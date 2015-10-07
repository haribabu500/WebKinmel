package com.hari.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.hari.data.WebKinmelServiceManager;
import com.hari.model.Item;


@Controller
public class ImageController {
	@RequestMapping("image")
	public void showImage(@RequestParam("id")Integer itemId,HttpServletRequest request,HttpServletResponse response) throws IOException{
		Item outfit=(Item) WebKinmelServiceManager.find(itemId, Item.class);
		response.setContentType("image/jpeg, image/jpg, image/png, image/gif");
		MultipartFile file= outfit.getFile();
		/*byte[] image=file.getBytes();*/
		System.out.println(file.getOriginalFilename());
		response.getOutputStream().write(file.getBytes());
	}
}
