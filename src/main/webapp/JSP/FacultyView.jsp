<%@page import="in.co.rays.proj4.util.ServletUtility"%>
<%@page import="in.co.rays.proj4.controller.BaseCtl"%>
<%@page import="in.co.rays.proj4.controller.ORSView"%>
<%@page import="in.co.rays.proj4.bean.FacultyBean"%>
<%@page import="in.co.rays.proj4.bean.CollegeBean"%>
<%@page import="java.util.List"%>

<!DOCTYPE html>
<html>

<head>

<meta charset="ISO-8859-1">

<title>Add Faculty</title>

</head>

<body>

	<%@ include file="Header.jsp"%>

	<%
	String _suc = ServletUtility.getSuccessMessage(request);

	String _err = ServletUtility.getErrorMessage(request);

	FacultyBean bean = (FacultyBean) request.getAttribute("bean");

	List<CollegeBean> collegeList = (List<CollegeBean>) request.getAttribute("collegeList");
	%>


	<form action="<%=ORSView.FACULTY_CTL%>" method="post">


		<div align="center">

			<h1>Add Faculty</h1>


			<h3 style="color: green">
				<%=_suc%>
			</h3>

			<h3 style="color: red">
				<%=_err%>
			</h3>


			<table>


				<!-- First Name -->

				<tr>

					<th>First Name<font color="red">*</font>
					</th>

					<td><input type="text" name="firstName"
						value="<%=bean != null ? bean.getFirstName() : ""%>"
						placeholder="enter first name"></td>

					<td style="color: red"><%=ServletUtility.getErrorMessage("firstName", request)%></td>

				</tr>


				<!-- Last Name -->

				<tr>

					<th>Last Name<font color="red">*</font>
					</th>

					<td><input type="text" name="lastName"
						value="<%=bean != null ? bean.getLastName() : ""%>"
						placeholder="enter last name"></td>

					<td style="color: red"><%=ServletUtility.getErrorMessage("lastName", request)%></td>

				</tr>


				<!-- Date of Birth -->

				<!-- Date Of Birth -->

				<tr>

					<th>Date Of Birth<font color="red">*</font>
					</th>

					<td><input type="text" name="dob"
						value="<%=bean != null && bean.getDob() != null ? bean.getDob() : ""%>"
						placeholder="dd/MM/yyyy"></td>

					<td style="color: red"><%=ServletUtility.getErrorMessage("dob", request)%></td>

				</tr>

				<th>Mobile No<font color="red">*</font>
				</th>

				<td><input type="text" name="mobileNo"
					value="<%=bean != null ? bean.getMobileNo() : ""%>"
					placeholder="enter mobile number"></td>

				<td style="color: red"><%=ServletUtility.getErrorMessage("mobileNo", request)%></td>

				</tr>


				<!-- Email -->

				<tr>

					<th>Email<font color="red">*</font>
					</th>

					<td><input type="text" name="email"
						value="<%=bean != null ? bean.getEmail() : ""%>"
						placeholder="enter email"></td>

					<td style="color: red"><%=ServletUtility.getErrorMessage("email", request)%></td>

				</tr>


				<!-- Address -->

				<tr>

					<th>Address</th>

					<td><input type="text" name="address"
						value="<%=bean != null ? bean.getAddress() : ""%>"
						placeholder="enter address"></td>

					<td></td>

				</tr>


				<!-- Gender -->

				<tr>

					<th>Gender</th>

					<td><select name="gender">

							<option value="">Select Gender</option>

							<option value="Male">Male</option>

							<option value="Female">Female</option>

					</select></td>

					<td></td>

				</tr>


				<!-- COLLEGE DROPDOWN -->

				<tr>

					<th>College<font color="red">*</font>
					</th>

					<td><select name="collegeId">

							<option value="">Select College</option>

							<%
							if (collegeList != null) {

								for (CollegeBean college : collegeList) {
							%>

							<option value="<%=college.getId()%>">

								<%=college.getName()%>

							</option>

							<%
							}
							}
							%>

					</select></td>

					<td style="color: red"><%=ServletUtility.getErrorMessage("collegeId", request)%></td>

				</tr>


				<!-- Save -->

				<tr>

					<th></th>

					<td><input type="submit" name="operation"
						value="<%=BaseCtl.OP_SAVE%>"></td>

				</tr>


			</table>

		</div>

	</form>


	<%@ include file="Footer.jsp"%>

</body>

</html>