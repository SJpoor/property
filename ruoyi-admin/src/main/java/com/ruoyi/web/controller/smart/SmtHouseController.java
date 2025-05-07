package com.ruoyi.web.controller.smart;

import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.domain.entity.SmtHouse;
import com.ruoyi.smart.service.ISmtHouseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * 房屋信息Controller
 * 
 * @author ruoyi
 * @date 2025-02-23
 */
@RestController
@RequestMapping("/smart/house")
public class SmtHouseController extends BaseController
{
    @Autowired
    private ISmtHouseService smtHouseService;

    /**
     * 查询房屋信息列表
     */
    //@PreAuthorize("@ss.hasPermi('smart:house:list')")
    @GetMapping("/list")
    public TableDataInfo list(SmtHouse smtHouse)
    {
        startPage();
        List<SmtHouse> list = smtHouseService.selectSmtHouseList(smtHouse);
        return getDataTable(list);
    }

    /**
     * 导出房屋信息列表
     */
    @PreAuthorize("@ss.hasPermi('smart:house:export')")
    @Log(title = "房屋信息", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, SmtHouse smtHouse)
    {
        List<SmtHouse> list = smtHouseService.selectSmtHouseList(smtHouse);
        ExcelUtil<SmtHouse> util = new ExcelUtil<SmtHouse>(SmtHouse.class);
        util.exportExcel(response, list, "房屋信息数据");
    }

    /**
     * 获取房屋信息详细信息
     */
    @PreAuthorize("@ss.hasPermi('smart:house:query')")
    @GetMapping(value = "/{houseId}")
    public AjaxResult getInfo(@PathVariable("houseId") Long houseId)
    {
        return success(smtHouseService.selectSmtHouseByHouseId(houseId));
    }

    /**
     * 新增房屋信息
     */
    @PreAuthorize("@ss.hasPermi('smart:house:add')")
    @Log(title = "房屋信息", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody SmtHouse smtHouse)
    {
        return toAjax(smtHouseService.insertSmtHouse(smtHouse));
    }

    /**
     * 修改房屋信息
     */
    @PreAuthorize("@ss.hasPermi('smart:house:edit')")
    @Log(title = "房屋信息", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody SmtHouse smtHouse)
    {
        return toAjax(smtHouseService.updateSmtHouse(smtHouse));
    }

    /**
     * 删除房屋信息
     */
    @PreAuthorize("@ss.hasPermi('smart:house:remove')")
    @Log(title = "房屋信息", businessType = BusinessType.DELETE)
	@DeleteMapping("/{houseIds}")
    public AjaxResult remove(@PathVariable Long[] houseIds)
    {
        return toAjax(smtHouseService.deleteSmtHouseByHouseIds(houseIds));
    }

    /**
     * 状态修改
     */
    @PreAuthorize("@ss.hasPermi('smart:house:edit')")
    @Log(title = "房屋管理", businessType = BusinessType.UPDATE)
    @PutMapping("/changeStatus")
    public AjaxResult changeStatus(@RequestBody SmtHouse smtHouse)
    {
        smtHouse.setUpdateBy(getUsername());
        return toAjax(smtHouseService.updateStatus(smtHouse));
    }
}
