package com.batdongsan.entity;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "role")  // ten cua table
public class RoleEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private int id;

    @ManyToMany(mappedBy = "roles")
    private List<TaiKhoanEntity> users = new ArrayList<>();

    public List<TaiKhoanEntity> getUsers() {
        return users;
    }

    public void setUsers(List<TaiKhoanEntity> users) {
        this.users = users;
    }

    public RoleEntity() {
    }

    @Column(name = "name")
    private String name;

    @Column(name = "code")
    private String code;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }
}
