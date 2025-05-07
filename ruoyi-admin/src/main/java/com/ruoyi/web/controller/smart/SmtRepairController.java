package com.ruoyi.web.controller.smart;

import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.domain.entity.SysUser;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.common.utils.SecurityUtils;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.smart.domain.SmtRepair;
import com.ruoyi.smart.service.ISmtRepairService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * 维修信息Controller
 * 
 * @author ruoyi
 * @date 2025-02-23
 */
@RestController
@RequestMapping("/smart/repair")
public class SmtRepairController extends BaseController
{
    @Autowired
    private ISmtRepairService smtRepairService;

    /**
     * 查询维修信息列表
     */
    @PreAuthorize("@ss.hasPermi('smart:repair:list')")
    @GetMapping("/list")
    public TableDataInfo list(SmtRepair smtRepair)
    {
        startPage();
        List<SmtRepair> list = smtRepairService.selectSmtRepairList(smtRepair);
        return getDataTable(list);
    }

    /**
     * 导出维修信息列表
     */
    @PreAuthorize("@ss.hasPermi('smart:repair:export')")
    @Log(title = "维修信息", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, SmtRepair smtRepair)
    {
        List<SmtRepair> list = smtRepairService.selectSmtRepairList(smtRepair);
        ExcelUtil<SmtRepair> util = new ExcelUtil<SmtRepair>(SmtRepair.class);
        util.exportExcel(response, list, "维修信息数据");
    }

    /**
     * 获取维修信息详细信息
     */
    @PreAuthorize("@ss.hasPermi('smart:repair:query')")
    @GetMapping(value = "/{repairId}")
    public AjaxResult getInfo(@PathVariable("repairId") Long repairId)
    {
        return success(smtRepairService.selectSmtRepairByRepairId(repairId));
    }

    /**
     * 新增维修信息
     */
    @PreAuthorize("@ss.hasPermi('smart:repair:add')")
    @Log(title = "维修信息", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody SmtRepair smtRepair)
    {
        SysUser user = SecurityUtils.getLoginUser().getUser();
        if(!user.isAdmin()){
            smtRepair.setOwnerId(user.getUserId());
        }
        return toAjax(smtRepairService.insertSmtRepair(smtRepair));
    }

    /**
     * 修改维修信息
     */
    @PreAuthorize("@ss.hasPermi('smart:repair:edit')")
    @Log(title = "维修信息", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody SmtRepair smtRepair)
    {
        return toAjax(smtRepairService.updateSmtRepair(smtRepair));
    }

    /**
     * 删除维修信息
     */
    @PreAuthorize("@ss.hasPermi('smart:repair:remove')")
    @Log(title = "维修信息", businessType = BusinessType.DELETE)
	@DeleteMapping("/{repairIds}")
    public AjaxResult remove(@PathVariable Long[] repairIds)
    {
        return toAjax(smtRepairService.deleteSmtRepairByRepairIds(repairIds));
    }

    /**
     * 状态修改
     */
    @PreAuthorize("@ss.hasPermi('smart:repair:edit')")
    @Log(title = "楼栋管理", businessType = BusinessType.UPDATE)
    @PutMapping("/changeStatus")
    public AjaxResult changeStatus(@RequestBody SmtRepair smtRepair)
    {
        smtRepair.setUpdateBy(getUsername());
        return toAjax(smtRepairService.updateStatus(smtRepair));
    }
}
