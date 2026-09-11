<%@page import="in.co.rays.proj4.util.ServletUtility"%>
<%@page import="in.co.rays.proj4.controller.BaseCtl"%>
<%@page import="in.co.rays.proj4.controller.ORSView"%>
<%@page import="in.co.rays.proj4.bean.MarksheetBean"%>
<%@page import="in.co.rays.proj4.bean.StudentBean"%>
<%@page import="java.util.List"%>

<!DOCTYPE html>

<html>

<head>

<meta charset="ISO-8859-1">

<title>Add Marksheet</title>

</head>

<body>

	<%@ include file="Header.jsp"%>

	<%
	MarksheetBean bean = (MarksheetBean) request.getAttribute("bean");

	List<StudentBean> studentList = (List<StudentBean>) request.getAttribute("studentList");

	String _suc = ServletUtility.getSuccessMessage(request);

	String _err = ServletUtility.getErrorMessage(request);
	%>


	<form action="<%=ORSView.MARKSHEET_CTL%>" method="post">


		<div align="center">

			<h1>Add Marksheet</h1>


			<h3 style="color: green">
				<%=_suc%>
			</h3>

			<h3 style="color: red">
				<%=_err%>
			</h3>


			<table>


				<!-- Roll No -->

				<tr>

					<th>Roll No<font color="red">*</font>
					</th>

					<td><input type="text" name="rollNo"
						value="<%=bean != null ? bean.getRollNo() : ""%>"
						placeholder="enter roll no"></td>

					<td style="color: red"><%=ServletUtility.getErrorMessage("rollNo", request)%></td>

				</tr>


				<!-- Student -->

				<tr>

					<th>Student<font color="red">*</font>
					</th>

					<td><select name="studentId">

							<option value="">Select Student</option>

							<%
							if (studentList != null) {

								for (StudentBean student : studentList) {
							%>

							<option value="<%=student.getId()%>"
								<%=bean != null && bean.getStudentId() == student.getId() ? "selected" : ""%>>

								<%=student.getFirstName()%>
								<%=student.getLastName()%>

							</option>

							<%
							}
							}
							%>

					</select></td>

					<td style="color: red"><%=ServletUtility.getErrorMessage("studentId", request)%></td>

				</tr>


				<!-- Physics -->

				<tr>

					<th>Physics<font color="red">*</font>
					</th>

					<td><input type="text" name="physics"
						value="<%=bean != null && bean.getPhysics() != null ? bean.getPhysics() : ""%>"
						placeholder="enter physics marks"></td>

					<td style="color: red"><%=ServletUtility.getErrorMessage("physics", request)%></td>

				</tr>


				<!-- Chemistry -->

				<tr>

					<th>Chemistry<font color="red">*</font>
					</th>

					<td><input type="text" name="chemistry"
						value="<%=bean != null && bean.getChemistry() != null ? bean.getChemistry() : ""%>"
						placeholder="enter chemistry marks"></td>

					<td style="color: red"><%=ServletUtility.getErrorMessage("chemistry", request)%></td>

				</tr>


				<!-- Maths -->

				<tr>

					<th>Maths<font color="red">*</font>
					</th>

					<td><input type="text" name="maths"
						value="<%=bean != null && bean.getMaths() != null ? bean.getMaths() : ""%>"
						placeholder="enter maths marks"></td>

					<td style="color: red"><%=ServletUtility.getErrorMessage("maths", request)%></td>

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