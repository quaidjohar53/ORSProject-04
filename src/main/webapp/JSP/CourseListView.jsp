<%@page import="in.co.rays.proj4.util.ServletUtility"%>
<%@page import="in.co.rays.proj4.controller.BaseCtl"%>
<%@page import="in.co.rays.proj4.bean.CourseBean"%>
<%@page import="in.co.rays.proj4.controller.ORSView"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>

<!DOCTYPE html>
<html>

<head>

<meta charset="ISO-8859-1">

<title>Course List</title>

</head>

<body>

	<%@ include file="Header.jsp"%>


	<%
		int pageNo =
				ServletUtility.getPageNo(request);

		int pageSize =
				ServletUtility.getPageSize(request);

		int index =
				((pageNo - 1) * pageSize) + 1;

		List<CourseBean> list =
				ServletUtility.getList(request);

		Iterator<CourseBean> it =
				list.iterator();

		String _suc =
				ServletUtility.getSuccessMessage(request);

		String _err =
				ServletUtility.getErrorMessage(request);
	%>


	<form action="<%=ORSView.COURSE_LIST_CTL%>"
		method="post">


		<div align="center">


			<h1>Course List</h1>


			<h3 style="color: green">
				<%=_suc != null ? _suc : ""%>
			</h3>


			<h3 style="color: red">
				<%=_err != null ? _err : ""%>
			</h3>


			<!-- Pagination values -->

			<input type="hidden"
				name="pageNo"
				value="<%=pageNo%>">

			<input type="hidden"
				name="pageSize"
				value="<%=pageSize%>">


			<!-- Search -->

			<table>

				<tr>

					<td>

						<input type="text"
							name="name"
							value=""
							placeholder="search by course">

					</td>


					<td>

						<input type="text"
							name="duration"
							value=""
							placeholder="search by duration">

					</td>


					<td>

						<input type="text"
							name="description"
							value=""
							placeholder="search by description">

					</td>


					<td>

						<input type="submit"
							name="operation"
							value="<%=BaseCtl.OP_SEARCH%>">

					</td>

				</tr>

			</table>


			<!-- Course Table -->

			<table border="1px" width="100%">

				<tr style="background-color: skyblue">


					<th>

						<input type="checkbox"
							onclick="document.querySelectorAll('input[name=ids]').forEach(c=>c.checked=this.checked)">

					</th>


					<th>S.No</th>

					<th>Name</th>

					<th>Duration</th>

					<th>Description</th>


				</tr>


				<%

					while (it.hasNext()) {

						CourseBean bean =
								it.next();

				%>


				<tr align="center"
					style="background-color: lightgrey">


					<td>

						<input type="checkbox"
							name="ids"
							value="<%=bean.getId()%>">

					</td>


					<td>

						<%=index++%>

					</td>


					<td>

						<%=bean.getName()%>

					</td>


					<td>

						<%=bean.getDuration()%>

					</td>


					<td>

						<%=bean.getDescription()%>

					</td>


				</tr>


				<%
					}
				%>


			</table>


		</div>


		<!-- Pagination -->

		<table width="100%">

			<tr>


				<!-- Previous -->

				<td>

					<input type="submit"
						name="operation"
						<%=pageNo == 1
								? "disabled"
								: ""%>
						value="<%=BaseCtl.OP_PREVIOUS%>">

				</td>


				<!-- Delete -->

				<td align="center">

					<input type="submit"
						name="operation"
						value="<%=BaseCtl.OP_DELETE%>">

				</td>


				<!-- Next -->

				<td align="right">

					<input type="submit"
						name="operation"
						<%=list.size() < 10
								? "disabled"
								: ""%>
						value="<%=BaseCtl.OP_NEXT%>">

				</td>


			</tr>

		</table>


	</form>


	<%@ include file="Footer.jsp"%>

</body>

</html>