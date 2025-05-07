<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="100px">
      <el-form-item label="车辆所有人" prop="ownerId">
       <el-select v-model="queryParams.ownerId" placeholder="请选择车辆所有人" filterable clearable style="width: 240px">
         <el-option v-for="dict in userList" :key="dict.userId" :label="dict.userName" :value="dict.userId" />
       </el-select>
     </el-form-item>
     <el-form-item label="车位" prop="parkingSpaceId">
          <el-select v-model="queryParams.parkingSpaceId" placeholder="楼栋类型" filterable clearable style="width: 240px">
         <el-option v-for="dict in parkingSpaceList" :key="dict.parkingSpaceId" :label="dict.parkingSpaceNo" :value="dict.parkingSpaceId" />
       </el-select>
     </el-form-item>
      <el-form-item>
        <el-button type="primary" icon="el-icon-search" size="mini" @click="handleQuery">搜索</el-button>
        <el-button icon="el-icon-refresh" size="mini" @click="resetQuery">重置</el-button>
      </el-form-item>
    </el-form>

    <el-row :gutter="10" class="mb8">
      <!-- <el-col :span="1.5">
        <el-button
          type="primary"
          plain
          icon="el-icon-plus"
          size="mini"
          @click="handleAdd"
          v-hasPermi="['smart:owner:park:add']"
        >新增</el-button>
      </el-col> -->
      <el-col :span="1.5">
        <el-button
          type="success"
          plain
          icon="el-icon-edit"
          size="mini"
          :disabled="single"
          @click="handleUpdate"
          v-hasPermi="['smart:owner:park:edit']"
        >修改</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="danger"
          plain
          icon="el-icon-delete"
          size="mini"
          :disabled="multiple"
          @click="handleDelete"
          v-hasPermi="['smart:owner:park:remove']"
        >删除</el-button>
      </el-col>
