package in.co.rays.proj4.test;

import java.sql.Timestamp;
import java.util.Date;

import in.co.rays.proj4.bean.MarksheetBean;
import in.co.rays.proj4.model.MarksheetModel;

public class TestMarksheetModel {

	public static void main(String[] args) {
		testadd();
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

}
