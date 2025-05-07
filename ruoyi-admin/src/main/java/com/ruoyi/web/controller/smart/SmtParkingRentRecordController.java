package com.ruoyi.web.controller.smart;

import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.smart.domain.SmtParkingRentRecord;
import com.ruoyi.smart.service.ISmtParkingRentRecordService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * 车位租赁记录Controller
 * 
 * @author ruoyi
 * @date 2025-02-23
 */
@RestController
@RequestMapping("/smart/park/rent/record")
public class SmtParkingRentRecordController extends BaseController
{
    @Autowired
    private ISmtParkingRentRecordService smtParkingRentRecordService;

    /**
     * 查询车位租赁记录列表
     */
    @PreAuthorize("@ss.hasPermi('smart:park:rent:record:list')")
    @GetMapping("/list")
    public TableDataInfo list(SmtParkingRentRecord smtParkingRentRecord)
    {
        startPage();
        List<SmtParkingRentRecord> list = smtParkingRentRecordService.selectSmtParkingRentRecordList(smtParkingRentRecord);
        return getDataTable(list);
    }

    /**
     * 导出车位租赁记录列表
     */
    @PreAuthorize("@ss.hasPermi('smart:park:rent:record:export')")
    @Log(title = "车位租赁记录", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, SmtParkingRentRecord smtParkingRentRecord)
    {
        List<SmtParkingRentRecord> list = smtParkingRentRecordService.selectSmtParkingRentRecordList(smtParkingRentRecord);
        ExcelUtil<SmtParkingRentRecord> util = new ExcelUtil<SmtParkingRentRecord>(SmtParkingRentRecord.class);
        util.exportExcel(response, list, "车位租赁记录数据");
    }

    /**
     * 获取车位租赁记录详细信息
     */
    @PreAuthorize("@ss.hasPermi('smart:park:rent:record:query')")
    @GetMapping(value = "/{parkingRentRecordId}")
    public AjaxResult getInfo(@PathVariable("parkingRentRecordId") Long parkingRentRecordId)
    {
        return success(smtParkingRentRecordService.selectSmtParkingRentRecordByParkingRentRecordId(parkingRentRecordId));
    }

    /**
     * 新增车位租赁记录
     */
    @PreAuthorize("@ss.hasPermi('smart:park:rent:record:add')")
    @Log(title = "车位租赁记录", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody SmtParkingRentRecord smtParkingRentRecord)
    {
        return toAjax(smtParkingRentRecordService.insertSmtParkingRentRecord(smtParkingRentRecord));
    }

    /**
     * 修改车位租赁记录
     */
    @PreAuthorize("@ss.hasPermi('smart:park:rent:record:edit')")
    @Log(title = "车位租赁记录", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody SmtParkingRentRecord smtParkingRentRecord)
    {
        return toAjax(smtParkingRentRecordService.updateSmtParkingRentRecord(smtParkingRentRecord));
    }

    /**
     * 删除车位租赁记录
     */
    @PreAuthorize("@ss.hasPermi('smart:park:rent:record:remove')")
    @Log(title = "车位租赁记录", businessType = BusinessType.DELETE)
	@DeleteMapping("/{parkingRentRecordIds}")
    public AjaxResult remove(@PathVariable Long[] parkingRentRecordIds)
    {
        return toAjax(smtParkingRentRecordService.deleteSmtParkingRentRecordByParkingRentRecordIds(parkingRentRecordIds));
    }

    /**
     * 状态修改
     */
    @PreAuthorize("@ss.hasPermi('smart:park:rent:record:edit')")
    @Log(title = "楼栋管理", businessType = BusinessType.UPDATE)
    @PutMapping("/changeStatus")
    public AjaxResult changeStatus(@RequestBody SmtParkingRentRecord smtParkingRentRecord)
    {
        smtParkingRentRecord.setUpdateBy(getUsername());
        return toAjax(smtParkingRentRecordService.updateStatus(smtParkingRentRecord));
    }
}
