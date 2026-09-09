<%@page import="in.co.rays.proj4.util.ServletUtility"%>
<%@page import="in.co.rays.proj4.controller.BaseCtl"%>
<%@page import="in.co.rays.proj4.controller.ORSView"%>
<%@page import="in.co.rays.proj4.bean.FacultyBean"%>
<%@page import="in.co.rays.proj4.bean.CollegeBean"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>

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

	int index = ((pageNo - 1) * pageSize) + 1;

	List<FacultyBean> list = ServletUtility.getList(request);

	Iterator<FacultyBean> it = list.iterator();

	String _suc = ServletUtility.getSuccessMessage(request);

	String _err = ServletUtility.getErrorMessage(request);
	%>


	<form action="<%=ORSView.FACULTY_LIST_CTL%>" method="post">


		<div align="center">

			<h1>Faculty List</h1>


			<h3 style="color: green">
				<%=_suc != null ? _suc : ""%>
			</h3>

			<h3 style="color: red">
				<%=_err != null ? _err : ""%>
			</h3>


			<input type="hidden" name="pageNo" value="<%=pageNo%>"> <input
				type="hidden" name="pageSize" value="<%=pageSize%>">


			<!-- Search -->

			<table>

				<tr>


					<td><input type="text" name="firstName" value=""
						placeholder="search by first name"></td>


					<td><input type="text" name="lastName" value=""
						placeholder="search by last name"></td>


					<td><input type="text" name="email" value=""
						placeholder="search by email"></td>


					<td><input type="text" name="mobileNo" value=""
						placeholder="search by mobile"></td>


					<td><input type="text" name="address" value=""
						placeholder="search by address"></td>


					<td><input type="text" name="gender" value=""
						placeholder="search by gender"></td>


					<td><input type="text" name="collegeId" value=""
						placeholder="search by college id"></td>


					<td><input type="submit" name="operation"
						value="<%=BaseCtl.OP_SEARCH%>"></td>


				</tr>

			</table>


			<!-- Faculty table -->

			<table border="1px" width="100%">


				<tr style="background-color: skyblue">


					<th><input type="checkbox"
						onclick="document.querySelectorAll('input[name=ids]').forEach(c=>c.checked=this.checked)">

					</th>


					<th>S.No</th>

					<th>College</th>

					<th>First Name</th>

					<th>Last Name</th>

					<th>Email</th>

					<th>Mobile No</th>

					<th>Address</th>

					<th>Gender</th>

					<th>Date Of Birth</th>


				</tr>


				<%
				while (it.hasNext()) {

					FacultyBean bean = it.next();
				%>


				<tr align="center" style="background-color: lightgrey">


					<td><input type="checkbox" name="ids"
						value="<%=bean.getId()%>"></td>


					<td><%=index++%></td>


					<td><%=bean.getCollegeName()%></td>


					<td><%=bean.getFirstName()%></td>


					<td><%=bean.getLastName()%></td>


					<td><%=bean.getEmail()%></td>


					<td><%=bean.getMobileNo()%></td>


					<td><%=bean.getAddress()%></td>


					<td><%=bean.getGender()%></td>


					<%=bean.getDob()%>

				</tr>


				<%
				}
				%>


			</table>

		</div>


		<!-- Pagination -->

		<table width="100%">

			<tr>


				<td><input type="submit" name="operation"
					<%=pageNo == 1 ? "disabled" : ""%> value="<%=BaseCtl.OP_PREVIOUS%>"></td>


				<td align="center"><input type="submit" name="operation"
					value="<%=BaseCtl.OP_DELETE%>"></td>


				<td align="right"><input type="submit" name="operation"
					<%=list.size() < 10 ? "disabled" : ""%>
					value="<%=BaseCtl.OP_NEXT%>"></td>


			</tr>

		</table>


	</form>


	<%@ include file="Footer.jsp"%>

</body>

</html>