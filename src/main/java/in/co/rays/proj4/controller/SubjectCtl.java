package in.co.rays.proj4.controller;

import java.util.List;

import in.co.rays.proj4.bean.CourseBean;
import in.co.rays.proj4.bean.SubjectBean;
import in.co.rays.proj4.model.CourseModel;
import in.co.rays.proj4.model.SubjectModel;
import in.co.rays.proj4.util.DataUtility;
import in.co.rays.proj4.util.DataValidator;
import in.co.rays.proj4.util.PropertyReader;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServletRequest;

@WebServlet("/ctl/SubjectCtl")
public class SubjectCtl extends BaseCtl<SubjectBean, SubjectModel> {

	@Override
	protected void preload(HttpServletRequest request) {

		CourseModel cmodel = new CourseModel();

		List<CourseBean> courseList = cmodel.list();

		request.setAttribute("courseList", courseList);
	}

	@Override
	protected boolean validate(HttpServletRequest request) {

		boolean pass = true;

		if (DataValidator.isNull(request.getParameter("name"))) {

			request.setAttribute("name", PropertyReader.getValue("error.require", "Subject Name"));

			pass = false;
		}

		if (DataValidator.isNull(request.getParameter("courseId"))) {

			request.setAttribute("courseId", PropertyReader.getValue("error.require", "Course"));

			pass = false;
		}

		if (DataValidator.isNull(request.getParameter("description"))) {

			request.setAttribute("description", PropertyReader.getValue("error.require", "Description"));

			pass = false;
		}

		return pass;
	}

	@Override
	protected SubjectBean populateBean(HttpServletRequest request) {

		SubjectBean bean = new SubjectBean();

		bean.setId(DataUtility.getLong(request.getParameter("id")));

		bean.setName(DataUtility.getString(request.getParameter("name")));

		bean.setCourseId(DataUtility.getLong(request.getParameter("courseId")));

		bean.setDescription(DataUtility.getString(request.getParameter("description")));

		populateDTO(bean, request);

		return bean;
	}

	@Override
	protected String getView() {

		return ORSView.SUBJECT_VIEW;
	}

	@Override
	protected SubjectModel getModel() {

		return new SubjectModel();
	}
}