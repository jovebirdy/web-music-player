package com.ruanko.hwm.dao;

import com.ruanko.hwm.bean.AdminRoleRela;

public interface AdminRoleRelaMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(AdminRoleRela record);

    int insertSelective(AdminRoleRela record);

    AdminRoleRela selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(AdminRoleRela record);

    int updateByPrimaryKey(AdminRoleRela record);
}