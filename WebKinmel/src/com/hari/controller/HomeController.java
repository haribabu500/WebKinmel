package com.hari.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.context.request.WebRequest;
import org.springframework.web.servlet.ModelAndView;

import com.hari.data.WebKinmelServiceManager;
import com.hari.model.CartItem;
import com.hari.model.Category;
import com.hari.model.Item;
import com.hari.model.Manufacturer;
import com.hari.model.ShoppingCart;

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
		
		/*This shopping should be added after the successful login to the system*/
		ShoppingCart cart=(ShoppingCart) request.getAttribute("cart", WebRequest.SCOPE_SESSION);
		if(cart!=null){
			mav.addObject("cart",cart);
		}
		return mav;
	}
	@RequestMapping("topbarContent")
	public ModelAndView topbarContent(){
		ModelAndView mav=new ModelAndView("topbarContent");
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
			List newItems=WebKinmelServiceManager.select("select i from Item i where i.name like '%"+querySearch+"%'", Item.class);
			mav.addObject("items", newItems);
		}
		return mav;
	}
		
	@RequestMapping("itemDescription")
	public ModelAndView itemDescription(@RequestParam("itemId")int itemid){
		ModelAndView  mav=new ModelAndView("itemDescription");
		Item item=(Item) WebKinmelServiceManager.find(itemid, Item.class);
		mav.addObject("item", item);
		return mav;
	}
	@RequestMapping("shoppingCart")
	public ModelAndView shoppingCart(@RequestParam(value="id", required=false)String itemId,WebRequest request){
		ModelAndView  mav=new ModelAndView("shoppingCart");
		
		ShoppingCart cart=(ShoppingCart) request.getAttribute("cart", WebRequest.SCOPE_SESSION);
		
		if(cart==null){
			ModelAndView mav2=new ModelAndView("message");
			mav2.addObject("message", "mustLogin");
			return mav2;
		}
		if(itemId!=null){
			Item item=(Item) WebKinmelServiceManager.find(Integer.parseInt(itemId), Item.class);
			cart.getItems().add(item);
		}
		double total=0;
		if(cart!=null){
			for (Item item : cart.getItems()) {
				double itemprice=item.getPrice();
				total=total+itemprice;
			}
			mav.addObject("total", total);
			mav.addObject("cart",cart);
			mav.addObject("cartItems",cart.getItems());
		}
		return mav;
	}
	@RequestMapping("removeFromShoppingCart")
	public ModelAndView removeFromShoppingCart(@RequestParam(value="id", required=false)String itemId,WebRequest request)
	{
		ModelAndView  mav=new ModelAndView("shoppingCart");
		
		ShoppingCart cart=(ShoppingCart) request.getAttribute("cart", WebRequest.SCOPE_SESSION);
		if(itemId!=null){
			Item item=(Item) WebKinmelServiceManager.find(Integer.parseInt(itemId), Item.class);
			cart.getItems().remove(item);
//			cart.getItems().remove(cart.getItems().get(Integer.parseInt(itemId)));
			mav.addObject("cart",cart);
			mav.addObject("cartItems",cart.getItems());
		}
		double total=0;
		for (Item item : cart.getItems()) {
			double itemprice=item.getPrice();
			total=total+itemprice;
		}
		mav.addObject("total", total);
		return mav;
	}
	
	@RequestMapping("checkout")
	public ModelAndView checkout(WebRequest request){
		ModelAndView mav=new ModelAndView("checkout");
		ShoppingCart sessionCart=(ShoppingCart) request.getAttribute("cart", WebRequest.SCOPE_SESSION);
		
		//===========codes to transfer repeating items to its respected numbers==========
		List items=sessionCart.getItems();
		List cartItems=new ArrayList<CartItem>();
		List oldList=new ArrayList<Item>();
		for (Object object : items) {
			Item item=(Item) object;
			oldList.add(item);
		}
		
		for (Object object : items) {
			Item item=(Item)object;
			int count=0;
			for (int i = 0; i < oldList.size(); i++) {
				if(oldList.get(i)!=null){
					if(((Item)(oldList.get(i))).getId()==item.getId()){
						count++;
						oldList.set(i, null);
					}
				}
			}
			if(count!=0){
				CartItem cartItem=new CartItem();
				cartItem.setItem(item);
				cartItem.setQuantity(count);
				cartItems.add(cartItem);
			}
			
		}
		
		
		//=================================================================
		mav.addObject("cartItems", cartItems);
		return mav;
	}
}
