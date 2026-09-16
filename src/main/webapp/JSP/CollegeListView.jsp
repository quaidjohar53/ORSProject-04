<%@page import="in.co.rays.proj4.util.ServletUtility"%>
<%@page import="in.co.rays.proj4.controller.BaseCtl"%>
<%@page import="in.co.rays.proj4.controller.ORSView"%>
<%@page import="in.co.rays.proj4.bean.CollegeBean"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Iterator"%>

<!DOCTYPE html>

<html>

<head>

<meta charset="ISO-8859-1">

<title>College List</title>

</head>

<body>

	<%@ include file="Header.jsp"%>


	<%
	int pageNo = ServletUtility.getPageNo(request);
	int pageSize = ServletUtility.getPageSize(request);
	int index = (pageNo - 1) * pageSize + 1;

	List<CollegeBean> list = ServletUtility.getList(request);
	Iterator<CollegeBean> it = list.iterator();

	String _suc = ServletUtility.getSuccessMessage(request);
	String _err = ServletUtility.getErrorMessage(request);
	%>


	<form action="<%=ORSView.COLLEGE_LIST_CTL%>" method="post">


		<div class="container-fluid">

			<!-- Page Heading -->

			<div class="text-center mt-4 mb-3">

				<h1>College List</h1>

			</div>


			<!-- Success / Error Message -->

			<h5 class="text-success text-center">
				<%=_suc != null ? _suc : ""%>
			</h5>

			<h5 class="text-danger text-center">
				<%=_err != null ? _err : ""%>
			</h5>


			<!-- Search -->

			<div class="row justify-content-center mb-3">

				<div class="col-md-2">

					<input type="text" name="name" value=""
						placeholder="Search by college" class="form-control">

				</div>


				<div class="col-md-2">

					<input type="text" name="address" value=""
						placeholder="Search by address" class="form-control">

				</div>


				<div class="col-md-2">

					<input type="text" name="state" value=""
						placeholder="Search by state" class="form-control">

				</div>


				<div class="col-md-2">

					<input type="text" name="city" value=""
						placeholder="Search by city" class="form-control">

				</div>


				<div class="col-md-1">

					<input type="text" name="phone" value=""
						placeholder="Search by phone" class="form-control">

				</div>


				<div class="col-md-1">

					<input type="submit" name="operation"
						value="<%=BaseCtl.OP_SEARCH%>" class="btn btn-primary">

				</div>

			</div>


			<!-- College Table -->

			<div class="table-responsive">

				<table class="table table-bordered table-hover align-middle">

					<thead class="table-info">

						<tr>

							<th><input type="checkbox"
								onclick="document.querySelectorAll('input[name=ids]').forEach(e=>e.checked=this.checked)">
							</th>

							<th>S.No</th>

							<th>Name</th>

							<th>Address</th>

							<th>State</th>

							<th>City</th>

							<th>Phone</th>

						</tr>

					</thead>


					<tbody>

						<%
						while (it.hasNext()) {

							CollegeBean bean = it.next();
						%>

						<tr>

							<td><input type="checkbox" name="ids"
								value="<%=bean.getId()%>"></td>

							<td><%=index++%></td>

							<td><%=bean.getName()%></td>

							<td><%=bean.getAddress()%></td>

							<td><%=bean.getState()%></td>

							<td><%=bean.getCity()%></td>

							<td><%=bean.getPhoneNo()%></td>

						</tr>

						<%
						}
						%>

					</tbody>

				</table>

			</div>


			<!-- Pagination / Delete -->

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


			<input type="hidden" name="pageNo" value="<%=pageNo%>"> <input
				type="hidden" name="pageSize" value="<%=pageSize%>">


		</div>

	</form>


	<%@ include file="Footer.jsp"%>

</body>

</html>