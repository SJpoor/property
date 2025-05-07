<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
     <el-form-item label="房屋" prop="houseId">
       <el-select v-model="queryParams.houseId" placeholder="请选择房屋" filterable clearable style="width: 240px">
         <el-option v-for="dict in houseList" :key="dict.houseId" :label="dict.houseNo" :value="dict.houseId" />
       </el-select>
     </el-form-item>
     <el-form-item label="业主" prop="ownerId">
       <el-select v-model="queryParams.ownerId" placeholder="请选择业主" filterable clearable style="width: 240px">
         <el-option v-for="dict in userList" :key="dict.userId" :label="dict.userName" :value="dict.userId" />
       </el-select>
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
          v-hasPermi="['smart:owner:house:add']"
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
          v-hasPermi="['smart:owner:house:edit']"
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
          v-hasPermi="['smart:owner:house:remove']"
        >删除</el-button>
      </el-col>

      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="ownerHouseList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="业主" align="center" prop="owner.nickName" />
      <el-table-column label="性别" align="center" prop="owner.sex" >
        <template slot-scope="scope">
          <dict-tag :options="dict.type.sys_user_sex" :value="scope.row.owner.sex"/>
        </template>
      </el-table-column>
      <el-table-column label="电话" align="center" prop="owner.phonenumber" />
      <el-table-column label="栋数" align="center" prop="build.buildName" />
      <el-table-column label="单元" align="center" prop="unit.unitName" />
      <el-table-column label="房屋编号" align="center" prop="house.houseNo" />
      <el-table-column label="使用面积" align="center" prop="house.houseArea" />
      <el-table-column label="车位" align="center" prop="parkingSpace.parkingSpaceNo" />
      <el-table-column label="状态" align="center" prop="status" >
        <template slot-scope="scope">
          <el-switch v-model="scope.row.status" active-value="0" inactive-value="1" @change="handleStatusChange(scope.row)"></el-switch>
        </template>
      </el-table-column>
      <!-- <el-table-column label="备注" align="center" prop="remark" :show-overflow-tooltip="true"/> -->
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width" fixed="right" width="250">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['smart:owner:house:edit']"
          >修改</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['smart:owner:house:remove']"
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

    <!-- 添加或修改房屋信息对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="房屋" prop="houseId">
          <el-select v-model="form.houseId" placeholder="请选择房屋" filterable clearable style="width: 100%">
            <el-option v-for="dict in houseList" :key="dict.houseId" :label="dict.houseNo" :value="dict.houseId" />
          </el-select>
        </el-form-item>
        <el-form-item label="业主" prop="ownerId">
          <el-select v-model="form.ownerId" placeholder="请选择业主" filterable clearable style="width: 100%">
            <el-option v-for="dict in userList" :key="dict.userId" :label="dict.userName" :value="dict.userId" />
          </el-select>
        </el-form-item>
        <!-- <el-form-item label="显示顺序" prop="orderNum">
          <el-input v-model="form.orderNum" placeholder="请输入显示顺序" />
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
import { listOwnerHouse, getOwnerHouse, delOwnerHouse, addOwnerHouse, updateOwnerHouse,changeStatus } from "@/api/smart/ownerHouse";
import { listUser } from "@/api/system/user";
import { listHouse } from "@/api/smart/house";
export default {
  name: "House",
  dicts:['sys_user_sex'],
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
      // 房屋信息表格数据
      ownerHouseList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        ownerId: null,
        houseId: null,
        status: null,
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
        ownerId: [
          { required: true, message: "业主不能为空", trigger: "blur" }
        ],
        houseId: [
          { required: true, message: "房屋不能为空", trigger: "blur" }
        ],
      },
      userList:[],
      houseList:[]
    };
  },
  created() {
    this.getList();
    this.getUserList();
    this.getHouseList();
  },
  methods: {
    /** 查询房屋信息列表 */
    getList() {
      this.loading = true;
      listOwnerHouse(this.queryParams).then(response => {
        this.ownerHouseList = response.rows;
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
    /** 查询房屋信息列表 */
    getHouseList() {
      listHouse({pageNum: 1,pageSize: 1000}).then(response => {
        this.houseList = response.rows;
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
        houseId: null,
        ownerId: null,
        orderNum: null,
        useStatus: null,
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
      this.ids = selection.map(item => item.ownerHouseId)
      this.single = selection.length!==1
      this.multiple = !selection.length
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.open = true;
      this.title = "添加房屋信息";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const houseId = row.ownerHouseId || this.ids
      getOwnerHouse(ownerHouseId).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "修改房屋信息";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.ownerHouseId != null) {
            updateOwnerHouse(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addOwnerHouse(this.form).then(response => {
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
      const ownerHouseIds = row.ownerHouseId || this.ids;
      this.$modal.confirm('是否确认删除房屋信息编号为"' + ownerHouseIds + '"的数据项？').then(function() {
        return delOwnerHouse(ownerHouseIds);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {});
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('system/house/export', {
        ...this.queryParams
      }, `house_${new Date().getTime()}.xlsx`)
    },
    // 业主房屋状态修改
    handleStatusChange(row) {
      let text = row.status === "0" ? "启用" : "停用";
      this.$modal.confirm('确认要"' + text + '"吗？').then(function() {
        return changeStatus({ownerHouseId:row.ownerHouseId, status:row.status});
      }).then(() => {
        this.$modal.msgSuccess(text + "成功");
      }).catch(function() {
        row.status = row.status === "0" ? "1" : "0";
      });
    },
  }
};
</script>
