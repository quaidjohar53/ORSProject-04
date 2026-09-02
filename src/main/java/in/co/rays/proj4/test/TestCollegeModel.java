package in.co.rays.proj4.test;

import java.sql.Timestamp;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import in.co.rays.proj4.bean.CollegeBean;
import in.co.rays.proj4.model.CollegeModel;

public class TestCollegeModel {

	public static void main(String[] args) {
		// testadd();
		// testdelete();
		// testupdate();
		testsearch();
	}

	public static void testadd() {

		CollegeBean bean = new CollegeBean();

		bean.setName("Vikram University");
		bean.setAddress("Dewas road");
		bean.setState("Madhya pradeh");
		bean.setCity("Ujjain");
		bean.setPhoneNo("8954412665");
		bean.setCreatedBy("ABCD");
		bean.setModifiedBy("xyz");
		bean.setCreatedDatetime(new Timestamp(new Date().getTime()));
		bean.setModifiedDatetime(new Timestamp(new Date().getTime()));

		CollegeModel model = new CollegeModel();

		model.add(bean);

	}

	public static void testdelete() {
		CollegeModel model = new CollegeModel();

		model.delete(1);

	}

	public static void testupdate() {

		CollegeBean bean = new CollegeBean();
		CollegeModel model = new CollegeModel();

		bean.setId(1);
		bean.setName("Vikram University");
		bean.setAddress("Dewas road");
		bean.setState("Madhya Pradesh");
		bean.setCity("Ujjain");
		bean.setPhoneNo("9000010000");
		bean.setModifiedBy("abcd");
		bean.setModifiedDatetime(new Timestamp(new Date().getTime()));

		model.update(bean);

	}

	public static void testsearch() {

		CollegeModel model = new CollegeModel();
		CollegeBean bean = new CollegeBean();
		
		bean.setName("Vikram University");
		

		List<CollegeBean> list = model.search(bean, 1, 5);

		Iterator<CollegeBean> it = list.iterator();

		while (it.hasNext()) {
			bean = it.next();

			System.out.println(bean.getId());
			System.out.println(bean.getName());
			System.out.println(bean.getCity());
			System.out.println(bean.getAddress());
			System.out.println(bean.getPhoneNo());

			System.out.println("-------------------");

		}

	}
}
