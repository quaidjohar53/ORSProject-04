package in.co.rays.proj4.test;

import java.sql.Timestamp;
import java.util.Date;

import in.co.rays.proj4.bean.CourseBean;
import in.co.rays.proj4.model.CourseModel;

public class TestCourseModel {

	public static void main(String[] args) {
		testadd();
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

}
