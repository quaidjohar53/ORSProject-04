<%@page import="in.co.rays.proj4.util.ServletUtility"%>
<%@page import="in.co.rays.proj4.controller.BaseCtl"%>
<%@page import="in.co.rays.proj4.controller.ORSView"%>
<%@page import="in.co.rays.proj4.bean.SubjectBean"%>
<%@page import="in.co.rays.proj4.bean.CourseBean"%>
<%@page import="java.util.List"%>

<!DOCTYPE html>

<html>

<head>

<meta charset="ISO-8859-1">

<title>Add Subject</title>

</head>

<body>

	<%@ include file="Header.jsp"%>


	<%
	SubjectBean bean = (SubjectBean) request.getAttribute("bean");

	List<CourseBean> courseList = (List<CourseBean>) request.getAttribute("courseList");

	String _suc = ServletUtility.getSuccessMessage(request);

	String _err = ServletUtility.getErrorMessage(request);
	%>


	<form action="<%=ORSView.SUBJECT_CTL%>" method="post">


		<div class="container">

			<div class="row justify-content-center mt-4">

				<div class="col-md-6">

					<div class="card shadow">


						<!-- Card Header -->

						<div class="card-header text-center">

							<h2>Add Subject</h2>

						</div>


						<div class="card-body">


							<!-- Success Message -->

							<h5 class="text-success text-center">

								<%=_suc%>

							</h5>


							<!-- Error Message -->

							<h5 class="text-danger text-center">

								<%=_err%>

							</h5>


							<!-- Subject Name -->

							<div class="mb-3">

								<label class="form-label"> Name <span
									class="text-danger">*</span>

								</label> <input type="text" name="name"
									value="<%=bean != null ? bean.getName() : ""%>"
									placeholder="Enter subject name" class="form-control">


								<div class="text-danger">

									<%=ServletUtility.getErrorMessage("name", request)%>

								</div>

							</div>


							<!-- Course -->

							<div class="mb-3">

								<label class="form-label"> Course <span
									class="text-danger">*</span>

								</label> <select name="courseId" class="form-select">


									<option value="">Select Course</option>


									<%
									if (courseList != null) {

										for (CourseBean course : courseList) {
									%>


									<option value="<%=course.getId()%>"
										<%=bean != null && bean.getCourseId() == course.getId() ? "selected" : ""%>>

										<%=course.getName()%>

									</option>


									<%
									}
									}
									%>


								</select>


								<div class="text-danger">

									<%=ServletUtility.getErrorMessage("courseId", request)%>

								</div>

							</div>


							<!-- Description -->

							<div class="mb-3">

								<label class="form-label"> Description <span
									class="text-danger">*</span>

								</label> <input type="text" name="description"
									value="<%=bean != null ? bean.getDescription() : ""%>"
									placeholder="Enter subject description" class="form-control">


								<div class="text-danger">

									<%=ServletUtility.getErrorMessage("description", request)%>

								</div>

							</div>


							<!-- Save -->

							<div class="text-center">

								<input type="submit" name="operation"
									value="<%=BaseCtl.OP_SAVE%>" class="btn btn-primary">

							</div>


						</div>

					</div>

				</div>

			</div>

		</div>


	</form>


	<%@ include file="Footer.jsp"%>

</body>

</html>