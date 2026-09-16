<%@page import="in.co.rays.proj4.util.ServletUtility"%>
<%@page import="in.co.rays.proj4.controller.BaseCtl"%>
<%@page import="in.co.rays.proj4.controller.ORSView"%>
<%@page import="in.co.rays.proj4.bean.CourseBean"%>

<!DOCTYPE html>

<html>

<head>

<meta charset="ISO-8859-1">

<title>Add Course</title>

</head>

<body>

	<%@ include file="Header.jsp"%>

	<%
	String _suc = ServletUtility.getSuccessMessage(request);
	String _err = ServletUtility.getErrorMessage(request);

	CourseBean bean = (CourseBean) request.getAttribute("bean");
	%>


	<form action="<%=ORSView.COURSE_CTL%>" method="post">

		<div class="container">

			<div class="row justify-content-center mt-4">

				<div class="col-md-6">

					<div class="card shadow">

						<div class="card-header text-center">

							<h2>Add Course</h2>

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


							<!-- Name -->

							<div class="mb-3">

								<label class="form-label"> Name <span
									class="text-danger">*</span>

								</label> <input type="text" name="name"
									value="<%=bean != null ? bean.getName() : ""%>"
									placeholder="Enter course name" class="form-control">


								<div class="text-danger">

									<%=ServletUtility.getErrorMessage("name", request)%>

								</div>

							</div>


							<!-- Duration -->

							<div class="mb-3">

								<label class="form-label"> Duration <span
									class="text-danger">*</span>

								</label> <input type="text" name="duration"
									value="<%=bean != null ? bean.getDuration() : ""%>"
									placeholder="Enter duration" class="form-control">


								<div class="text-danger">

									<%=ServletUtility.getErrorMessage("duration", request)%>

								</div>

							</div>


							<!-- Description -->

							<div class="mb-3">

								<label class="form-label"> Description <span
									class="text-danger">*</span>

								</label>


								<textarea name="description"
									placeholder="Enter course description" class="form-control"
									rows="4"><%=bean != null ? bean.getDescription() : ""%></textarea>


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