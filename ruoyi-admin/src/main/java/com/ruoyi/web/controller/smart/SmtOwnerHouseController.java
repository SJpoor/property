package com.ruoyi.web.controller.smart;

import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.smart.domain.SmtOwnerHouse;
import com.ruoyi.smart.service.ISmtOwnerHouseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * 业主房屋信息Controller
 * 
 * @author ruoyi
 * @date 2025-02-23
 */
@RestController
@RequestMapping("/smart/owner/house")
public class SmtOwnerHouseController extends BaseController
{
    @Autowired
    private ISmtOwnerHouseService smtOwnerHouseService;

    /**
     * 查询业主房屋信息列表
     */
    @PreAuthorize("@ss.hasPermi('smart:owner:house:list')")
    @GetMapping("/list")
    public TableDataInfo list(SmtOwnerHouse smtOwnerHouse)
    {
        startPage();
        List<SmtOwnerHouse> list = smtOwnerHouseService.selectSmtOwnerHouseList(smtOwnerHouse);
        return getDataTable(list);
    }

    /**
     * 导出业主房屋信息列表
     */
    @PreAuthorize("@ss.hasPermi('smart:owner:house:export')")
    @Log(title = "业主房屋信息", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, SmtOwnerHouse smtOwnerHouse)
    {
        List<SmtOwnerHouse> list = smtOwnerHouseService.selectSmtOwnerHouseList(smtOwnerHouse);
        ExcelUtil<SmtOwnerHouse> util = new ExcelUtil<SmtOwnerHouse>(SmtOwnerHouse.class);
        util.exportExcel(response, list, "业主房屋信息数据");
    }

    /**
     * 获取业主房屋信息详细信息
     */
    @PreAuthorize("@ss.hasPermi('smart:owner:house:query')")
    @GetMapping(value = "/{ownerHouseId}")
    public AjaxResult getInfo(@PathVariable("ownerHouseId") Long ownerHouseId)
    {
        return success(smtOwnerHouseService.selectSmtOwnerHouseByOwnerHouseId(ownerHouseId));
    }

    /**
     * 新增业主房屋信息
     */
    @PreAuthorize("@ss.hasPermi('smart:owner:house:add')")
    @Log(title = "业主房屋信息", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody SmtOwnerHouse smtOwnerHouse)
    {
        return toAjax(smtOwnerHouseService.insertSmtOwnerHouse(smtOwnerHouse));
    }

    /**
     * 修改业主房屋信息
     */
    @PreAuthorize("@ss.hasPermi('smart:owner:house:edit')")
    @Log(title = "业主房屋信息", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody SmtOwnerHouse smtOwnerHouse)
    {
        return toAjax(smtOwnerHouseService.updateSmtOwnerHouse(smtOwnerHouse));
    }

    /**
     * 删除业主房屋信息
     */
    @PreAuthorize("@ss.hasPermi('smart:owner:house:remove')")
    @Log(title = "业主房屋信息", businessType = BusinessType.DELETE)
	@DeleteMapping("/deleteOwnerHouse")
    public AjaxResult deleteOwnerHouse(@RequestBody SmtOwnerHouse smtOwnerHouse)
    {
        return toAjax(smtOwnerHouseService.deleteOwnerHouse(smtOwnerHouse));
    }

    /**
     * 删除业主房屋信息
     */
    @PreAuthorize("@ss.hasPermi('smart:owner:house:remove')")
    @Log(title = "业主房屋信息", businessType = BusinessType.DELETE)
    @DeleteMapping("/{ownerHouseIds}")
    public AjaxResult remove(@PathVariable Long[] ownerHouseIds)
    {
        return toAjax(smtOwnerHouseService.deleteSmtOwnerHouseByOwnerHouseIds(ownerHouseIds));
    }

    /**
     * 状态修改
     */
    @PreAuthorize("@ss.hasPermi('smart:owner:house:edit')")
    @Log(title = "业主房屋管理", businessType = BusinessType.UPDATE)
    @PutMapping("/changeStatus")
    public AjaxResult changeStatus(@RequestBody SmtOwnerHouse smtOwnerHouse)
    {
        smtOwnerHouse.setUpdateBy(getUsername());
        return toAjax(smtOwnerHouseService.updateStatus(smtOwnerHouse));
    }
}
