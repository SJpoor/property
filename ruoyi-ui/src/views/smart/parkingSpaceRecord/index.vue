<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="业主" prop="ownerId">
        <el-select v-model="queryParams.ownerId" placeholder="请选择业主" filterable clearable style="width: 240px" @change="handleOwnerChange">
          <el-option v-for="dict in userList" :key="dict.userId" :label="dict.userName" :value="dict.userId" />
        </el-select>
      </el-form-item>
      <el-form-item label="车位" prop="parkingSpaceId">
           <el-select v-model="queryParams.parkingSpaceId" placeholder="请选择车位" filterable clearable style="width: 240px">
          <el-option v-for="dict in parkingSpaceList" :key="dict.parkingSpaceId" :label="dict.parkingSpaceNo" :value="dict.parkingSpaceId" />
        </el-select>
      </el-form-item>
      <el-form-item label="车牌号" prop="plateNo">
        <el-input
          v-model="queryParams.plateNo"
          placeholder="请输入车牌号"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="驶入时间" prop="driveInTime">
        <el-date-picker clearable
          v-model="queryParams.driveInTime"
          type="date"
          value-format="yyyy-MM-dd"
          placeholder="请选择驶入时间">
        </el-date-picker>
      </el-form-item>
      <el-form-item label="驶出时间" prop="driveOutTime">
        <el-date-picker clearable
          v-model="queryParams.driveOutTime"
          type="date"
          value-format="yyyy-MM-dd"
          placeholder="请选择驶出时间">
        </el-date-picker>
      </el-form-item>
      <el-form-item>
        <el-button type="primary" icon="el-icon-search" size="mini" @click="handleQuery">搜索</el-button>
        <el-button icon="el-icon-refresh" size="mini" @click="resetQuery">重置</el-button>
      </el-form-item>
    </el-form>

    <el-row :gutter="10" class="mb8">
<!--      <el-col :span="1.5">
        <el-button
          type="primary"
          plain
          icon="el-icon-plus"
          size="mini"
          @click="handleAdd"
          v-hasPermi="['smart:park:space:record:add']"
        >新增</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="success"
          plain
          icon="el-icon-edit"
          size="mini"
          :disabled="single"
          @click="handleUpdate"
          v-hasPermi="['smart:park:space:record:edit']"
        >修改</el-button>
      </el-col> -->
      <el-col :span="1.5">
        <el-button
          type="danger"
          plain
          icon="el-icon-delete"
          size="mini"
          :disabled="multiple"
          @click="handleDelete"
          v-hasPermi="['smart:park:space:record:remove']"
        >删除</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="recordList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="车位" align="center" prop="parkingSpace.parkingSpaceNo" width="80"/>
      <el-table-column label="业主" align="center" prop="owner.nickName" width="80"/>
      <el-table-column label="车牌照" align="center" prop="plateUrl" width="100">
        <template slot-scope="scope">
          <img :src="baseUrl+scope.row.attr.attrUrl" style="width: 100px;" v-if="scope.row.attr"/>
        </template>
      </el-table-column>
      <el-table-column label="车牌号" align="center" prop="plateNo" />
      <el-table-column label="驶入时间" align="center" prop="driveInTime" width="160"/>
      <el-table-column label="驶出时间" align="center" prop="driveOutTime" width="160"/>

<!--      显示生成费用的状态，如果已经生成费用，不显示生成费用按钮-->
<!--       <el-table-column label="费用状态" align="center" prop="parkingSpace.parkingSpaceStatus" />-->
<!--      驶出状态-->
<!--      <el-table-column label="驶出状态（无则显示驶出按钮）" align="center" prop="driveOutTime" />-->


      <el-table-column label="备注" align="center" prop="remark" :show-overflow-tooltip="true"/>
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width" width="200">
        <template slot-scope="scope">
         <!-- <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['smart:park:space:record:edit']"
          >修改</el-button> -->
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['smart:park:space:record:remove']"
          >删除
          </el-button>

