package in.co.rays.proj4.test;

import java.sql.Timestamp;
import java.util.Date;

import in.co.rays.proj4.bean.CourseBean;
import in.co.rays.proj4.model.CourseModel;

public class TestCourseModel {

	public static void main(String[] args) {
		// testadd();
		// testdelete();
		testupdate();
	}

	public static void testadd() {

		CourseBean bean = new CourseBean();

		bean.setName("quaid");
		bean.setDescription("java full stack");
		bean.setDuration("6 months");
		bean.setCreatedBy("abcd");
		bean.setModifiedBy("xyz");
		bean.setCreatedDatetime(new Timestamp(new Date().getTime()));
		bean.setModifiedDatetime(new Timestamp(new Date().getTime()));

		CourseModel model = new CourseModel();

		model.add(bean);

	}

	public static void testdelete() {
		CourseModel model = new CourseModel();

		model.delete(2);
	}

	public static void testupdate() {
		CourseBean bean = new CourseBean();
		CourseModel model = new CourseModel();
		
		bean.setId(1);
		bean.setName("Java FullStack");
		bean.setDescription("Affordable course");
		bean.setDuration("6 months");
		bean.setCreatedBy("ABCD");
		bean.setModifiedBy("XYZ");
		bean.setModifiedDatetime(new Timestamp(new Date().getTime()));
		
		model.update(bean);
		

		
	}
}
