<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="费用类型" prop="feeId">
        <el-select v-model="queryParams.feeId" placeholder="请选择费用" filterable clearable style="width: 100%">
          <el-option v-for="dict in feeList" :key="dict.feeId" :label="dict.feeName" :value="dict.feeId" />
        </el-select>
      </el-form-item>

      <el-form-item label="业主" prop="ownerId">
        <el-select v-model="queryParams.ownerId" placeholder="请选择业主" filterable clearable style="width: 100%">
          <el-option v-for="dict in userList" :key="dict.userId" :label="dict.userName" :value="dict.userId" />
        </el-select>
      </el-form-item>
      <el-form-item label="费用" prop="amount">
        <el-input
          v-model="queryParams.amount"
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
          v-hasPermi="['smart:fee:record:add']"
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
          v-hasPermi="['smart:fee:record:edit']"
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
          v-hasPermi="['smart:fee:record:remove']"
        >删除</el-button>
      </el-col>
     <!-- <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['smart:record:export']"
        >导出</el-button>
      </el-col> -->
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="recordList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="费用名称" align="center" prop="fee.feeName" />
      <el-table-column label="业主" align="center" prop="owner.nickName" />
      <el-table-column label="表显" align="center" prop="display" />
      <el-table-column label="金额" align="center" prop="amount" />
      <el-table-column label="是否生成费用" align="center" prop="feeStatus" width="110">
        <template slot-scope="scope">
          <span>{{ scope.row.feeStatus == '0' ? '否' : '是' }}</span>
        </template>
      </el-table-column>
      <el-table-column label="备注" align="center" prop="remark" :show-overflow-tooltip="true"/>
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width" width="200">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['smart:fee:record:edit']"
          >修改</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['smart:fee:record:remove']"
          >删除</el-button>
          <el-button
             size="mini"
             type="text"
             icon="el-icon-edit"
             @click="handleFee(scope.row)"
             v-hasPermi="['smart:fee:record:gen']"
             v-if="scope.row.feeStatus == '0'"
           >生成费用</el-button>
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

    <!-- 添加或修改收费记录对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="费用类型" prop="feeId">
          <el-select v-model="form.feeId" placeholder="请选择费用类型" filterable clearable style="width: 100%" @change="handleDateChange">
            <el-option v-for="dict in feeList" :key="dict.feeId" :label="dict.feeName" :value="dict.feeId" />
          </el-select>
        </el-form-item>

        <el-form-item label="业主" prop="ownerId">
          <el-select v-model="form.ownerId" placeholder="请选择业主" filterable clearable style="width: 100%">
            <el-option v-for="dict in userList" :key="dict.userId" :label="dict.userName" :value="dict.userId" />
          </el-select>
        </el-form-item>
        <el-form-item label="表显" prop="display">
           <el-input v-model="form.display" placeholder="请输入表显" @change="handleDateChange"/>
         </el-form-item>
         <el-form-item label="所属月份" prop="month">
           <el-date-picker clearable
             v-model="form.month"
             type="month"
             value-format="yyyy-MM"
             :style="`width: 100%`"
             placeholder="请选择月份">
           </el-date-picker>
         </el-form-item>
        <el-form-item label="金额" prop="amount">
          <el-input v-model="form.amount" placeholder="请输入金额" />
        </el-form-item>
       <!-- <el-form-item label="显示顺序" prop="orderNum">
          <el-input v-model="form.orderNum" placeholder="请输入显示顺序" />
        </el-form-item> -->
       <!-- <el-form-item label="备注" prop="remark">
          <el-input v-model="form.remark" placeholder="请输入备注" />
        </el-form-item> -->
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitForm">确 定</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import { listRecord, getRecord, delRecord, addRecord, updateRecord,changeStatus,addCommonFee } from "@/api/smart/feeRecord";
import { listFee } from "@/api/smart/fee";
import { listUser } from "@/api/system/user";
export default {
  name: "Record",
  dicts:['pay_status'],
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
      // 收费记录表格数据
      recordList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        feeId: null,
        ownerId: null,
        amount: null,
        orderNum: null,
        status: null,
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
        feeId: [
          { required: true, message: "费用不能为空", trigger: "blur" }
        ],
        ownerId: [
          { required: true, message: "业主不能为空", trigger: "blur" }
        ],
        amount: [
          { required: true, message: "费用不能为空", trigger: "blur" }
        ],
        display: [
          { required: true, message: "表显不能为空", trigger: "blur" }
        ],
        month: [
          { required: true, message: "所属月份不能为空", trigger: "blur" }
        ]
      },
      userList:[],
      feeList:[],
      feeType:3
    };
  },
  created() {
    this.getList();
    this.getUserList();
    this.getFeeList();
  },
  methods: {
    /** 查询收费记录列表 */
    getList() {
      this.loading = true;
      listRecord(this.queryParams).then(response => {
        this.recordList = response.rows;
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
        if(this.feeList.length > 0){
          const wFeeObj = this.feeList.find(item => item.feeType == '1');
          const eFeeObj = this.feeList.find(item => item.feeType == '2');
          this.feeList = [wFeeObj,eFeeObj]
        }
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
        feeRecordId: null,
        feeId: null,
        ownerId: null,
        amount: null,
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
      this.ids = selection.map(item => item.feeRecordId)
      this.single = selection.length!==1
      this.multiple = !selection.length
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.open = true;
      this.title = "添加收费记录";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const feeRecordId = row.feeRecordId || this.ids
      getRecord(feeRecordId).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "修改收费记录";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.feeRecordId != null) {
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
      const feeRecordIds = row.feeRecordId || this.ids;
      this.$modal.confirm('是否确认删除收费记录编号为"' + feeRecordIds + '"的数据项？').then(function() {
        return delRecord(feeRecordIds);
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
    // 费用状态修改
    handleStatusChange(row) {
      let text = row.status === "1" ? "启用" : "停用";
      this.$modal.confirm('确认要"' + text + '"吗？').then(function() {
        return changeStatus({feeRecordId:row.feeRecordId, status:row.status});
      }).then(() => {
        this.$modal.msgSuccess(text + "成功");
      }).catch(function() {
        row.status = row.status === "0" ? "1" : "0";
      });
    },
    handleDateChange(){
      let amount = 0;
      if(!this.form.feeId){
        return
      }else{
        let fee = this.feeList.find(item=>item.feeId===this.form.feeId)
        this.feeType = fee.feeType
        let num = fee.feeType == 3 ? this.fothis.calculateDifference() : this.form.display || 0
        console.info("feeType===",fee.feeType)
        console.info("this.form.display===",this.form.display || 0)
        amount = Number(fee.price)*Number(num)
        this.form.amount = amount
      }
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
        return Math.ceil(timeDifference / (1000 * 60 * 60 * 24)) || 0;
    },
    handlePay(row){
      this.$modal.confirm('确认要缴费吗？').then(function() {
        return changeStatus({feeRecordId:row.feeRecordId, payStatus:'1'});
      }).then(() => {
        this.$modal.msgSuccess("缴费成功");
        this.getList()
      }).catch(function() {

      });
    },
    handleFee(row){
      this.$modal.confirm('是否确认要生成费用？').then(function() {
        return addCommonFee(row);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("费用生成成功");
      }).catch(() => {});
    }
  }
};
</script>
