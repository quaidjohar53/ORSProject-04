package in.co.rays.proj4.test;

import java.sql.Timestamp;
import java.util.Date;

import in.co.rays.proj4.bean.SubjectBean;
import in.co.rays.proj4.model.SubjectModel;

public class TestSubjectModel {
	
	public static void main(String[] args) {
		testadd();
	}

	public static void testadd() {
		
		SubjectBean bean = new SubjectBean();
		
		bean.setName("quaid");
		bean.setDescription("CS");
		bean.setCourseId(1001);
		bean.setCreatedBy("abcd");
		bean.setModifiedBy("xyz");
		bean.setCreatedDatetime(new Timestamp(new Date().getTime()));
		bean.setModifiedDatetime(new Timestamp(new Date().getTime()));
		
		SubjectModel model = new SubjectModel();
		
		model.add(bean);
		
		
	}
}
