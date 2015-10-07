package com.hari.model;

import java.util.List;

public class ShoppingCart {
	private List<Item> outfits;
	private double total;
	private boolean isEmpty;
	public List<Item> getOutfits() {
		return outfits;
	}
	public void setOutfits(List<Item> outfits) {
		this.outfits = outfits;
	}
	public double getTotal() {
		return total;
	}
	public void setTotal(double total) {
		this.total = total;
	}
	public boolean getIsEmpty() {
		return isEmpty;
	}
	public void setIsEmpty(boolean isEmpty) {
		this.isEmpty = isEmpty;
	}
}
