<%@page import="in.co.rays.proj4.util.ServletUtility"%>
<%@page import="in.co.rays.proj4.controller.BaseCtl"%>
<%@page import="in.co.rays.proj4.controller.ORSView"%>
<%@page import="in.co.rays.proj4.bean.MarksheetBean"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>

<!DOCTYPE html>

<html>

<head>

<meta charset="ISO-8859-1">

<title>Marksheet List</title>

</head>

<body>

	<%@ include file="Header.jsp"%>


	<%
	int pageNo = ServletUtility.getPageNo(request);

	int pageSize = ServletUtility.getPageSize(request);

	int index = ((pageNo - 1) * pageSize) + 1;

	List<MarksheetBean> list = ServletUtility.getList(request);

	Iterator<MarksheetBean> it = list.iterator();

	String _suc = ServletUtility.getSuccessMessage(request);

	String _err = ServletUtility.getErrorMessage(request);
	%>


	<form action="<%=ORSView.MARKSHEET_LIST_CTL%>" method="post">


		<div class="container-fluid">


			<!-- Heading -->

			<div class="text-center mt-4 mb-3">

				<h1>Marksheet List</h1>

			</div>


			<!-- Success Message -->

			<h5 class="text-success text-center">

				<%=_suc != null ? _suc : ""%>

			</h5>


			<!-- Error Message -->

			<h5 class="text-danger text-center">

				<%=_err != null ? _err : ""%>

			</h5>


			<!-- Hidden Fields -->

			<input type="hidden" name="pageNo" value="<%=pageNo%>"> <input
				type="hidden" name="pageSize" value="<%=pageSize%>">


			<!-- Search -->

			<div class="row justify-content-center mb-3">


				<div class="col-md-3">

					<input type="text" name="rollNo" value=""
						placeholder="Search by roll no" class="form-control">

				</div>


				<div class="col-md-3">

					<input type="text" name="name" value=""
						placeholder="Search by student" class="form-control">

				</div>


				<div class="col-md-1">

					<input type="submit" name="operation"
						value="<%=BaseCtl.OP_SEARCH%>" class="btn btn-primary">

				</div>


			</div>


			<!-- List -->

			<div class="table-responsive">


				<table class="table table-bordered table-hover align-middle">


					<thead class="table-info">


						<tr>


							<th><input type="checkbox"
								onclick="document.querySelectorAll('input[name=ids]').forEach(e=>e.checked=this.checked)">

							</th>


							<th>S.No</th>

							<th>Roll No</th>

							<th>Student</th>

							<th>Physics</th>

							<th>Chemistry</th>

							<th>Maths</th>


						</tr>


					</thead>


					<tbody>


						<%
						while (it.hasNext()) {

							MarksheetBean bean = it.next();
						%>


						<tr>


							<td><input type="checkbox" name="ids"
								value="<%=bean.getId()%>"></td>


							<td><%=index++%></td>


							<td><%=bean.getRollNo()%></td>


							<td><%=bean.getName()%></td>


							<td><%=bean.getPhysics()%></td>


							<td><%=bean.getChemistry()%></td>


							<td><%=bean.getMaths()%></td>


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