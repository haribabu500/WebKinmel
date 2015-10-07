package com.hari.tools;

import java.math.BigInteger;
import java.security.MessageDigest;

public class Tools {
	public static String getHash(String maintext){
		try{
			MessageDigest digest=MessageDigest.getInstance("SHA");
			String yourString=maintext;
			byte[] bytesOfMessage = yourString.getBytes("UTF-8");
			byte[] thedigest = digest.digest(bytesOfMessage);
			
			BigInteger bigInt = new BigInteger(1,thedigest);
			String hashtext = bigInt.toString(16);
			return hashtext;
		}
		catch (Exception e) {
			System.out.println(e);
			return null;
		}
	}
}
