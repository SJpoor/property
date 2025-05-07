package com.ruoyi.web.controller.smart;

import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.smart.domain.SmtParkingRent;
import com.ruoyi.smart.service.ISmtParkingRentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * 车位租赁信息Controller
 * 
 * @author ruoyi
 * @date 2025-02-23
 */
@RestController
@RequestMapping("/smart/park/rent")
public class SmtParkingRentController extends BaseController
{
    @Autowired
    private ISmtParkingRentService smtParkingRentService;

    /**
     * 查询车位租赁信息列表
     */
    @PreAuthorize("@ss.hasPermi('smart:park:rent:list')")
    @GetMapping("/list")
    public TableDataInfo list(SmtParkingRent smtParkingRent)
    {
        startPage();
        List<SmtParkingRent> list = smtParkingRentService.selectSmtParkingRentList(smtParkingRent);
        return getDataTable(list);
    }

    /**
     * 导出车位租赁信息列表
     */
    @PreAuthorize("@ss.hasPermi('smart:park:rent:export')")
    @Log(title = "车位租赁信息", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, SmtParkingRent smtParkingRent)
    {
        List<SmtParkingRent> list = smtParkingRentService.selectSmtParkingRentList(smtParkingRent);
        ExcelUtil<SmtParkingRent> util = new ExcelUtil<SmtParkingRent>(SmtParkingRent.class);
        util.exportExcel(response, list, "车位租赁信息数据");
    }

    /**
     * 获取车位租赁信息详细信息
     */
    @PreAuthorize("@ss.hasPermi('smart:park:rent:query')")
    @GetMapping(value = "/{parkingRentId}")
    public AjaxResult getInfo(@PathVariable("parkingRentId") Long parkingRentId)
    {
        return success(smtParkingRentService.selectSmtParkingRentByParkingRentId(parkingRentId));
    }

    /**
     * 新增车位租赁信息
     */
    @PreAuthorize("@ss.hasPermi('smart:park:rent:add')")
    @Log(title = "车位租赁信息", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody SmtParkingRent smtParkingRent)
    {
        return toAjax(smtParkingRentService.insertSmtParkingRent(smtParkingRent));
    }

    /**
     * 修改车位租赁信息
     */
    @PreAuthorize("@ss.hasPermi('smart:park:rent:edit')")
    @Log(title = "车位租赁信息", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody SmtParkingRent smtParkingRent)
    {
        return toAjax(smtParkingRentService.updateSmtParkingRent(smtParkingRent));
    }

    /**
     * 删除车位租赁信息
     */
    @PreAuthorize("@ss.hasPermi('smart:park:rent:remove')")
    @Log(title = "车位租赁信息", businessType = BusinessType.DELETE)
	@DeleteMapping("/{parkingRentIds}")
    public AjaxResult remove(@PathVariable Long[] parkingRentIds)
    {
        return toAjax(smtParkingRentService.deleteSmtParkingRentByParkingRentIds(parkingRentIds));
    }

    /**
     * 状态修改
     */
    @PreAuthorize("@ss.hasPermi('smart:park:rent:edit')")
    @Log(title = "车位租赁管理", businessType = BusinessType.UPDATE)
    @PutMapping("/changeStatus")
    public AjaxResult changeStatus(@RequestBody SmtParkingRent smtParkingRent)
    {
        smtParkingRent.setUpdateBy(getUsername());
        return toAjax(smtParkingRentService.updateStatus(smtParkingRent));
    }

    /**
     * 新增车位租赁信息
     */
    @PreAuthorize("@ss.hasPermi('smart:park:rent:add')")
    @Log(title = "车位租赁信息", businessType = BusinessType.INSERT)
    @PostMapping("addFee")
    public AjaxResult addFee(@RequestBody SmtParkingRent smtParkingRent)
    {
        smtParkingRent.setCreateBy(getUsername());
        smtParkingRent.setCreateTime(DateUtils.getNowDate());
        return toAjax(smtParkingRentService.insertSmtParkingRentFee(smtParkingRent));
    }
}
