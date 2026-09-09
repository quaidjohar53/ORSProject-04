package in.co.rays.proj4.controller;

import java.util.List;

import in.co.rays.proj4.bean.CollegeBean;
import in.co.rays.proj4.bean.FacultyBean;
import in.co.rays.proj4.model.CollegeModel;
import in.co.rays.proj4.model.FacultyModel;
import in.co.rays.proj4.util.DataUtility;
import in.co.rays.proj4.util.DataValidator;
import in.co.rays.proj4.util.PropertyReader;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServletRequest;

@WebServlet("/ctl/FacultyCtl")
public class FacultyCtl
		extends BaseCtl<FacultyBean, FacultyModel> {

	@Override
	protected void preload(HttpServletRequest request) {

		CollegeModel cmodel = new CollegeModel();

		List<CollegeBean> collegeList =
				cmodel.list();

		request.setAttribute(
				"collegeList",
				collegeList);
	}

	@Override
	protected boolean validate(
			HttpServletRequest request) {

		boolean pass = true;

		String email =
				request.getParameter("email");

		String dob =
				request.getParameter("dateOfBirth");


		if (DataValidator.isNull(
				request.getParameter("firstName"))) {

			request.setAttribute(
					"firstName",
					PropertyReader.getValue(
							"error.require",
							"First Name"));

			pass = false;
		}


		if (DataValidator.isNull(
				request.getParameter("lastName"))) {

			request.setAttribute(
					"lastName",
					PropertyReader.getValue(
							"error.require",
							"Last Name"));

			pass = false;
		}


		if (DataValidator.isNull(
				request.getParameter("mobileNo"))) {

			request.setAttribute(
					"mobileNo",
					PropertyReader.getValue(
							"error.require",
							"Mobile No"));

			pass = false;
		}


		if (DataValidator.isNull(email)) {

			request.setAttribute(
					"email",
					PropertyReader.getValue(
							"error.require",
							"Email"));

			pass = false;

		} else if (!DataValidator.isEmail(email)) {

			request.setAttribute(
					"email",
					PropertyReader.getValue(
							"error.email",
							"Email"));

			pass = false;
		}


		if (DataValidator.isNull(
				request.getParameter("collegeId"))) {

			request.setAttribute(
					"collegeId",
					PropertyReader.getValue(
							"error.require",
							"College Name"));

			pass = false;
		}


		if (DataValidator.isNull(dob)) {

			request.setAttribute(
					"dateOfBirth",
					PropertyReader.getValue(
							"error.require",
							"Date Of Birth"));

			pass = false;

		} else if (!DataValidator.isDate(dob)) {

			request.setAttribute(
					"dateOfBirth",
					PropertyReader.getValue(
							"error.date",
							"Date Of Birth"));

			pass = false;
		}

		return pass;
	}

	@Override
	protected FacultyBean populateBean(
			HttpServletRequest request) {

		FacultyBean bean = new FacultyBean();

		bean.setId(
				DataUtility.getLong(
						request.getParameter("id")));

		bean.setFirstName(
				DataUtility.getString(
						request.getParameter("firstName")));

		bean.setLastName(
				DataUtility.getString(
						request.getParameter("lastName")));

		bean.setDob(
				DataUtility.getDate(
						request.getParameter("dateOfBirth")));

		bean.setMobileNo(
				DataUtility.getString(
						request.getParameter("mobileNo")));

		bean.setEmail(
				DataUtility.getString(
						request.getParameter("email")));

		bean.setAddress(
				DataUtility.getString(
						request.getParameter("address")));

		bean.setGender(
				DataUtility.getString(
						request.getParameter("gender")));

		bean.setCollegeId(
				DataUtility.getLong(
						request.getParameter("collegeId")));

		populateDTO(bean, request);

		return bean;
	}

	@Override
	protected String getView() {
		return ORSView.FACULTY_VIEW;
	}

	@Override
	protected FacultyModel getModel() {
		return new FacultyModel();
	}
}