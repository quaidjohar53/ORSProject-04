package in.co.rays.proj4.test;

import java.sql.Timestamp;
import java.util.Date;

import in.co.rays.proj4.bean.FacultyBean;
import in.co.rays.proj4.model.FacultyModel;

public class TestFacultyModel {
	
	public static void main(String[] args) {
		//testadd();
		//testdelete();
		testupdate();
		
	}
	

	public static void testadd() {
		
		FacultyBean bean = new FacultyBean();
		
		bean.setCollegeId(125);
		bean.setCollegeName("vikram");
		bean.setFirstName("quaid");
		bean.setLastName("johar");
		bean.setEmail("abc@gmail.com");
		bean.setMobileNo("82546232321");
		bean.setAddress("indore");
		bean.setGender("male");
		bean.setDob(new Date());
		bean.setCreatedBy("abcd");
		bean.setModifiedBy("xyz");
		bean.setCreatedDatetime(new Timestamp(new Date().getTime()));
		bean.setModifiedDatetime(new Timestamp(new Date().getTime()));
		
		FacultyModel model = new FacultyModel();
		
		model.add(bean);
		
	}
	
	public static void testdelete() {
		
		FacultyModel model = new FacultyModel();
		
		model.delete(1);
		
	}
	
	public static void testupdate() {
		
		FacultyBean bean = new FacultyBean();
		FacultyModel model = new FacultyModel();
		
		bean.setId(1);
		bean.setCollegeId(101);
		bean.setCollegeName("Accropolis");
		bean.setFirstName("ABCD");
		bean.setLastName("XYZ");
		bean.setEmail("FGH@gmail.com");
		bean.setMobileNo("5454544454");
		bean.setAddress("INdore");
		bean.setGender("Male");
		bean.setDob(new Date());
		bean.setModifiedBy("XYZ");
		bean.setModifiedDatetime(new Timestamp(new Date().getTime()));
		
		model.update(bean);
		
		
	}
}
