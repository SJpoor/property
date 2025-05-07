package com.ruoyi.web.controller.smart;

import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.domain.entity.SmtUnit;
import com.ruoyi.smart.service.ISmtUnitService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * 单元信息Controller
 * 
 * @author ruoyi
 * @date 2025-02-23
 */
@RestController
@RequestMapping("/smart/unit")
public class SmtUnitController extends BaseController
{
    @Autowired
    private ISmtUnitService smtUnitService;

    /**
     * 查询单元信息列表
     */
    @PreAuthorize("@ss.hasPermi('smart:unit:list')")
    @GetMapping("/list")
    public TableDataInfo list(SmtUnit smtUnit)
    {
        startPage();
        List<SmtUnit> list = smtUnitService.selectSmtUnitList(smtUnit);
        return getDataTable(list);
    }

    /**
     * 导出单元信息列表
     */
    @PreAuthorize("@ss.hasPermi('smart:unit:export')")
    @Log(title = "单元信息", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, SmtUnit smtUnit)
    {
        List<SmtUnit> list = smtUnitService.selectSmtUnitList(smtUnit);
        ExcelUtil<SmtUnit> util = new ExcelUtil<SmtUnit>(SmtUnit.class);
        util.exportExcel(response, list, "单元信息数据");
    }

    /**
     * 获取单元信息详细信息
     */
    @PreAuthorize("@ss.hasPermi('smart:unit:query')")
    @GetMapping(value = "/{unitId}")
    public AjaxResult getInfo(@PathVariable("unitId") Long unitId)
    {
        return success(smtUnitService.selectSmtUnitByUnitId(unitId));
    }

    /**
     * 新增单元信息
     */
    @PreAuthorize("@ss.hasPermi('smart:unit:add')")
    @Log(title = "单元信息", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody SmtUnit smtUnit)
    {
        return toAjax(smtUnitService.insertSmtUnit(smtUnit));
    }

    /**
     * 修改单元信息
     */
    @PreAuthorize("@ss.hasPermi('smart:unit:edit')")
    @Log(title = "单元信息", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody SmtUnit smtUnit)
    {
        return toAjax(smtUnitService.updateSmtUnit(smtUnit));
    }

    /**
     * 删除单元信息
     */
    @PreAuthorize("@ss.hasPermi('smart:unit:remove')")
    @Log(title = "单元信息", businessType = BusinessType.DELETE)
	@DeleteMapping("/{unitIds}")
    public AjaxResult remove(@PathVariable Long[] unitIds)
    {
        return toAjax(smtUnitService.deleteSmtUnitByUnitIds(unitIds));
    }

    /**
     * 状态修改
     */
    @PreAuthorize("@ss.hasPermi('smart:build:edit')")
    @Log(title = "单元管理", businessType = BusinessType.UPDATE)
    @PutMapping("/changeStatus")
    public AjaxResult changeStatus(@RequestBody SmtUnit smtUnit)
    {
        smtUnit.setUpdateBy(getUsername());
        return toAjax(smtUnitService.updateStatus(smtUnit));
    }
}
