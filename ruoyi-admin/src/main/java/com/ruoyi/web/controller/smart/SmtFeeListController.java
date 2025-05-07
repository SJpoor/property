package com.ruoyi.web.controller.smart;

import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.smart.domain.SmtFeeList;
import com.ruoyi.smart.service.ISmtFeeListService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * 费用清单Controller
 * 
 * @author ruoyi
 * @date 2025-03-09
 */
@RestController
@RequestMapping("/smart/fee/list")
public class SmtFeeListController extends BaseController
{
    @Autowired
    private ISmtFeeListService smtFeeListService;

    /**
     * 查询费用清单列表
     */
   @PreAuthorize("@ss.hasPermi('smart:fee:list:list')")
    @GetMapping("/list")
    public TableDataInfo list(SmtFeeList smtFeeList)
    {
        startPage();
        List<SmtFeeList> list = smtFeeListService.selectSmtFeeListList(smtFeeList);
        return getDataTable(list);
    }

    /**
     * 导出费用清单列表
     */
    @PreAuthorize("@ss.hasPermi('smart:fee:list:export')")
    @Log(title = "费用清单", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, SmtFeeList smtFeeList)
    {
        List<SmtFeeList> list = smtFeeListService.selectSmtFeeListList(smtFeeList);
        ExcelUtil<SmtFeeList> util = new ExcelUtil<SmtFeeList>(SmtFeeList.class);
        util.exportExcel(response, list, "费用清单数据");
    }

    /**
     * 获取费用清单详细信息
     */
    @PreAuthorize("@ss.hasPermi('smart:fee:list:query')")
    @GetMapping(value = "/{feeListId}")
    public AjaxResult getInfo(@PathVariable("feeListId") Long feeListId)
    {
        return success(smtFeeListService.selectSmtFeeListByFeeListId(feeListId));
    }

    /**
     * 新增费用清单
     */
    @PreAuthorize("@ss.hasPermi('smart:fee:list:add')")
    @Log(title = "费用清单", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody SmtFeeList smtFeeList)
    {
        return toAjax(smtFeeListService.insertSmtFeeList(smtFeeList));
    }

    /**
     * 修改费用清单
     */
    @PreAuthorize("@ss.hasPermi('smart:fee:list:edit')")
    @Log(title = "费用清单", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody SmtFeeList smtFeeList)
    {
        return toAjax(smtFeeListService.updateSmtFeeList(smtFeeList));
    }

    /**
     * 删除费用清单
     */
    @PreAuthorize("@ss.hasPermi('smart:fee:list:remove')")
    @Log(title = "费用清单", businessType = BusinessType.DELETE)
	@DeleteMapping("/{feeListIds}")
    public AjaxResult remove(@PathVariable Long[] feeListIds)
    {
        return toAjax(smtFeeListService.deleteSmtFeeListByFeeListIds(feeListIds));
    }

    /**
     * 状态修改
     */
   // @PreAuthorize("@ss.hasPermi('smart:park:rent:edit')")
    @Log(title = "车位租赁管理", businessType = BusinessType.UPDATE)
    @PutMapping("/changeStatus")
    public AjaxResult changeStatus(@RequestBody SmtFeeList smtFeeList)
    {
        smtFeeList.setUpdateBy(getUsername());
        return toAjax(smtFeeListService.updateStatus(smtFeeList));
    }
}
