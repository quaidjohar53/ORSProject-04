package in.co.rays.proj4.test;

import java.sql.Timestamp;
import java.util.Date;

import in.co.rays.proj4.bean.CollegeBean;
import in.co.rays.proj4.model.CollegeModel;

public class TestCollegeModel {

	public static void main(String[] args) {
		testadd();

	}

	public static void testadd() {
		
		CollegeBean bean = new CollegeBean();
		
		bean.setName("quaid");
		bean.setAddress("indore");
		bean.setState("Mp");
		bean.setCity("inodre");
		bean.setPhoneNo("8954412665");
		bean.setCreatedBy("quaid");
		bean.setModifiedBy("quaid");
		bean.setCreatedDatetime(new Timestamp(new Date().getTime()));
		bean.setModifiedDatetime(new Timestamp(new Date().getTime()));
		
		CollegeModel model = new CollegeModel() ;
		
		model.add(bean);
		
		
		

	}
}
