package com.ruoyi.web.controller.smart;

import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.domain.entity.SysUser;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.common.utils.SecurityUtils;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.smart.domain.SmtComplain;
import com.ruoyi.smart.service.ISmtComplainService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * 投诉信息Controller
 * 
 * @author ruoyi
 * @date 2025-02-23
 */
@RestController
@RequestMapping("/smart/complain")
public class SmtComplainController extends BaseController
{
    @Autowired
    private ISmtComplainService smtComplainService;

    /**
     * 查询投诉信息列表
     */
    @PreAuthorize("@ss.hasPermi('smart:complain:list')")
    @GetMapping("/list")
    public TableDataInfo list(SmtComplain smtComplain)
    {
        startPage();
        List<SmtComplain> list = smtComplainService.selectSmtComplainList(smtComplain);
        return getDataTable(list);
    }

    /**
     * 导出投诉信息列表
     */
    @PreAuthorize("@ss.hasPermi('smart:complain:export')")
    @Log(title = "投诉信息", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, SmtComplain smtComplain)
    {
        List<SmtComplain> list = smtComplainService.selectSmtComplainList(smtComplain);
        ExcelUtil<SmtComplain> util = new ExcelUtil<SmtComplain>(SmtComplain.class);
        util.exportExcel(response, list, "投诉信息数据");
    }

    /**
     * 获取投诉信息详细信息
     */
    @PreAuthorize("@ss.hasPermi('smart:complain:query')")
    @GetMapping(value = "/{complainId}")
    public AjaxResult getInfo(@PathVariable("complainId") Long complainId)
    {
        return success(smtComplainService.selectSmtComplainByComplainId(complainId));
    }

    /**
     * 新增投诉信息
     */
    @PreAuthorize("@ss.hasPermi('smart:complain:add')")
    @Log(title = "投诉信息", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody SmtComplain smtComplain)
    {
        SysUser user = SecurityUtils.getLoginUser().getUser();
        if(!user.isAdmin()){
            smtComplain.setOwnerId(user.getUserId());
        }
        return toAjax(smtComplainService.insertSmtComplain(smtComplain));
    }

    /**
     * 修改投诉信息
     */
    @PreAuthorize("@ss.hasPermi('smart:complain:edit')")
    @Log(title = "投诉信息", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody SmtComplain smtComplain)
    {
        return toAjax(smtComplainService.updateSmtComplain(smtComplain));
    }

    /**
     * 删除投诉信息
     */
    @PreAuthorize("@ss.hasPermi('smart:complain:remove')")
    @Log(title = "投诉信息", businessType = BusinessType.DELETE)
	@DeleteMapping("/{complainIds}")
    public AjaxResult remove(@PathVariable Long[] complainIds)
    {
        return toAjax(smtComplainService.deleteSmtComplainByComplainIds(complainIds));
    }

    /**
     * 状态修改
     */
    @PreAuthorize("@ss.hasPermi('smart:complain:edit')")
    @Log(title = "投诉管理", businessType = BusinessType.UPDATE)
    @PutMapping("/changeStatus")
    public AjaxResult changeStatus(@RequestBody SmtComplain smtComplain)
    {
        smtComplain.setUpdateBy(getUsername());
        return toAjax(smtComplainService.updateStatus(smtComplain));
    }
}
