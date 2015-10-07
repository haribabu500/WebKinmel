package com.hari.model;

import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.MappedSuperclass;

@MappedSuperclass
public class WebKinmelObject {
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int id;
	
	public boolean isPersisted(){
		if(id==0)
			return false; 
		else 
			return true;
	}
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}
	
}
