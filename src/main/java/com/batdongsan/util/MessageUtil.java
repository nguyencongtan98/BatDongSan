package com.batdongsan.util;

import org.springframework.stereotype.Component;

import java.util.HashMap;
import java.util.Map;

@Component
public class MessageUtil {
    public Map<String , String> getMessage(String message){
        Map<String , String> result = new HashMap<>();
        if(message.equals("update_success")){
            result.put("message" , "Cập nhật thành công");
            result.put("alert" ,"success" );
        }
        else if(message.equals("update_failed")){
            result.put("message" , "Cập nhật thất bại");
            result.put("alert" ,"danger" );
        }
        else if (message.equals("insert_success")){
            result.put("message" , "Thêm thành công");
            result.put("alert","success");
        }
        else if(message.equals("insert_failed")){
            result.put("message" , "Thêm thất bại");
            result.put("alert","danger");
        }
        else if(message.equals("delete_success")){
            result.put("message" , "Xóa thành công");
            result.put("alert","success");
        }
        else if(message.equals("delete_failed")){
            result.put("message" , "Xóa thất bại");
            result.put("alert","danger");
        }
        else if(message.equals("duyet_success")){
            result.put("message" , "Duyệt thành công");
            result.put("alert","success");
        }
        else if(message.equals("duyet_failed")){
            result.put("message" , "Duyệt thất bại");
            result.put("alert","danger");
        }
        else if(message.equals("lock_success")){
            result.put("message" , "Khóa thành công");
            result.put("alert","success");
        }
        else if(message.equals("lock_failed")){
            result.put("message" , "Khóa thất bại");
            result.put("alert","danger");
        }
        else if(message.equals("unlock_success")){
            result.put("message" , "Mở khóa thành công");
            result.put("alert","success");
        }
        else if(message.equals("unlock_failed")){
            result.put("message" , "Mở khóa thất bại");
            result.put("alert","danger");
        }
        if(message.equals("gobai_success")){
            result.put("message" , "Gỡ bài thành công");
            result.put("alert" ,"success" );
        }
        else if(message.equals("gobai_failed")){
            result.put("message" , "Gỡ bài thất bại");
            result.put("alert" ,"danger" );
        }
        if(message.equals("undelete_success")){
            result.put("message" , "Đã hoàn tác");
            result.put("alert" ,"success" );
        }
        else if(message.equals("undelete_failed")){
            result.put("message" , "Hoàn tác thất bại");
            result.put("alert" ,"danger" );
        }
        if(message.equals("change_password_success")){
            result.put("message" , "Đổi mật khẩu thành công");
            result.put("alert" ,"success" );
        }
        else if(message.equals("change_password_failed")){
            result.put("message" , "Đổi mật khẩu thất bại");
            result.put("alert" ,"danger" );
        }
        return result;
    }
}
