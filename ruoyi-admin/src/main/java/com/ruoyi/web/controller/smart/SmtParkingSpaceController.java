package com.ruoyi.web.controller.smart;

import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.domain.entity.SmtParkingSpace;
import com.ruoyi.smart.service.ISmtParkingSpaceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * 车位信息Controller
 * 
 * @author ruoyi
 * @date 2025-02-23
 */
@RestController
@RequestMapping("/smart/park/space")
public class SmtParkingSpaceController extends BaseController
{
    @Autowired
    private ISmtParkingSpaceService smtParkingSpaceService;

    /**
     * 查询车位信息列表
     */
    //@PreAuthorize("@ss.hasPermi('smart:park:space:list')")
    @GetMapping("/list")
    public TableDataInfo list(SmtParkingSpace smtParkingSpace)
    {
        startPage();
        List<SmtParkingSpace> list = smtParkingSpaceService.selectSmtParkingSpaceList(smtParkingSpace);
        int size = list.size();
        System.out.println("list用户数量" + size);
        return getDataTable(list);
    }

    /**
     * 导出车位信息列表
     */
    @PreAuthorize("@ss.hasPermi('smart:park:space:export')")
    @Log(title = "车位信息", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, SmtParkingSpace smtParkingSpace)
    {
        List<SmtParkingSpace> list = smtParkingSpaceService.selectSmtParkingSpaceList(smtParkingSpace);
        ExcelUtil<SmtParkingSpace> util = new ExcelUtil<SmtParkingSpace>(SmtParkingSpace.class);
        util.exportExcel(response, list, "车位信息数据");
    }

    /**
     * 获取车位信息详细信息
     */
    @PreAuthorize("@ss.hasPermi('smart:park:space:query')")
    @GetMapping(value = "/{parkingSpaceId}")
    public AjaxResult getInfo(@PathVariable("parkingSpaceId") Long parkingSpaceId)
    {
        return success(smtParkingSpaceService.selectSmtParkingSpaceByParkingSpaceId(parkingSpaceId));
    }

    /**
     * 新增车位信息
     */
    @PreAuthorize("@ss.hasPermi('smart:park:space:add')")
    @Log(title = "车位信息", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody SmtParkingSpace smtParkingSpace)
    {
        return toAjax(smtParkingSpaceService.insertSmtParkingSpace(smtParkingSpace));
    }

    /**
     * 修改车位信息
     */
    @PreAuthorize("@ss.hasPermi('smart:park:space:edit')")
    @Log(title = "车位信息", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody SmtParkingSpace smtParkingSpace)
    {
        return toAjax(smtParkingSpaceService.updateSmtParkingSpace(smtParkingSpace));
    }

    /**
     * 删除车位信息
     */
    @PreAuthorize("@ss.hasPermi('smart:park:space:remove')")
    @Log(title = "车位信息", businessType = BusinessType.DELETE)
	@DeleteMapping("/{parkingSpaceIds}")
    public AjaxResult remove(@PathVariable Long[] parkingSpaceIds)
    {
        return toAjax(smtParkingSpaceService.deleteSmtParkingSpaceByParkingSpaceIds(parkingSpaceIds));
    }

    /**
     * 状态修改
     */
    @PreAuthorize("@ss.hasPermi('smart:park:space:edit')")
    @Log(title = "楼栋管理", businessType = BusinessType.UPDATE)
    @PutMapping("/changeStatus")
    public AjaxResult changeStatus(@RequestBody SmtParkingSpace smtParkingSpace)
    {
        smtParkingSpace.setUpdateBy(getUsername());
        return toAjax(smtParkingSpaceService.updateStatus(smtParkingSpace));
    }
}
