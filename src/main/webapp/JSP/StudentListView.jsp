<%@page import="in.co.rays.proj4.util.ServletUtility"%>
<%@page import="in.co.rays.proj4.controller.BaseCtl"%>
<%@page import="in.co.rays.proj4.controller.ORSView"%>
<%@page import="in.co.rays.proj4.bean.StudentBean"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>

<!DOCTYPE html>

<html>

<head>

<meta charset="ISO-8859-1">

<title>Student List</title>

</head>

<body>

	<%@ include file="Header.jsp"%>


	<%
	int pageNo = ServletUtility.getPageNo(request);

	int pageSize = ServletUtility.getPageSize(request);

	int index = ((pageNo - 1) * pageSize) + 1;

	List<StudentBean> list = ServletUtility.getList(request);

	Iterator<StudentBean> it = list.iterator();

	String _suc = ServletUtility.getSuccessMessage(request);

	String _err = ServletUtility.getErrorMessage(request);
	%>


	<form action="<%=ORSView.STUDENT_LIST_CTL%>" method="post">


		<div class="container-fluid">


			<!-- Heading -->

			<div class="text-center mt-4 mb-3">

				<h1>Student List</h1>

			</div>


			<!-- Success Message -->

			<h5 class="text-success text-center">

				<%=_suc != null ? _suc : ""%>

			</h5>


			<!-- Error Message -->

			<h5 class="text-danger text-center">

				<%=_err != null ? _err : ""%>

			</h5>


			<!-- Hidden Pagination Values -->

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

					<input type="text" name="rollNo" value=""
						placeholder="Search by roll no" class="form-control">

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


			<!-- Student Table -->

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

							<th>DOB</th>

							<th>Mobile No</th>

							<th>Email</th>

							<th>College Id</th>


						</tr>

					</thead>


					<tbody>


						<%
						while (it.hasNext()) {

							StudentBean bean = it.next();
						%>


						<tr>


							<td><input type="checkbox" name="ids"
								value="<%=bean.getId()%>"></td>


							<td><%=index++%></td>


							<td><%=bean.getFirstName()%></td>


							<td><%=bean.getLastName()%></td>


							<td><%=bean.getDob()%></td>


							<td><%=bean.getMobileNo()%></td>


							<td><%=bean.getEmail()%></td>


							<td><%=bean.getCollegeId()%></td>


						</tr>


						<%
						}
						%>


					</tbody>


				</table>

			</div>


			<!-- Pagination -->

			<div class="row mt-3">


				<!-- Previous -->

				<div class="col-md-4">

					<input type="submit" name="operation"
						value="<%=BaseCtl.OP_PREVIOUS%>"
						<%=pageNo == 1 ? "disabled" : ""%>
						class="btn btn-outline-secondary">

				</div>


				<!-- Delete -->

				<div class="col-md-4 text-center">

					<input type="submit" name="operation"
						value="<%=BaseCtl.OP_DELETE%>" class="btn btn-danger">

				</div>


				<!-- Next -->

				<div class="col-md-4 text-end">

					<input type="submit" name="operation" value="<%=BaseCtl.OP_NEXT%>"
						<%=list.size() < 10 ? "disabled" : ""%>
						class="btn btn-outline-secondary">

				</div>


			</div>


		</div>


	</form>


	<%@ include file="Footer.jsp"%>

</body>

</html>