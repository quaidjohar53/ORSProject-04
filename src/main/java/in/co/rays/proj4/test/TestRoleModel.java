package in.co.rays.proj4.test;

import java.sql.Timestamp;
import java.util.Date;

import in.co.rays.proj4.bean.RoleBean;
import in.co.rays.proj4.model.RoleModel;

public class TestRoleModel {

	public static void main(String[] args) {
//		testadd();
//		testdelete();
		testupdate();

	}

	public static void testadd() {

		RoleBean bean = new RoleBean();

		bean.setName("KIOSK");
		bean.setDescription("KIOSK Role");
		bean.setCreatedBy("abc");
		bean.setModifiedBy("fgh");
		bean.setCreatedDatetime(new Timestamp(new Date().getTime()));
		bean.setModifiedDatetime(new Timestamp(new Date().getTime()));

		RoleModel model = new RoleModel();

		model.add(bean);

	}

	public static void testupdate() {

		RoleBean bean = new RoleBean();

		bean.setId(2);
		bean.setName("student");
		bean.setDescription("role student");
		bean.setModifiedBy("xyz");
		bean.setModifiedDatetime(new Timestamp(new Date().getTime()));

		RoleModel model = new RoleModel();

		model.update(bean);

	}

	public static void testdelete() {
		RoleModel model = new RoleModel();

		model.delete(1);

	}

}
