<%@page import="in.co.rays.proj4.util.ServletUtility"%>
<%@page import="in.co.rays.proj4.controller.BaseCtl"%>
<%@page import="in.co.rays.proj4.controller.ORSView"%>
<%@page import="in.co.rays.proj4.bean.StudentBean"%>
<%@page import="in.co.rays.proj4.bean.CollegeBean"%>
<%@page import="java.util.List"%>

<!DOCTYPE html>

<html>

<head>

<meta charset="ISO-8859-1">

<title>Add Student</title>

</head>

<body>

	<%@ include file="Header.jsp"%>

	<%
	String _suc = ServletUtility.getSuccessMessage(request);
	String _err = ServletUtility.getErrorMessage(request);

	StudentBean bean = (StudentBean) request.getAttribute("bean");

	List<CollegeBean> collegeList = (List<CollegeBean>) request.getAttribute("collegeList");
	%>


	<form action="<%=ORSView.STUDENT_CTL%>" method="post">


		<div class="container">

			<div class="row justify-content-center mt-4">

				<div class="col-md-6">

					<div class="card shadow">


						<div class="card-header text-center">

							<h2>Add Student</h2>

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


							<!-- First Name -->

							<div class="mb-3">

								<label class="form-label"> First Name <span
									class="text-danger">*</span>

								</label> <input type="text" name="firstName"
									value="<%=bean != null ? bean.getFirstName() : ""%>"
									placeholder="Enter first name" class="form-control">


								<div class="text-danger">

									<%=ServletUtility.getErrorMessage("firstName", request)%>

								</div>

							</div>


							<!-- Last Name -->

							<div class="mb-3">

								<label class="form-label"> Last Name <span
									class="text-danger">*</span>

								</label> <input type="text" name="lastName"
									value="<%=bean != null ? bean.getLastName() : ""%>"
									placeholder="Enter last name" class="form-control">


								<div class="text-danger">

									<%=ServletUtility.getErrorMessage("lastName", request)%>

								</div>

							</div>


							<!-- Date of Birth -->

							<div class="mb-3">

								<label class="form-label"> Date of Birth <span
									class="text-danger">*</span>

								</label> <input type="text" name="dob"
									value="<%=bean != null ? bean.getDob() : ""%>"
									placeholder="Enter date of birth" class="form-control">


								<div class="text-danger">

									<%=ServletUtility.getErrorMessage("dob", request)%>

								</div>

							</div>


							<!-- Mobile Number -->

							<div class="mb-3">

								<label class="form-label"> Mobile No <span
									class="text-danger">*</span>

								</label> <input type="text" name="mobileNo"
									value="<%=bean != null ? bean.getMobileNo() : ""%>"
									placeholder="Enter mobile number" class="form-control">


								<div class="text-danger">

									<%=ServletUtility.getErrorMessage("mobileNo", request)%>

								</div>

							</div>


							<!-- Email -->

							<div class="mb-3">

								<label class="form-label"> Email <span
									class="text-danger">*</span>

								</label> <input type="text" name="email"
									value="<%=bean != null ? bean.getEmail() : ""%>"
									placeholder="Enter email" class="form-control">


								<div class="text-danger">

									<%=ServletUtility.getErrorMessage("email", request)%>

								</div>

							</div>


							<!-- College -->

							<div class="mb-3">

								<label class="form-label"> College <span
									class="text-danger">*</span>

								</label> <select name="collegeId" class="form-select">


									<option value="">Select College</option>


									<%
									if (collegeList != null) {

										for (CollegeBean college : collegeList) {
									%>


									<option value="<%=college.getId()%>">

										<%=college.getName()%>

									</option>


									<%
									}
									}
									%>


								</select>


								<div class="text-danger">

									<%=ServletUtility.getErrorMessage("collegeId", request)%>

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