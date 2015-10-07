package com.hari.model;

import java.beans.Transient;

import javax.persistence.Entity;
import javax.persistence.Temporal;

import org.springframework.web.multipart.MultipartFile;

@Entity
public class Item extends WebKinmelObject {
	private String name;
	private double price;
	private String manufacturer;
	private String description;
	private String category;
	private String imagePath;
	private int quantity;
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getManufacturer() {
		return manufacturer;
	}
	public void setManufacturer(String manufacturer) {
		this.manufacturer = manufacturer;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	private MultipartFile file;
	public MultipartFile getFile() {
		return file;
	}
	@Transient
	public void setFile(MultipartFile file) {
		this.file = file;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public String getImagePath() {
		return imagePath;
	}
	public void setImagePath(String imagePath) {
		this.imagePath = imagePath;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
}
