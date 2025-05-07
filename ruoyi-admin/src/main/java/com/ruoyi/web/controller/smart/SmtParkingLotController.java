package com.ruoyi.web.controller.smart;

import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.domain.entity.SmtParkingLot;
import com.ruoyi.smart.service.ISmtParkingLotService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * 停车场信息Controller
 * 
 * @author ruoyi
 * @date 2025-02-23
 */
@RestController
@RequestMapping("/smart/park/lot")
public class SmtParkingLotController extends BaseController
{
    @Autowired
    private ISmtParkingLotService smtParkingLotService;

    /**
     * 查询停车场信息列表
     */
    //@PreAuthorize("@ss.hasPermi('smart:park:list')")
    @GetMapping("/list")
    public TableDataInfo list(SmtParkingLot smtParkingLot)
    {
        startPage();
        List<SmtParkingLot> list = smtParkingLotService.selectSmtParkingLotList(smtParkingLot);
        return getDataTable(list);
    }

    /**
     * 导出停车场信息列表
     */
    @PreAuthorize("@ss.hasPermi('smart:park:export')")
    @Log(title = "停车场信息", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, SmtParkingLot smtParkingLot)
    {
        List<SmtParkingLot> list = smtParkingLotService.selectSmtParkingLotList(smtParkingLot);
        ExcelUtil<SmtParkingLot> util = new ExcelUtil<SmtParkingLot>(SmtParkingLot.class);
        util.exportExcel(response, list, "停车场信息数据");
    }

    /**
     * 获取停车场信息详细信息
     */
    @PreAuthorize("@ss.hasPermi('smart:park:query')")
    @GetMapping(value = "/{parkingLotId}")
    public AjaxResult getInfo(@PathVariable("parkingLotId") Long parkingLotId)
    {
        return success(smtParkingLotService.selectSmtParkingLotByParkingLotId(parkingLotId));
    }

    /**
     * 新增停车场信息
     */
    @PreAuthorize("@ss.hasPermi('smart:park:add')")
    @Log(title = "停车场信息", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody SmtParkingLot smtParkingLot)
    {
        return toAjax(smtParkingLotService.insertSmtParkingLot(smtParkingLot));
    }

    /**
     * 修改停车场信息
     */
    @PreAuthorize("@ss.hasPermi('smart:park:edit')")
    @Log(title = "停车场信息", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody SmtParkingLot smtParkingLot)
    {
        return toAjax(smtParkingLotService.updateSmtParkingLot(smtParkingLot));
    }

    /**
     * 删除停车场信息
     */
    @PreAuthorize("@ss.hasPermi('smart:park:remove')")
    @Log(title = "停车场信息", businessType = BusinessType.DELETE)
	@DeleteMapping("/{parkingLotIds}")
    public AjaxResult remove(@PathVariable Long[] parkingLotIds)
    {
        return toAjax(smtParkingLotService.deleteSmtParkingLotByParkingLotIds(parkingLotIds));
    }

    /**
     * 状态修改
     */
    @PreAuthorize("@ss.hasPermi('smart:park:edit')")
    @Log(title = "停车场管理", businessType = BusinessType.UPDATE)
    @PutMapping("/changeStatus")
    public AjaxResult changeStatus(@RequestBody SmtParkingLot smtParkingLot)
    {
        smtParkingLot.setUpdateBy(getUsername());
        return toAjax(smtParkingLotService.updateStatus(smtParkingLot));
    }
}
