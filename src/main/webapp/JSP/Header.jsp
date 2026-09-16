<%@page import="in.co.rays.proj4.controller.ORSView"%>
<%@page import="in.co.rays.proj4.bean.UserBean"%>

<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>ORS</title>


<!-- Bootstrap CSS -->
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


	<!-- ================= NAVBAR ================= -->

	<nav class="navbar navbar-dark bg-dark navbar-expand-lg">

		<div class="container-fluid">





			<!-- ================= MOBILE BUTTON ================= -->

			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarContent"
				aria-controls="navbarContent" aria-expanded="false"
				aria-label="Toggle navigation">

				<span class="navbar-toggler-icon"></span>

			</button>


			<!-- ================= NAVBAR CONTENT ================= -->

			<div class="collapse navbar-collapse" id="navbarContent">


				<%
				if (isLogin) {
				%>


				<!-- ================= WELCOME ================= -->

				<span class="navbar-text text-white fw-bold me-4"> <%=welcomeMsg + userBean.getFirstName() + "(" + roleName + ")"%>

				</span>


				<!-- ================= ACADEMIC ================= -->

				<ul class="navbar-nav me-2">

					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" id="academicDropdown"
						role="button" data-bs-toggle="dropdown" aria-expanded="false">

							Academic </a>


						<ul class="dropdown-menu">


							<!-- College -->

							<li><a class="dropdown-item" href="<%=ORSView.COLLEGE_CTL%>">

									Add College </a></li>


							<li><a class="dropdown-item"
								href="<%=ORSView.COLLEGE_LIST_CTL%>"> College List </a></li>


							<li>
								<hr class="dropdown-divider">
							</li>


							<!-- Course -->

							<li><a class="dropdown-item" href="<%=ORSView.COURSE_CTL%>">

									Add Course </a></li>


							<li><a class="dropdown-item"
								href="<%=ORSView.COURSE_LIST_CTL%>"> Course List </a></li>


						</ul></li>

				</ul>


				<!-- ================= STUDENT ================= -->

				<ul class="navbar-nav me-2">

					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" id="studentDropdown"
						role="button" data-bs-toggle="dropdown" aria-expanded="false">

							Student </a>


						<ul class="dropdown-menu">


							<!-- Student -->

							<li><a class="dropdown-item" href="<%=ORSView.STUDENT_CTL%>">

									Add Student </a></li>


							<li><a class="dropdown-item"
								href="<%=ORSView.STUDENT_LIST_CTL%>"> Student List </a></li>


							<li>
								<hr class="dropdown-divider">
							</li>


							<!-- Faculty -->

							<li><a class="dropdown-item" href="<%=ORSView.FACULTY_CTL%>">

									Add Faculty </a></li>


							<li><a class="dropdown-item"
								href="<%=ORSView.FACULTY_LIST_CTL%>"> Faculty List </a></li>


						</ul></li>

				</ul>


				<!-- ================= MODULES ================= -->

				<ul class="navbar-nav me-2">

					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" id="modulesDropdown"
						role="button" data-bs-toggle="dropdown" aria-expanded="false">

							Modules </a>


						<ul class="dropdown-menu">


							<!-- Role -->

							<li><a class="dropdown-item" href="<%=ORSView.ROLE_CTL%>">

									Add Role </a></li>


							<li><a class="dropdown-item"
								href="<%=ORSView.ROLE_LIST_CTL%>"> Role List </a></li>


							<li>
								<hr class="dropdown-divider">
							</li>


							<!-- User -->

							<li><a class="dropdown-item" href="<%=ORSView.USER_CTL%>">

									Add User </a></li>


							<li><a class="dropdown-item"
								href="<%=ORSView.USER_LIST_CTL%>"> User List </a></li>


							<li>
								<hr class="dropdown-divider">
							</li>


							<!-- Marksheet -->

							<li><a class="dropdown-item"
								href="<%=ORSView.MARKSHEET_CTL%>"> Add Marksheet </a></li>


							<li><a class="dropdown-item"
								href="<%=ORSView.MARKSHEET_LIST_CTL%>"> Marksheet List </a></li>


							<li>
								<hr class="dropdown-divider">
							</li>


							<!-- Subject -->

							<li><a class="dropdown-item" href="<%=ORSView.SUBJECT_CTL%>">

									Add Subject </a></li>


							<li><a class="dropdown-item"
								href="<%=ORSView.SUBJECT_LIST_CTL%>"> Subject List </a></li>


						</ul></li>

				</ul>


				<!-- ================= LOGOUT ================= -->

				<a class="nav-link text-danger fw-bold ms-2"
					href="LoginCtl?operation=logout"> Logout </a>


				<%
				}
				%>


				<%
				if (!isLogin) {
				%>


				<!-- ================= GUEST ================= -->

				<span class="navbar-text text-white fw-bold me-4"> Hi, Guest

				</span> <a class="nav-link" href="<%=ORSView.WELCOME_CTL%>"> Welcome </a> <a
					class="nav-link" href="<%=ORSView.LOGIN_CTL%>"> Login </a> <a
					class="nav-link" href="<%=ORSView.USER_REGISTRATION_CTL%>">

					SignUp </a>


				<%
				}
				%>


				<!-- ================= RIGHT RAYS LOGO ================= -->

				<div class="ms-auto">

					<img src="<%=ORSView.APP_CONTEXT%>/img/customLogo.jpg" width="220"
						height="65" alt="RAYS Logo">

				</div>


			</div>

		</div>

	</nav>


	<hr>


	<!-- Bootstrap JavaScript -->

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
		crossorigin="anonymous">
		
	</script>


</body>

</html>