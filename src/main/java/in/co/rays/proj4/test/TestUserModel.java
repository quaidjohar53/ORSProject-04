package in.co.rays.proj4.test;

import java.sql.Timestamp;
import java.util.Date;

import in.co.rays.proj4.bean.UserBean;
import in.co.rays.proj4.model.UserModel;

public class TestUserModel {

	public static void main(String[] args) {
	//	testadd();
testdelete();
	}

	public static void testadd() {

		UserBean bean = new UserBean();

		bean.setFirstName("quaid");
		bean.setLastName("johar");
		bean.setLogin("abc@gmail.com");
		bean.setPassword("12345");
		bean.setDob(new Date());
		bean.setMobileNo("7852314666");
		bean.setRoleId(2);
		bean.setUnSuccessfulLogin(0);
		bean.setGender("male");
		bean.setLastLogin(new Timestamp(new Date().getTime()));
		bean.setLock("N");
		bean.setRegisteredIP("127.0.0.1");
		bean.setLastLoginIP("127.0.0.1");
		bean.setCreatedBy("quaid");
		bean.setModifiedBy("quaid");
		bean.setCreatedDatetime(new Timestamp(new Date().getTime()));
		bean.setModifiedDatetime(new Timestamp(new Date().getTime()));
		UserModel model = new UserModel();

		model.add(bean);

	}
	
	public static void testdelete() {
		
		UserModel model = new UserModel();
		
		model.delete(1);
	}

}
