<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="停车场" prop="parkingLotId">
        <el-select v-model="queryParams.parkingLotId" placeholder="请选择停车场" filterable clearable style="width: 240px">
          <el-option v-for="dict in parkingLotList" :key="dict.parkingLotId" :label="dict.parkingLotName" :value="dict.parkingLotId" />
        </el-select>
      </el-form-item>
      <el-form-item label="车位编号" prop="parkingSpaceNo">
        <el-input
          v-model="queryParams.plateNo"
          placeholder="请输入车位编号"
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
          v-hasPermi="['smart:park:space:add']"
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
          v-hasPermi="['smart:park:space:edit']"
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
          v-hasPermi="['smart:park:space:remove']"
        >删除</el-button>
      </el-col>
      <!-- <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['smart:park:space:export']"
        >导出</el-button>
      </el-col> -->
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="spaceList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="停车场" align="center" prop="parkingLot.parkingLotName" />
      <el-table-column label="停车场类型" align="center" prop="parkingLot.parkingLotType" >
        <template slot-scope="scope">
          <dict-tag :options="dict.type.parking_lot_type" :value="scope.row.parkingLot.parkingLotType"/>
        </template>
      </el-table-column>
      <el-table-column label="车位编号" align="center" prop="parkingSpaceNo" />
      <el-table-column label="车位类型" align="center" prop="parkingSpaceType" >
        <template slot-scope="scope">
          <dict-tag :options="dict.type.parking_space_type" :value="scope.row.parkingSpaceType"/>
        </template>
      </el-table-column>
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
      <el-table-column label="备注" align="center" prop="remark" :show-overflow-tooltip="true"/>
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['smart:park:space:edit']"
          >修改</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['smart:park:space:remove']"
          >删除</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleIn(scope.row)"
            v-hasPermi="['smart:park:space:in']"
            v-if="scope.row.parkingSpaceStatus == 0"
          >驶入</el-button>
         <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleOut(scope.row)"
            v-hasPermi="['smart:park:space:out']"
            v-if="scope.row.parkingSpaceStatus == 1"
          >驶出
         </el-button>
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

    <!-- 添加或修改车位信息对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body @close="cancel">
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="停车场" prop="parkingLotId">
          <el-select v-model="form.parkingLotId" placeholder="请选择停车场" filterable clearable style="width: 100%">
            <el-option v-for="dict in parkingLotList" :key="dict.parkingLotId" :label="dict.parkingLotName" :value="dict.parkingLotId" />
          </el-select>
        </el-form-item>
        <el-form-item label="车位编号" prop="parkingSpaceNo">
          <el-input v-model="form.parkingSpaceNo" placeholder="请输入车位编号" />
        </el-form-item>
        <el-form-item label="车位类型" prop="parkingSpaceType" >
           <el-select v-model="form.parkingSpaceType" placeholder="请选择车位类型" filterable clearable style="width: 100%">
              <el-option
                        v-for="dict in dict.type.parking_space_type"
                        :key="dict.value"
                        :label="dict.label"
                        :value="dict.value"
                      />
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

    <el-dialog :title="title" :visible.sync="inOpen" width="700px" append-to-body @close="cancel">
      <el-form ref="inForm" :model="inForm" :rules="inRules" label-width="110px">
        <el-form-item label="车辆所有人" prop="ownerId" v-if="roles.includes('admin')">
          <el-select v-model="inForm.ownerId" placeholder="请选择车辆所有人" filterable  clearable style="width: 100%">
            <el-option v-for="dict in userList" :key="dict.userId" :label="dict.userName" :value="dict.userId" />
          </el-select>
        </el-form-item>
        <el-form-item label="车位" prop="parkingSpaceId" v-if="1==2">
           <el-select v-model="inForm.parkingSpaceId" placeholder="请选择车位" filterable clearable style="width: 100%">
            <el-option v-for="dict in parkingSpaceList" :key="dict.parkingSpaceId" :label="dict.parkingSpaceNo" :value="dict.parkingSpaceId" />
          </el-select>
        </el-form-item>
        <el-form-item label="车牌照" >
          <imageUpload ref="imageUpload" @handleAfter="handleAfter"/>
        </el-form-item>
        <el-form-item label="车牌号" prop="plateNo"  >
          <el-input v-model="inForm.plateNo" placeholder="请输入车牌号" />
        </el-form-item>
        <el-form-item label="备注" prop="remark">
          <el-input v-model="inForm.remark" placeholder="请输入备注" />
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitInForm">确 定</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>
    </el-dialog>

    <el-dialog :title="title" :visible.sync="outOpen" width="700px" append-to-body @close="cancel">
      <el-form ref="outForm" :model="outForm" :rules="inRules" label-width="110px">
        <el-form-item label="车辆所有人" prop="ownerId" v-if="roles.includes('admin')">
          <el-select v-model="outForm.ownerId" placeholder="请选择车辆所有人" filterable  clearable style="width: 100%">
            <el-option v-for="dict in userList" :key="dict.userId" :label="dict.userName" :value="dict.userId" />
          </el-select>
        </el-form-item>
        <el-form-item label="车位" prop="parkingSpaceId" v-if="1==2">
          <el-select v-model="outForm.parkingSpaceId" placeholder="请选择车位" filterable clearable style="width: 100%">
            <el-option v-for="dict in parkingSpaceList" :key="dict.parkingSpaceId" :label="dict.parkingSpaceNo" :value="dict.parkingSpaceId" />
          </el-select>
        </el-form-item>

        <el-form-item label="车牌照" >
          <imageUpload ref="imageUpload" @handleAfter="handleAfter"/>
        </el-form-item>
        <el-form-item label="车牌号" prop="plateNo"  >
          <el-input v-model="outForm.plateNo" placeholder="请输入车牌号" />
        </el-form-item>
        <el-form-item label="备注" prop="remark">
          <el-input v-model="outForm.remark" placeholder="请输入备注" />
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitOutForm">确 定</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import { listParkingSpace, getParkingSpace, delParkingSpace, addParkingSpace, updateParkingSpace,changeStatus } from "@/api/smart/parkingSpace";
import { listLot } from "@/api/smart/parkingLot";
import {addRecord, getActiveRecordByParkingSpace, updateRecord} from "@/api/smart/parkingSpaceRecord";
import { listUser } from "@/api/system/user";
import imageUpload from "@/components/ImageUpload/index"
export default {
  name: "Space",
  dicts:['parking_lot_type','parking_space_status','parking_space_type'],
  components:[imageUpload],
  data() {
    return {
      baseUrl: process.env.VUE_APP_BASE_API,
      parkingLotList:[],
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
      showPlatNo: false,
      // 总条数
      total: 0,
      // 车位信息表格数据
      spaceList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      inOpen:false,
      outOpen:false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        parkingSpaceId: null,
        plateNo: null,
        parkingLotId: null,
      },
      // 表单参数
      form: {},
      inForm:{},
      outForm:{},
      // 表单校验
      rules: {
        parkingLotId: [
          { required: true, message: "停车场不能为空", trigger: "blur" }
        ],
        parkingSpaceNo: [
          { required: true, message: "车位不能为空", trigger: "blur" }
        ]
      },
      // 表单校验
      inRules: {
        ownerId: [
          { required: true, message: "车辆所有人不能为空", trigger: "blur" }
        ],
        parkingSpaceId: [
          { required: true, message: "车位不能为空", trigger: "blur" }
        ],
        plateNo: [{ required: true, message: "车牌号不能为空", trigger: "blur" }],
      },
      // 表单校验
      outRules: {
        ownerId: [
          { required: true, message: "车辆所有人不能为空", trigger: "blur" }
        ],
        parkingSpaceId: [
          { required: true, message: "车位不能为空", trigger: "blur" }
        ],
        plateNo: [{ required: true, message: "车牌号不能为空", trigger: "blur" }],
      },
      userList:[],
      roles:[]
    };
  },
  created() {
    this.getList();
    this.getParkingLotList();
    this.getUserList();
    this.roles = this.$store.getters.roles
  },
  methods: {
    /** 查询车位信息列表 */
    getList() {
      this.loading = true;
      listParkingSpace(this.queryParams).then(response => {
        this.spaceList = response.rows;
        this.total = response.total;
        this.loading = false;
      });
    },
    /** 查询停车场信息列表 */
    getParkingLotList() {
      listLot({pageNum: 1,pageSize: 1000}).then(response => {
        this.parkingLotList = response.rows;
      });
    },
    getUserList() {
      listUser({pageNum: 1,pageSize: 1000,userType:'11'}).then(response => {
          this.userList = response.rows;
        }
      );
    },
    // 取消按钮
    cancel() {
      this.open = false;
      this.inOpen = false;
      this.outOpen = false;
      this.reset();
      this.resetInForm();
      this.resetOutForm();
    },
    // 表单重置
    reset() {
      this.form = {
        parkingSpaceId: null,
        parkingSpaceNo: null,
        parkingSpaceStatus: null,
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
    resetInForm() {
      this.inForm = {
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
        updateTime: null
      };
      this.resetForm("inForm");
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
        updateTime: null
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
      this.ids = selection.map(item => item.ownerHouseId)
      this.single = selection.length!==1
      this.multiple = !selection.length
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.open = true;
      this.title = "添加车位信息";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const parkingSpaceId = row.parkingSpaceId || this.ids
      getParkingSpace(parkingSpaceId).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "修改车位信息";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.parkingSpaceId != null) {
            updateParkingSpace(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addParkingSpace(this.form).then(response => {
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
      const parkingSpaceIds = row.parkingSpaceId || this.ids;
      this.$modal.confirm('是否确认删除车位信息？').then(function() {
        return delParkingSpace(parkingSpaceIds);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {});
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('system/space/export', {
        ...this.queryParams
      }, `space_${new Date().getTime()}.xlsx`)
    },
    // 车位状态修改
    handleStatusChange(row) {
      let text = row.status === "0" ? "启用" : "禁用";
      this.$modal.confirm('确认要"' + text + '"吗？').then(function() {
        return changeStatus({parkingSpaceId:row.parkingSpaceId, status:row.status});
      }).then(() => {
        this.$modal.msgSuccess(text + "成功");
      }).catch(function() {
        row.status = row.status === "0" ? "1" : "0";
      });
    },
    // 车位状态修改
    handleParkingStatusChange(row) {
      let text = row.parkingSpaceStatus === "0" ? "空闲" : "占用";
      this.$modal.confirm('确认要"' + text + '"吗？').then(function() {
        return changeStatus({parkingSpaceId:row.parkingSpaceId, parkingSpaceStatus:row.parkingSpaceStatus});
      }).then(() => {
        this.$modal.msgSuccess(text + "成功");
      }).catch(function() {
        row.parkingSpaceStatus = row.parkingSpaceStatus === "0" ? "1" : "0";
      });
    },
    handleIn(row){
      this.resetInForm();
      this.inOpen = true;
      this.title = "驶入信息";
      this.inForm.parkingSpaceId = row.parkingSpaceId
    },
    //识别后处理
    handleAfter(res){
      let attrText = res.attrText || ''
      this.inForm.plateNo = attrText
      this.outForm.plateNo = attrText
    },

    //驶出按钮逻辑修改，与车位使用管理的驶出逻辑不同
    handleOut(row){
      this.resetOutForm();
      this.loading = true;
      this.title = "驶出信息";
      this.outForm.parkingSpaceId = row.parkingSpaceId;

      // 获取该车位的当前使用记录
      getActiveRecordByParkingSpace(row.parkingSpaceId).then(response => {
        if (response.code === 200 && response.data) {
          // 存储记录信息：车位使用记录id，业主id，车牌id
          this.outForm.parkingRecordId = response.data.parkingRecordId;
          this.outForm.expectedOwnerId = response.data.ownerId;
          this.outForm.expectedPlateNo = response.data.plateNo;

          // 测试：确保获取使车位使用记录
          const ownerName = this.userList.find(u => u.userId === response.data.ownerId)?.userName || '未知';
          this.$message.info(`当前车位使用信息: 车主 ${ownerName}, 车牌号 ${response.data.plateNo}`);

          this.outOpen = true;//驶出对话框显示状态打开
        } else {
          this.$modal.msgError("未找到该车位的使用记录");
        }
        this.loading = false;
      }).catch(error => {
        this.$modal.msgError("获取车位使用记录失败: " + (error.message || "未知错误"));
        this.loading = false;
      });
    }
    ,
    /** 提交按钮 */
    submitInForm() {
      this.$nextTick(()=>{
        //从上传组件中得到回调结果
        let fileList = this.$refs.imageUpload.fileList || []
        console.info("fileList===>>",fileList)
        if(fileList.length <= 0){
          this.$modal.msgError("请上传车牌照");
          return;
        }
        this.$refs["inForm"].validate(valid => {
          if (valid) {
              let fileList = this.$refs.imageUpload.fileList
              let file = fileList[0]
              console.info("fileList===<<<",fileList)
              let attr = {
                attrId: file.id,
                attrName: file.name,
                attrUrl: file.url,
                attrText: file.attrText
              }
              this.inForm.attr = attr
              this.inForm.plateNo = file.attrText
              addRecord(this.inForm).then(response => {
                this.$modal.msgSuccess("操作成功");
                this.inOpen = false;
                this.getList();
              });
          }
        });
      })
    },
    /** 提交驶出表单 */
    submitOutForm() {
      this.$nextTick(() => {
        let fileList = this.$refs.imageUpload.fileList || [];

        if (fileList.length <= 0) {
          this.$modal.msgError("请上传车牌照");
          return;
        }

        this.$refs["outForm"].validate(valid => {
          if (valid) {
            // 获取车牌识别结果
            let file = fileList[0];
            let recognizedPlateNo = file.attrText || '';

            // 验证车牌号是否匹配
            if (this.outForm.expectedPlateNo &&
              recognizedPlateNo !== this.outForm.expectedPlateNo) {
              this.$modal.msgError(`车牌号不匹配！当前记录的车牌号为: ${this.outForm.expectedPlateNo}`);
              return;
            }

            // 验证车主是否匹配（如果是管理员）
            if (this.roles.includes('admin') &&
              this.outForm.expectedOwnerId &&
              this.outForm.ownerId !== this.outForm.expectedOwnerId) {
              const expectedOwner = this.userList.find(u => u.userId === this.outForm.expectedOwnerId)?.userName || '未知';
              this.$modal.msgError(`车辆所有人不匹配！当前记录的车辆所有人为: ${expectedOwner}`);
              return;
            }

            // 构建更新数据
            const updateData = {
              parkingRecordId: this.outForm.parkingRecordId,  // 使用记录ID进行精确操作
              parkingSpaceId: this.outForm.parkingSpaceId,
              plateNo: recognizedPlateNo,
              ownerId: this.outForm.ownerId,
              driveStatus: '0'  // 设置为驶出状态
            };

            // 发送更新请求
            updateRecord(updateData)
              .then(response => {
                if (response.code === 200) {
                  this.$modal.msgSuccess("驶出成功");
                  this.outOpen = false;
                  this.getList();
                } else {
                  this.$modal.msgError(response.msg || "驶出失败");
                }
              })
              .catch(error => {
                this.$modal.msgError("驶出失败: " + (error.message || "未知错误"));
                console.error("驶出失败:", error);
              });
          }
        });
      });
    }

  }
};
</script>
