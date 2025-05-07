<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="100px">
      <el-form-item label="停车场名称" prop="parkingLotName">
        <el-input
          v-model="queryParams.parkingLotName"
          placeholder="请输入停车场名称"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="停车场类型" prop="parkingLotType">
        <el-select v-model="queryParams.parkingLotType" placeholder="请选择停车场类型" filterable clearable style="width: 240px">
          <el-option v-for="dict in dict.type.parking_lot_type" :key="dict.value" :label="dict.label" :value="dict.value" />
        </el-select>
      </el-form-item>
      <el-form-item label="车位总数" prop="totalSpace">
        <el-input
          v-model="queryParams.totalSpace"
          placeholder="请输入车位总数"
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
          v-hasPermi="['smart:park:add']"
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
          v-hasPermi="['smart:park:edit']"
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
          v-hasPermi="['smart:parkremove']"
        >删除</el-button>
      </el-col>
      <!-- <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['smart:parkexport']"
        >导出</el-button>
      </el-col> -->
<!--      查询停车场信息，刷新-->
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="lotList"  @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="停车场名称" align="center" prop="parkingLotName" />
      <el-table-column label="停车场类型" align="center" prop="parkingLotType" >
        <template slot-scope="scope">
          <dict-tag :options="dict.type.parking_lot_type" :value="scope.row.parkingLotType"/>
        </template>
      </el-table-column>

<!--      目前：车位总数固定，在车位管理中分配车位后重新计算剩余车位-->
<!--      或者：车位管理分配的车位作为车位总数，剩余车位 = 车位总数 - 占用状态车位-->
      <el-table-column label="车位总数" align="center" prop="totalSpace" />

<!--      <el-table-column label="剩余车位" align="center" prop="parkingLotId" >
        <template slot-scope="scope" >
          {{scope.row.totalSpace - scope.row.availableSpaces }}
        </template>
      </el-table-column>-->

<!--      <el-table-column :data="parkingLotStats" prop="availableSpaces" label="可用车位" align="center">-->
<!--        <template slot-scope="scope">-->
<!--          <el-tag :type="scope.row.availableSpaces > 10 ? 'success' : 'danger'">-->
<!--            {{ scope.row.availableSpaces }}-->
<!--          </el-tag>-->
<!--        </template>-->
<!--      </el-table-column>-->


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
            v-hasPermi="['smart:park:edit']"
          >修改</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['smart:park:remove']"
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

    <!-- 添加或修改停车场信息对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="100px">
        <el-form-item label="停车场名称" prop="parkingLotName">
          <el-input v-model="form.parkingLotName" placeholder="请输入停车场名称" />
        </el-form-item>
        <el-form-item label="停车场类型" prop="parkingLotType">
          <el-select v-model="form.parkingLotType" placeholder="请选择停车场类型" filterable clearable style="width: 100%">
            <el-option v-for="dict in dict.type.parking_lot_type" :key="dict.value" :label="dict.label" :value="dict.value" />
          </el-select>
        </el-form-item>
        <el-form-item label="车位总数" prop="totalSpace">
          <el-input v-model="form.totalSpace" placeholder="请输入车位总数" />
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

    <!-- 添加停车场车位统计区域 -->
    <el-row :gutter="20" style="margin-bottom: 20px;">
      <el-col :span="24">
        <el-card shadow="hover">
          <div slot="header">
            <span style="font-weight: bold; font-size: 16px;">
              <i class="el-icon-location"></i> 停车场车位统计
            </span>
            <el-button style="float: right; padding: 3px 0" type="text" icon="el-icon-refresh" @click="refreshParkingStats">刷新</el-button>
          </div>
          <el-table :data="parkingLotStats" border style="width: 100%">
            <el-table-column prop="parkingLotName" label="停车场名称" align="center" />
            <el-table-column prop="totalSpaces" label="已分配车位数" align="center" />
            <el-table-column prop="occupiedSpaces" label="已占用车位" align="center" />
            <el-table-column prop="availableSpaces" label="可用车位" align="center">
              <template slot-scope="scope">
                <el-tag :type="scope.row.availableSpaces > 10 ? 'success' : 'danger'">
                  {{ scope.row.availableSpaces }}
                </el-tag>
              </template>
            </el-table-column>
          </el-table>
        </el-card>
      </el-col>
    </el-row>

  </div>
</template>

<script>
import { listLot, getLot, delLot, addLot, updateLot,changeStatus } from "@/api/smart/parkingLot";
import {listUser} from "@/api/system/user";
// import { listParkingSpace, getParkingSpace, delParkingSpace, addParkingSpace, updateParkingSpace,changeStatus } from "@/api/smart/parkingSpace";
import { listParkingSpace } from "@/api/smart/parkingSpace";

