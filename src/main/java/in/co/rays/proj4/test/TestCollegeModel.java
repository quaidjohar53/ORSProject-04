package in.co.rays.proj4.test;

import java.sql.Timestamp;
import java.util.Date;

import in.co.rays.proj4.bean.CollegeBean;
import in.co.rays.proj4.model.CollegeModel;
import in.co.rays.proj4.model.RoleModel;

public class TestCollegeModel {

	public static void main(String[] args) {
		 testadd();
		// testdelete();
		//testupdate();
	}

	public static void testadd() {

		CollegeBean bean = new CollegeBean();

		bean.setName("Vikram University");
		bean.setAddress("Dewas road");
		bean.setState("Madhya pradeh");
		bean.setCity("Ujjain");
		bean.setPhoneNo("8954412665");
		bean.setCreatedBy("ABCD");
		bean.setModifiedBy("xyz");
		bean.setCreatedDatetime(new Timestamp(new Date().getTime()));
		bean.setModifiedDatetime(new Timestamp(new Date().getTime()));

		CollegeModel model = new CollegeModel();

		model.add(bean);

	}

	public static void testdelete() {
		CollegeModel model = new CollegeModel();

		model.delete(1);

	}
	
	public static void testupdate() {
		
		CollegeBean bean = new CollegeBean();
		CollegeModel model = new CollegeModel();
		
		bean.setId(1);
		bean.setName("Vikram University");
		bean.setAddress("Dewas road");
		bean.setState("Madhya Pradesh");
		bean.setCity("Ujjain");
		bean.setPhoneNo("9000010000");
		bean.setModifiedBy("abcd");
		bean.setModifiedDatetime(new Timestamp(new Date().getTime()));
		
		model.update(bean);
		
	}
}
