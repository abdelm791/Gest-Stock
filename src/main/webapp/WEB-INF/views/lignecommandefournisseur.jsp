<!DOCTYPE html >
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv="Cache-Control" content="no-cache">
<meta http-equiv="Expires" content="sat, 01 Dec 2001 00:00:00 GMT">
<title> GST /Ligne Commande Fournisseur</title>
<link href="static/css/bootstrap.min.css" rel="stylesheet">
<link href="static/css/style.css" rel="stylesheet">
<!--[if lt IE 9]>
      <script src="static/js/html5shiv.min.js"></script>
      <script src="static/js//respond.min.js"></script>
    <![endif]-->

</head>
<body>
	<div role="navigation">
		<div class="navbar navbar-inverse">
			<a href="/welcome" class="navbar-brand">Homepage</a>
			<div class="navbar-collapse collapse">
				<ul class="nav navbar-nav">
					<li><a href="/Log in">Accueil</a></li>
					<li><a href="/fournisseur">Gestion des Fournisseurs</a></li>
					<li><a href="/registerLigneCommandeFournisseur">Ajout des Ligne de Commandes Fournisseurd</a></li>
					<li><a href="/show-lignecommandefournisseurs">Liste des Lignes de Commandes Fournisseurs</a></li>
				</ul>
			</div>
		</div>
	</div>

	<c:choose>
		<c:when test="${mode=='MODE_LIGNECOMMANDEFOURNISSEUR' }">
			<div class="container" id="homediv">
				<div class="jumbotron text-center">
					<h1>Welcome to GST Webside</h1>
					<h3> LIGNE COMMANDE FOURNISSEUR</h3>
				</div>
			</div>

		</c:when>

		<c:when test="${mode=='MODE_REGISTER_LIGNECOMMANDEFOURNISSEUR' }">
			<div class="container text-center">
				<h3>Ajouter des Lignes Commandes Fournisseurs</h3>
				<hr>
				<form class="form-horizontal" method="POST" action="save-lignecommandefournisseur">
					<input type="hidden" name="idLigneCdeFrs" value="${lignecommandefournisseur.idLigneCdeFrs }" />
					<div class="form-group">
						<label class="control-label col-md-3">Article</label>
						<div class="col-md-7">
							<input type="text" class="form-control" name="article"
								value="${lignecommandefournisseur.article }" />
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-3">Commande Fournisseur</label>
						<div class="col-md-7">
							<input type="text" class="form-control" name="commandeFournisseur"
								value="${lignecommandefournisseur.commandeFournisseur }" />
						</div>
					</div>
					
					
					<div class="form-group ">
						<input type="submit" class="btn btn-primary" value="Register" />
						<input type="hidden" name="_csrf" value="${_csrf.token}"/>
					</div>
				</form>
			</div>
		</c:when>
		<c:when test="${mode=='ALL_LIGNECOMMANDEFOURNISSEURS' }">
			<div class="container text-center" id="tasksDiv">
				<h3>All Users</h3>
				<hr>
				<div class="table-responsive">
					<table class="table table-striped table-bordered">
						<thead>
							<tr>
								<th>IdLigneCommandeFournisseur</th>
								<th>Article</th>
								<th>Commande Fournisseur/th>
								<th>Delete</th>
								<th>Edit</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="lignecommandefournisseur" items="${lignecommandefournisseurs }">
								<tr>
									<td>${lignecommandefournisseur.idLigneCdeFrs}</td>
									<td>${lignecommandefournisseur.article}</td>
									<td>${lignecommandefournisseur.commandeFournisseur}</td>
									<td><a href="/delete-lignecommandefournisseur?id=${lignecommandefournisseur.idLigneCdeFrs }"><span
											class="glyphicon glyphicon-trash"></span></a></td>
									<td><a href="/edit-lignecommandefournisseur?id=${lignecommandefournisseur.idLigneCdeFrs }"><span
											class="glyphicon glyphicon-pencil"></span></a></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</c:when>

		<c:when test="${mode=='MODE_UPDATE_LIGNECOMMANDEFOURNISSEUR' }">
			<div class="container text-center">
				<h3>Update Ligne Commande Fournisseur</h3>
				<hr>
				<form class="form-horizontal" method="POST" action="save-lignecommandefournisseur">
					<input type="hidden" name="idLigneCdeFrs" value="${lignecommandefournisseur.idLigneCdeFrs }" />
					<div class="form-group">
						<label class="control-label col-md-3">Article</label>
						<div class="col-md-7">
							<input type="text" class="form-control" name="article"
								value="${lignecommandefournisseur.article }" />
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-3">Commande Fournisseur</label>
						<div class="col-md-7">
							<input type="text" class="form-control" name="commandeFournisseur"
								value="${lignecommandefournisseur.commandeFournisseur }" />
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