package com.hari.model;

import javax.persistence.Entity;

@Entity
public class Category extends WebKinmelObject {
	private String name;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
}
