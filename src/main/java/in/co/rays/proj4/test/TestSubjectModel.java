package in.co.rays.proj4.test;

import java.sql.Timestamp;
import java.util.Date;

import in.co.rays.proj4.bean.SubjectBean;
import in.co.rays.proj4.model.SubjectModel;

public class TestSubjectModel {

	public static void main(String[] args) {
		// testadd();
		// testdelete();
		testupdate();
	}

	public static void testadd() {

		SubjectBean bean = new SubjectBean();

		bean.setName("CS");
		bean.setDescription("Hard");
		bean.setCourseId(1001);
		bean.setCreatedBy("abcd");
		bean.setModifiedBy("xyz");
		bean.setCreatedDatetime(new Timestamp(new Date().getTime()));
		bean.setModifiedDatetime(new Timestamp(new Date().getTime()));

		SubjectModel model = new SubjectModel();

		model.add(bean);

	}

	public static void testdelete() {

		SubjectModel model = new SubjectModel();

		model.delete(1);
	}

	public static void testupdate() {
		SubjectBean bean = new SubjectBean();
		SubjectModel model = new SubjectModel();

		bean.setId(1);
		bean.setName("Java FullStack");
		bean.setDescription("Hard");
		bean.setCourseId(1);
		bean.setModifiedBy("xyz");
		bean.setCreatedBy("ABC");
		bean.setCreatedDatetime(new Timestamp(new Date().getTime()));
		bean.setModifiedDatetime(new Timestamp(new Date().getTime()));

		model.update(bean);

	}
}
