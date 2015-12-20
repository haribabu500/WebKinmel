package com.hari.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.context.request.WebRequest;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.hari.data.WebKinmelServiceManager;
import com.hari.model.Category;
import com.hari.model.Item;
import com.hari.model.Manufacturer;
import com.hari.model.Orders;
import com.hari.model.User;

@SessionAttributes(value={"goto","recent"})
@Controller
public class AdminController {
	@Autowired
    ServletContext context;
	
	@RequestMapping("adminHome")
	public ModelAndView adminHome(WebRequest request,SessionStatus status){
		User user=(User) request.getAttribute("loggedInUser", WebRequest.SCOPE_SESSION);
		if(user==null||!user.getRole().equalsIgnoreCase("admin")){
			ModelAndView mav=new ModelAndView("redirect:home.htm");
			return mav;
		}
		ModelAndView mav=new ModelAndView("adminHome");
		return mav;	
		
	}
	public void addItemContent(ModelAndView mav){
		Item item=new Item();
		mav.addObject("item",item);
		List items=WebKinmelServiceManager.select("Select i from Item i", Item.class);
		String itemsTable=WebKinmelServiceManager.getItemsTable(items);
		mav.addObject("itemsTable", itemsTable);
		
		List categories=WebKinmelServiceManager.select("select c from Category c", Category.class);
		mav.addObject("categories", categories);
		
		List manufacturers=WebKinmelServiceManager.select("select m from Manufacturer m", Manufacturer.class);
		mav.addObject("manufacturers", manufacturers);
	}
	@RequestMapping("admin/adminItem")
	public ModelAndView adminItem(@RequestParam(value="id",required=false)String id,
			@RequestParam(value="search",required=false)String search){
		ModelAndView mav=new ModelAndView("admin/adminItem");
		if(id==null){
//			addItemContent(mav);
			Item item=new Item();
			mav.addObject("item",item);
		}
		else{
			Item item=(Item) WebKinmelServiceManager.find(Integer.parseInt(id), Item.class);
			mav.addObject("item",item);
		}
		
		List items=WebKinmelServiceManager.select("Select i from Item i", Item.class);
		if(search!=null){
			items=WebKinmelServiceManager.select("Select i from Item i " +
					"where i.name like '%"+search+"%' " +
					"OR i.manufacturer like '%"+search+"%'" +
					"OR i.category like '%"+search+"%'" +
					"", Item.class);
		}
		String itemsTable=WebKinmelServiceManager.getItemsTable(items);
		mav.addObject("itemsTable", itemsTable);
		List categories=WebKinmelServiceManager.select("select c from Category c", Category.class);
		mav.addObject("categories", categories);
		List manufacturers=WebKinmelServiceManager.select("select m from Manufacturer m", Manufacturer.class);
		mav.addObject("manufacturers", manufacturers);
		return mav;	
		
	}
	@RequestMapping("admin/addItemAction")
	public ModelAndView addItemAction(@ModelAttribute("item")Item formItem,HttpServletRequest req){
		MultipartFile uploadedFile=formItem.getFile();
		if(uploadedFile!=null){
			String fileName=uploadedFile.getOriginalFilename();
			try {
				//-- if uploaded file is empty
				if(fileName!=""){
					//String imagePath="/Users/hari/Documents/workspace/WebKinmel/WebContent/resources/upload/"+fileName;
					String testpath=context.getRealPath("/");
					System.out.println("==>"+testpath);
					String imagePath="/Users/hari/git/local_WebKinmel/WebKinmel/WebContent/resources/upload/"+fileName;
					System.out.println("==>>>"+imagePath);
					File f=new File(imagePath);
					formItem.setImagePath("/WebKinmel"+imagePath.substring(imagePath.indexOf("/resources")));
					formItem.setFile(null);
					FileOutputStream fos=new FileOutputStream(f);
					fos.write(uploadedFile.getBytes());
					fos.flush();
					fos.close();
					f.createNewFile();
				}
			} catch (IOException e) {
				e.printStackTrace();
				System.out.println("==>>The uploaded file cound not be saved");
			}
		}
		if(formItem.isPersisted()){
			
			// to be done if no image
			String fileName=uploadedFile.getOriginalFilename();
			if(fileName==""){
				Item i=(Item) WebKinmelServiceManager.find(formItem.getId(), Item.class);
				formItem.setImagePath(i.getImagePath());//transferring old image path if no image path found
			}
			Date date=new Date();
			formItem.setAddedDate(date);
			WebKinmelServiceManager.update(formItem);
		}
		else{
			Date date=new Date();
			formItem.setAddedDate(date);
			WebKinmelServiceManager.save(formItem);
		}
		System.out.println("object"+formItem+" saved");
		ModelAndView mav=new ModelAndView("admin/adminItem");
		addItemContent(mav);
		mav.addObject("recent", formItem);
		return mav;	
		
	}
	@RequestMapping("admin/removeItem")
	public ModelAndView removeItem(@RequestParam("id")int id){
		WebKinmelServiceManager.remove(id, Item.class);
		System.out.println("object deleted");
		ModelAndView mav=new ModelAndView("admin/adminItem");
		addItemContent(mav);
		return mav;	
		
	}

