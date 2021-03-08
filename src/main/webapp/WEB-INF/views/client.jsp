<!DOCTYPE html >
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv="Cache-Control" content="no-cache">
<meta http-equiv="Expires" content="sat, 01 Dec 2001 00:00:00 GMT">
<title> Gestion de stock| Client</title>
<link href="static/css/bootstrap.min.css" rel="stylesheet">
<link href="static/css/style.css" rel="stylesheet">
<!--[if lt IE 9]>
      <script src="static/js/html5shiv.min.js"></script>
      <script src="static/js//respond.min.js"></script>
    <![endif]-->
<style>
    body {
  color: black;
  background-image: url("Images/nature4.jpg");
}

</style>
</head>
<body>
	<div role="navigation">
		<div class="navbar navbar-inverse">
			<a href="/client" class="navbar-brand">Interface Client</a>
			<div class="navbar-collapse collapse">
				<ul class="nav navbar-nav">
				   <li><a href="/Log in">Accueil</a></li>
					<li><a href="/registerClient">Ajouter des Clients</a></li>
					<li><a href="/show-clients">Liste des Clients</a></li>
				</ul>
			</div>
		</div>
	</div>

	<c:choose>
		<c:when test="${mode=='MODE_CLIENT' }">
			<div class="container" id="homediv">
				<div class="jumbotron text-center">
					<h1>Bienvenue à votre Espace GST</h1>
					<h3> Gestion des Clients</h3>
				</div>
			</div>

		</c:when>

		<c:when test="${mode=='MODE_REGISTER_CLIENT' }">
			<div class="container text-center">
				<h3>New Registration Clients</h3>
				<hr>
				<form class="form-horizontal" method="POST" action="save-client">
					<input type="hidden" name="id" value="${client.idClient }" />
					<div class="form-group">
						<label class="control-label col-md-3">Nom</label>
						<div class="col-md-7">
							<input type="text" class="form-control" name="Nom"
								value="${client.nom }" />
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-3">Prenom</label>
						<div class="col-md-7">
							<input type="text" class="form-control" name="Prenom"
								value="${client.prenom }" />
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-3">Adresse</label>
						<div class="col-md-7">
							<input type="text" class="form-control" name="Adresse"
								value="${client.adresse }" />
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-3">Email </label>
						<div class="col-md-3">
							<input type="text" class="form-control" name="Email"
								value="${client.email }" />
						</div>
					</div>
				
					<div class="form-group ">
						<input type="submit" class="btn btn-primary" value="Register" />
						<input type="hidden" name="_csrf" value="${_csrf.token}"/>
					</div>
				</form>
			</div>
		</c:when>
		<c:when test="${mode=='ALL_CLIENTS' }">
			<div class="container text-center" id="tasksDiv">
				<h3>List of Clients</h3>
				<hr>
				<div class="table-responsive">
					<table class="table table-striped table-bordered">
						<thead>
							<tr>
								<th>IdClient</th>
								<th>Nom</th>
								<th>Prenom</th>
								<th>Adresse</th>
								<th>Email</th>
								<th>Delete</th>
								<th>Edit</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="client" items="${clients }">
								<tr>
									<td>${client.idClient}</td>
									<td>${client.nom}</td>
									<td>${client.prenom}</td>
									<td>${client.adresse}</td>
									<td>${client.email}</td>
									<td><a href="/delete-client?id=${client.idClient }"><span
											class="glyphicon glyphicon-trash"></span></a></td>
									<td><a href="/edit-client?id=${client.idClient }"><span
											class="glyphicon glyphicon-pencil"></span></a></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</c:when>

		<c:when test="${mode=='MODE_UPDATE_CLIENT' }">
			<div class="container text-center">
				<h3>Update Client</h3>
				<hr>
				<form class="form-horizontal" method="POST" action="save-client">
					<input type="hidden" name="id" value="${client.idClient }" />
					<div class="form-group">
						<label class="control-label col-md-3">Nom</label>
						<div class="col-md-7">
							<input type="text" class="form-control" name="nom"
								value="${client.nom }" />
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-3">Prenom</label>
						<div class="col-md-7">
							<input type="text" class="form-control" name="prenom"
								value="${client.prenom }" />
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-3">Adresse</label>
						<div class="col-md-7">
							<input type="text" class="form-control" name="adresse"
								value="${client.adresse }" />
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-3">Email </label>
						<div class="col-md-3">
							<input type="text" class="form-control" name="email"
								value="${client.email }" />
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