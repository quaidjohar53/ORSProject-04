package in.co.rays.proj4.test;

import java.sql.Timestamp;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import in.co.rays.proj4.bean.UserBean;
import in.co.rays.proj4.model.UserModel;

public class TestUserModel {

	public static void main(String[] args) {
		// testadd();
		// testdelete();
		// testupdate();
		testsearch();

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

	public static void testupdate() {

		UserBean bean = new UserBean();
		UserModel model = new UserModel();

		bean.setId(1);
		bean.setFirstName("Quaid");
		bean.setLastName("Johar");
		bean.setLogin("ABC@gmail.com");
		bean.setPassword("12345");
		bean.setDob(new Date());
		bean.setMobileNo("7879865556");
		bean.setRoleId(1);
		bean.setUnSuccessfulLogin(0);
		bean.setGender("male");
		bean.setLastLogin(new Timestamp(new Date().getTime()));
		bean.setLock("N");
		bean.setRegisteredIP("127.0.0.1");
		bean.setLastLoginIP("127.0.0.1");
		bean.setModifiedBy("XYZ");
		bean.setModifiedDatetime(new Timestamp(new Date().getTime()));

		model.update(bean);

	}

	public static void testsearch() {
		UserModel model = new UserModel();
		UserBean bean = new UserBean();

		bean.setFirstName("Quaid");

		List<UserBean> list = model.search(bean, 1, 5);

		Iterator<UserBean> it = list.iterator();

		while (it.hasNext()) {
			bean = it.next();

			System.out.println(bean.getId());
			System.out.println(bean.getFirstName());
			System.out.println(bean.getLastName());
			System.out.println(bean.getLogin());
			System.out.println(bean.getPassword());
			System.out.println(bean.getDob());
			System.out.println(bean.getMobileNo());
			System.out.println("-----------------------");

		}

	}

}
