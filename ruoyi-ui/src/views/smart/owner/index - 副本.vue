<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="业主姓名" prop="ownerName">
        <el-input
          v-model="queryParams.ownerName"
          placeholder="请输入业主姓名"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="业主邮箱" prop="email">
        <el-input
          v-model="queryParams.email"
          placeholder="请输入业主邮箱"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="手机号码" prop="phonenumber">
        <el-input
          v-model="queryParams.phonenumber"
          placeholder="请输入手机号码"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item>
        <el-button type="primary" icon="el-icon-search" size="mini" @click="handleQuery">搜索</el-button>
        <el-button icon="el-icon-refresh" size="mini" @click="resetQuery">重置</el-button>
      </el-form-item>
    </el-form>

    <el-row :gutter="10" class="mb8">
      <el-col :span="1.5">
        <el-button
          type="primary"
          plain
          icon="el-icon-plus"
          size="mini"
          @click="handleAdd"
          v-hasPermi="['smart:owner:add']"
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
          v-hasPermi="['smart:owner:edit']"
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
          v-hasPermi="['smart:owner:remove']"
        >删除</el-button>
      </el-col>
      <!-- <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['smart:owner:export']"
        >导出</el-button>
      </el-col> -->
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="ownerList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="业主姓名" align="center" prop="ownerName" />
      <el-table-column label="业主性别" align="center" prop="sex" >
        <template slot-scope="scope">
          <dict-tag :options="dict.type.sys_user_sex" :value="scope.row.sex"/>
        </template>
      </el-table-column>
      <el-table-column label="手机号" align="center" prop="phonenumber" width="110"/>
     <!-- <el-table-column label="业主邮箱" align="center" prop="email" /> -->
      <el-table-column label="栋数" align="center" prop="build.buildName" />
      <el-table-column label="单元" align="center" prop="unit.unitName" />
      <el-table-column label="房屋编号" align="center" prop="house.houseNo" />
      <el-table-column label="使用面积" align="center" prop="house.houseArea" />
      <el-table-column label="车位" align="center" prop="parkingSpace.parkingSpaceNo" />
     <!-- <el-table-column label="头像地址" align="center" prop="avatar" /> -->
      <!-- <el-table-column label="状态" align="center" prop="status" >
          <template slot-scope="scope">
            <el-switch v-model="scope.row.status" active-value="0" inactive-value="1" @change="handleStatusChange(scope.row)"></el-switch>
          </template>
        </el-table-column> -->
      <!-- <el-table-column label="备注" align="center" prop="remark" /> -->
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width" fixed="right" width="300">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['smart:owner:edit']"
          >修改</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['smart:owner:remove']"
          >删除</el-button>
        <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleAssignHouse(scope.row)"
            v-hasPermi="['smart:owner:assign:house']"
          >分配房屋</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleAssignSpace(scope.row)"
            v-hasPermi="['smart:owner:assign:space']"
          >分配车位</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleReturnHouse(scope.row)"
            v-hasPermi="['smart:owner:return:house']"
          >退房</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleReturnSpace(scope.row)"
            v-hasPermi="['smart:owner:return:space']"
          >退车位</el-button>
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

    <!-- 添加或修改业主对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="业主姓名" prop="ownerName">
          <el-input v-model="form.ownerName" placeholder="请输入业主姓名" />
        </el-form-item>
        <el-form-item label="手机号码" prop="phonenumber">
          <el-input v-model="form.phonenumber" placeholder="请输入手机号码" />
        </el-form-item>
        <el-form-item label="业主邮箱" prop="email">
          <el-input v-model="form.email" placeholder="请输入业主邮箱" />
        </el-form-item>
        <el-form-item label="备注" prop="remark">
          <el-input v-model="form.remark" type="textarea" placeholder="请输入内容" />
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitForm">确 定</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>
    </el-dialog>
    <!-- 分配房屋 -->
    <el-dialog :title="title" :visible.sync="assignHouseOpen" width="500px" append-to-body>
      <el-form ref="assignHouseForm" :model="assignHouseForm" :rules="rulesHouse" label-width="80px">
        <el-form-item label="房屋" prop="houseId">
          <el-select v-model="assignHouseForm.houseId" placeholder="请选择房屋" filterable clearable style="width: 100%">
            <el-option v-for="dict in houseList" :key="dict.houseId" :label="dict.houseNo" :value="dict.houseId" />
          </el-select>
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitHouseForm">确 定</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>
    </el-dialog>
    <!-- 分配车位 -->
    <el-dialog :title="title" :visible.sync="assignSpaceOpen" width="500px" append-to-body>
      <el-form ref="assignSpaceForm" :model="assignSpaceForm" :rules="rulesSpace" label-width="80px">
        <el-form-item label="车位" prop="parkingSpaceId">
          <el-select v-model="assignSpaceForm.parkingSpaceId" placeholder="请选择车位" filterable clearable style="width: 100%">
            <el-option v-for="dict in parkingSpaceList" :key="dict.parkingSpaceId" :label="dict.parkingSpaceNo" :value="dict.parkingSpaceId" />
          </el-select>
        </el-form-item>
        <el-form-item label="车牌照" >
          <imageUpload ref="imageUpload"/>
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitSpaceForm">确 定</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>
    </el-dialog>

  </div>
</template>

