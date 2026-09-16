<%@page import="in.co.rays.proj4.controller.UserRegistrationCtl"%>
<%@page import="in.co.rays.proj4.controller.LoginCtl"%>
<%@page import="in.co.rays.proj4.util.ServletUtility"%>
<%@page import="in.co.rays.proj4.controller.BaseCtl"%>
<%@page import="in.co.rays.proj4.controller.ORSView"%>

<!DOCTYPE html>

<html>

<head>

<meta charset="ISO-8859-1">

<title>Add User</title>

</head>

<body>

	<%@ include file="Header.jsp"%>


	<%
	String _suc = ServletUtility.getSuccessMessage(request);

	String _err = ServletUtility.getErrorMessage(request);
	%>


	<form action="<%=ORSView.USER_CTL%>" method="post">


		<div class="container">

			<div class="row justify-content-center mt-4">

				<div class="col-md-6">

					<div class="card shadow">


						<!-- Header -->

						<div class="card-header text-center">

							<h2>Add User</h2>

						</div>


						<div class="card-body">


							<!-- Success -->

							<h5 class="text-success text-center">

								<%=_suc%>

							</h5>


							<!-- Error -->

							<h5 class="text-danger text-center">

								<%=_err%>

							</h5>


							<!-- First Name -->

							<div class="mb-3">

								<label class="form-label"> First Name <span
									class="text-danger">*</span>

								</label> <input type="text" name="firstName" value=""
									placeholder="Enter your firstName" class="form-control">


								<div class="text-danger">

									<%=ServletUtility.getErrorMessage("firstName", request)%>

								</div>

							</div>


							<!-- Last Name -->

							<div class="mb-3">

								<label class="form-label"> Last Name <span
									class="text-danger">*</span>

								</label> <input type="text" name="lastName" value=""
									placeholder="Enter your lastName" class="form-control">


								<div class="text-danger">

									<%=ServletUtility.getErrorMessage("lastName", request)%>

								</div>

							</div>


							<!-- Login -->

							<div class="mb-3">

								<label class="form-label"> Login <span
									class="text-danger">*</span>

								</label> <input type="text" name="login" value=""
									placeholder="Enter an email" class="form-control">


								<div class="text-danger">

									<%=ServletUtility.getErrorMessage("login", request)%>

								</div>

							</div>


							<!-- Password -->

							<div class="mb-3">

								<label class="form-label"> Password <span
									class="text-danger">*</span>

								</label> <input type="password" name="password" value=""
									placeholder="Enter your password" class="form-control">


								<div class="text-danger">

									<%=ServletUtility.getErrorMessage("password", request)%>

								</div>

							</div>


							<!-- Confirm Password -->

							<div class="mb-3">

								<label class="form-label"> Confirm Password <span
									class="text-danger">*</span>

								</label> <input type="password" name="confirmPassword" value=""
									placeholder="Re-enter your password" class="form-control">


								<div class="text-danger">

									<%=ServletUtility.getErrorMessage("confirmPassword", request)%>

								</div>

							</div>


							<!-- Role -->

							<div class="mb-3">

								<label class="form-label"> Role <span
									class="text-danger">*</span>

								</label> <select class="form-select" name="roleId">


									<option selected value="">Select</option>


									<option value="1">Admin</option>


									<option value="2">Student</option>


									<option value="3">College</option>


									<option value="4">KIOSK</option>


								</select>


								<div class="text-danger">

									<%=ServletUtility.getErrorMessage("roleId", request)%>

								</div>

							</div>


							<!-- Gender -->

							<div class="mb-3">

								<label class="form-label"> Gender <span
									class="text-danger">*</span>

								</label> <select class="form-select" name="gender">


									<option selected value="">Select</option>


									<option value="female">female</option>


									<option value="male">male</option>


								</select>


								<div class="text-danger">

									<%=ServletUtility.getErrorMessage("gender", request)%>

								</div>

							</div>


							<!-- DOB -->

							<div class="mb-3">

								<label class="form-label"> DOB <span class="text-danger">*</span>

								</label> <input type="date" name="dob" value="" class="form-control">


								<div class="text-danger">

									<%=ServletUtility.getErrorMessage("dob", request)%>

								</div>

							</div>


							<!-- Sign Up -->

							<div class="text-center">

								<input type="submit" name="operation"
									value="<%=UserRegistrationCtl.OP_SIGN_UP%>"
									class="btn btn-primary">

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