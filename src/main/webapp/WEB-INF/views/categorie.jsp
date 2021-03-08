<!DOCTYPE html >
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv="Cache-Control" content="no-cache">
<meta http-equiv="Expires" content="sat, 01 Dec 2001 00:00:00 GMT">
<title> Gestion de stock| Categorie</title>
<link href="static/css/bootstrap.min.css" rel="stylesheet">
<link href="static/css/style.css" rel="stylesheet">
<!--[if lt IE 9]>
      <script src="static/js/html5shiv.min.js"></script>
      <script src="static/js//respond.min.js"></script>
    <![endif]-->
<style>
    body {
  color: black;
  background-image: url("Images/nature5.jpg");
}

</style>
</head>
<body>
	<div role="navigation">
		<div class="navbar navbar-inverse">
			<a href="/categorie" class="navbar-brand">Gestion des Catégories</a>
			<div class="navbar-collapse collapse">
				<ul class="nav navbar-nav">
					<li><a href="/welcome">Accueil</a></li>
					<li><a href="/registerCategorie">Ajout des catégories</a></li>
					<li><a href="/show-categories">Liste des catégories</a></li>
				</ul>
			</div>
		</div>
	</div>

	<c:choose>
		<c:when test="${mode=='MODE_CATEGORIE' }">
			<div class="container" id="homediv">
				<div class="jumbotron text-center">
					<h1>Bienvenue à votre Espace GST</h1>
					<h3> Gestion des catégories</h3>
				</div>
			</div>

		</c:when>

		<c:when test="${mode=='MODE_REGISTER_CATEGORIE' }">
			<div class="container text-center">
				<h3>Ajouter des catégories</h3>
				<hr>
				<form class="form-horizontal" method="POST" action="save-categorie">
					<input type="hidden" name="idCategorie" value="${categorie.idCategorie }" />
					<div class="form-group">
						<label class="control-label col-md-3">Code Categorie</label>
						<div class="col-md-7">
							<input type="text" class="form-control" name="codeCategorie"
								value="${categorie.codeCategorie }" />
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-3">Designation</label>
						<div class="col-md-7">
							<input type="text" class="form-control" name="designation"
								value="${categorie.designation }" />
						</div>
					</div>
					
				
				
					<div class="form-group ">
						<input type="submit" class="btn btn-primary" value="Register" />
						<input type="hidden" name="_csrf" value="${_csrf.token}"/>
					</div>
				</form>
			</div>
		</c:when>
		<c:when test="${mode=='ALL_CATEGORIES' }">
			<div class="container text-center" id="tasksDiv">
				<h3>Liste des Categories</h3>
				<hr>
				<div class="table-responsive">
					<table class="table table-striped table-bordered">
						<thead>
							<tr>
								<th>IdCategorie</th>
								<th>Code Categorie</th>
								<th>Designation</th>
								<th>Articles</th>
								<th>Delete</th>
								<th>Edit</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="categorie" items="${categories }">
								<tr>
									<td>${categorie.idCategorie}</td>
									<td>${categorie.codeCategorie}</td>
									<td>${categorie.designation}</td>
									<td>${article.articles}</td>
									<td><a href="/delete-categorie?id=${categorie.idCategorie }"><span
											class="glyphicon glyphicon-trash"></span></a></td>
									<td><a href="/edit-categorie?id=${categorie.idCategorie }"><span
											class="glyphicon glyphicon-pencil"></span></a></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</c:when>

		<c:when test="${mode=='MODE_UPDATE_CATEGORIE' }">
			<div class="container text-center">
				<h3>Update Catégorie</h3>
				<hr>
				<form class="form-horizontal" method="POST" action="save-categorie">
					<input type="hidden" name="idCategorie" value="${categorie.idCategorie }" />
					<div class="form-group">
						<label class="control-label col-md-3">Code Categorie</label>
						<div class="col-md-7">
							<input type="text" class="form-control" name="codeCategorie"
								value="${categorie.codeCategorie }" />
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-3">Designation</label>
						<div class="col-md-7">
							<input type="text" class="form-control" name="designation"
								value="${categorie.designation }" />
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