<!--      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['smart:owner:park:export']"
        >导出</el-button>
      </el-col> -->
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="spaceList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="车位" align="center" prop="parkingSpace.parkingSpaceNo" />
      <el-table-column label="车辆所有人" align="center" prop="owner.nickName" width="140"/>
      <el-table-column label="联系方式" align="center" prop="owner.phonenumber" width="120"/>
      <el-table-column label="总费用(元)" align="center" prop="parkingRent.rentAmount" width="90"/>
      <el-table-column label="开始时间" align="center" prop="startTime" width="120">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.parkingRent.startTime, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="结束时间" align="center" prop="endTime" width="120">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.parkingRent.endTime, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <!-- <el-table-column label="状态" align="center" prop="status" >
        <template slot-scope="scope">
          <el-switch v-model="scope.row.status" active-value="0" inactive-value="1" @change="handleStatusChange(scope.row)"></el-switch>
        </template>
      </el-table-column> -->
      <!-- <el-table-column label="备注" align="center" prop="remark" :show-overflow-tooltip="true"/> -->
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width" width="180" fixed="right">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['smart:owner:park:edit']"
          >修改</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['smart:owner:park:remove']"
          >删除</el-button>
        </template>
      </el-table-column>
    </el-table>

    <pagination
      v-show="total>0"
      :total="total"
      :page.sync="queryParams.pageNum"
      :limit.sync="queryParams.pageSize"
      @pagination="getList"
    />

    <!-- 添加或修改业主车位信息对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="700px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="110px">
        <el-form-item label="车辆所有人" prop="ownerId">
          <el-select v-model="form.ownerId" placeholder="请选择车辆所有人" filterable  clearable style="width: 100%">
            <el-option v-for="dict in userList" :key="dict.userId" :label="dict.userName" :value="dict.userId" />
          </el-select>
        </el-form-item>
        <el-form-item label="车位" prop="parkingSpaceId">
           <el-select v-model="form.parkingSpaceId" placeholder="请选择车位" filterable clearable style="width: 100%">
            <el-option v-for="dict in parkingSpaceList" :key="dict.parkingSpaceId" :label="dict.parkingSpaceNo" :value="dict.parkingSpaceId" />
          </el-select>
        </el-form-item>
        <!-- <el-form-item label="车牌照" >
          <imageUpload ref="imageUpload" @handleAfter="handleAfter"/>
        </el-form-item>
        <div style="margin-left: 110px;color: red;font-weight: bold;" v-if="showPlatNo">车牌号未正常识别,请手动录入!</div>
        <el-form-item label="车牌号" prop="plateNo" v-if="showPlatNo" :rules="[{ required: true, message: '车牌号不能为空', trigger: 'blur' }]">
          <el-input v-model="form.plateNo" placeholder="请输入车牌号" />
        </el-form-item> -->
        <el-form-item label="备注" prop="remark">
          <el-input v-model="form.remark" placeholder="请输入备注" />
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitForm">确 定</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import { addRecord, updateRecord } from "@/api/smart/parkingSpaceRecord";
import { listParkingSpace } from "@/api/smart/parkingSpace";
import { listUser } from "@/api/system/user";
import { listFee} from "@/api/smart/fee";
import imageUpload from "@/components/ImageUpload/index"
export default {
  name: "Space",
  components:[imageUpload],
  data() {
    return {
      baseUrl: process.env.VUE_APP_BASE_API,
      // 遮罩层
      loading: true,
      // 选中数组
      ids: [],
      // 非单个禁用
      single: true,
      // 非多个禁用
      multiple: true,
      // 显示搜索条件
      showSearch: true,
      // 总条数
      total: 0,
      // 业主车位信息表格数据
      spaceList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        ownerId : null,
        parkingSpaceId: null,
        plateNo: null,
        orderNum: null,
        status: null,
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
        ownerId: [
          { required: true, message: "车辆所有人不能为空", trigger: "blur" }
        ],
        parkingSpaceId: [
          { required: true, message: "车位不能为空", trigger: "blur" }
        ],
        /* plateNo: [{ required: true, message: "车牌号不能为空", trigger: "blur" }], */
        /* plateUrl: [
          { required: true, message: "车牌照不能为空", trigger: "blur" }
        ], */
      },
      parkingSpaceList:[],
      userList:[],
      feeList:[],
      showPlatNo: false
    };
  },
  created() {
    this.getList();
    this.getParkSpaceList();
    this.getUserList();
    this.getFeeList();
  },
  methods: {
    /** 查询业主车位信息列表 */
    getList() {
      this.loading = true;
      listOwnerParkingSpace(this.queryParams).then(response => {
        this.spaceList = response.rows;
        this.total = response.total;
        this.loading = false;
      });
    },
    /** 查询用户列表 */
    getUserList() {
      listUser({pageNum: 1,pageSize: 1000,userType:'11'}).then(response => {
          this.userList = response.rows;
        }
      );
    },
    /** 查询收费信息列表 */
    getFeeList() {
      listFee({pageNum: 1,pageSize: 1000}).then(response => {
        this.feeList = response.rows;
      });
    },
    /** 查询业主车位信息列表 */
    getParkSpaceList() {
      listParkingSpace({pageNum: 1,pageSize: 1000}).then(response => {
        this.parkingSpaceList = response.rows;
      });
    },
    // 取消按钮
    cancel() {
      this.open = false;
      this.reset();
    },
    // 表单重置
    reset() {
      this.form = {
        ownerParkingId: null,
        ownerId:null,
        parkingSpaceId: null,
        plateNo: null,
        orderNum: null,
        status: null,
        remark: null,
        delFlag: null,
        createBy: null,
        createTime: null,
        updateBy: null,
        updateTime: null
      };
      this.resetForm("form");
    },
    /** 搜索按钮操作 */
    handleQuery() {
      this.queryParams.pageNum = 1;
      this.getList();
    },
    /** 重置按钮操作 */
    resetQuery() {
      this.resetForm("queryForm");
      this.handleQuery();
    },
    // 多选框选中数据
    handleSelectionChange(selection) {
      this.ids = selection.map(item => item.ownerParkingId)
      this.single = selection.length!==1
      this.multiple = !selection.length
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.open = true;
      this.title = "添加业主车位信息";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const ownerParkingId = row.ownerParkingId || this.ids
      getOwnerParkingSpace(ownerParkingId).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "修改业主车位信息";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$nextTick(()=>{
        let fileList = this.$refs.imageUpload.fileList || []
        console.info("fileList===>>",fileList)
        if(fileList.length <= 0){
          this.$modal.msgError("请上传车牌照");
          return;
        }
        this.$refs["form"].validate(valid => {
          if (valid) {
              let fileList = this.$refs.imageUpload.fileList
              let file = fileList[0]
              console.info("fileList===<<<",fileList)
              let attr = {
                attrId: file.id,
                attrName: file.name,
                attrUrl: file.url,
                attrText: file.attrText
              }
              this.form.attr = attr
              this.form.plateNo = file.attrText
              if (this.form.ownerParkingId != null) {
                addRecord(this.form).then(response => {
                  this.$modal.msgSuccess("修改成功");
                  this.open = false;
                  this.getList();
                });
              } else {
                addRecord(this.form).then(response => {
                  this.$modal.msgSuccess("新增成功");
                  this.open = false;
                  this.getList();
                });
              }
          }
        });
      })
    },
    /** 删除按钮操作 */
    handleDelete(row) {
      const ownerParkingIds = row.ownerParkingId || this.ids;
      this.$modal.confirm('是否确认删除业主车位信息？').then(function() {
        return delOwnerParkingSpace(ownerParkingIds);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {});
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('system/space/export', {
        ...this.queryParams
      }, `space_${new Date().getTime()}.xlsx`)
    },
    // 房屋状态修改
    handleStatusChange(row) {
      let text = row.status === "0" ? "启用" : "停用";
      this.$modal.confirm('确认要"' + text + '"吗？').then(function() {
        return changeStatus({ownerParkingId:row.ownerParkingId, status:row.status});
      }).then(() => {
        this.$modal.msgSuccess(text + "成功");
      }).catch(function() {
        row.status = row.status === "0" ? "1" : "0";
      });
    },
    handleAfter(res){
      let attrText = res.attrText || ''
      this.showPlatNo = !attrText
    },
    handleOut(row){
      this.$modal.confirm('确认要驶出吗？').then(function() {
        const ownerParkingIds = row.ownerParkingId || this.ids;
        return delOwnerParkingSpace(ownerParkingIds);
      }).then(() => {
        this.$modal.msgSuccess("驶出成功");
        this.getList()
      }).catch(function() {
        row.status = row.status === "0" ? "1" : "0";
      });
    }
  }
};
</script>
