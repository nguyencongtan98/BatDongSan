package com.batdongsan.service.impl;

import com.batdongsan.entity.RoleEntity;
import com.batdongsan.entity.TaiKhoanEntity;
import com.batdongsan.model.MyUser;
import com.batdongsan.repository.TaiKhoanRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class CustomUserDetailsService implements UserDetailsService {

    @Autowired
    private TaiKhoanRepository taiKhoanRepository;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        TaiKhoanEntity taiKhoanEntity = taiKhoanRepository.findOneByStatusAndEmailAndTrangThai(1,username,1);
        if(taiKhoanEntity == null){
            throw new UsernameNotFoundException("User not found");
        }
        List<GrantedAuthority> authorities = new ArrayList<>();
        for(RoleEntity role : taiKhoanEntity.getRoles()) {
            authorities.add(new SimpleGrantedAuthority(role.getCode()));
        }
        //put all thong tin vào security để duy trì khi ng dùng login vào hệ thống and phân quyền
        MyUser myUser = new MyUser(taiKhoanEntity.getEmail(),taiKhoanEntity.getMatKhau(),true,true,
                true,true,authorities);
        myUser.setHoTen(taiKhoanEntity.getHoTen());
        myUser.setDiaChi(taiKhoanEntity.getDiaChi());
        myUser.setId(taiKhoanEntity.getId());
        myUser.setSoDienThoai(taiKhoanEntity.getSoDienThoai());
        myUser.setEmail(taiKhoanEntity.getEmail());
        return myUser;
    }
}
