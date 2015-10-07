package com.hari.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.hari.data.WebKinmelServiceManager;
import com.hari.model.User;

@SessionAttributes(value={"username",""})

@Controller
public class LoginController {
	@RequestMapping("login/register")
	public ModelAndView register()
	{
		ModelAndView mav=new ModelAndView("login/register");
		mav.addObject("user",new User());
		return mav;
	}
	
	@RequestMapping("registerAction")
	public ModelAndView registerAction(@ModelAttribute("user")User user){
		WebKinmelServiceManager.save(user);
		ModelAndView mav=new ModelAndView("home");
		return mav;
	}
	
}
