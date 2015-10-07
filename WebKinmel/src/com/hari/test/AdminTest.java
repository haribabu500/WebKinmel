package com.hari.test;

import java.io.File;
import java.io.FileWriter;

import com.hari.data.WebKinmelServiceManager;
import com.hari.model.User;

public class AdminTest {
	public static void main(String[] args) {
//		User user=new User();
//		user.setUsername("hari");
//		user.setPassword("hari");
//		user.setRole("user");
//		
//		WebKinmelServiceManager.save(user);
		File file=new File("/Users/hari/Desktop/uploads/1.txt");
		System.out.println("File ==>"+file.getAbsolutePath());
		try {
			FileWriter writer=new FileWriter(file);
			writer.write("what the????");
			writer.flush();
			writer.close();
			file.createNewFile();
			System.out.println("File created"+file.getAbsolutePath());
			System.out.println("==>"+file.getCanonicalPath());
		} catch (Exception e) {
			System.out.println("not saved");
		}
		
		
	}
}
