<%@page import="in.co.rays.proj4.util.ServletUtility"%>
<%@page import="in.co.rays.proj4.controller.BaseCtl"%>
<%@page import="in.co.rays.proj4.controller.ORSView"%>
<%@page import="in.co.rays.proj4.bean.FacultyBean"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Iterator"%>

<!DOCTYPE html>

<html>

<head>

<meta charset="ISO-8859-1">

<title>Faculty List</title>

</head>

<body>

	<%@ include file="Header.jsp"%>


	<%
	int pageNo = ServletUtility.getPageNo(request);
	int pageSize = ServletUtility.getPageSize(request);
	int index = (pageNo - 1) * pageSize + 1;

	List<FacultyBean> list = ServletUtility.getList(request);
	Iterator<FacultyBean> it = list.iterator();

	String _suc = ServletUtility.getSuccessMessage(request);
	String _err = ServletUtility.getErrorMessage(request);
	%>


	<form action="<%=ORSView.FACULTY_LIST_CTL%>" method="post">


		<div class="container-fluid">


			<!-- Heading -->

			<div class="text-center mt-4 mb-3">

				<h1>Faculty List</h1>

			</div>


			<!-- Messages -->

			<h5 class="text-success text-center">

				<%=_suc != null ? _suc : ""%>

			</h5>


			<h5 class="text-danger text-center">

				<%=_err != null ? _err : ""%>

			</h5>


			<input type="hidden" name="pageNo" value="<%=pageNo%>"> <input
				type="hidden" name="pageSize" value="<%=pageSize%>">


			<!-- Search -->

			<div class="row justify-content-center mb-3">


				<div class="col-md-2">

					<input type="text" name="firstName" value=""
						placeholder="Search by first name" class="form-control">

				</div>


				<div class="col-md-2">

					<input type="text" name="lastName" value=""
						placeholder="Search by last name" class="form-control">

				</div>


				<div class="col-md-2">

					<input type="text" name="email" value=""
						placeholder="Search by email" class="form-control">

				</div>


				<div class="col-md-2">

					<input type="text" name="collegeId" value=""
						placeholder="Search by college" class="form-control">

				</div>


				<div class="col-md-1">

					<input type="submit" name="operation"
						value="<%=BaseCtl.OP_SEARCH%>" class="btn btn-primary">

				</div>


			</div>


			<!-- Faculty Table -->

			<div class="table-responsive">

				<table class="table table-bordered table-hover align-middle">


					<thead class="table-info">

						<tr>


							<th><input type="checkbox"
								onclick="document.querySelectorAll('input[name=ids]').forEach(e=>e.checked=this.checked)">

							</th>


							<th>S.No</th>

							<th>First Name</th>

							<th>Last Name</th>

							<th>Email</th>

							<th>Gender</th>

							<th>College</th>

							<th>Date of Birth</th>


						</tr>

					</thead>


					<tbody>


						<%
						while (it.hasNext()) {

							FacultyBean bean = it.next();
						%>


						<tr>


							<td><input type="checkbox" name="ids"
								value="<%=bean.getId()%>"></td>


							<td><%=index++%></td>


							<td><%=bean.getFirstName()%></td>


							<td><%=bean.getLastName()%></td>


							<td><%=bean.getEmail()%></td>


							<td><%=bean.getGender()%></td>


							<td><%=bean.getCollegeId()%></td>


							<td><%=bean.getDob()%></td>


						</tr>


						<%
						}
						%>


					</tbody>


				</table>

			</div>


			<!-- Pagination -->

			<div class="row mt-3">


				<div class="col-md-4">

					<input type="submit" name="operation"
						value="<%=BaseCtl.OP_PREVIOUS%>"
						<%=pageNo == 1 ? "disabled" : ""%>
						class="btn btn-outline-secondary">

				</div>


				<div class="col-md-4 text-center">

					<input type="submit" name="operation"
						value="<%=BaseCtl.OP_DELETE%>" class="btn btn-danger">

				</div>


				<div class="col-md-4 text-end">

					<input type="submit" name="operation" value="<%=BaseCtl.OP_NEXT%>"
						<%=list.size() < pageSize ? "disabled" : ""%>
						class="btn btn-outline-secondary">

				</div>


			</div>


		</div>


	</form>


	<%@ include file="Footer.jsp"%>


</body>

</html>