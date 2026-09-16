<%@page import="in.co.rays.proj4.controller.ORSView"%>
<%@page import="in.co.rays.proj4.bean.UserBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>ORS Project</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">

</head>

<body>

	<%
	UserBean userBean = (UserBean) session.getAttribute("user");
	String roleName = (String) session.getAttribute("role");
	boolean isLogin = userBean != null;
	String welcomeMsg = "Hi, ";
	%>


	<!-- Bootstrap Navbar -->
	<nav class="navbar navbar-dark bg-dark navbar-expand-lg">

		<div class="container-fluid">


			<!-- Logo -->
			<a class="navbar-brand" href="<%=ORSView.WELCOME_CTL%>"> <img
				src="<%=ORSView.APP_CONTEXT%>/img/customLogo.jpg" width="175"
				height="50">

			</a>


			<!-- Mobile Menu Button -->
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarNav"
				aria-controls="navbarNav" aria-expanded="false"
				aria-label="Toggle navigation">

				<span class="navbar-toggler-icon"></span>

			</button>


			<div class="collapse navbar-collapse" id="navbarNav">


				<%
				if (isLogin) {
				%>


				<!-- Logged In User -->
				<span class="navbar-text text-white me-3"> <b><%=welcomeMsg + userBean.getFirstName() + "(" + roleName + ")"%></b>

				</span>


				<ul class="navbar-nav">


					<!-- ================= ACADEMIC ================= -->

					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" id="academicDropdown"
						role="button" data-bs-toggle="dropdown" aria-expanded="false">

							Academic </a>


						<ul class="dropdown-menu" aria-labelledby="academicDropdown">

							<li><a class="dropdown-item" href="<%=ORSView.COLLEGE_CTL%>">

									Add College </a></li>

							<li><a class="dropdown-item"
								href="<%=ORSView.COLLEGE_LIST_CTL%>"> College List </a></li>


							<li><hr class="dropdown-divider"></li>


							<li><a class="dropdown-item" href="<%=ORSView.COURSE_CTL%>">

									Add Course </a></li>

							<li><a class="dropdown-item"
								href="<%=ORSView.COURSE_LIST_CTL%>"> Course List </a></li>

						</ul></li>



					<!-- ================= STUDENT ================= -->

					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" id="studentDropdown"
						role="button" data-bs-toggle="dropdown" aria-expanded="false">

							Student </a>


						<ul class="dropdown-menu" aria-labelledby="studentDropdown">


							<li><a class="dropdown-item" href="<%=ORSView.STUDENT_CTL%>">

									Add Student </a></li>


							<li><a class="dropdown-item"
								href="<%=ORSView.STUDENT_LIST_CTL%>"> Student List </a></li>


							<li><hr class="dropdown-divider"></li>


							<li><a class="dropdown-item" href="<%=ORSView.FACULTY_CTL%>">

									Add Faculty </a></li>


							<li><a class="dropdown-item"
								href="<%=ORSView.FACULTY_LIST_CTL%>"> Faculty List </a></li>

						</ul></li>



					<!-- ================= MODULES ================= -->

					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" id="modulesDropdown"
						role="button" data-bs-toggle="dropdown" aria-expanded="false">

							Modules </a>


						<ul class="dropdown-menu" aria-labelledby="modulesDropdown">


							<li><a class="dropdown-item" href="<%=ORSView.ROLE_CTL%>">

									Add Role </a></li>


							<li><a class="dropdown-item"
								href="<%=ORSView.ROLE_LIST_CTL%>"> Role List </a></li>


							<li><hr class="dropdown-divider"></li>


							<li><a class="dropdown-item" href="<%=ORSView.USER_CTL%>">

									Add User </a></li>


							<li><a class="dropdown-item"
								href="<%=ORSView.USER_LIST_CTL%>"> User List </a></li>


							<li><hr class="dropdown-divider"></li>


							<li><a class="dropdown-item"
								href="<%=ORSView.MARKSHEET_CTL%>"> Add Marksheet </a></li>


							<li><a class="dropdown-item"
								href="<%=ORSView.MARKSHEET_LIST_CTL%>"> Marksheet List </a></li>


							<li><hr class="dropdown-divider"></li>


							<li><a class="dropdown-item" href="<%=ORSView.SUBJECT_CTL%>">

									Add Subject </a></li>


							<li><a class="dropdown-item"
								href="<%=ORSView.SUBJECT_LIST_CTL%>"> Subject List </a></li>

						</ul></li>



					<!-- ================= LOGOUT ================= -->

					<li class="nav-item"><a class="nav-link text-danger"
						href="LoginCtl?operation=logout"> <b>Logout</b>

					</a></li>


				</ul>


				<%
				}
				%>



				<%
				if (!isLogin) {
				%>


				<ul class="navbar-nav">


					<li class="nav-item"><a class="nav-link"
						href="<%=ORSView.WELCOME_CTL%>"> <b>Welcome</b>

					</a></li>


					<li class="nav-item"><a class="nav-link"
						href="<%=ORSView.LOGIN_CTL%>"> <b>Login</b>

					</a></li>


					<li class="nav-item"><a class="nav-link"
						href="<%=ORSView.USER_REGISTRATION_CTL%>"> <b>SignUp</b>

					</a></li>


				</ul>


				<%
				}
				%>


			</div>

		</div>

	</nav>


	<hr>


	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
		crossorigin="anonymous">
		
	</script>

</body>

</html>