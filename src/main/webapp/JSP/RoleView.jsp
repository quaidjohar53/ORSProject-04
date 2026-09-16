<%@page import="in.co.rays.proj4.util.ServletUtility"%>
<%@page import="in.co.rays.proj4.controller.BaseCtl"%>
<%@page import="in.co.rays.proj4.controller.ORSView"%>

<!DOCTYPE html>

<html>

<head>

<meta charset="ISO-8859-1">

<title>Add Role</title>

</head>

<body>

	<%@ include file="Header.jsp"%>

	<%
	String _suc = ServletUtility.getSuccessMessage(request);
	String _err = ServletUtility.getErrorMessage(request);
	%>


	<form action="<%=ORSView.ROLE_CTL%>" method="post">

		<div class="container">

			<div class="row justify-content-center mt-4">

				<div class="col-md-6">

					<div class="card shadow">

						<div class="card-header text-center">

							<h2>Add Role</h2>

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

								<label class="form-label">

									Name <span class="text-danger">*</span>

								</label>


								<input type="text"
									name="name"
									value=""
									placeholder="Enter role name"
									class="form-control">


								<div class="text-danger">

									<%=ServletUtility.getErrorMessage("name", request)%>

								</div>

							</div>


							<!-- Description -->

							<div class="mb-3">

								<label class="form-label">

									Description <span class="text-danger">*</span>

								</label>


								<textarea
									name="description"
									placeholder="Enter role description"
									class="form-control"
									rows="4"></textarea>


								<div class="text-danger">

									<%=ServletUtility.getErrorMessage("description", request)%>

								</div>

							</div>


							<!-- Save -->

							<div class="text-center">

								<input type="submit"
									name="operation"
									value="<%=BaseCtl.OP_SAVE%>"
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