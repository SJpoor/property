<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="楼栋" prop="buildId">
        <el-select v-model="queryParams.buildId" placeholder="请选择楼栋" filterable clearable style="width: 240px" @change="handleBuildChange">
          <el-option v-for="dict in buildList" :key="dict.buildId" :label="dict.buildName" :value="dict.buildId" />
        </el-select>
      </el-form-item>
      <el-form-item label="单元" prop="unitId">
        <el-select v-model="queryParams.unitId" placeholder="请选择单元" filterable clearable style="width: 240px">
          <el-option v-for="dict in unitList" :key="dict.unitId" :label="dict.unitName" :value="dict.unitId" />
        </el-select>
      </el-form-item>
      <el-form-item label="房屋编号" prop="houseNo">
        <el-input
          v-model="queryParams.houseNo"
          placeholder="请输入房屋编号"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="房屋面积" prop="houseArea">
        <el-input
          v-model="queryParams.houseArea"
          placeholder="请输入房屋面积"
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
          v-hasPermi="['smart:house:add']"
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
          v-hasPermi="['smart:house:edit']"
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
          v-hasPermi="['smart:house:remove']"
        >删除</el-button>
      </el-col>
      <!-- <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['smart:house:export']"
        >导出</el-button>
      </el-col> -->
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="houseList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="楼栋" align="center" prop="build.buildName" />

      <el-table-column label="楼栋类型" align="center" prop="build.buildType" >
        <template slot-scope="scope">
          <dict-tag :options="dict.type.build_type" :value="scope.row.build.buildType"/>
        </template>
      </el-table-column>
      <el-table-column label="单元" align="center" prop="unit.unitName" />
      <el-table-column label="房屋编号" align="center" prop="houseNo" />
      <el-table-column label="房屋面积" align="center" prop="houseArea" />
      <el-table-column label="户型" align="center" prop="houseType" >
        <template slot-scope="scope">
          <dict-tag :options="dict.type.house_type" :value="scope.row.houseType"/>
        </template>
      </el-table-column>
      <!-- <el-table-column label="显示顺序" align="center" prop="orderNum" /> -->
      <el-table-column label="使用状态" align="center" prop="useStatus">
        <template slot-scope="scope">
          <dict-tag :options="dict.type.house_use_status" :value="scope.row.useStatus"/>
        </template>
      </el-table-column>
<!--      <el-table-column label="状态" align="center" prop="status" >
        <template slot-scope="scope">
          <el-switch v-model="scope.row.status" active-value="0" inactive-value="1" @change="handleStatusChange(scope.row)"></el-switch>
        </template>
      </el-table-column>-->
      <el-table-column label="备注" align="center" prop="remark" :show-overflow-tooltip="true"/>
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['smart:house:edit']"
          >修改</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['smart:house:remove']"
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
        <el-form-item label="楼栋" prop="buildId">
          <el-select v-model="form.buildId" placeholder="请选择楼栋" filterable clearable style="width:100%" @change="handleBuildChange">
            <el-option v-for="dict in buildList" :key="dict.buildId" :label="dict.buildName" :value="dict.buildId" />
          </el-select>
        </el-form-item>
        <el-form-item label="单元" prop="unitId">
          <el-select v-model="form.unitId" placeholder="请选择单元" filterable clearable style="width:100%">
            <el-option v-for="dict in unitList" :key="dict.unitId" :label="dict.unitName" :value="dict.unitId" />
          </el-select>
        </el-form-item>
        <el-form-item label="房屋编号" prop="houseNo">
          <el-input v-model="form.houseNo" placeholder="请输入房屋编号" />
        </el-form-item>
        <el-form-item label="房屋面积" prop="houseArea">
          <el-input v-model="form.houseArea" placeholder="请输入房屋面积" />
        </el-form-item>
        <el-form-item label="户型" prop="houseType">
          <el-select v-model="form.houseType" placeholder="请选择户型" filterable clearable style="width: 100%">
            <el-option v-for="dict in dict.type.house_type" :key="dict.value" :label="dict.label" :value="dict.value" />
          </el-select>
        </el-form-item>
        <el-form-item label="使用状态">
          <el-radio-group v-model="form.useStatus">
            <el-radio
              v-for="dict in dict.type.house_use_status"
              :key="dict.value"
              :label="dict.value"
            >{{dict.label}}</el-radio>
          </el-radio-group>
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
import { listHouse, getHouse, delHouse, addHouse, updateHouse,changeStatus } from "@/api/smart/house";
import { listBuild } from "@/api/smart/build";
import { listUnit } from "@/api/smart/unit";
export default {
  name: "House",
  dicts:['house_type','house_use_status','build_type'],
  data() {
    return {
      buildList:[],
      unitList:[],
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
      houseList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        buildId: null,
        unitId: null,
        houseNo: null,
        houseArea: null,
        houseType: null,
        orderNum: null,
        useStatus: null,
        status: null,
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
        buildId: [
          { required: true, message: "楼栋不能为空", trigger: "blur" }
        ],
        unitId: [
          { required: true, message: "单元不能为空", trigger: "blur" }
        ],
        houseNo: [
          { required: true, message: "房屋编号不能为空", trigger: "blur" }
        ],
        houseArea: [
          { required: true, message: "房屋面积不能为空", trigger: "blur" }
        ],
        useStatus: [
          { required: true, message: "使用状态不能为空", trigger: "blur" }
        ],
      }
    };
  },
  created() {
    this.getList();
    //this.getUnitList();
    this.getBuildList();
  },
  methods: {
    /** 查询房屋信息列表 */
    getList() {
      this.loading = true;
      listHouse(this.queryParams).then(response => {
        this.houseList = response.rows;
        this.total = response.total;
        this.loading = false;
      });
    },
    /** 查询单元信息列表 */
    getUnitList(buildId) {
      console.info("buildId",buildId)
      listUnit({pageNum: 1,pageSize: 1000,buildId:buildId}).then(response => {
        this.unitList = response.rows;
        console.info("this.unitList==>>>",this.unitList)
      });
    },
    /** 查询楼栋信息列表 */
    getBuildList() {
      listBuild({pageNum: 1,pageSize: 1000}).then(response => {
        this.buildList = response.rows;
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
        buildId: null,
        unitId: null,
        houseNo: null,
        houseArea: null,
        houseType: null,
        orderNum: null,
        useStatus: '0',
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
      this.ids = selection.map(item => item.houseId)
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
      const houseId = row.houseId || this.ids
      getHouse(houseId).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "修改房屋信息";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.houseId != null) {
            updateHouse(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addHouse(this.form).then(response => {
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
      const houseIds = row.houseId || this.ids;
      this.$modal.confirm('是否确认删除房屋信息编号为"' + houseIds + '"的数据项？').then(function() {
        return delHouse(houseIds);
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
        return changeStatus({houseId:row.houseId, status:row.status});
      }).then(() => {
        this.$modal.msgSuccess(text + "成功");
      }).catch(function() {
        row.status = row.status === "0" ? "1" : "0";
      });
    },
    handleBuildChange(v){
      console.info("v===>>",v)
      this.getUnitList(v)
    }
  }
};
</script>
