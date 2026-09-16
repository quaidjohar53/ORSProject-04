<%@page import="in.co.rays.proj4.controller.UserRegistrationCtl"%>
<%@page import="in.co.rays.proj4.util.ServletUtility"%>
<%@page import="in.co.rays.proj4.controller.BaseCtl"%>
<%@page import="in.co.rays.proj4.controller.ORSView"%>

<!DOCTYPE html>

<html>

<head>

<meta charset="ISO-8859-1">

<title>Registration</title>

</head>

<body>

	<%@ include file="Header.jsp"%>

	<%
	String _suc = ServletUtility.getSuccessMessage(request);
	String _err = ServletUtility.getErrorMessage(request);
	%>


	<form action="<%=ORSView.USER_REGISTRATION_CTL%>" method="post">


		<div class="container py-5">

			<div class="row justify-content-center">

				<div class="col-lg-7 col-md-9">


					<!-- Registration Card -->

					<div class="card shadow-lg border-0">


						<!-- Card Header -->

						<div class="card-header text-center bg-dark text-white py-4">

							<h2 class="mb-1">Create Your Account</h2>

							<p class="mb-0">Registration</p>

						</div>


						<div class="card-body p-4 p-md-5">


							<!-- Messages -->

							<%
							if (_suc != null && !_suc.trim().isEmpty()) {
							%>

							<div class="alert alert-success text-center">

								<%=_suc%>

							</div>

							<%
							}
							%>


							<%
							if (_err != null && !_err.trim().isEmpty()) {
							%>

							<div class="alert alert-danger text-center">

								<%=_err%>

							</div>

							<%
							}
							%>


							<!-- First Name -->

							<div class="mb-3">

								<label class="form-label fw-bold"> First Name <span
									class="text-danger">*</span>

								</label> <input type="text" name="firstName" value=""
									placeholder="Enter your first name"
									class="form-control form-control-lg">


								<div class="text-danger mt-1">

									<%=ServletUtility.getErrorMessage("firstName", request)%>

								</div>

							</div>


							<!-- Last Name -->

							<div class="mb-3">

								<label class="form-label fw-bold"> Last Name <span
									class="text-danger">*</span>

								</label> <input type="text" name="lastName" value=""
									placeholder="Enter your last name"
									class="form-control form-control-lg">


								<div class="text-danger mt-1">

									<%=ServletUtility.getErrorMessage("lastName", request)%>

								</div>

							</div>


							<!-- Login -->

							<div class="mb-3">

								<label class="form-label fw-bold"> Login <span
									class="text-danger">*</span>

								</label> <input type="text" name="login" value=""
									placeholder="Enter an email"
									class="form-control form-control-lg">


								<div class="text-danger mt-1">

									<%=ServletUtility.getErrorMessage("login", request)%>

								</div>

							</div>


							<!-- Password -->

							<div class="mb-3">

								<label class="form-label fw-bold"> Password <span
									class="text-danger">*</span>

								</label> <input type="password" name="password" value=""
									placeholder="Enter a password"
									class="form-control form-control-lg">


								<div class="text-danger mt-1">

									<%=ServletUtility.getErrorMessage("password", request)%>

								</div>

							</div>


							<!-- Confirm Password -->

							<div class="mb-3">

								<label class="form-label fw-bold"> Confirm Password <span
									class="text-danger">*</span>

								</label> <input type="password" name="confirmPassword" value=""
									placeholder="Re-enter your password"
									class="form-control form-control-lg">


								<div class="text-danger mt-1">

									<%=ServletUtility.getErrorMessage("confirmPassword", request)%>

								</div>

							</div>


							<!-- Gender -->

							<div class="mb-3">

								<label class="form-label fw-bold"> Gender <span
									class="text-danger">*</span>

								</label> <select class="form-select form-select-lg" name="gender">


									<option selected value="">Select</option>


									<option value="female">female</option>


									<option value="male">male</option>


								</select>


								<div class="text-danger mt-1">

									<%=ServletUtility.getErrorMessage("gender", request)%>

								</div>

							</div>


							<!-- DOB -->

							<div class="mb-4">

								<label class="form-label fw-bold"> DOB <span
									class="text-danger">*</span>

								</label> <input type="date" name="dob" value=""
									class="form-control form-control-lg">


								<div class="text-danger mt-1">

									<%=ServletUtility.getErrorMessage("dob", request)%>

								</div>

							</div>


							<!-- Sign Up -->

							<div class="d-grid">

								<input type="submit" name="operation"
									value="<%=UserRegistrationCtl.OP_SIGN_UP%>"
									class="btn btn-primary btn-lg">

							</div>


						</div>


						<!-- Card Footer -->

						<div class="card-footer text-center text-muted">

							Already have an account? <a href="<%=ORSView.LOGIN_CTL%>"
								class="text-decoration-none"> Login </a>

						</div>


					</div>

				</div>

			</div>

		</div>


	</form>


	<%@ include file="Footer.jsp"%>

</body>

</html>