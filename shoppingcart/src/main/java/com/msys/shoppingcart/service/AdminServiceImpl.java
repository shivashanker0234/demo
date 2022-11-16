package com.msys.shoppingcart.service;

import com.msys.shoppingcart.dao.AdminDao;
import com.msys.shoppingcart.model.Admin;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;


@Service
@AllArgsConstructor
public class AdminServiceImpl implements AdminService {
    private final AdminDao adminDao;

    @Override
    public Admin login(final Admin admin) {
        return adminDao.login(admin);
    }
}





