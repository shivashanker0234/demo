package com.msys.shoppingcart.service;

import com.msys.shoppingcart.dao.AdminDao;
import com.msys.shoppingcart.model.Admin;
import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;
import org.springframework.stereotype.Service;
@Service
@AllArgsConstructor
public class AdminServiceImpl implements AdminService{
   private AdminDao adminDao;

    @Override
    public boolean login(final Admin admin) {
        return adminDao.login(admin);
    }
}
