<template>
  <div class="homepage-container">

  <el-row :gutter="20">
    <!-- 第一个卡片 -->
    <el-col :xs="24" :sm="24" :md="8" :lg="8" :xl="8">
      <el-card class="box-card">
        <div slot="header" class="clearfix">
          <span style="font-weight: bold; color: lightslategrey ; font-size: 20px">用户总数</span>
        </div>
        <div class="text item">
<!--          <img src="@/assets/images/home/index_1.png" alt="" style="float: left; margin-right: 5px;" />-->
          <img src="@/assets/images/home/index_1.png" alt="" style="float: left;width: 50px; height: 50px;" />
          <span style="font-weight: bold; color: cornflowerblue; font-size: 32px;">{{ usertotal }}</span>
        </div>
      </el-card>
    </el-col>
    <!-- 第二个卡片 -->
    <el-col :xs="24" :sm="24" :md="8" :lg="8" :xl="8">
      <el-card class="box-card">
        <div slot="header" class="clearfix">
          <span style="font-weight: bold; color: lightslategrey ; font-size: 20px">车位数量</span>
        </div>
        <div class="text item">
          <img src="@/assets/images/home/车位 (1).png" alt="" style="float: left;width: 50px; height: 50px;" />
          <span style="font-weight: bold; color: orangered; font-size: 32px;">{{ cartotal }}</span>
        </div>
      </el-card>
    </el-col>
    <!-- 第三个卡片 -->
    <el-col :xs="24" :sm="24" :md="8" :lg="8" :xl="8">
      <el-card class="box-card">
        <div slot="header" class="clearfix">
          <span style="font-weight: bold; color: lightslategrey ; font-size: 20px">费用单数</span>
        </div>
        <div class="text item">
          <img src="@/assets/images/home/费用单据.png" alt="" style="float: left;width: 50px; height: 50px;" />
          <span style="font-weight: bold; color: orange; font-size: 32px;">{{ feetotal }}</span>
        </div>
      </el-card>
    </el-col>
  </el-row>

    <!-- 左右两栏布局 -->
    <el-row :gutter="20">
      <!-- 左侧维修记录组件 -->
      <el-col :xs="24" :sm="24" :md="12" :lg="12">
        <div class="repair-list-container">
          <h3 class="section-title" style="font-weight: bold; color: lightslategrey ; font-size: 20px">维修记录</h3>
          <el-table v-loading="loading" :data="repairList" class="el-table-wrapper">
            <el-table-column type="selection" width="55" align="center" />
            <el-table-column label="业主" align="center" prop="owner.nickName" />
            <el-table-column label="标题" align="center" prop="title" />
            <el-table-column label="内容" align="center" prop="content">
              <template slot-scope="scope">
                <span v-html="scope.row.content"></span>
              </template>
            </el-table-column>
          </el-table>
          <!--    列表分页-->
          <pagination
            v-show="repairtotal>0"
            :total="repairtotal"
            :page.sync="queryParams1.pageNum"
            :limit.sync="queryParams1.pageSize"
            @pagination="getRepairList"
          />
        </div>
      </el-col>

      <!-- 右侧缴费记录组件，与左侧结构完全相同 -->
      <el-col :xs="24" :sm="24" :md="12" :lg="12">
        <div class="repair-list-container">
          <h3 class="section-title" style="font-weight: bold; color: lightslategrey ; font-size: 20px">投诉记录</h3>
          <!--投诉列表展示-->
          <el-table v-loading="loading" :data="complainList" class="el-table-wrapper">
            <el-table-column type="selection" width="55" align="center" />
            <el-table-column label="业主" align="center" prop="owner.nickName" />
            <el-table-column label="标题" align="center" prop="title" />
            <el-table-column label="内容" align="center" prop="content" :show-overflow-tooltip="true">
              <template slot-scope="scope">
                <span v-html="scope.row.content"></span>
              </template>
            </el-table-column>
          </el-table>
          <!--    列表分页-->
          <pagination
            v-show="complaintotal>0"
            :total="complaintotal"
            :page.sync="queryParams2.pageNum"
            :limit.sync="queryParams2.pageSize"
            @pagination="getComplainList"
          />
        </div>
      </el-col>
    </el-row>

  </div>
</template>

