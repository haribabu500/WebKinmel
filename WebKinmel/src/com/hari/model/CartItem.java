package com.hari.model;

import javax.persistence.Entity;

@Entity
public class CartItem extends WebKinmelObject{
	private Item item;
	private int quantity;
	public Item getItem() {
		return item;
	}
	public void setItem(Item item) {
		this.item = item;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
}