<!--          //驶出状态-->
<!--          根据有无驶出时间判断显示状态-->
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleOut(scope.row)"
            v-hasPermi="['smart:park:space:record:out']"
            v-if="!scope.row.driveOutTime"
          >驶出
          </el-button>


          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleFee(scope.row)"
            v-hasPermi="['smart:park:space:record:out']"

            v-if="scope.row.driveInTime && scope.row.driveOutTime && roles.includes('admin')&& Number(scope.row.feeStatus) !== 1"
          >生成费用
          </el-button>
          <!--            如果费用状态为1则不显示按钮-->
          <!--            数据类型问题：表格显示时自动转换成字符串，需要转换回数字类型再进行判断-->

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

    <!-- 添加或修改车位使用信息对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="车位" prop="parkingSpaceId">
             <el-select v-model="form.parkingSpaceId" placeholder="楼栋类型" filterable clearable style="width: 240px">
            <el-option v-for="dict in parkingSpaceList" :key="dict.parkingSpaceId" :label="dict.parkingSpaceNo" :value="dict.parkingSpaceId" />
          </el-select>
        </el-form-item>
        <el-form-item label="业主" prop="ownerId">
          <el-select v-model="form.ownerId" placeholder="请选择业主" filterable clearable style="width: 240px">
            <el-option v-for="dict in userList" :key="dict.userId" :label="dict.userName" :value="dict.userId" />
          </el-select>
        </el-form-item>
        <el-table-column label="车牌照" align="center" prop="plateUrl" width="100">
          <template slot-scope="scope">
            <img :src="baseUrl+scope.row.attr.attrUrl" style="width: 100px;" v-if="scope.row.attr"/>
          </template>
        </el-table-column>
        <el-form-item label="车牌号" prop="plateNo" :rules="[{ required: true, message: '车牌号不能为空', trigger: 'blur' }]">
          <el-input v-model="form.plateNo" placeholder="请输入车牌号" />
        </el-form-item>

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
import { listRecord, getRecord, delRecord, addRecord, updateRecord,addRecordFee } from "@/api/smart/parkingSpaceRecord";
import { listParkingSpace } from "@/api/smart/parkingSpace";
import { listUser } from "@/api/system/user";
import { listFee} from "@/api/smart/fee";
import imageUpload from "@/components/ImageUpload/index"
export default {
  name: "parkingSpaceRecord",
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
      //补充：费用状态
      // feeStatus: null,
      // 车位信息表格数据
      spaceList: [],
      // 车位使用信息表格数据
      recordList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        parkingSpaceId: null,
        ownerId: null,
        plateNo: null,
        orderNum: null,
        driveInTime: null,
        driveOutTime: null,
        status: null,
        // parkingSpaceStatus: null
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
        parkingSpaceId: [
          { required: true, message: "车位不能为空", trigger: "blur" }
        ],
        ownerId: [
          { required: true, message: "业主不能为空", trigger: "blur" }
        ],
        plateNo: [
          { required: true, message: "车牌号不能为空", trigger: "blur" }
        ]
      },
      parkingSpaceList:[],
      userList:[],
      feeList:[],
      showPlatNo: false,
      roles:[]
    };
  },
  created() {
    this.getList();
    this.getUserList();
    this.getParkList();
    this.roles = this.$store.getters.roles
  },
  methods: {
    /** 查询车位使用信息列表 */
    getList() {
      this.loading = true;
      listRecord(this.queryParams).then(response => {
        this.recordList = response.rows;
        this.total = response.total;
        this.loading = false;
      });
    },

    getParkList() {
      this.loading = true;
      listParkingSpace(this.queryParams).then(response => {
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
    getParkingSpaceList(ownerId) {
      listParkingSpace({pageNum: 1,pageSize: 1000,parkingSpaceType:'1',ownerId:ownerId}).then(response => {
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
        parkingRecordId: null,
        parkingSpaceId: null,

        //添加车位状态
        // parkingSpaceStatus: null,

        ownerId: null,
        plateNo: null,
        orderNum: null,
        driveInTime: null,
        driveOutTime: null,
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
    resetOutForm() {
      this.outForm = {
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
        updateTime: null,
        driveStatus: 0

        // parkingSpaceStatus: null
      };
      this.resetForm("outForm");
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
      this.ids = selection.map(item => item.parkingRecordId)
      this.single = selection.length!==1
      this.multiple = !selection.length
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.open = true;
      this.title = "添加车位使用信息";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const parkingRecordId = row.parkingRecordId || this.ids
      getRecord(parkingRecordId).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "修改车位使用信息";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.parkingRecordId != null) {
            updateRecord(this.form).then(response => {
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
    },
    /** 删除按钮操作 */
    handleDelete(row) {
      const parkingRecordIds = row.parkingRecordId || this.ids;
      this.$modal.confirm('是否确认删除车位使用信息编号为"' + parkingRecordIds + '"的数据项？').then(function() {
        return delRecord(parkingRecordIds);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {});
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('system/record/export', {
        ...this.queryParams
      }, `record_${new Date().getTime()}.xlsx`)
    },

    // 驶出操作
    /**
     * 处理驶出操作 - 直接更新，无需表单
     */
    handleOut(row) {
      console.log("原始行数据:", row); // 调试输出

      this.$modal.confirm('确认要驶出吗？').then(() => {
        // 构建与后端期望匹配的数据对象
        const outData = {
          parkingRecordId: row.parkingRecordId,
          parkingSpaceId: row.parkingSpaceId,
          plateNo: row.plateNo,      // 必须包含车牌号
          driveStatus: '0'      ,     // 这是关键，后端根据这个字段识别驶出操作
          // driveStatus: row.driveStatus

          driveOutTime: null  // 明确只更新未驶出的记录

        };

        console.log("发送更新数据:", outData); // 调试输出

        // 调用API更新
        return updateRecord(outData);
      }).then(response => {
        console.log("更新响应:", response); // 调试输出
        this.$modal.msgSuccess("驶出成功");
        this.getList(); // 刷新列表数据
      }).catch(error => {
        console.error("更新失败:", error);
        this.$modal.msgError("驶出失败，请检查控制台日志");
      });
    }
    ,
    // 时间
    formatDateTime(date) {
      const year = date.getFullYear();
      const month = String(date.getMonth() + 1).padStart(2, '0');
      const day = String(date.getDate()).padStart(2, '0');
      const hours = String(date.getHours()).padStart(2, '0');
      const minutes = String(date.getMinutes()).padStart(2, '0');
      const seconds = String(date.getSeconds()).padStart(2, '0');

      return `${year}-${month}-${day} ${hours}:${minutes}:${seconds}`;
    },

    handleFee(row){
      this.$modal.confirm('是否确认要生成费用？').then(function() {
        return addRecordFee(row);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("费用生成成功");
      }).catch(() => {});
    },
    handleOwnerChange(v){
      this.getParkingSpaceList(v)
    },
  }
};
</script>
