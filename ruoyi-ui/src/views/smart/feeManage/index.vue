<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
<!--停用-->
      <el-form-item label="费用" prop="feeId">
        <el-select v-model="queryParams.feeId" placeholder="请选择费用" filterable clearable style="width: 240px">
          <el-option v-for="dict in feeList" :key="dict.feeId" :label="dict.feeName" :value="dict.feeId" />
        </el-select>
      </el-form-item>
      <el-form-item label="开始时间" prop="startTime">
        <el-date-picker clearable
          v-model="queryParams.startTime"
          type="date"
          value-format="yyyy-MM-dd"
          placeholder="请选择开始时间">
        </el-date-picker>
      </el-form-item>
      <el-form-item label="结束时间" prop="endTime">
        <el-date-picker clearable
          v-model="queryParams.endTime"
          type="date"
          value-format="yyyy-MM-dd"
          placeholder="请选择结束时间">
        </el-date-picker>
      </el-form-item>
      <el-form-item label="费用" prop="rentAmount">
        <el-input
          v-model="queryParams.rentAmount"
          placeholder="请输入费用"
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
          v-hasPermi="['smart:park:rent:add']"
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
          v-hasPermi="['smart:park:rent:edit']"
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
          v-hasPermi="['smart:park:rent:remove']"
        >删除</el-button>
      </el-col>
      <!-- <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['smart:park:rent:export']"
        >导出</el-button>
      </el-col> -->
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="rentList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="车位" align="center" prop="parkingSpace.parkingSpaceNo" />
      <el-table-column label="费用" align="center" prop="fee.feeName" />
      <el-table-column label="开始时间" align="center" prop="startTime" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.startTime, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="结束时间" align="center" prop="endTime" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.endTime, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <!-- <el-table-column label="表显" align="center" prop="display" /> -->
      <el-table-column label="租金" align="center" prop="rentAmount" />
      <!-- <el-table-column label="显示顺序" align="center" prop="orderNum" /> -->
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
            v-hasPermi="['smart:park:rent:edit']"
          >修改</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['smart:park:rent:remove']"
          >删除</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleDelete(scope.row)"
            v-hasPermi="['smart:park:rent:gen']"
          >缴费</el-button>
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

    <!-- 添加或修改车位租赁信息对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="车位" prop="parkingSpaceId">
          <el-select v-model="form.parkingSpaceId" placeholder="请选择车位" filterable clearable style="width: 100%">
            <el-option v-for="dict in parkingSpaceList" :key="dict.parkingSpaceId" :label="dict.parkingSpaceNo" :value="dict.parkingSpaceId" />
          </el-select>
        </el-form-item>
        <el-form-item label="费用" prop="feeId">
          <el-select v-model="form.feeId" placeholder="请选择费用" filterable clearable style="width: 100%" @change="handleDateChange">
            <el-option v-for="dict in feeList" :key="dict.feeId" :label="dict.feeName" :value="dict.feeId" />
          </el-select>
        </el-form-item>
        <el-form-item label="开始时间" prop="startTime">
          <el-date-picker clearable
            v-model="form.startTime"
            type="date"
            value-format="yyyy-MM-dd"
            :style="`width: 100%`"
            placeholder="请选择开始时间"
            @change="handleDateChange">
          </el-date-picker>
        </el-form-item>
        <el-form-item label="结束时间" prop="endTime">
          <el-date-picker clearable
            v-model="form.endTime"
            type="date"
            value-format="yyyy-MM-dd"
            :style="`width: 100%`"
            placeholder="请选择结束时间"
            @change="handleDateChange">
          </el-date-picker>
        </el-form-item>
       <!-- <el-form-item label="表显" prop="display" v-if="feeType != 3">
          <el-input v-model="form.display" placeholder="请输入表显" />
        </el-form-item> -->
        <el-form-item label="租金" prop="rentAmount">
          <el-input v-model="form.rentAmount" placeholder="请输入租金" />
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
import { listRent, getRent, delRent, addRent, updateRent,changeStatus } from "@/api/smart/parkingRent";
import { listParkingSpace } from "@/api/smart/parkingSpace";
import { listFee } from "@/api/smart/fee";
export default {
  name: "Rent",
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
      // 车位租赁信息表格数据
      rentList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      feeType:3,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        parkingSpaceId:null,
        feeId:null,
        startTime: null,
        endTime: null,
        rentAmount: null,
        orderNum: null,
        status: null,
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
        ownerId: [
          { required: true, message: "业主不能为空", trigger: "blur" }
        ],
        feeId: [
          { required: true, message: "费用不能为空", trigger: "blur" }
        ],
        startTime: [
          { required: true, message: "开始时间不能为空", trigger: "blur" }
        ],
        endTime: [
          { required: true, message: "结束时间不能为空", trigger: "blur" }
        ],
       /* display: [
          { required: true, message: "表显不能为空", trigger: "blur" }
        ], */
        rentAmount: [
          { required: true, message: "租金不能为空", trigger: "blur" }
        ],
      },
      parkingSpaceList:[],
      feeList:[],
    };
  },
  created() {
    this.getList();
    this.getPrkingSpaceList();
    this.getFeeList();
  },
  methods: {
    /** 查询车位租赁信息列表 */
    getList() {
      this.loading = true;
      listRent(this.queryParams).then(response => {
        this.rentList = response.rows;
        this.total = response.total;
        this.loading = false;
      });
    },
    /** 查询业主车位信息列表 */
    getPrkingSpaceList() {
      listParkingSpace(this.queryParams).then(response => {
        this.parkingSpaceList = response.rows;
      });
    },
    /** 查询收费信息列表 */
    getFeeList() {
      listFee({pageNum: 1,pageSize: 1000}).then(response => {
        this.feeList = response.rows;
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
        parkingRentId: null,
        ownerId:null,
        parkingSpaceId:null,
        feeId:null,
        startTime: null,
        endTime: null,
        rentAmount: 0,
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
      this.ids = selection.map(item => item.parkingRentId)
      this.single = selection.length!==1
      this.multiple = !selection.length
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.open = true;
      this.title = "添加车位租赁信息";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const parkingRentId = row.parkingRentId || this.ids
      getRent(parkingRentId).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "修改车位租赁信息";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.parkingRentId != null) {
            updateRent(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addRent(this.form).then(response => {
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
      const parkingRentIds = row.parkingRentId || this.ids;
      this.$modal.confirm('是否确认删除车位租赁信息编号为"' + parkingRentIds + '"的数据项？').then(function() {
        return delRent(parkingRentIds);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {});
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('system/rent/export', {
        ...this.queryParams
      }, `rent_${new Date().getTime()}.xlsx`)
    },
    // 车位租赁状态修改
    handleStatusChange(row) {
      let text = row.status === "0" ? "启用" : "停用";
      this.$modal.confirm('确认要"' + text + '"吗？').then(function() {
        return changeStatus({parkingRentId:row.parkingRentId, status:row.status});
      }).then(() => {
        this.$modal.msgSuccess(text + "成功");
      }).catch(function() {
        row.status = row.status === "0" ? "1" : "0";
      });
    },
    calculateDifference() {
        if (!this.form.startTime || !this.form.endTime) {
          return;
        }

        // 将日期字符串转换为 Date 对象
        const start = new Date(this.form.startTime);
        const end = new Date(this.form.endTime);

        // 计算相差的毫秒数
        const timeDifference = end.getTime() - start.getTime();

        // 将毫秒数转换为天数
        return Math.ceil(timeDifference / (1000 * 60 * 60 * 24));
    },
    handleDateChange(){
      let rentAmount = 0;
      if(!this.form.feeId){
        return
      }else{
        let days = this.calculateDifference() || 0
        console.info("days==",days)
        let fee = this.feeList.find(item=>item.feeId===this.form.feeId)
        this.feeType = fee.feeType
        console.info("fee===>>",fee)
        rentAmount = Number(fee.price)*Number(days)
      }
      this.form.rentAmount = rentAmount
    }
  }
};
</script>
