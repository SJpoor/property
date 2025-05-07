package com.ruoyi.web.controller.smart;

import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.smart.domain.SmtFee;
import com.ruoyi.smart.service.ISmtFeeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * 收费信息Controller
 * 
 * @author ruoyi
 * @date 2025-02-23
 */
@RestController
@RequestMapping("/smart/fee")
public class SmtFeeController extends BaseController
{
    @Autowired
    private ISmtFeeService smtFeeService;

    /**
     * 查询收费信息列表
     */
    @PreAuthorize("@ss.hasPermi('smart:fee:list')")
    @GetMapping("/list")
    public TableDataInfo list(SmtFee smtFee)
    {
        startPage();
        List<SmtFee> list = smtFeeService.selectSmtFeeList(smtFee);
        return getDataTable(list);
    }

    /**
     * 导出收费信息列表
     */
    @PreAuthorize("@ss.hasPermi('smart:fee:export')")
    @Log(title = "收费信息", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, SmtFee smtFee)
    {
        List<SmtFee> list = smtFeeService.selectSmtFeeList(smtFee);
        ExcelUtil<SmtFee> util = new ExcelUtil<SmtFee>(SmtFee.class);
        util.exportExcel(response, list, "收费信息数据");
    }

    /**
     * 获取收费信息详细信息
     */
    @PreAuthorize("@ss.hasPermi('smart:fee:query')")
    @GetMapping(value = "/{feeId}")
    public AjaxResult getInfo(@PathVariable("feeId") Long feeId)
    {
        return success(smtFeeService.selectSmtFeeByFeeId(feeId));
    }

    /**
     * 新增收费信息
     */
    @PreAuthorize("@ss.hasPermi('smart:fee:add')")
    @Log(title = "收费信息", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody SmtFee smtFee)
    {
        return toAjax(smtFeeService.insertSmtFee(smtFee));
    }

    /**
     * 修改收费信息
     */
    @PreAuthorize("@ss.hasPermi('smart:fee:edit')")
    @Log(title = "收费信息", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody SmtFee smtFee)
    {
        return toAjax(smtFeeService.updateSmtFee(smtFee));
    }

    /**
     * 删除收费信息
     */
    @PreAuthorize("@ss.hasPermi('smart:fee:remove')")
    @Log(title = "收费信息", businessType = BusinessType.DELETE)
	@DeleteMapping("/{feeIds}")
    public AjaxResult remove(@PathVariable Long[] feeIds)
    {
        return toAjax(smtFeeService.deleteSmtFeeByFeeIds(feeIds));
    }

    /**
     * 状态修改
     */
    @PreAuthorize("@ss.hasPermi('smart:fee:edit')")
    @Log(title = "收费管理", businessType = BusinessType.UPDATE)
    @PutMapping("/changeStatus")
    public AjaxResult changeStatus(@RequestBody SmtFee smtFee)
    {
        smtFee.setUpdateBy(getUsername());
        return toAjax(smtFeeService.updateStatus(smtFee));
    }
}
