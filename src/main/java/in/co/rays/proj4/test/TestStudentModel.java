package in.co.rays.proj4.test;

import java.sql.Timestamp;
import java.util.Date;

import in.co.rays.proj4.bean.StudentBean;
import in.co.rays.proj4.model.StudentModel;

public class TestStudentModel {

	public static void main(String[] args) {
		// testadd();
		testdelete();

	}

	private static void testadd() {

		StudentBean bean = new StudentBean();

		bean.setCollegeId(1);
		bean.setCollegeName("DAVV");
		bean.setFirstName("quaid");
		bean.setLastName("johar");
		bean.setDob(new Date());
		bean.setMobileNo("694995949494");
		bean.setEmail("abc@gmail.com");
		bean.setCreatedBy("abcd");
		bean.setModifiedBy("fgh");
		bean.setCreatedDatetime(new Timestamp(new Date().getTime()));
		bean.setModifiedDatetime(new Timestamp(new Date().getTime()));

		StudentModel model = new StudentModel();

		model.add(bean);

	}
	
	public static void testdelete() {
		
		StudentModel model = new StudentModel();
		
		model.delete(1);
	}

}
