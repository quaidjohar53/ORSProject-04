<%@page import="in.co.rays.proj4.util.ServletUtility"%>
<%@page import="in.co.rays.proj4.controller.BaseCtl"%>
<%@page import="in.co.rays.proj4.controller.ORSView"%>
<%@page import="in.co.rays.proj4.bean.CourseBean"%>

<!DOCTYPE html>
<html>

<head>

<meta charset="ISO-8859-1">

<title>Add Course</title>

</head>

<body>

	<%@ include file="Header.jsp"%>

	<%
		String _suc =
				ServletUtility.getSuccessMessage(request);

		String _err =
				ServletUtility.getErrorMessage(request);

		CourseBean bean =
				(CourseBean) request.getAttribute("bean");
	%>


	<form action="<%=ORSView.COURSE_CTL%>" method="post">

		<div align="center">

			<h1>Add Course</h1>

			<h3 style="color: green"><%=_suc%></h3>

			<h3 style="color: red"><%=_err%></h3>


			<table>


				<!-- Name -->

				<tr>

					<th>
						Name<font color="red">*</font>
					</th>

					<td>

						<input type="text"
							name="name"
							value="<%=bean != null ? bean.getName() : ""%>"
							placeholder="enter course name">

					</td>

					<td style="color: red">

						<%=ServletUtility.getErrorMessage(
								"name", request)%>

					</td>

				</tr>


				<!-- Duration -->

				<tr>

					<th>
						Duration<font color="red">*</font>
					</th>

					<td>

						<input type="text"
							name="duration"
							value="<%=bean != null ? bean.getDuration() : ""%>"
							placeholder="enter duration">

					</td>

					<td style="color: red">

						<%=ServletUtility.getErrorMessage(
								"duration", request)%>

					</td>

				</tr>


				<!-- Description -->

				<tr>

					<th>
						Description<font color="red">*</font>
					</th>

					<td>

						<input type="text"
							name="description"
							value="<%=bean != null ? bean.getDescription() : ""%>"
							placeholder="enter course description">

					</td>

					<td style="color: red">

						<%=ServletUtility.getErrorMessage(
								"description", request)%>

					</td>

				</tr>


				<!-- Save -->

				<tr>

					<th></th>

					<td>

						<input type="submit"
							name="operation"
							value="<%=BaseCtl.OP_SAVE%>">

					</td>

				</tr>


			</table>

		</div>

	</form>


	<%@ include file="Footer.jsp"%>

</body>

</html>