	public void addCategoryContent(ModelAndView mav){
		Category category=new Category();
		mav.addObject("category",category);
		List categories=WebKinmelServiceManager.select("Select c from Category c", Category.class);
		String categoriesTable=WebKinmelServiceManager.getCategoryTable(categories);
		mav.addObject("categoriesTable", categoriesTable);
	}
	@RequestMapping("admin/adminCategory")
	public ModelAndView adminCategory(@RequestParam(value="id",required=false)String id,
			@RequestParam(value="search",required=false)String search){
		ModelAndView mav=new ModelAndView("admin/adminCategory");
		if(id==null){
//			addCategoryContent(mav);
			Category category=new Category();
			mav.addObject("category",category);
		}
		else{
			Category category=(Category) WebKinmelServiceManager.find(Integer.parseInt(id), Category.class);
			mav.addObject("category",category);
		}
		List categories=WebKinmelServiceManager.select("Select c from Category c", Category.class);
		if(search!=null){
			categories=WebKinmelServiceManager.select("Select c from Category c where c.name like '%"+search+"%' ", Category.class);
		}
		String categoriesTable=WebKinmelServiceManager.getCategoryTable(categories);
		mav.addObject("categoriesTable", categoriesTable);
		return mav;	
		
	}
	@RequestMapping("admin/addCategoryAction")
	public ModelAndView addCategoryAction(@ModelAttribute("category")Category formCategory){
		System.out.println(formCategory);
		if(formCategory.isPersisted()){
			WebKinmelServiceManager.update(formCategory);
		}
		else
			WebKinmelServiceManager.save(formCategory);
		System.out.println("object "+formCategory+" saved");
		ModelAndView mav=new ModelAndView("admin/adminCategory");
		addCategoryContent(mav);
		mav.addObject("recent", formCategory);
		return mav;	
		
	}
	@RequestMapping("admin/removeCategory")
	public ModelAndView removeCategory(@RequestParam("id")int id){
		WebKinmelServiceManager.remove(id, Category.class);
		System.out.println("object deleted");
		ModelAndView mav=new ModelAndView("admin/adminCategory");
		addCategoryContent(mav);
		return mav;	
		
	}
	
