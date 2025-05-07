package com.ruoyi.web.controller.smart;

import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.smart.domain.SmtFeeRecord;
import com.ruoyi.smart.domain.SmtParkingRent;
import com.ruoyi.smart.service.ISmtFeeRecordService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * 收费记录Controller
 * 
 * @author ruoyi
 * @date 2025-02-23
 */
@RestController
@RequestMapping("/smart/fee/record")
public class SmtFeeRecordController extends BaseController
{
    @Autowired
    private ISmtFeeRecordService smtFeeRecordService;

    /**
     * 查询收费记录列表
     */
    @PreAuthorize("@ss.hasPermi('smart:fee:record:list')")
    @GetMapping("/list")
    public TableDataInfo list(SmtFeeRecord smtFeeRecord)
    {
        startPage();
        List<SmtFeeRecord> list = smtFeeRecordService.selectSmtFeeRecordList(smtFeeRecord);
        return getDataTable(list);
    }

    /**
     * 导出收费记录列表
     */
    @PreAuthorize("@ss.hasPermi('smart:fee:record:export')")
    @Log(title = "收费记录", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, SmtFeeRecord smtFeeRecord)
    {
        List<SmtFeeRecord> list = smtFeeRecordService.selectSmtFeeRecordList(smtFeeRecord);
        ExcelUtil<SmtFeeRecord> util = new ExcelUtil<SmtFeeRecord>(SmtFeeRecord.class);
        util.exportExcel(response, list, "收费记录数据");
    }

    /**
     * 获取收费记录详细信息
     */
    @PreAuthorize("@ss.hasPermi('smart:fee:record:query')")
    @GetMapping(value = "/{feeRecordId}")
    public AjaxResult getInfo(@PathVariable("feeRecordId") Long feeRecordId)
    {
        return success(smtFeeRecordService.selectSmtFeeRecordByFeeRecordId(feeRecordId));
    }

    /**
     * 新增收费记录
     */
    //@PreAuthorize("@ss.hasPermi('smart:fee:record:add')")
    @Log(title = "收费记录", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody SmtFeeRecord smtFeeRecord)
    {
        return toAjax(smtFeeRecordService.insertSmtFeeRecord(smtFeeRecord));
    }

    /**
     * 修改收费记录
     */
    //@PreAuthorize("@ss.hasPermi('smart:fee:record:edit')")
    @Log(title = "收费记录", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody SmtFeeRecord smtFeeRecord)
    {
        return toAjax(smtFeeRecordService.updateSmtFeeRecord(smtFeeRecord));
    }

    /**
     * 删除收费记录
     */
    @PreAuthorize("@ss.hasPermi('smart:fee:record:remove')")
    @Log(title = "收费记录", businessType = BusinessType.DELETE)
	@DeleteMapping("/{feeRecordIds}")
    public AjaxResult remove(@PathVariable Long[] feeRecordIds)
    {
        return toAjax(smtFeeRecordService.deleteSmtFeeRecordByFeeRecordIds(feeRecordIds));
    }

    /**
     * 状态修改
     */
    //@PreAuthorize("@ss.hasPermi('smart:fee:record:edit')")
    @Log(title = "楼栋管理", businessType = BusinessType.UPDATE)
    @PutMapping("/changeStatus")
    public AjaxResult changeStatus(@RequestBody SmtFeeRecord smtFeeRecord)
    {
        smtFeeRecord.setUpdateBy(getUsername());
        return toAjax(smtFeeRecordService.updateStatus(smtFeeRecord));
    }

    /**
     * 新增收费记录
     */
    @PreAuthorize("@ss.hasPermi('smart:fee:record:add')")
    @Log(title = "收费记录", businessType = BusinessType.INSERT)
    @PostMapping("addCommonFee")
    public AjaxResult addCommonFee(@RequestBody SmtFeeRecord smtFeeRecord)
    {
        smtFeeRecord.setCreateBy(getUsername());
        smtFeeRecord.setCreateTime(DateUtils.getNowDate());
        return toAjax(smtFeeRecordService.insertCommonFee(smtFeeRecord));
    }
}
