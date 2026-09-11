package in.co.rays.proj4.controller;

import java.util.List;

import in.co.rays.proj4.bean.MarksheetBean;
import in.co.rays.proj4.bean.StudentBean;
import in.co.rays.proj4.model.MarksheetModel;
import in.co.rays.proj4.model.StudentModel;
import in.co.rays.proj4.util.DataUtility;
import in.co.rays.proj4.util.DataValidator;
import in.co.rays.proj4.util.PropertyReader;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServletRequest;

@WebServlet("/ctl/MarksheetCtl")
public class MarksheetCtl extends BaseCtl<MarksheetBean, MarksheetModel> {

	@Override
	protected void preload(HttpServletRequest request) {

		StudentModel smodel = new StudentModel();

		List<StudentBean> studentList = smodel.list();

		request.setAttribute("studentList", studentList);
	}

	@Override
	protected boolean validate(HttpServletRequest request) {

		boolean pass = true;

		if (DataValidator.isNull(request.getParameter("rollNo"))) {

			request.setAttribute("rollNo", PropertyReader.getValue("error.require", "Roll No"));

			pass = false;
		}

		if (DataValidator.isNull(request.getParameter("studentId"))) {

			request.setAttribute("studentId", PropertyReader.getValue("error.require", "Student"));

			pass = false;
		}

		if (DataValidator.isNull(request.getParameter("physics"))) {

			request.setAttribute("physics", PropertyReader.getValue("error.require", "Physics"));

			pass = false;
		}

		if (DataValidator.isNull(request.getParameter("chemistry"))) {

			request.setAttribute("chemistry", PropertyReader.getValue("error.require", "Chemistry"));

			pass = false;
		}

		if (DataValidator.isNull(request.getParameter("maths"))) {

			request.setAttribute("maths", PropertyReader.getValue("error.require", "Maths"));

			pass = false;
		}

		return pass;
	}

	@Override
	protected MarksheetBean populateBean(HttpServletRequest request) {

		MarksheetBean bean = new MarksheetBean();

		bean.setId(DataUtility.getLong(request.getParameter("id")));

		bean.setRollNo(DataUtility.getString(request.getParameter("rollNo")));

		bean.setStudentId(DataUtility.getLong(request.getParameter("studentId")));

		bean.setPhysics(DataUtility.getInt(request.getParameter("physics")));

		bean.setChemistry(DataUtility.getInt(request.getParameter("chemistry")));

		bean.setMaths(DataUtility.getInt(request.getParameter("maths")));

		populateDTO(bean, request);

		return bean;
	}

	@Override
	protected String getView() {

		return ORSView.MARKSHEET_VIEW;
	}

	@Override
	protected MarksheetModel getModel() {

		return new MarksheetModel();
	}
}