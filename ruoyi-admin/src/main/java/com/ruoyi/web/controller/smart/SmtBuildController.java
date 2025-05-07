package com.ruoyi.web.controller.smart;

import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.domain.entity.SmtBuild;
import com.ruoyi.smart.service.ISmtBuildService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * 楼栋信息Controller
 * 
 * @author ruoyi
 * @date 2025-02-23
 */
@RestController
@RequestMapping("/smart/build")
public class SmtBuildController extends BaseController
{
    @Autowired
    private ISmtBuildService smtBuildService;

    /**
     * 查询楼栋信息列表
     */
    @PreAuthorize("@ss.hasPermi('smart:build:list')")
    @GetMapping("/list")
    public TableDataInfo list(SmtBuild smtBuild)
    {
        startPage();
        List<SmtBuild> list = smtBuildService.selectSmtBuildList(smtBuild);
        return getDataTable(list);
    }

    /**
     * 导出楼栋信息列表
     */
    @PreAuthorize("@ss.hasPermi('smart:build:export')")
    @Log(title = "楼栋信息", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, SmtBuild smtBuild)
    {
        List<SmtBuild> list = smtBuildService.selectSmtBuildList(smtBuild);
        ExcelUtil<SmtBuild> util = new ExcelUtil<SmtBuild>(SmtBuild.class);
        util.exportExcel(response, list, "楼栋信息数据");
    }

    /**
     * 获取楼栋信息详细信息
     */
    @PreAuthorize("@ss.hasPermi('smart:build:query')")
    @GetMapping(value = "/{buildId}")
    public AjaxResult getInfo(@PathVariable("buildId") Long buildId)
    {
        return success(smtBuildService.selectSmtBuildByBuildId(buildId));
    }

    /**
     * 新增楼栋信息
     */
    @PreAuthorize("@ss.hasPermi('smart:build:add')")
    @Log(title = "楼栋信息", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody SmtBuild smtBuild)
    {
        return toAjax(smtBuildService.insertSmtBuild(smtBuild));
    }

    /**
     * 修改楼栋信息
     */
    @PreAuthorize("@ss.hasPermi('smart:build:edit')")
    @Log(title = "楼栋信息", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody SmtBuild smtBuild)
    {
        return toAjax(smtBuildService.updateSmtBuild(smtBuild));
    }

    /**
     * 删除楼栋信息
     */
    @PreAuthorize("@ss.hasPermi('smart:build:remove')")
    @Log(title = "楼栋信息", businessType = BusinessType.DELETE)
	@DeleteMapping("/{buildIds}")
    public AjaxResult remove(@PathVariable Long[] buildIds)
    {
        return toAjax(smtBuildService.deleteSmtBuildByBuildIds(buildIds));
    }

    /**
     * 状态修改
     */
    @PreAuthorize("@ss.hasPermi('smart:build:edit')")
    @Log(title = "楼栋管理", businessType = BusinessType.UPDATE)
    @PutMapping("/changeStatus")
    public AjaxResult changeStatus(@RequestBody SmtBuild smtBuild)
    {
        smtBuild.setUpdateBy(getUsername());
        return toAjax(smtBuildService.updateStatus(smtBuild));
    }
}
