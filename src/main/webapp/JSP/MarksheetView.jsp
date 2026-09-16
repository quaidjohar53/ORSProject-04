<%@page import="in.co.rays.proj4.util.ServletUtility"%>
<%@page import="in.co.rays.proj4.controller.BaseCtl"%>
<%@page import="in.co.rays.proj4.controller.ORSView"%>
<%@page import="in.co.rays.proj4.bean.MarksheetBean"%>
<%@page import="in.co.rays.proj4.bean.StudentBean"%>
<%@page import="java.util.List"%>

<!DOCTYPE html>

<html>

<head>

<meta charset="ISO-8859-1">

<title>Add Marksheet</title>

</head>

<body>

	<%@ include file="Header.jsp"%>

	<%
	MarksheetBean bean = (MarksheetBean) request.getAttribute("bean");

	List<StudentBean> studentList = (List<StudentBean>) request.getAttribute("studentList");

	String _suc = ServletUtility.getSuccessMessage(request);

	String _err = ServletUtility.getErrorMessage(request);
	%>


	<form action="<%=ORSView.MARKSHEET_CTL%>" method="post">


		<div class="container">

			<div class="row justify-content-center mt-4">

				<div class="col-md-6">

					<div class="card shadow">


						<div class="card-header text-center">

							<h2>Add Marksheet</h2>

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


							<!-- Roll No -->

							<div class="mb-3">

								<label class="form-label"> Roll No <span
									class="text-danger">*</span>

								</label> <input type="text" name="rollNo"
									value="<%=bean != null ? bean.getRollNo() : ""%>"
									placeholder="Enter roll no" class="form-control">


								<div class="text-danger">

									<%=ServletUtility.getErrorMessage("rollNo", request)%>

								</div>

							</div>


							<!-- Student -->

							<div class="mb-3">

								<label class="form-label"> Student <span
									class="text-danger">*</span>

								</label> <select name="studentId" class="form-select">


									<option value="">Select Student</option>


									<%
									if (studentList != null) {

										for (StudentBean student : studentList) {
									%>


									<option value="<%=student.getId()%>">

										<%=student.getFirstName()%>
										<%=student.getLastName()%>

									</option>


									<%
									}
									}
									%>


								</select>


								<div class="text-danger">

									<%=ServletUtility.getErrorMessage("studentId", request)%>

								</div>

							</div>


							<!-- Physics -->

							<div class="mb-3">

								<label class="form-label"> Physics <span
									class="text-danger">*</span>

								</label> <input type="text" name="physics"
									value="<%=bean != null ? bean.getPhysics() : ""%>"
									placeholder="Enter physics marks" class="form-control">


								<div class="text-danger">

									<%=ServletUtility.getErrorMessage("physics", request)%>

								</div>

							</div>


							<!-- Chemistry -->

							<div class="mb-3">

								<label class="form-label"> Chemistry <span
									class="text-danger">*</span>

								</label> <input type="text" name="chemistry"
									value="<%=bean != null ? bean.getChemistry() : ""%>"
									placeholder="Enter chemistry marks" class="form-control">


								<div class="text-danger">

									<%=ServletUtility.getErrorMessage("chemistry", request)%>

								</div>

							</div>


							<!-- Maths -->

							<div class="mb-3">

								<label class="form-label"> Maths <span
									class="text-danger">*</span>

								</label> <input type="text" name="maths"
									value="<%=bean != null ? bean.getMaths() : ""%>"
									placeholder="Enter maths marks" class="form-control">


								<div class="text-danger">

									<%=ServletUtility.getErrorMessage("maths", request)%>

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