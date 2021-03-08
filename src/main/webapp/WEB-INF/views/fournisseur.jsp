<!DOCTYPE html >
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv="Cache-Control" content="no-cache">
<meta http-equiv="Expires" content="sat, 01 Dec 2001 00:00:00 GMT">
<title> Gestion de stock| Fournisseur</title>
<link href="static/css/bootstrap.min.css" rel="stylesheet">
<link href="static/css/style.css" rel="stylesheet">
<!--[if lt IE 9]>
      <script src="static/js/html5shiv.min.js"></script>
      <script src="static/js//respond.min.js"></script>
    <![endif]-->
  <style>
    body {
  color: green;
  background-image: url("Images/nature1.jpg");
}

</style>

</head>
<body>
	<div role="navigation">
		<div class="navbar navbar-inverse">
			<a href="/fournisseur" class="navbar-brand">Interface Gestion de Fournisseurs</a>
			<div class="navbar-collapse collapse">
				<ul class="nav navbar-nav">
					<li><a href="/Log in">Accueil</a></li>
					<li><a href="/commandefournisseur">Gestion Commandes Fournisseur</a></li>
					<li><a href="/lignecommandefournisseur">Ligne Commandes Fournisseur</a></li>
					<li><a href="/registerFournisseur">Ajout des Fournisseurs</a></li>
					<li><a href="/show-fournisseurs">Liste des Fournisseurs</a></li>
				</ul>
			</div>
		</div>
	</div>

	<c:choose>
		<c:when test="${mode=='MODE_FOURNISSEUR' }">
			<div class="container" id="homediv">
				<div class="jumbotron text-center">
					<h1>Bienvenue à votre Espace GST</h1>
					<h3> Gestion des fournisseurs</h3>
				</div>
			</div>

		</c:when>

		<c:when test="${mode=='MODE_REGISTER_FOURNISSEUR' }">
			<div class="container text-center">
				<h3>Ajouter des fournisseurs</h3>
				<hr>
				<form class="form-horizontal" method="POST" action="save-fournisseur">
					<input type="hidden" name="idFournisseur" value="${fournisseur.idFournisseur }" />
					<div class="form-group">
						<label class="control-label col-md-3">Nom</label>
						<div class="col-md-7">
							<input type="text" class="form-control" name="nom"
								value="${fournisseur.nom }" />
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-3">Prenom</label>
						<div class="col-md-7">
							<input type="text" class="form-control" name="prenom"
								value="${fournisseur.prenom }" />
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-3">Adresse</label>
						<div class="col-md-7">
							<input type="text" class="form-control" name="adresse"
								value="${fournisseur.adresse }" />
						</div>
					</div>
				
					<div class="form-group">
						<label class="control-label col-md-3">Email</label>
						<div class="col-md-7">
							<input type="text" class="form-control" name="email"
								value="${fournisseur.email }" />
						</div>
					</div>
					
					<div class="form-group ">
						<input type="submit" class="btn btn-primary" value="Register" />
						<input type="hidden" name="_csrf" value="${_csrf.token}"/>
					</div>
				</form>
			</div>
		</c:when>
		<c:when test="${mode=='MODE_ALL_FOURNISSEURS' }">
			<div class="container text-center" id="tasksDiv">
				<h3>Liste des Fournisseurs</h3>
				<hr>
				<div class="table-responsive">
					<table class="table table-striped table-bordered">
						<thead>
							<tr>
							    <th>IdFournniseur</th>
								<th>Nom</th>
								<th>Prenom</th>
								<th>Adresse</th>
								<th>Email</th>
								<th>Delete</th>
								<th>Edit</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="fournisseur" items="${fournisseurs }">
								<tr>
                                    <td>${fournisseur.idFournisseur}</td>
									<td>${fournisseur.nom}</td>
									<td>${fournisseur.prenom}</td>
									<td>${fournisseur.adresse}</td>
									<td>${fournisseur.email}</td>
									<td><a href="/delete-fournisseur?id=${fournisseur.idFournisseur }"><span
											class="glyphicon glyphicon-trash"></span></a></td>
									<td><a href="/edit-fournisseur?id=${fournisseur.idFournisseur }"><span
											class="glyphicon glyphicon-pencil"></span></a></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</c:when>

		<c:when test="${mode=='MODE_UPDATE_FOURNISSEUR' }">
			<div class="container text-center">
				<h3>Update Fournisseur</h3>
				<hr>
				<form class="form-horizontal" method="POST" action="save-fournisseur">
					<input type="hidden" name="idFournisseur" value="${fournisseur.idFournisseur }" />
					<div class="form-group">
						<label class="control-label col-md-3">Nom</label>
						<div class="col-md-7">
							<input type="text" class="form-control" name="nom"
								value="${fournisseur.nom }" />
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-3">Prenom</label>
						<div class="col-md-7">
							<input type="text" class="form-control" name="prenom"
								value="${fournisseur.prenom }" />
						</div>
					</div>
				
					<div class="form-group">
						<label class="control-label col-md-3">Adresse </label>
						<div class="col-md-3">
							<input type="text" class="form-control" name="adresse"
								value="${fournisseur.adresse }" />
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-3">Email </label>
						<div class="col-md-3">
							<input type="text" class="form-control" name="email"
								value="${fournisseur.email }" />
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