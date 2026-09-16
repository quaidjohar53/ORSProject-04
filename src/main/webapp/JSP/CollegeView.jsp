<%@page import="in.co.rays.proj4.util.ServletUtility"%>
<%@page import="in.co.rays.proj4.controller.BaseCtl"%>
<%@page import="in.co.rays.proj4.controller.ORSView"%>

<!DOCTYPE html>

<html>

<head>

<meta charset="ISO-8859-1">

<title>Insert title here</title>

</head>

<body>

	<%@ include file="Header.jsp"%>

	<%
	String _suc = ServletUtility.getSuccessMessage(request);
	String _err = ServletUtility.getErrorMessage(request);
	%>


	<form action="<%=ORSView.COLLEGE_CTL%>" method="post">

		<div class="container">

			<div class="row justify-content-center mt-4">

				<div class="col-md-6">

					<div class="card shadow">

						<div class="card-header text-center">

							<h2>Add College</h2>

						</div>


						<div class="card-body">


							<h5 class="text-success text-center">
								<%=_suc%>
							</h5>

							<h5 class="text-danger text-center">
								<%=_err%>
							</h5>


							<!-- Name -->

							<div class="mb-3">

								<label class="form-label"> Name <span
									class="text-danger">*</span>
								</label> <input type="text" name="name" value=""
									placeholder="Enter college name" class="form-control">

								<div class="text-danger">
									<%=ServletUtility.getErrorMessage("name", request)%>
								</div>

							</div>


							<!-- Address -->

							<div class="mb-3">

								<label class="form-label"> Address <span
									class="text-danger">*</span>
								</label> <input type="text" name="address" value=""
									placeholder="Enter college address" class="form-control">

								<div class="text-danger">
									<%=ServletUtility.getErrorMessage("address", request)%>
								</div>

							</div>


							<!-- State -->

							<div class="mb-3">

								<label class="form-label"> State <span
									class="text-danger">*</span>
								</label> <input type="text" name="state" value=""
									placeholder="Enter state" class="form-control">

								<div class="text-danger">
									<%=ServletUtility.getErrorMessage("state", request)%>
								</div>

							</div>


							<!-- City -->

							<div class="mb-3">

								<label class="form-label"> City <span
									class="text-danger">*</span>
								</label> <input type="text" name="city" value=""
									placeholder="Enter city" class="form-control">

								<div class="text-danger">
									<%=ServletUtility.getErrorMessage("city", request)%>
								</div>

							</div>


							<!-- Phone -->

							<div class="mb-3">

								<label class="form-label"> Phone <span
									class="text-danger">*</span>
								</label> <input type="text" name="phone" value=""
									placeholder="Enter phone number" class="form-control">

								<div class="text-danger">
									<%=ServletUtility.getErrorMessage("phone", request)%>
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