package com.ruoyi.web.controller.smart;

import java.util.List;
import javax.servlet.http.HttpServletResponse;

import com.ruoyi.common.core.domain.model.LoginUser;
import com.ruoyi.common.utils.SecurityUtils;
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
import com.ruoyi.smart.domain.SmtParkingSpaceRecord;
import com.ruoyi.smart.service.ISmtParkingSpaceRecordService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 车位使用信息Controller
 * 
 * @author ruoyi
 * @date 2025-03-02
 */
@RestController
@RequestMapping("/smart/park/space/record")
public class SmtParkingSpaceRecordController extends BaseController
{
    @Autowired
    private ISmtParkingSpaceRecordService smtParkingSpaceRecordService;

    /**
     * 查询车位使用信息列表
     */
    //@PreAuthorize("@ss.hasPermi('smart:park:space:record:list')")
    @GetMapping("/list")
    public TableDataInfo list(SmtParkingSpaceRecord smtParkingSpaceRecord)
    {
        startPage();
        List<SmtParkingSpaceRecord> list = smtParkingSpaceRecordService.selectSmtParkingSpaceRecordList(smtParkingSpaceRecord);

        return getDataTable(list);
    }

    /**
     * 导出车位使用信息列表
     */
    @PreAuthorize("@ss.hasPermi('smart:park:space:record:export')")
    @Log(title = "车位使用信息", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, SmtParkingSpaceRecord smtParkingSpaceRecord)
    {
        List<SmtParkingSpaceRecord> list = smtParkingSpaceRecordService.selectSmtParkingSpaceRecordList(smtParkingSpaceRecord);
        ExcelUtil<SmtParkingSpaceRecord> util = new ExcelUtil<SmtParkingSpaceRecord>(SmtParkingSpaceRecord.class);
        util.exportExcel(response, list, "车位使用信息数据");
    }

    /**
     * 获取车位使用信息详细信息
     */
    @PreAuthorize("@ss.hasPermi('smart:park:space:record:query')")
    @GetMapping(value = "/{parkingRecordId}")
    public AjaxResult getInfo(@PathVariable("parkingRecordId") Long parkingRecordId)
    {
        return success(smtParkingSpaceRecordService.selectSmtParkingSpaceRecordByParkingRecordId(parkingRecordId));
    }

    /**
     * 新增车位使用信息
     */
    //@PreAuthorize("@ss.hasPermi('smart:park:space:record:add')")
    @Log(title = "车位使用信息", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody SmtParkingSpaceRecord smtParkingSpaceRecord)
    {
        LoginUser loginUser = SecurityUtils.getLoginUser();
        smtParkingSpaceRecord.setAdmin(loginUser.getUser().isAdmin());
        return toAjax(smtParkingSpaceRecordService.insertSmtParkingSpaceRecord(smtParkingSpaceRecord));
    }

    /**
     * 修改车位使用信息
     */
    //@PreAuthorize("@ss.hasPermi('smart:park:space:record:edit')")
    @Log(title = "车位使用信息", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody SmtParkingSpaceRecord smtParkingSpaceRecord)
    {
        return toAjax(smtParkingSpaceRecordService.updateSmtParkingSpaceRecord(smtParkingSpaceRecord));
    }


    /**
     * 删除车位使用信息
     */
    @PreAuthorize("@ss.hasPermi('smart:park:space:record:remove')")
    @Log(title = "车位使用信息", businessType = BusinessType.DELETE)
	@DeleteMapping("/{parkingRecordIds}")
    public AjaxResult remove(@PathVariable Long[] parkingRecordIds)
    {
        return toAjax(smtParkingSpaceRecordService.deleteSmtParkingSpaceRecordByParkingRecordIds(parkingRecordIds));
    }

    /**
     * 新增车位使用信息
     */
    @PreAuthorize("@ss.hasPermi('smart:park:space:record:add')")
    @Log(title = "车位使用信息", businessType = BusinessType.INSERT)
    @PostMapping("addRecordFee")
    public AjaxResult addRecordFee(@RequestBody SmtParkingSpaceRecord smtParkingSpaceRecord)
    {
        LoginUser loginUser = SecurityUtils.getLoginUser();
        smtParkingSpaceRecord.setAdmin(loginUser.getUser().isAdmin());
        smtParkingSpaceRecord.setCreateBy(getUsername());
        return toAjax(smtParkingSpaceRecordService.insertParkingSpaceFee(smtParkingSpaceRecord));
    }
}
