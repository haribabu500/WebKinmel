package com.hari.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.context.request.WebRequest;
import org.springframework.web.servlet.ModelAndView;

import com.hari.data.WebKinmelServiceManager;
import com.hari.model.Item;
import com.hari.model.ShoppingCart;
import com.hari.model.User;

@SessionAttributes(value={"username","cart"})

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
	
	@RequestMapping("login/login")
	public ModelAndView login()
	{
		ModelAndView mav=new ModelAndView("login/login");
		mav.addObject("user",new User());
		return mav;
	}
	
	@RequestMapping("loginAction")
	public ModelAndView loginAction(@ModelAttribute("user")User user){
		String username=user.getUsername();
		String password=user.getPassword();
		List users=WebKinmelServiceManager.select("select u from User u where u.username='"+username+"' and u.password='"+password+"'", User.class);
		User loggedInUser=(User) users.get(0);
		System.out.println(loggedInUser.getFirstname()+" "+loggedInUser.getLastname()+"==>"+loggedInUser.getRole());

		ShoppingCart cart=new ShoppingCart();
		List items=new ArrayList<Item>();
		cart.setItems(items);
		
		ModelAndView mav=new ModelAndView("home");
		mav.addObject("cart",cart);
		mav.addObject("username", loggedInUser.getUsername());
		return mav;
	}
	
	@RequestMapping("login/logout")
	public ModelAndView logout(WebRequest request,SessionStatus status){
		status.setComplete();
		request.removeAttribute("username", WebRequest.SCOPE_SESSION);
		ModelAndView mav=new ModelAndView("redirect:../home.htm");
		return mav;
	}
}