<script>
import { listUser} from "@/api/system/user";
import { listParkingSpace } from "@/api/smart/parkingSpace";
import { listList } from "@/api/smart/feeList";
import {listRepair} from "@/api/smart/repair";
import {listComplain} from "@/api/smart/complain";

export default {
  data() {
    return {
      htmlSrc:'static/index_v3.html',
      // 遮罩层
      loading: true,
      // user总条数
      usertotal: 0,
      // car总条数
      cartotal: 0,
      // fee总条数
      feetotal: 0,
      // 维修总条数
      repairtotal: 0,
      // 投诉总条数
      complaintotal: 0,
      // 维修信息表格数据
      repairList: [],
      // 投诉信息表格数据
      complainList: [],
      // 用户表格数据
      userList: null,
      size: null,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        userName: undefined,
        phonenumber: undefined,
        status: undefined,
        deptId: undefined,
        userType:'11'
      },
      // 维修查询参数
      queryParams1: {
        pageNum: 1,
        pageSize: 10,
        title: null,
        content: null,
        address: null,
        phone: null,
        status: null,
      },
      // 投诉查询参数
      queryParams2: {
        pageNum: 1,
        pageSize: 10,
        ownerId:null,
        title: null,
        content: null,
        status: null,
      },
    };

  },
  //自动装载
  created() {
    this.UserCount();
    this.CarCount();
    this.FeeCount();
    // 维修
    this.getRepairList();
      // this.getUserList();
      // this.roles = this.$store.getters.roles
    //投诉
    this.getComplainList();
      // this.getUserList();
      // this.roles = this.$store.getters.roles
  },
  methods: {
    //用户
    UserCount: function () {
      this.loading = true;
      listUser(this.addDateRange(this.queryParams, this.dateRange)).then(response => {
        // this.userList = response.rows;
        this.usertotal = response.total;
        this.loading = false;
        }
      );
    },
    //车辆
    CarCount() {
      this.loading = true;
      listParkingSpace(this.queryParams).then(response => {
        // this.spaceList = response.rows;
        this.cartotal = response.total;
        this.loading = false;
      });
    },
    //费用
    FeeCount() {
      this.loading = true;
      listList(this.queryParams).then(response => {
        // this.spaceList = response.rows;
        this.feetotal = response.total;
        this.loading = false;
      });
    },
    //报修
    getRepairList() {
      this.loading = true;
      //queryParams1是维修参数
      listRepair(this.queryParams1).then(response => {
        this.repairList = response.rows;
        this.repairtotal = response.total;
        this.loading = false;
      });
    },
    getUserList() {
      listUser({pageNum: 1,pageSize: 1000,userType:'11'}).then(response => {
          this.userList = response.rows;
        }
      );
    },
    /** 查询投诉信息列表 */
    getComplainList() {
      this.loading = true;
      listComplain(this.queryParams2).then(response => {
        this.complainList = response.rows;
        this.complaintotal = response.total;
        this.loading = false;
      });
    },
  },
};
</script>



<style>

.item {
  margin-bottom: 18px;
}

.clearfix:before,
.clearfix:after {
  display: table;
  content: "";
}
.clearfix:after {
  clear: both
}

.box-card {
  width: 480px;
}
.box-card {
  margin-bottom: 20px;
}
.text.item {
  text-align: center;
  padding: 15px 0;
}
</style>

<!--报修格式-->
<style scoped>
.homepage-container {
  padding: 20px;
}
.repair-list-container {
  margin-top: 20px;
  width: 100%; /* 或指定宽度，如 calc(33.33% - 20px) */
  max-width: 800px; /* 限制最大宽度 */

  background-color: #fff;
  border-radius: 4px;
  box-shadow: 0 2px 12px 0 rgba(0, 0, 0, 0.1);
  padding: 15px;
  overflow-y: auto;/* 添加垂直滚动条 */
}
.section-title {
  margin-top: 0;
  margin-bottom: 15px;
  font-size: 18px;
  color: #303133;
}
/*首页维修消息长度*/
.el-table-wrapper {
  max-height: 600px;
  overflow-y: auto;
}

/*//picture*/
    /* 在CSS文件中添加 */
  .left-image {
    float: left;
    margin-right: 20px; /* 图片与右侧内容的间距 */
    width: auto; /* 或设置具体宽度 */
    height: auto; /* 或设置具体高度 */
  }

.content-wrapper {
  overflow: hidden; /* 清除浮动 */
}
</style>
