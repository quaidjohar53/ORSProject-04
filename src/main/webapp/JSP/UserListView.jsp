<%@page import="in.co.rays.proj4.bean.RoleBean"%>
<%@page import="in.co.rays.proj4.model.RoleModel"%>
<%@page import="in.co.rays.proj4.util.ServletUtility"%>
<%@page import="in.co.rays.proj4.controller.BaseCtl"%>
<%@page import="in.co.rays.proj4.controller.ORSView"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>

<!DOCTYPE html>

<html>

<head>

<meta charset="ISO-8859-1">

<title>User List</title>

</head>

<body>

	<%@ include file="Header.jsp"%>


	<%
	int pageNo = ServletUtility.getPageNo(request);

	int pageSize = ServletUtility.getPageSize(request);

	int index = ((pageNo - 1) * pageSize) + 1;

	List<UserBean> list = ServletUtility.getList(request);

	Iterator<UserBean> it = list.iterator();

	String _suc = ServletUtility.getSuccessMessage(request);

	String _err = ServletUtility.getErrorMessage(request);
	%>


	<form action="<%=ORSView.USER_LIST_CTL%>" method="post">


		<div class="container-fluid">


			<!-- Heading -->

			<div class="text-center mt-4 mb-3">

				<h1>User List</h1>

			</div>


			<!-- Success -->

			<h5 class="text-success text-center">

				<%=_suc%>

			</h5>


			<!-- Error -->

			<h5 class="text-danger text-center">

				<%=_err%>

			</h5>


			<!-- Hidden Fields -->

			<input type="hidden" name="pageNo" value="<%=pageNo%>"> <input
				type="hidden" name="pageSize" value="<%=pageSize%>">


			<!-- Search -->

			<div class="row justify-content-center mb-3">


				<div class="col-md-3">

					<input type="text" name="firstName" value=""
						placeholder="Search by firstName" class="form-control">

				</div>


				<div class="col-md-3">

					<input type="text" name="lastName" value=""
						placeholder="Search by lastName" class="form-control">

				</div>


				<div class="col-md-1">

					<input type="submit" name="operation"
						value="<%=BaseCtl.OP_SEARCH%>" class="btn btn-primary">

				</div>


			</div>


			<!-- User Table -->

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

							<th>Login</th>

							<th>DOB</th>

							<th>Role Name</th>


						</tr>


					</thead>


					<tbody>


						<%
						while (it.hasNext()) {

							UserBean bean = it.next();

							RoleModel rmodel = new RoleModel();

							RoleBean rbean = rmodel.findByPK(bean.getRoleId());
						%>


						<tr>


							<td><input type="checkbox" name="ids"
								value="<%=bean.getId()%>"></td>


							<td><%=index++%></td>


							<td><%=bean.getFirstName()%></td>


							<td><%=bean.getLastName()%></td>


							<td><%=bean.getLogin()%></td>


							<td><%=bean.getDob()%></td>


							<td><%=rbean.getName()%></td>


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