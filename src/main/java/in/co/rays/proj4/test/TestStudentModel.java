package in.co.rays.proj4.test;

import java.sql.Timestamp;
import java.util.Date;

import in.co.rays.proj4.bean.StudentBean;
import in.co.rays.proj4.model.StudentModel;

public class TestStudentModel {

	public static void main(String[] args) {
		 //testadd();
		//testdelete();

		//testupdate();
	}

	private static void testadd() {

		StudentBean bean = new StudentBean();

		bean.setCollegeId(1);
		bean.setCollegeName("Vikram University");
		bean.setFirstName("quaid");
		bean.setLastName("johar");
		bean.setDob(new Date());
		bean.setMobileNo("8954412665");
		bean.setEmail("abc@gmail.com");
		bean.setCreatedBy("abcd");
		bean.setModifiedBy("xyz");
		bean.setGender("Male");	
		bean.setCreatedDatetime(new Timestamp(new Date().getTime()));
		bean.setModifiedDatetime(new Timestamp(new Date().getTime()));

		StudentModel model = new StudentModel();

		model.add(bean);

	}

	public static void testdelete() {

		StudentModel model = new StudentModel();

		model.delete(2);
	}

	public static void testupdate() {

		StudentBean bean = new StudentBean();
		StudentModel model = new StudentModel();
		
		bean.setId(1);
		bean.setCollegeId(1);
		bean.setCollegeName("Accropolis");
		bean.setFirstName("Quaid");
		bean.setLastName("johar");
		bean.setDob(new Date());
		bean.setMobileNo("9898989898");
		bean.setModifiedBy("xyz");
		bean.setModifiedDatetime(new Timestamp(new Date().getTime()));
		
		model.update(bean);
		

	}

}