export default {
  name: "Lot",
  dicts:['parking_lot_type'],
  data() {
    return {
      parkingLotList:[],
      parkingLotStats: [], // 新增：存储停车场车位统计信息
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
      // 停车场信息表格数据
      lotList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        parkingLotName: null,
        totalSpace: null,
        orderNum: null,
        status: null,
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
        parkingLotName: [
          { required: true, message: "停车场名称不能为空", trigger: "blur" }
        ],
        parkingLotType: [
          { required: true, message: "停车场类型不能为空", trigger: "blur" }
        ],
        totalSpace: [
          { required: true, message: "车位总数不能为空", trigger: "blur" }
        ]
      }
    };
  },
  created() {
    this.getList();
    this.getParkingLotListWithStats(); // 修改：调用新方法获取带统计信息的停车场列表
    this.getUserList();
    this.roles = this.$store.getters.roles
  },
  methods: {
    /** 查询停车场信息列表 */
    getList() {
      this.loading = true;
      listLot(this.queryParams).then(response => {
        this.lotList = response.rows;
        this.total = response.total;
        this.loading = false;
      });
    },

    //弃用
    getOccList(){
      this.loading = true;
      listLot(this.queryParams).then(response => {
        this.lotList = response.rows;
        this.total = response.total;
        this.loading = false;
      });
    },

    getUserList() {
      listUser({pageNum: 1,pageSize: 1000,userType:'11'}).then(response => {
          this.userList = response.rows;
        }
      );
    },

    //重新统计车位数量
    /** 查询停车场信息列表及其车位统计 */
    /*停车场与车位关联
    * */
    getParkingLotListWithStats() {
      // 先获取停车场列表
      listLot({pageNum: 1, pageSize: 1000}).then(response => {
        this.parkingLotList = response.rows;

        // 没有停车场数据，则不继续处理
        if (!this.parkingLotList || this.parkingLotList.length === 0) {
          return;
        }

        // 获取所有车位信息列表，用于计算每个停车场的车位统计(停车位controller方法)
        listParkingSpace({pageNum: 1, pageSize: 10000}).then(spaceResponse => {
          const spaces = spaceResponse.rows || [];

          // 创建停车场ID到停车场对象的映射，方便后续查找
          const parkingLotMap = {};
          // 遍历停车场列表，然后
          this.parkingLotList.forEach(lot => {
            parkingLotMap[lot.parkingLotId] = { ...lot };
          });

          // 获取所有车位后按照停车场id分组

          /*lot作为map（）方法回调参数，是parkingLotList每个停车场对象，最后用数组stats统计
          * s作为find（）方法和回调参数，代表stats数组中的每个统计对象（lot -> stats）
          *
          * lot 是原始停车场数据对象
          *  s 是基于原始数据创建的统计对象
          *
          * 变量名不同但是代表的是同一数据在不同阶段的引用
          * */




          // 初始化停车场统计数据，lot回调参数会包含prkinglotid，后续与每个车位内的停车场id进行判断
          const stats = this.parkingLotList.map(lot => ({
            parkingLotId: lot.parkingLotId,
            parkingLotName: lot.parkingLotName,
            totalSpaces: 0, //已分配车位数
            occupiedSpaces: 0,  //已占用车位
            availableSpaces: 0  //可用车位
          }));

          // 统计每个停车场的车位情况(遍历每一个车位，通过车位的停车场id区分停车场)
          spaces.forEach(space => {
            if (!space.parkingLot || !space.parkingLot.parkingLotId) return;

            const lotId = space.parkingLot.parkingLotId;//得到停车场id
            const lotStat = stats.find(s => s.parkingLotId === lotId);//s依次引用每个停车场id直到找到等于lotId位置，parkingLotId = lotId则找到这个车位归属的停车场
            //这里不使用lot。parkingLotId是因为不再直接使用原始的停车场对象，lot对象数据被tats统计，而是使用从中派生出来的统计对象。
            /*如果使用lot：
            * parkingLotList.forEach(lot => {
                // 添加统计字段
                lot.totalSpaces = 0;
                lot.occupiedSpaces = 0;
                lot.availableSpaces = 0;
              });
            * const originalLot = parkingLotList.find(lot => lot.parkingLotId === lotId);
            * 每次查找都需要遍历整个parkingLotList数组
            * */


            if (lotStat) {
              lotStat.totalSpaces++;
              if (space.parkingSpaceStatus === '1') { // 假设1表示已占用
                lotStat.occupiedSpaces++;
              } else {
                lotStat.availableSpaces++;
              }
            }
          });

          // 更新统计结果
          this.parkingLotStats = stats;
        });
      });
    },
    // 刷新停车场统计信息
    refreshParkingStats() {
      this.getParkingLotListWithStats();
    },


    // 取消按钮
    cancel() {
      this.open = false;
      this.reset();
    },
    // 表单重置
    reset() {
      this.form = {
        parkingLotId: null,
        parkingLotName: null,
        totalSpace: null,
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
      this.ids = selection.map(item => item.parkingLotId)
      this.single = selection.length!==1
      this.multiple = !selection.length
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.open = true;
      this.title = "添加停车场信息";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const parkingLotId = row.parkingLotId || this.ids
      getLot(parkingLotId).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "修改停车场信息";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.parkingLotId != null) {
            updateLot(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addLot(this.form).then(response => {
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
      const parkingLotIds = row.parkingLotId || this.ids;
      this.$modal.confirm('是否确认删除停车场信息？').then(function() {
        return delLot(parkingLotIds);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {});
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('system/lot/export', {
        ...this.queryParams
      }, `lot_${new Date().getTime()}.xlsx`)
    },
    // 停车场状态修改
    handleStatusChange(row) {
      let text = row.status === "0" ? "启用" : "停用";
      this.$modal.confirm('确认要"' + text + '"吗？').then(function() {
        return changeStatus({parkingLotId:row.parkingLotId, status:row.status});
      }).then(() => {
        this.$modal.msgSuccess(text + "成功");
      }).catch(function() {
        row.status = row.status === "0" ? "1" : "0";
      });
    },
  }
};
</script>