<script>
import { listOwner, getOwner, delOwner, addOwner, updateOwner,changeStatus } from "@/api/smart/owner";
import { listHouse } from "@/api/smart/house";
import { listParkingSpace } from "@/api/smart/parkingSpace";
import { deleteOwnerHouse, addOwnerHouse } from "@/api/smart/ownerHouse";
import {deleteOwnerParkingSpace, addOwnerParkingSpace } from "@/api/smart/ownerParkingSpace";
import imageUpload from "@/components/ImageUpload/index";
export default {
  name: "Owner",
  dicts:['sys_user_sex'],
  components:[imageUpload],
  data() {
    return {
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
      // 业主表格数据
      ownerList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,

      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        ownerName: null,
        email: null,
        phonenumber: null,
        sex: null,
        avatar: null,
        status: null,
      },
      // 表单参数
      form: {},

      // 表单校验
      rules: {
        ownerName: [
          { required: true, message: "业主姓名不能为空", trigger: "blur" }
        ],
        phonenumber: [
          { required: true, message: "手机号不能为空", trigger: "blur" }
        ],
      },
      assignHouseOpen: false,
      assignSpaceOpen: false,
      assignHouseForm:{},
      assignSpaceForm:{},
      // 表单校验
      rulesHouse: {
        /* ownerId: [
          { required: true, message: "业主不能为空", trigger: "blur" }
        ], */
        houseId: [
          { required: true, message: "房屋不能为空", trigger: "blur" }
        ],
      },
      // 表单校验
      rulesSpace: {
        parkingSpaceId: [
          { required: true, message: "车位不能为空", trigger: "blur" }
        ]/* ,
        houseId: [
          { required: true, message: "房屋不能为空", trigger: "blur" }
        ], */
      },
      houseList:[],
      parkingSpaceList:[]
    };
  },
  created() {
    this.getList();
    this.getHouseList();
    this.getParkingSpaceList();
  },
  methods: {
    /** 查询业主列表 */
    getList() {
      this.loading = true;
      listOwner(this.queryParams).then(response => {
        this.ownerList = response.rows;
        this.total = response.total;
        this.loading = false;
      });
    },
    /** 查询房屋信息列表 */
    getHouseList() {
      listHouse({pageNum: 1,pageSize: 1000}).then(response => {
        this.houseList = response.rows;
      });
    },
    /** 查询车位信息列表 */
    getParkingSpaceList() {
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
        ownerId: null,
        ownerName: null,
        email: null,
        phonenumber: null,
        sex: null,
        avatar: null,
        status: null,
        delFlag: null,
        createBy: null,
        createTime: null,
        updateBy: null,
        updateTime: null,
        remark: null
      };
      this.resetForm("form");
    },
    resetHouseForm() {
      this.assignHouseForm = {
        houseId: null,
        ownerId: null
      };
      this.resetForm("assignHouseForm");
    },
    resetSpaceForm() {
      this.assignSpaceForm = {
        parkingSpaceId: null,
        ownerId: null,
        plateNo: null,
        attr: null
      };
      this.resetForm("assignSpaceForm");
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
      this.ids = selection.map(item => item.ownerId)
      this.single = selection.length!==1
      this.multiple = !selection.length
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.open = true;
      this.title = "添加业主";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const ownerId = row.ownerId || this.ids
      getOwner(ownerId).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "修改业主";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.ownerId != null) {
            updateOwner(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addOwner(this.form).then(response => {
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
      const ownerIds = row.ownerId || this.ids;
      this.$modal.confirm('是否确认删除业主编号为"' + ownerIds + '"的数据项？').then(function() {
        return delOwner(ownerIds);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {});
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('system/owner/export', {
        ...this.queryParams
      }, `owner_${new Date().getTime()}.xlsx`)
    },
    // 业主状态修改
    handleStatusChange(row) {
      let text = row.status === "0" ? "启用" : "停用";
      this.$modal.confirm('确认要"' + text + '"吗？').then(function() {
        return changeStatus({ownerId:row.ownerId, status:row.status});
      }).then(() => {
        this.$modal.msgSuccess(text + "成功");
      }).catch(function() {
        row.status = row.status === "0" ? "1" : "0";
      });
    },
    // 分配房屋
    handleAssignHouse(row){
      this.resetHouseForm();
      this.assignHouseOpen = true;
      this.assignHouseForm.ownerId = row.ownerId
      this.title = "分配房屋";
    },
    // 分配车位
    handleAssignSpace(row){
      this.resetSpaceForm();
      this.assignSpaceOpen = true;
      this.assignSpaceForm.ownerId = row.ownerId
      this.title = "分配车位";
    },
    // 退房
    handleReturnHouse(row){
      this.$modal.confirm('确认要退房吗？').then(function() {
        return deleteOwnerHouse({ownerId:row.ownerId, houseId:row.house.houseId});
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("退房成功");
      }).catch(function() {
      });
    },
    // 退车位
    handleReturnSpace(row){
      this.$modal.confirm('确认要退车位吗？').then(function() {
        return deleteOwnerParkingSpace({ownerId:row.ownerId, parkingSpaceId:row.parkingSpace.parkingSpaceId});
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("退车位成功");
      }).catch(function() {
      });

    },
    submitHouseForm() {
      this.$refs["assignHouseForm"].validate(valid => {
        if (valid) {
          addOwnerHouse(this.assignHouseForm).then(response => {
            this.$modal.msgSuccess("分配成功");
            this.assignHouseOpen = false;
            this.getList();
          });
        }
      });
    },
    submitSpaceForm() {
      this.$refs["assignSpaceForm"].validate(valid => {
        if (valid) {
          this.$nextTick(()=>{
            let fileList = this.$refs.imageUpload.fileList
            let file = fileList[0]
            console.info("fileList===<<<",fileList)
            let attr = {
              attrId: file.id,
              attrName: file.name,
              attrUrl: file.url
            }
            this.assignSpaceForm.attr = attr
            this.assignSpaceForm.plateNo = file.imgText
            addOwnerParkingSpace(this.assignSpaceForm).then(response => {
              this.$modal.msgSuccess("分配成功");
              this.assignSpaceOpen = false;
              this.getList();
            });
          })
        }
      });
    },
  }
};
</script>
