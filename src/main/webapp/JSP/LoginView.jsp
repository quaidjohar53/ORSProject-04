<%@page import="in.co.rays.proj4.controller.LoginCtl"%>
<%@page import="in.co.rays.proj4.util.ServletUtility"%>
<%@page import="in.co.rays.proj4.controller.BaseCtl"%>
<%@page import="in.co.rays.proj4.controller.ORSView"%>

<!DOCTYPE html>

<html>

<head>

<meta charset="ISO-8859-1">

<title>Login</title>

</head>

<body>

	<%@include file="Header.jsp"%>

	<%
	String _suc = ServletUtility.getSuccessMessage(request);
	String _err = ServletUtility.getErrorMessage(request);
	%>

	<form action="<%=ORSView.LOGIN_CTL%>" method="post">

		<div class="container">

			<div class="row justify-content-center mt-5">

				<div class="col-md-5">

					<div class="card">

						<div class="card-header text-center">
							<h3>Login</h3>
						</div>

						<div class="card-body">

							<h5 class="text-success text-center"><%=_suc%></h5>

							<h5 class="text-danger text-center"><%=_err%></h5>


							<!-- Login -->
							<div class="mb-3">

								<label class="form-label">
									Login <font color="red">*</font>
								</label>

								<input type="text"
									name="login"
									value=""
									placeholder="Enter your login"
									class="form-control">

								<div class="text-danger">
									<%=ServletUtility.getErrorMessage("login", request)%>
								</div>

							</div>


							<!-- Password -->
							<div class="mb-3">

								<label class="form-label">
									Password <font color="red">*</font>
								</label>

								<input type="password"
									name="password"
									value=""
									placeholder="Enter your password"
									class="form-control">

								<div class="text-danger">
									<%=ServletUtility.getErrorMessage("password", request)%>
								</div>

							</div>


							<!-- Sign In Button -->
							<div class="text-center">

								<input type="submit"
									name="operation"
									value="<%=LoginCtl.OP_SIGN_IN%>"
									class="btn btn-primary">

							</div>

						</div>

					</div>

				</div>

			</div>

		</div>

	</form>

	<%@include file="Footer.jsp"%>

</body>

</html>