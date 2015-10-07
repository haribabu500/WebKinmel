package com.hari.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.context.request.WebRequest;
import org.springframework.web.servlet.ModelAndView;

import com.hari.data.WebKinmelServiceManager;
import com.hari.model.Category;
import com.hari.model.Item;
import com.hari.model.Manufacturer;

@SessionAttributes(value={"username","cart"})

@Controller
public class HomeController {
	
	
	@RequestMapping("home")
	public ModelAndView home(WebRequest request){
		ModelAndView mav=new ModelAndView("home");
		List categories=WebKinmelServiceManager.select("select c from Category c", Category.class);
		mav.addObject("categories", categories);	
		List manufacturers=WebKinmelServiceManager.select("select m from Manufacturer m", Manufacturer.class);
		mav.addObject("manufacturers", manufacturers);	
		return mav;
	}
	
	@RequestMapping("itemsContent")
	public ModelAndView itemsContent(@RequestParam(value="category", required=false)String queryCategory,
									@RequestParam(value="manufacturer",required=false)String queryManufacturer,
									@RequestParam(value="search",required=false)String querySearch){
		ModelAndView mav=new ModelAndView("itemsContent");
		List items=WebKinmelServiceManager.select("select i from Item i", Item.class);
		mav.addObject("items", items);
		if(queryCategory!=null){
			List newItems=WebKinmelServiceManager.select("select i from Item i where i.category='"+queryCategory+"'", Item.class);
			mav.addObject("items", newItems);
		}
		if(queryManufacturer!=null){
			List newItems=WebKinmelServiceManager.select("select i from Item i where i.manufacturer='"+queryManufacturer+"'", Item.class);
			mav.addObject("items", newItems);
		}
		if(querySearch!=null){
			List newItems=WebKinmelServiceManager.select("select i from Item i where i.name='"+querySearch+"'", Item.class);
			mav.addObject("items", newItems);
		}
		return mav;
	}
		
	
	
}
