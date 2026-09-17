<%@ page import="in.co.rays.proj4.util.MessageSource"%>
<%@ page import="in.co.rays.proj4.controller.ORSView"%>
<%@ page import="in.co.rays.proj4.bean.UserBean"%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>Header</title>

<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet">

</head>

<body>

	<%
	MessageSource ms = MessageSource.getInstance();

	UserBean userBean = (UserBean) session.getAttribute("user");
	String roleName = (String) session.getAttribute("role");

	boolean isLogin = userBean != null;

	String welcomeMsg = "Hi, ";
	String locale = ms.getLanguage();
	%>


	<!-- ================= NAVBAR ================= -->

	<nav class="navbar navbar-expand-lg navbar-dark bg-dark">

		<div class="container-fluid">

			<!-- LEFT SIDE -->

			<%
			if (isLogin) {
			%>

			<a class="navbar-brand fw-bold" href="#"> <%=welcomeMsg + userBean.getFirstName() + "(" + roleName + ")"%>
			</a>

			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarMenu"
				aria-controls="navbarMenu" aria-expanded="false"
				aria-label="Toggle navigation">

				<span class="navbar-toggler-icon"></span>

			</button>


			<div class="collapse navbar-collapse" id="navbarMenu">

				<ul class="navbar-nav me-auto mb-2 mb-lg-0">


					<!-- ================= ACADEMIC ================= -->

					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" role="button"
						data-bs-toggle="dropdown" aria-expanded="false"> Academic </a>

						<ul class="dropdown-menu">

							<li><a class="dropdown-item" href="<%=ORSView.COLLEGE_CTL%>">
									Add College </a></li>

							<li><a class="dropdown-item"
								href="<%=ORSView.COLLEGE_LIST_CTL%>"> College List </a></li>

							<li>
								<hr class="dropdown-divider">
							</li>

							<li><a class="dropdown-item" href="<%=ORSView.COURSE_CTL%>">
									Add Course </a></li>

							<li><a class="dropdown-item"
								href="<%=ORSView.COURSE_LIST_CTL%>"> Course List </a></li>

						</ul></li>


					<!-- ================= STUDENT ================= -->

					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" role="button"
						data-bs-toggle="dropdown" aria-expanded="false"> Student </a>

						<ul class="dropdown-menu">

							<li><a class="dropdown-item" href="<%=ORSView.STUDENT_CTL%>">
									Add Student </a></li>

							<li><a class="dropdown-item"
								href="<%=ORSView.STUDENT_LIST_CTL%>"> Student List </a></li>

							<li>
								<hr class="dropdown-divider">
							</li>

							<li><a class="dropdown-item" href="<%=ORSView.FACULTY_CTL%>">
									Add Faculty </a></li>

							<li><a class="dropdown-item"
								href="<%=ORSView.FACULTY_LIST_CTL%>"> Faculty List </a></li>

						</ul></li>


					<!-- ================= MODULES ================= -->

					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" role="button"
						data-bs-toggle="dropdown" aria-expanded="false"> Modules </a>

						<ul class="dropdown-menu">

							<li><a class="dropdown-item" href="<%=ORSView.ROLE_CTL%>">
									Add Role </a></li>

							<li><a class="dropdown-item"
								href="<%=ORSView.ROLE_LIST_CTL%>"> Role List </a></li>

							<li>
								<hr class="dropdown-divider">
							</li>

							<li><a class="dropdown-item" href="<%=ORSView.USER_CTL%>">
									Add User </a></li>

							<li><a class="dropdown-item"
								href="<%=ORSView.USER_LIST_CTL%>"> User List </a></li>

							<li>
								<hr class="dropdown-divider">
							</li>

							<li><a class="dropdown-item"
								href="<%=ORSView.MARKSHEET_CTL%>"> Add Marksheet </a></li>

							<li><a class="dropdown-item"
								href="<%=ORSView.MARKSHEET_LIST_CTL%>"> Marksheet List </a></li>

							<li>
								<hr class="dropdown-divider">
							</li>

							<li><a class="dropdown-item" href="<%=ORSView.SUBJECT_CTL%>">
									Add Subject </a></li>

							<li><a class="dropdown-item"
								href="<%=ORSView.SUBJECT_LIST_CTL%>"> Subject List </a></li>

						</ul></li>


					<!-- ================= LOGOUT ================= -->

					<li class="nav-item"><a class="nav-link text-danger fw-bold"
						href="<%=ORSView.LOGIN_CTL%>?operation=logout"> Logout </a></li>

				</ul>


				<!-- ================= LANGUAGE ================= -->

				<form class="d-flex me-3" style="margin: 0;">

					<select name="lang" class="form-select"
						onchange="this.form.submit()">

						<option value="en" <%=("en".equals(locale)) ? "selected" : ""%>>
							English</option>

						<option value="hi" <%=("hi".equals(locale)) ? "selected" : ""%>>
							Hindi</option>

					</select>

				</form>


				<!-- ================= RAYS LOGO ================= -->

				<div class="d-flex align-items-center">

					<img src="<%=ORSView.APP_CONTEXT%>/img/customLogo.jpg" width="175"
						height="70" class="img-fluid" alt="RAYS Logo">

				</div>

			</div>


			<%
			}

			if (!isLogin) {
			%>


			<!-- ================= GUEST ================= -->

			<a class="navbar-brand fw-bold" href="#"> Hi, Guest </a>

			<div class="collapse navbar-collapse">

				<ul class="navbar-nav me-auto">

					<li class="nav-item"><a class="nav-link fw-bold"
						href="<%=ORSView.WELCOME_CTL%>"> Welcome </a></li>

					<li class="nav-item"><a class="nav-link fw-bold"
						href="<%=ORSView.LOGIN_CTL%>"> Login </a></li>

					<li class="nav-item"><a class="nav-link fw-bold"
						href="<%=ORSView.USER_REGISTRATION_CTL%>"> SignUp </a></li>

				</ul>


				<!-- LANGUAGE -->

				<form class="d-flex me-3" style="margin: 0;">

					<select name="lang" class="form-select"
						onchange="this.form.submit()">

						<option value="en" <%=("en".equals(locale)) ? "selected" : ""%>>
							English</option>

						<option value="hi" <%=("hi".equals(locale)) ? "selected" : ""%>>
							Hindi</option>

					</select>

				</form>


				<!-- RAYS LOGO -->

				<div>

					<img src="<%=ORSView.APP_CONTEXT%>/img/customLogo.jpg" width="175"
						height="70" class="img-fluid" alt="RAYS Logo">

				</div>

			</div>


			<%
			}
			%>

		</div>

	</nav>


	<!-- Bootstrap JavaScript -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js">
		
	</script>


	<hr>

</body>

</html>