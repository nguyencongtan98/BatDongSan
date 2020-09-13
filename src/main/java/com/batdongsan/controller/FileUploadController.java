package com.batdongsan.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.file.Files;
import java.util.ArrayList;
import java.util.List;


@Controller
@RequestMapping(value = "/f")
public class FileUploadController {
    private static final String IMG_ROOT_PATH = "E:\\GITHUB\\BatDongSan\\src\\main\\webapp\\resources\\images";

    @RequestMapping(method = RequestMethod.GET)
    public String home(Model model) {
        model.addAttribute("product", new Product());
        return "upload";
    }

    @RequestMapping(value = "uploadFile", method = RequestMethod.POST)
    String uploadFileHandler(Product product) {
        try {
            CommonsMultipartFile[] files = product.getFileData();
            for(int i = 0; i<files.length; i++) {
                CommonsMultipartFile file = files[i];
                byte[] bytes = file.getBytes();
                // Creating the directory to store file
                // Assume uploaded file location on web server is D:\file-upload

                File dir = new File(IMG_ROOT_PATH);
                if (!dir.exists()) {
                    dir.mkdirs();
                }

                // Create the file on server
                String fileSource = dir.getAbsolutePath() + File.separator + file.getOriginalFilename();
                File serverFile = new File(fileSource);
                BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(serverFile));
                stream.write(bytes);
                stream.close();
            }

            //return "You uploaded successfully a file, at : " + fileSource;
            return "redirect:/photos";
        } catch (Exception e) {
            System.out.println(e);
            return "Error when uploading file"+ e;
        }
    }

    @RequestMapping(value = "/photos", method = RequestMethod.GET)
    String show(Model model) {
        List<String> imgList = new ArrayList<>();

        File dir = new File(IMG_ROOT_PATH);
        for (File file : dir.listFiles()) {
            imgList.add("/image/" + file.getName());
        }
        model.addAttribute("imgPathList", imgList);
        return "photo";
    }


    @RequestMapping(value = "/image/{imageName}")
    @ResponseBody
    public byte[] getImage(@PathVariable(value = "imageName") String imageName) throws IOException {
        File serverFile = new File(IMG_ROOT_PATH + imageName + ".jpg");

        return Files.readAllBytes(serverFile.toPath());
    }
}
