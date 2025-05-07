<template>
  <div class="app-container">
    <!-- <h4 class="form-header h4">基本信息</h4>
    <el-form ref="form" :model="form" label-width="80px">
      <el-row>
        <el-col :span="8" :offset="2">
          <el-form-item label="用户昵称" prop="nickName">
            <el-input v-model="form.nickName" disabled />
          </el-form-item>
        </el-col>
        <el-col :span="8" :offset="2">
          <el-form-item label="登录账号" prop="userName">
            <el-input  v-model="form.userName" disabled />
          </el-form-item>
        </el-col>
      </el-row>
    </el-form> -->

    <h4 class="form-header h4">车位信息</h4>
    <el-table v-loading="loading" :row-key="getRowKey" @row-click="clickRow" ref="table" @selection-change="handleSelectionChange" :data="parkingSpaces.slice((pageNum-1)*pageSize,pageNum*pageSize)">
      <el-table-column label="序号" type="index" align="center">
        <template slot-scope="scope">
          <span>{{(pageNum - 1) * pageSize + scope.$index + 1}}</span>
        </template>
      </el-table-column>
      <el-table-column type="selection" :reserve-selection="true" width="55"></el-table-column>
      <el-table-column label="停车场" align="center" prop="parkingLot.parkingLotName" />
      <el-table-column label="停车场类型" align="center" prop="parkingLot.parkingLotType" >
        <template slot-scope="scope">
          <dict-tag :options="dict.type.parking_lot_type" :value="scope.row.parkingLot.parkingLotType"/>
        </template>
      </el-table-column>
      <el-table-column label="车位编号" align="center" prop="parkingSpaceNo" />
      <el-table-column label="车位状态" align="center" prop="parkingSpaceStatus" >
        <template slot-scope="scope">
          <dict-tag :options="dict.type.parking_space_status" :value="scope.row.parkingSpaceStatus"/>
        </template>
      </el-table-column>
      <!-- <el-table-column label="显示顺序" align="center" prop="orderNum" /> -->
     <!-- <el-table-column label="状态" align="center" prop="status" >
        <template slot-scope="scope">
          <el-switch v-model="scope.row.status" active-value="0" inactive-value="1" @change="handleStatusChange(scope.row)"></el-switch>
        </template>
      </el-table-column> -->

    </el-table>

    <pagination v-show="total>0" :total="total" :page.sync="pageNum" :limit.sync="pageSize" />

    <el-form label-width="100px">
      <el-form-item style="text-align: center;margin-left:-120px;margin-top:30px;">
        <el-button type="primary" @click="submitForm()" v-if="roles.includes('admin')">提交</el-button>
        <el-button @click="close()">返回</el-button>
      </el-form-item>
    </el-form>
  </div>
</template>

<script>
import { getAuthParkingSpace, updateAuthParkingSpace } from "@/api/system/user";

export default {
  name: "AuthParkingSpace",
  dicts:['parking_lot_type','parking_space_status'],
  data() {
    return {
       // 遮罩层
      loading: true,
      // 分页信息
      total: 0,
      pageNum: 1,
      pageSize: 10,
      // 选中角色编号
      parkingSpaceIds:[],
      // 角色信息
      parkingSpaces: [],
      // 用户信息
      form: {},
      roles:[]
    };
  },
  created() {
    this.roles = this.$store.getters.roles
    const ownerId = this.$route.params && this.$route.params.ownerId;
    if (ownerId) {
      this.loading = true;
      getAuthParkingSpace(ownerId).then((response) => {
        this.form = response.owner;
        this.parkingSpaces = response.parkingSpaces;
        this.total = this.parkingSpaces.length;
        this.$nextTick(() => {
          this.parkingSpaces.forEach((row) => {
            if (row.flag) {
              this.$refs.table.toggleRowSelection(row);
            }
          });
        });
        this.loading = false;
      });
    }
  },
  methods: {
    /** 单击选中行数据 */
    clickRow(row) {
      this.$refs.table.toggleRowSelection(row);
    },
    // 多选框选中数据
    handleSelectionChange(selection) {
      this.parkingSpaceIds = selection.map((item) => item.parkingSpaceId);
    },
    // 保存选中的数据编号
    getRowKey(row) {
      return row.parkingSpaceId;
    },
    /** 提交按钮 */
    submitForm() {
      const ownerId = this.form.userId;
      const parkingSpaceIds = this.parkingSpaceIds.join(",");
      updateAuthParkingSpace({ ownerId: ownerId, parkingSpaceIds: parkingSpaceIds }).then((response) => {
        this.$modal.msgSuccess("分配成功");
        this.close();
      });
    },
    /** 关闭按钮 */
    close() {
      const obj = { path: "/ownerHouseManage/owner" };
      this.$tab.closeOpenPage(obj);
    },
  },
};
</script>