	public void addManufacturerContent(ModelAndView mav){
		Manufacturer manufacturer=new Manufacturer();
		mav.addObject("manufacturer",manufacturer);
		List manufacturers=WebKinmelServiceManager.select("Select m from Manufacturer m", Manufacturer.class);
		String cmanufacturersTable=WebKinmelServiceManager.getManufacturerTable(manufacturers);
		mav.addObject("manufacturersTable", cmanufacturersTable);
	}
	@RequestMapping("admin/adminManufacturer")
	public ModelAndView adminManufacturer(@RequestParam(value="id",required=false)String id,
			@RequestParam(value="search",required=false)String search){
		ModelAndView mav=new ModelAndView("admin/adminManufacturer");
		if(id==null){
//			addManufacturerContent(mav);
			Manufacturer manufacturer=new Manufacturer();
			mav.addObject("manufacturer",manufacturer);
		}
		else{
			Manufacturer manufacturer=(Manufacturer) WebKinmelServiceManager.find(Integer.parseInt(id), Manufacturer.class);
			mav.addObject("manufacturer",manufacturer);
		}
		List manufacturers=WebKinmelServiceManager.select("Select m from Manufacturer m", Manufacturer.class);
		if(search!=null){
			manufacturers=WebKinmelServiceManager.select("Select m from Manufacturer m where m.name like '%"+search+"%'", Manufacturer.class);
		}
		String manufacturersTable=WebKinmelServiceManager.getManufacturerTable(manufacturers);
		mav.addObject("manufacturersTable", manufacturersTable);
		return mav;	
		
	}
	@RequestMapping("admin/addManufacturerAction")
	public ModelAndView addManufacturerAction(@ModelAttribute("manufacturer")Manufacturer formManufacturer){
		if(formManufacturer.isPersisted()){
			WebKinmelServiceManager.update(formManufacturer);
		}
		else
			WebKinmelServiceManager.save(formManufacturer);
		System.out.println("object "+formManufacturer+" saved");
		ModelAndView mav=new ModelAndView("admin/adminManufacturer");
		addManufacturerContent(mav);
		mav.addObject("recent", formManufacturer);
		return mav;	
		
	}
	@RequestMapping("admin/removeManufacturer")
	public ModelAndView removeManufacturer(@RequestParam("id")int id){
		WebKinmelServiceManager.remove(id, Manufacturer.class);
		System.out.println("object deleted");
		ModelAndView mav=new ModelAndView("admin/adminManufacturer");
		addManufacturerContent(mav);
		return mav;	
		
	}
	@RequestMapping("admin/adminUser")
	public ModelAndView adminManufacturer(@RequestParam(value="search",required=false)String search){
		ModelAndView mav=new ModelAndView("admin/adminUser");
			List userList=WebKinmelServiceManager.select("select u from User u where u.role='user'", User.class);
			if(search!=null){
				userList=WebKinmelServiceManager.select("select u from User u where u.role='user' and " +
						"u.firstname like '%"+search+"%' " +
						"OR u.lastname like '%"+search+"%' " +
						"OR u.email like '%"+search+"%' " +
						"OR u.username like '%"+search+"%' "+
						"OR u.telephone like '%"+search+"%' "+
						"OR u.country like '%"+search+"%' "+
						"OR u.city like '%"+search+"%'"+
						"", User.class);
			}
			String usersTable=WebKinmelServiceManager.getUsersTable(userList);
			mav.addObject("usersTable", usersTable);
			return mav;
	}
	
	@RequestMapping("admin/removeUser")
	public ModelAndView removeUser(@RequestParam("id")int id){
		ModelAndView mav=new ModelAndView("admin/adminUser");
		WebKinmelServiceManager.remove(id, User.class);
		List userList=WebKinmelServiceManager.select("select u from User u where u.role='user'", User.class);
		String usersTable=WebKinmelServiceManager.getUsersTable(userList);
		mav.addObject("usersTable", usersTable);
		return mav;
	}	
	
	@RequestMapping("admin/adminOrders")
	public ModelAndView adminOrders(@RequestParam(value="search",required=false)String search){
		ModelAndView mav=new ModelAndView("admin/adminOrders");
		List orders=WebKinmelServiceManager.select("select o from Orders o", Orders.class);
		if(search!=null){
//			"select o from Orders o join o.cartItems ci where ci.item.name like '%sam%' group by o.id"
			orders=WebKinmelServiceManager.select("select o from Orders o join o.cartItems ci where " +
					"o.id like '%"+search+"%'"+
					"OR o.date like '%"+search+"%'"+
					"OR o.user.firstname like '%"+search+"%' " +
					"OR o.user.lastname like '%"+search+"%' " +
					"OR o.user.email like '%"+search+"%' " +
					"OR o.user.username like '%"+search+"%' "+
					"OR o.user.telephone like '%"+search+"%' "+
					"OR o.user.country like '%"+search+"%' "+
					"OR o.user.city like '%"+search+"%'"+
					"OR o.user.area like '%"+search+"%' "+
					"OR o.user.street like '%"+search+"%' "+
					"OR ci.item.name like '%"+search+"%'"+
					"OR ci.item.id like '%"+search+"%'"+
					"group by o.id", User.class);
		}
		String ordersTable=WebKinmelServiceManager.getOrdersTable(orders);
		mav.addObject("ordersTable", ordersTable);
		return mav;
	}
	
	@RequestMapping("admin/adminReports")
	public ModelAndView adminReports(){
		ModelAndView mav=new ModelAndView("admin/adminReports");
		return mav;
	}
}
