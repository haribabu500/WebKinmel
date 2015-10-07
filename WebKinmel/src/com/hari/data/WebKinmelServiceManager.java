package com.hari.data;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.Persistence;

import com.hari.model.Category;
import com.hari.model.Item;
import com.hari.model.Manufacturer;
import com.hari.model.User;

public class WebKinmelServiceManager {
	public static EntityManager entityManager = Persistence
			.createEntityManagerFactory("WEB_KINMEL")
			.createEntityManager();
	public static void save(Object object) {
		entityManager.getTransaction().begin();
		entityManager.persist(object);
		entityManager.getTransaction().commit();
	}
	
	public static void update(Object object) {
		entityManager.getTransaction().begin();
		entityManager.merge(object);
		entityManager.getTransaction().commit();
	}
	public static List<Object> select(String query, Class clasz) {
		return entityManager.createQuery(query, clasz).getResultList();
	}
	public static Object find(int id,Class class1){
		return entityManager.find(class1, id);
	}
	public static void remove(int id,Class classz){
		Object object=find(id, classz);
		entityManager.getTransaction().begin();
			entityManager.remove(object);
		entityManager.getTransaction().commit();
	}

	public static String getItemsTable(List items) {
		String table="<table class='table table-hover'><thead><tr>"
				+ "<th>Name</th>"
				+"<th>Category</th>"
				+ "<th>Manufacturer</th>"
				+ "<th>Price</th>"
				+ "<th>Description</th>"
				+ "<th>Preview</th>"
				+ "<th></th>" 
				+"</tr></thead>";
		
		for (Object object : items) {
			Item item=(Item) object;
			table=table.concat("<tr id='"+item.getId()+"'>"
					+ "<td class='update'>"+item.getName()+"</td>"
					+ "<td class='update'>"+item.getCategory()+"</td>"
					+ "<td class='update'>"+item.getManufacturer()+"</td>"
					+ "<td class='update'>"+item.getPrice()+"</td>"
					+ "<td class='update'>"+item.getDescription()+"</td>"
					+ "<td class='update'><img src='"+item.getImagePath()+"' height='40'/></td>"
					+ "<td><button id='"+item.getId()+"' name='"+item+"'class='myButton delete'>Remove</button></td>"
					+ "</tr>");
		}
		
		table=table.concat("</table>");
		return table;
	}

	public static String getCategoryTable(List categories) {
		String table="<table class='table table-hover'><thead><tr>"
				+ "<th>Name</th>"
				+ "<th></th>"
				+ "<th></th></tr></thead>";
		
		for (Object object : categories) {
			Category category=(Category) object;
			table=table.concat("<tr id='"+category.getId()+"'>"
					+ "<td class='update'>"+category.getName()+"</td>"
					+ "<td><button id='"+category.getId()+"' name='"+category+"'class='myButton delete'>Remove</button></td>"
					+ "</tr>");
		}
		
		table=table.concat("</table>");
		return table;
	}

	public static String getManufacturerTable(List manufacturers) {
		String table="<table class='table table-hover'><thead><tr>"
				+ "<th>Name</th>"
				+ "<th></th>"
				+ "<th></th></tr></thead>";
		
		for (Object object : manufacturers) {
			Manufacturer manufacturer=(Manufacturer) object;
			table=table.concat("<tr id='"+manufacturer.getId()+"'>"
					+ "<td class='update'>"+manufacturer.getName()+"</td>"
					+ "<td><button id='"+manufacturer.getId()+"' name='"+manufacturer+"'class='myButton delete'>Remove</button></td>"
					+ "</tr>");
		}
		
		table=table.concat("</table>");
		return table;
	}

	public static String getUsersTable(List userList) {
		String table="<table class='table table-hover'><thead><tr>"
				+ "<th>Id</th>"
				+"<th>Name</th>"
				+ "<th>Username</th>"
				+ "<th>Email</th>"
				+ "<th>Address</th>"
				+ "<th>Contact</th>"
				+ "<th></th></tr></thead>";
		for (Object object : userList) {
			User user=(User) object;
			table=table.concat("<tr id='"+user.getId()+"'>"
					+ "<td class='update'>"+user.getId()+"</td>"
					+ "<td class='update'>"+user.getFirstname()+" "+user.getLastname()+"</td>"
					+ "<td class='update'>"+user.getUsername()+"</td>"
					+ "<td class='update'>"+user.getEmail()+"</td>"
					+ "<td class='update'>"+user.getEmail()+"</td>"
					+ "<td class='update'>"+user.getTelephone()+"</td>"
					+ "<td><button id='"+user.getId()+"' name='"+user+"'class='myButton delete'>Remove</button></td>"
					+ "</tr>");
		}
		return table;
	}
}
