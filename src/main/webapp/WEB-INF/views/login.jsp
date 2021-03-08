<!DOCTYPE html >
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv="Cache-Control" content="no-cache">
<meta http-equiv="Expires" content="sat, 01 Dec 2001 00:00:00 GMT">
<title> Gestion de stock| home</title>
<link href="static/css/bootstrap.min.css" rel="stylesheet">
<link href="static/css/style.css" rel="stylesheet">
<!--[if lt IE 9]>
      <script src="static/js/html5shiv.min.js"></script>
      <script src="static/js//respond.min.js"></script>
    <![endif]-->

</head>
<body>
	<div role="navigation">
		<div class="navbar navbar-inverse bg-primary ">
			<a href="/Log in" class="navbar-brand ">Interface Utilisateur</a>
		
		</div>
	</div>

	<c:choose>
		<c:when test="${mode=='MODE_HOME' }">
			<div class="container" id="homediv">
				<div class="jumbotron text-center">
					<h1>Bienvenue à votre Espace GST </h1>
					<h3> Une application pour la gestion de stock</h3>
				</div>
			</div>
         <div class="container " id="homediv">
				<div class="jumbotron" style="background-color:hsla(290,60%,70%,0.3)" >
					<h2><a href="/categorie"  class="text-success" >Gestion des Catégories</a></h2>
					
					<h3><a class="btn btn-primary" data-toggle="collapse" href="/registerCategorie" role="button" aria-expanded="false" aria-controls="/registerCategorie">Ajouter des catégories</a> </h3>
					<h3><a class="btn btn-primary" data-toggle="collapse" href="/show-categories"role="button" aria-expanded="false" aria-controls="/show-categories">Liste des catégories</a></h3>
				
				<h2  class="text-success" >Gestion des Utilisateurs</h2>
				    <h3><a class="btn btn-primary" data-toggle="collapse" href="/register" role="button" aria-expanded="false" aria-controls="/register">Ajouter des nouveaux Utilisateurs</a></h3>
					<h3><a class="btn btn-primary" data-toggle="collapse" href="/show-users" role="button" aria-expanded="false" aria-controls="/show-users">Liste des Utilisateurs</a></h3>
				
				</div>
				
				
			</div>
			
		</c:when>

		

		<c:when test="${mode=='MODE_LOGIN' }">
			<div class="container text-center">
				<h3>User Login</h3>
				<hr>
				<form class="form-horizontal" method="POST" action="/login-user">
					<c:if test="${not empty error }">
						<div class= "alert alert-danger">
							<c:out value="${error }"></c:out>
							</div>
					</c:if>
					<div class="form-group">
						<label class="control-label col-md-3">Username</label>
						<div class="col-md-7">
							<input type="text" class="form-control" name="username"
								value="${user.username }" />
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-3">Password</label>
						<div class="col-md-7">
							<input type="password" class="form-control" name="password"
								value="${user.password }" />
						</div>
					</div>
					<div class="form-group ">
						<input type="submit" class="btn btn-primary" value="Login" />
						<input type="hidden" name="_csrf" value="${_csrf.token}"/>
					</div>
					</form>
					</div>
					</c:when>
	</c:choose>


	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	 <script src="static/js/bootstrap.min.js"></script>
      <script src="static/js/jquery-1.11.1.min.js"></script>
</body>
</html>