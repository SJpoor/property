<template>
  <div class="app-container">
    <h4 class="form-header h4">基本信息</h4>
    <el-form ref="form" :model="form" label-width="80px">
      <el-row>
        <el-col :span="8" :offset="2">
          <el-form-item label="业主" prop="nickName">
            <el-input v-model="form.nickName" disabled />
          </el-form-item>
        </el-col>
        <el-col :span="8" :offset="2">
          <el-form-item label="手机号" prop="phonenumber">
            <el-input  v-model="form.phonenumber" disabled />
          </el-form-item>
        </el-col>
      </el-row>
    </el-form>

    <h4 class="form-header h4">房屋信息</h4>
    <el-table v-loading="loading" :row-key="getRowKey" @row-click="clickRow" ref="table" @selection-change="handleSelectionChange" :data="houses.slice((pageNum-1)*pageSize,pageNum*pageSize)">
      <el-table-column label="序号" type="index" align="center">
        <template slot-scope="scope">
          <span>{{(pageNum - 1) * pageSize + scope.$index + 1}}</span>
        </template>
      </el-table-column>
      <el-table-column type="selection" :reserve-selection="true" width="55"></el-table-column>
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
      <!-- <el-table-column label="状态" align="center" prop="status" >
        <template slot-scope="scope">
          <el-switch v-model="scope.row.status" active-value="0" inactive-value="1" @change="handleStatusChange(scope.row)"></el-switch>
        </template>
      </el-table-column> -->
      <!-- <el-table-column label="备注" align="center" prop="remark" :show-overflow-tooltip="true"/> -->

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
import { getAuthHouse, updateAuthHouse } from "@/api/system/user";

export default {
  name: "AuthHouse",
  dicts:['house_type','house_use_status','build_type'],
  data() {
    return {
       // 遮罩层
      loading: true,
      // 分页信息
      total: 0,
      pageNum: 1,
      pageSize: 10,

      // 用户信息
      form: {},
      // 房屋信息
      houses: [],
      // 选中房屋编号
      houseIds:[],
      roles:[]
    };
  },
  created() {
    this.roles = this.$store.getters.roles
    const ownerId = this.$route.params && this.$route.params.ownerId;
    if (ownerId) {
      this.loading = true;
      getAuthHouse(ownerId).then((response) => {
        this.form = response.owner;
        this.houses = response.houses;
        this.total = this.houses.length;
        this.$nextTick(() => {
          this.houses.forEach((row) => {
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
      this.houseIds = selection.map((item) => item.houseId);
    },
    // 保存选中的数据编号
    getRowKey(row) {
      return row.houseId;
    },
    /** 提交按钮 */
    submitForm() {
      const ownerId = this.form.userId;
      const houseIds = this.houseIds.join(",");
      updateAuthHouse({ ownerId: ownerId, houseIds: houseIds }).then((response) => {
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
