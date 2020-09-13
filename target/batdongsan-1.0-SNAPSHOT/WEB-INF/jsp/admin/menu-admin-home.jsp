<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div id="sidebar" class="sidebar                  responsive                    ace-save-state">
    <script type="text/javascript">
        try {
            ace.settings.loadState('sidebar')
        } catch (e) {
        }
    </script>

    <div class="sidebar-shortcuts" id="sidebar-shortcuts">
        <div class="sidebar-shortcuts-large" id="sidebar-shortcuts-large">
            <button class="btn btn-success">
                <i class="ace-icon fa fa-signal"></i>
            </button>

            <button class="btn btn-info">
                <i class="ace-icon fa fa-pencil"></i>
            </button>

            <button class="btn btn-warning">
                <i class="ace-icon fa fa-users"></i>
            </button>

            <button class="btn btn-danger">
                <i class="ace-icon fa fa-cogs"></i>
            </button>
        </div>

        <div class="sidebar-shortcuts-mini" id="sidebar-shortcuts-mini">
            <span class="btn btn-success"></span>

            <span class="btn btn-info"></span>

            <span class="btn btn-warning"></span>

            <span class="btn btn-danger"></span>
        </div>
    </div>

    <ul class="nav nav-list">
        <li class="active">
            <a href="/admin">
                <i class="menu-icon fa fa-tachometer"></i>
                <span class="menu-text"> Trang chủ </span>
            </a>

            <b class="arrow"></b>
        </li>

        <li class="">
            <a href="/admin-quanlythoihan/showthoihan">
                <i class="menu-icon fa fa-list-alt"></i>
                <span class="menu-text"> Quản lý thời hạn </span>
            </a>

            <b class="arrow"></b>
        </li>

        <li class="">
            <a href="/admin-quanlyloaitin/showloaitin">
                <i class="menu-icon fa fa-list-alt"></i>
                <span class="menu-text"> Quản lý loại tin </span>
            </a>

            <b class="arrow"></b>
        </li>

        <li class="">
            <a href="/admin-quanlydanhmuc/showdanhmuc">
                <i class="menu-icon fa fa-list-alt"></i>
                <span class="menu-text"> Quản lý danh mục </span>
            </a>

            <b class="arrow"></b>
        </li>


        <li class="">
            <a href="#" class="dropdown-toggle">
                <i class="menu-icon fa fa-list-alt"></i>
                <span class="menu-text"> Quản lý bài đăng </span>

                <b class="arrow fa fa-angle-down"></b>
            </a>

            <b class="arrow"></b>

            <ul class="submenu">
                <li class="">
                    <a href="/admin-quanlybaidang/showbaidang">
                        <i class="menu-icon fa fa-caret-right"></i>
                        Danh sách bài đăng
                    </a>

                    <b class="arrow"></b>
                </li>

                <li class="">
                    <a href="/admin-quanlybaidang/showbaidangchuaduyet">
                        <i class="menu-icon fa fa-caret-right"></i>
                        Bài đăng chưa duyệt
                    </a>

                    <b class="arrow"></b>
                </li>

                <li class="">
                    <a href="/admin-quanlybaidang/showbaidangdaduyet">
                        <i class="menu-icon fa fa-caret-right"></i>
                        Bài đăng đã duyệt
                    </a>

                    <b class="arrow"></b>
                </li>

                <li class="">
                    <a href="/admin-quanlybaidang/showbaidangkhoa">
                        <i class="menu-icon fa fa-caret-right"></i>
                        Bài đăng bị khóa
                    </a>

                    <b class="arrow"></b>
                </li>
            </ul>
        </li>

        <li class="">
            <a href="#" class="dropdown-toggle">
                <i class="menu-icon fa fa-list-alt"></i>
                <span class="menu-text"> Quản lý tài khoản </span>

                <b class="arrow fa fa-angle-down"></b>
            </a>

            <b class="arrow"></b>

            <ul class="submenu">
                <li class="">
                    <a href="/admin-quanlytaikhoan/showtaikhoanuser">
                        <i class="menu-icon fa fa-caret-right"></i>
                        Danh sách người dùng
                    </a>

                    <b class="arrow"></b>
                </li>

                <li class="">
                    <a href="/admin-quanlytaikhoan/showtaikhoanadmin">
                        <i class="menu-icon fa fa-caret-right"></i>
                        Danh sách quản trị viên
                    </a>

                    <b class="arrow"></b>
                </li>

                <li class="">
                    <a href="/admin-quanlytaikhoan/showtaikhoanlockuser">
                        <i class="menu-icon fa fa-caret-right"></i>
                        DS người dùng khóa
                    </a>

                    <b class="arrow"></b>
                </li>

                <li class="">
                    <a href="/admin-quanlytaikhoan/showtaikhoanlockadmin">
                        <i class="menu-icon fa fa-caret-right"></i>
                        DS quản trị khóa
                    </a>

                    <b class="arrow"></b>
                </li>

                <li class="">
                    <a href="/admin-quanlytaikhoan/showtaikhoandelete">
                        <i class="menu-icon fa fa-caret-right"></i>
                        DS Admin ngừng hoạt động
                    </a>

                    <b class="arrow"></b>
                </li>
            </ul>
        </li>
    </ul><!-- /.nav-list -->

    <div class="sidebar-toggle sidebar-collapse" id="sidebar-collapse">
        <i id="sidebar-toggle-icon" class="ace-icon fa fa-angle-double-left ace-save-state"
           data-icon1="ace-icon fa fa-angle-double-left" data-icon2="ace-icon fa fa-angle-double-right"></i>
    </div>
</div>