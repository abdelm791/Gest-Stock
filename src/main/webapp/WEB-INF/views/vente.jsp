<!DOCTYPE html >
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="f" %>
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
<style>
    body {
  color: white;
  background-image: url("Images/nature3.jpg");
}

</style>
</head>
<body>
	<div role="navigation">
		<div class="navbar navbar-inverse">
			<a href="/vente" class="navbar-brand">Gestion des Ventes</a>
			<div class="navbar-collapse collapse">
				<ul class="nav navbar-nav">
					<li><a href="/Log in">Accueil</a></li>
					<li><a href="/registerVente">Ajouter des Ventes</a></li>
					<li><a href="/show-ventes">Liste des Ventes</a></li>
				</ul>
			</div>
		</div>
	</div>

	<c:choose>
		<c:when test="${mode=='MODE_VENTE' }">
			<div class="container" id="homediv">
				<div class="jumbotron text-center" style="background-color:hsla(290,60%,70%,0.3)" >
					
					<h1 >Bienvenue à votre Espace GST</h1>
					<h3> Gestion des Ventes</h3>
				</div>
			
			</div>
			<div class="container" id="homediv">
				<div class="jumbotron" style="background-color:hsla(290,60%,70%,0.3)" >
					
					<h3 >Gestion des ventes</h3>
					
					
					<h3><a class="btn btn-primary" data-toggle="collapse" href="/registerVente" role="button" aria-expanded="false" aria-controls="/registerVente">Ajouter des ventes</a> </h3>
					<h3><a class="btn btn-primary" data-toggle="collapse" href="/show-ventes"role="button" aria-expanded="false" aria-controls="/show-ventes">Liste des ventes</a></h3>
				</div>
			</div>

		</c:when>

		<c:when test="${mode=='MODE_REGISTER_VENTE' }">
			<div class="container text-center">
				<h3>Ajouter des Ventes</h3>
				<hr>
				<form class="form-horizontal" method="POST" action="save-vente">
					<input type="hidden" name="idVente" value="${vente.idVente }" />
					<div class="form-group">
						<label class="control-label col-md-3">Code Vente</label>
						<div class="col-md-7">
							<input type="text" class="form-control" name="code"
								value="${vente.code }" />
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-3">Date de vente</label>
						<div class="col-md-7">
							<input type="date" class="form-control" name="dateVente"
								value="${vente.dateVente }" />
						</div>
					</div>
						<div class="form-group">
						<label class="control-label col-md-3">Ligne de ventes</label>
						<div class="col-md-7">
							<input type="text" class="form-control" name="ligneVentes"
								value="${vente.ligneVentes }" />
						</div>
					</div>
				
					<div class="form-group ">
						<input type="submit" class="btn btn-primary" value="Register" />
						<input type="hidden" name="_csrf" value="${_csrf.token}"/>
					</div>
				</form>
			</div>
		</c:when>
		<c:when test="${mode=='ALL_VENTES' }">
			<div class="container text-center" id="tasksDiv">
				<h3>Liste des Ventes</h3>
				<hr>
				<div class="table-responsive">
					<table class="table table-striped table-bordered">
						<thead>
							<tr>
								<th>IdArticle</th>
								<th>Code Vente</th>
								<th>Date de vente</th>
								<th>Delete</th>
								<th>Edit</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="vente" items="${ventes }">
								<tr>
									<td>${vente.idVente}</td>
									<td>${vente.code}</td>
									<td>${vente.dateVente}</td>
									<td><a href="/delete-vente?id=${vente.idVente }"><span
											class="glyphicon glyphicon-trash"></span></a></td>
									<td><a href="/edit-vente?id=${vente.idVente }"><span
											class="glyphicon glyphicon-pencil"></span></a></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</c:when>

		<c:when test="${mode=='MODE_UPDATE_VENTE' }">
			<div class="container text-center">
				<h3>Update Article</h3>
				<hr>
				<form class="form-horizontal" method="POST" action="save-vente">
					<input type="hidden" name="idVente" value="${vente.idVente }" />
					<div class="form-group">
						<label class="control-label col-md-3">Code Article</label>
						<div class="col-md-7">
							<input type="text" class="form-control" name="code"
								value="${vente.code }" />
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-3">Date de vente</label>
						<div class="col-md-7">
							<input type="text" class="form-control" name="dateVente"
								value="${vente.dateVente }" />
						</div>
					</div>
					
				
					<div class="form-group ">
						<input type="submit" class="btn btn-primary" value="Update" />
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