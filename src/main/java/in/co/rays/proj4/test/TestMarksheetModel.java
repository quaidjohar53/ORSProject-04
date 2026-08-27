package in.co.rays.proj4.test;

import java.sql.Timestamp;
import java.util.Date;

import in.co.rays.proj4.bean.MarksheetBean;
import in.co.rays.proj4.model.MarksheetModel;

public class TestMarksheetModel {

	public static void main(String[] args) {
		//testadd();
		
		//testdelete();
		
		testupdate();
		
	}

	public static void testadd() {
		MarksheetBean bean = new MarksheetBean();

		bean.setRollNo(1);
		bean.setStudentId(258);
		bean.setName("quaid");
		bean.setPhysics(58);
		bean.setChemistry(78);
		bean.setMaths(95);
		bean.setCreatedBy("abcd");
		bean.setModifiedBy("fghi");
		bean.setCreatedDatetime(new Timestamp(new Date().getTime()));
		bean.setModifiedDatetime(new Timestamp(new Date().getTime()));

		MarksheetModel model = new MarksheetModel();

		model.add(bean);

	}
	
	public static void testdelete() {
		
		MarksheetModel model = new MarksheetModel ();
		
		model.delete(1);
	}
	
	public static void testupdate() {
		MarksheetBean bean = new MarksheetBean();
		MarksheetModel model = new MarksheetModel();
		
		bean.setId(1);
		bean.setRollNo(10);
		bean.setStudentId(1);
		bean.setName("Quaid");
		bean.setPhysics(89);
		bean.setChemistry(87);
		bean.setMaths(91);
		bean.setModifiedBy("XYZ");
		bean.setModifiedDatetime(new Timestamp(new Date().getTime()));
		
		model.update(bean);
		
	}

}
