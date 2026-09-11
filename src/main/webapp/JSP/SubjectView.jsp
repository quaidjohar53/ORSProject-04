<%@page import="in.co.rays.proj4.util.ServletUtility"%>
<%@page import="in.co.rays.proj4.controller.BaseCtl"%>
<%@page import="in.co.rays.proj4.controller.ORSView"%>
<%@page import="in.co.rays.proj4.bean.SubjectBean"%>
<%@page import="in.co.rays.proj4.bean.CourseBean"%>
<%@page import="java.util.List"%>

<!DOCTYPE html>

<html>

<head>

<meta charset="ISO-8859-1">

<title>Add Subject</title>

</head>

<body>

	<%@ include file="Header.jsp"%>

	<%
	SubjectBean bean = (SubjectBean) request.getAttribute("bean");

	List<CourseBean> courseList = (List<CourseBean>) request.getAttribute("courseList");

	String _suc = ServletUtility.getSuccessMessage(request);

	String _err = ServletUtility.getErrorMessage(request);
	%>


	<form action="<%=ORSView.SUBJECT_CTL%>" method="post">


		<div align="center">

			<h1>Add Subject</h1>


			<h3 style="color: green">
				<%=_suc%>
			</h3>

			<h3 style="color: red">
				<%=_err%>
			</h3>


			<table>


				<!-- Subject Name -->

				<tr>

					<th>Name<font color="red">*</font>
					</th>

					<td><input type="text" name="name"
						value="<%=bean != null ? bean.getName() : ""%>"
						placeholder="enter subject name"></td>

					<td style="color: red"><%=ServletUtility.getErrorMessage("name", request)%></td>

				</tr>


				<!-- Course -->

				<tr>

					<th>Course<font color="red">*</font>
					</th>

					<td><select name="courseId">

							<option value="">Select Course</option>


							<%
							if (courseList != null) {

								for (CourseBean course : courseList) {
							%>


							<option value="<%=course.getId()%>"
								<%=bean != null && bean.getCourseId() == course.getId() ? "selected" : ""%>>

								<%=course.getName()%>

							</option>


							<%
							}
							}
							%>

					</select></td>

					<td style="color: red"><%=ServletUtility.getErrorMessage("courseId", request)%></td>

				</tr>


				<!-- Description -->

				<tr>

					<th>Description<font color="red">*</font>
					</th>

					<td><input type="text" name="description"
						value="<%=bean != null ? bean.getDescription() : ""%>"
						placeholder="enter subject description"></td>

					<td style="color: red"><%=ServletUtility.getErrorMessage("description", request)%></td>

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