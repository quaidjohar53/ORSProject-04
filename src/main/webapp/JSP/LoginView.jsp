<%@page import="in.co.rays.proj4.util.DataUtility"%>

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

	<jsp:useBean id="bean" class="in.co.rays.proj4.bean.UserBean"
		scope="request"></jsp:useBean>

	<%@ include file="Header.jsp"%>

	<%
	String _suc = ServletUtility.getSuccessMessage(request);

	String _err = ServletUtility.getErrorMessage(request);
	%>


	<form action="<%=ORSView.LOGIN_CTL%>" method="post">

		<div class="container mt-5">

			<div class="row justify-content-center">

				<div class="col-md-5">


					<!-- Login Card -->

					<div class="card shadow">


						<!-- Card Header -->

						<div class="card-header bg-dark text-white text-center">

							<h1 class="mb-0">
								<%=ms.get("login.title")%>
							</h1>

						</div>


						<!-- Card Body -->

						<div class="card-body">


							<!-- Success Message -->

							<%
							if (_suc != null && !_suc.isEmpty()) {
							%>

							<div class="alert alert-success text-center">

								<%=_suc%>

							</div>

							<%
							}
							%>


							<!-- Error Message -->

							<%
							if (_err != null && !_err.isEmpty()) {
							%>

							<div class="alert alert-danger text-center">

								<%=_err%>

							</div>

							<%
							}
							%>


							<!-- Login -->

							<div class="mb-3">

								<label class="form-label fw-bold"> <%=ms.get("login.userid")%>

									<span class="text-danger">*</span>

								</label> <input type="text" name="login" class="form-control"
									value="<%=DataUtility.getStringData(bean.getLogin())%>"
									placeholder="Enter your login">


								<div class="text-danger mt-1">

									<%=ServletUtility.getErrorMessage("login", request)%>

								</div>

							</div>


							<!-- Password -->

							<div class="mb-3">

								<label class="form-label fw-bold"> <%=ms.get("login.password")%>

									<span class="text-danger">*</span>

								</label> <input type="password" name="password" class="form-control"
									value="<%=DataUtility.getStringData(bean.getPassword())%>"
									placeholder="Enter your password">


								<div class="text-danger mt-1">

									<%=ServletUtility.getErrorMessage("password", request)%>

								</div>

							</div>


							<!-- Login Button -->

							<div class="d-grid mt-4">

								<input type="submit" name="operation"
									class="btn btn-primary btn-lg" value="<%=LoginCtl.OP_SIGN_IN%>">

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