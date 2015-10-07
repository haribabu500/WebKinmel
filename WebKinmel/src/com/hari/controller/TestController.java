package com.hari.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.FileWriter;
import java.io.IOException;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.hari.model.Stock;
import com.hari.test.Image;

@Controller
public class TestController {
	@RequestMapping("test/testUpload")
	public ModelAndView testUpload(){
		ModelAndView mav=new ModelAndView("test/testUpload");
		Image image=new Image();
		mav.addObject("image", image);
		return mav;
	}
	
	@RequestMapping("test/uploadAction")
	public ModelAndView uploadAction(@ModelAttribute("image")Image image,HttpServletRequest request){
		ModelAndView mav=new ModelAndView("test/uploadAction");
		MultipartFile uploadedFile=image.getFile();
		String fileName=uploadedFile.getOriginalFilename();
		
		String path=request.getSession().getServletContext().getContextPath();
		String path2=request.getSession().getServletContext().getRealPath(path);
		
		try {
			File f=new File("/Users/hari/Documents/workspace/WebKinmel/WebContent/resources/upload/"+fileName);
			FileOutputStream fos=new FileOutputStream(f);
			fos.write(uploadedFile.getBytes());
			fos.close();
			f.createNewFile();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return mav;
	}
	@RequestMapping("test/testReporting")
	public ModelAndView testReporting(){
		ModelAndView mav=new ModelAndView("test/testReporting");
		return mav;
	}
	@RequestMapping("test/pieChart")
	public ModelAndView pieChart(){
		ModelAndView mav=new ModelAndView("test/pieChart");
		return mav;
	}
	@RequestMapping("test/barChart")
	public ModelAndView barChart(){
		ModelAndView mav=new ModelAndView("test/barChart");
		return mav;
	}
}
