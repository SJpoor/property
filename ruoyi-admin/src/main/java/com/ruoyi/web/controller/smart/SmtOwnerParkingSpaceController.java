package com.ruoyi.web.controller.smart;

import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.smart.domain.SmtOwnerParkingSpace;
import com.ruoyi.smart.service.ISmtOwnerParkingSpaceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * 业主车位信息Controller
 * 
 * @author ruoyi
 * @date 2025-02-23
 */
@RestController
@RequestMapping("/smart/owner/park/space")
public class SmtOwnerParkingSpaceController extends BaseController
{
    @Autowired
    private ISmtOwnerParkingSpaceService smtOwnerParkingSpaceService;

    /**
     * 查询业主车位信息列表
     */
    @PreAuthorize("@ss.hasPermi('smart:owner:park:space:list')")
    @GetMapping("/list")
    public TableDataInfo list(SmtOwnerParkingSpace smtOwnerParkingSpace)
    {
        startPage();
        List<SmtOwnerParkingSpace> list = smtOwnerParkingSpaceService.selectSmtOwnerParkingSpaceList(smtOwnerParkingSpace);
        return getDataTable(list);
    }

    /**
     * 导出业主车位信息列表
     */
    @PreAuthorize("@ss.hasPermi('smart:owner:park:space:export')")
    @Log(title = "业主车位信息", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, SmtOwnerParkingSpace smtOwnerParkingSpace)
    {
        List<SmtOwnerParkingSpace> list = smtOwnerParkingSpaceService.selectSmtOwnerParkingSpaceList(smtOwnerParkingSpace);
        ExcelUtil<SmtOwnerParkingSpace> util = new ExcelUtil<SmtOwnerParkingSpace>(SmtOwnerParkingSpace.class);
        util.exportExcel(response, list, "业主车位信息数据");
    }

    /**
     * 获取业主车位信息详细信息
     */
    @PreAuthorize("@ss.hasPermi('smart:owner:park:space:query')")
    @GetMapping(value = "/{ownerParkingId}")
    public AjaxResult getInfo(@PathVariable("ownerParkingId") Long ownerParkingId)
    {
        return success(smtOwnerParkingSpaceService.selectSmtOwnerParkingSpaceByOwnerParkingId(ownerParkingId));
    }

    /**
     * 新增业主车位信息
     */
    @PreAuthorize("@ss.hasPermi('smart:owner:park:space:add')")
    @Log(title = "业主车位信息", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody SmtOwnerParkingSpace smtOwnerParkingSpace)
    {
        return toAjax(smtOwnerParkingSpaceService.insertSmtOwnerParkingSpace(smtOwnerParkingSpace));
    }

    /**
     * 修改业主车位信息
     */
    @PreAuthorize("@ss.hasPermi('smart:owner:park:space:edit')")
    @Log(title = "业主车位信息", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody SmtOwnerParkingSpace smtOwnerParkingSpace)
    {
        return toAjax(smtOwnerParkingSpaceService.updateSmtOwnerParkingSpace(smtOwnerParkingSpace));
    }

    /**
     * 删除业主车位信息
     */
    @PreAuthorize("@ss.hasPermi('smart:owner:park:space:remove')")
    @Log(title = "业主车位信息", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ownerParkingIds}")
    public AjaxResult remove(@PathVariable Long[] ownerParkingIds)
    {
        return toAjax(smtOwnerParkingSpaceService.deleteSmtOwnerParkingSpaceByOwnerParkingIds(ownerParkingIds));
    }

    /**
     * 状态修改
     */
    @PreAuthorize("@ss.hasPermi('smart:owner:park:space:edit')")
    @Log(title = "业主车位管理", businessType = BusinessType.UPDATE)
    @PutMapping("/changeStatus")
    public AjaxResult changeStatus(@RequestBody SmtOwnerParkingSpace smtOwnerParkingSpace)
    {
        smtOwnerParkingSpace.setUpdateBy(getUsername());
        return toAjax(smtOwnerParkingSpaceService.updateStatus(smtOwnerParkingSpace));
    }

    /**
     * 删除业主车位信息
     */
    @PreAuthorize("@ss.hasPermi('smart:owner:park:space:remove')")
    @Log(title = "业主车位信息", businessType = BusinessType.DELETE)
    @DeleteMapping("/deleteOwnerParkingSpace")
    public AjaxResult deleteOwnerParkingSpace(@RequestBody SmtOwnerParkingSpace smtOwnerParkingSpace)
    {
        return toAjax(smtOwnerParkingSpaceService.deleteOwnerParkingSpace(smtOwnerParkingSpace));
    }

    /**
     * 删除业主车位信息
     */
    @PreAuthorize("@ss.hasPermi('smart:owner:park:space:remove')")
    @Log(title = "业主车位信息", businessType = BusinessType.DELETE)
    @DeleteMapping("/{parkingSpaceIds}")
    public AjaxResult delByParkingSpaceId(@PathVariable Long[] parkingSpaceIds)
    {
        return toAjax(smtOwnerParkingSpaceService.deleteByParkingSpaceIds(parkingSpaceIds));
    }
}
