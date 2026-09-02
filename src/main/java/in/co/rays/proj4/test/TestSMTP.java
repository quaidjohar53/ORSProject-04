package in.co.rays.proj4.test;

import java.util.HashMap;

import in.co.rays.proj4.util.EmailBuilder;
import in.co.rays.proj4.util.EmailMessage;

public class TestSMTP {

	public static void main(String[] args) {

		testForgetPassword();

	}

	public static void testForgetPassword() {
		
		HashMap<String, String> map = new HashMap<String, String>();
  
		EmailMessage msg = new EmailMessage();
		
		map.put("login", "qjlightwala21@gmail.com");
		map.put("password", "12345");
		
		msg.setTo(map.get("login"));
		msg.setSubject("forget password mail");
		msg.setMessage(EmailBuilder);

	}

}
