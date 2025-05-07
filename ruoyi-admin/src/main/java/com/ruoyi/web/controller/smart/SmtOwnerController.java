package com.ruoyi.web.controller.smart;

import java.util.List;
import javax.servlet.http.HttpServletResponse;

import com.ruoyi.common.core.domain.entity.SmtOwner;
import com.ruoyi.smart.domain.SmtOwnerParkingSpace;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.smart.service.ISmtOwnerService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 业主Controller
 * 
 * @author ruoyi
 * @date 2025-02-26
 */
@RestController
@RequestMapping("/smart/owner")
public class SmtOwnerController extends BaseController
{
    @Autowired
    private ISmtOwnerService smtOwnerService;

    /**
     * 查询业主列表
     */
    @PreAuthorize("@ss.hasPermi('smart:owner:list')")
    @GetMapping("/list")
    public TableDataInfo list(SmtOwner smtOwner)
    {
        startPage();
        List<SmtOwner> list = smtOwnerService.selectSmtOwnerList(smtOwner);
        return getDataTable(list);
    }

    /**
     * 导出业主列表
     */
    @PreAuthorize("@ss.hasPermi('smart:owner:export')")
    @Log(title = "业主", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, SmtOwner smtOwner)
    {
        List<SmtOwner> list = smtOwnerService.selectSmtOwnerList(smtOwner);
        ExcelUtil<SmtOwner> util = new ExcelUtil<SmtOwner>(SmtOwner.class);
        util.exportExcel(response, list, "业主数据");
    }

    /**
     * 获取业主详细信息
     */
    @PreAuthorize("@ss.hasPermi('smart:owner:query')")
    @GetMapping(value = "/{ownerId}")
    public AjaxResult getInfo(@PathVariable("ownerId") Long ownerId)
    {
        return success(smtOwnerService.selectSmtOwnerByOwnerId(ownerId));
    }

    /**
     * 新增业主
     */
    @PreAuthorize("@ss.hasPermi('smart:owner:add')")
    @Log(title = "业主", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody SmtOwner smtOwner)
    {
        return toAjax(smtOwnerService.insertSmtOwner(smtOwner));
    }

    /**
     * 修改业主
     */
    @PreAuthorize("@ss.hasPermi('smart:owner:edit')")
    @Log(title = "业主", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody SmtOwner smtOwner)
    {
        return toAjax(smtOwnerService.updateSmtOwner(smtOwner));
    }

    /**
     * 删除业主
     */
    @PreAuthorize("@ss.hasPermi('smart:owner:remove')")
    @Log(title = "业主", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ownerIds}")
    public AjaxResult remove(@PathVariable Long[] ownerIds)
    {
        return toAjax(smtOwnerService.deleteSmtOwnerByOwnerIds(ownerIds));
    }

    /**
     * 状态修改
     */
    @PreAuthorize("@ss.hasPermi('smart:owner:edit')")
    @Log(title = "业主管理", businessType = BusinessType.UPDATE)
    @PutMapping("/changeStatus")
    public AjaxResult changeStatus(@RequestBody SmtOwner smtOwner)
    {
        smtOwner.setUpdateBy(getUsername());
        return toAjax(smtOwnerService.updateStatus(smtOwner));
    }
}
