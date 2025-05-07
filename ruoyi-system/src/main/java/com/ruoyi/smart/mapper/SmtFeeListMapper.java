package com.ruoyi.smart.mapper;

import java.util.List;
import com.ruoyi.smart.domain.SmtFeeList;

/**
 * 费用清单Mapper接口
 * 
 * @author ruoyi
 * @date 2025-03-09
 */
public interface SmtFeeListMapper 
{
    /**
     * 查询费用清单
     * 
     * @param feeListId 费用清单主键
     * @return 费用清单
     */
    public SmtFeeList selectSmtFeeListByFeeListId(Long feeListId);

    /**
     * 查询费用清单列表
     * 
     * @param smtFeeList 费用清单
     * @return 费用清单集合
     */
    public List<SmtFeeList> selectSmtFeeListList(SmtFeeList smtFeeList);

    /**
     * 新增费用清单
     * 
     * @param smtFeeList 费用清单
     * @return 结果
     */
    public int insertSmtFeeList(SmtFeeList smtFeeList);

    /**
     * 修改费用清单
     * 
     * @param smtFeeList 费用清单
     * @return 结果
     */
    public int updateSmtFeeList(SmtFeeList smtFeeList);

    /**
     * 删除费用清单
     * 
     * @param feeListId 费用清单主键
     * @return 结果
     */
    public int deleteSmtFeeListByFeeListId(Long feeListId);

    /**
     * 批量删除费用清单
     * 
     * @param feeListIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteSmtFeeListByFeeListIds(Long[] feeListIds);
}
