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
  color: black;
  background-image: url("Images/texture.jpg");
}

</style>
</head>
<body>
	<div role="navigation">
		<div class="navbar navbar-inverse">
			<a href="/article" class="navbar-brand">Gestion des Articles</a>
			<div class="navbar-collapse collapse">
				<ul class="nav navbar-nav">
					<li><a href="/Log in">Accueil</a></li>
					<li><a href="/movstock">Mouvement des Stocks</a></li>
					<li><a href="/registerArticle">Ajouter des Articles</a></li>
					<li><a href="/show-articles">Liste des Articles</a></li>
				</ul>
			</div>
		</div>
	</div>

	<c:choose>
		<c:when test="${mode=='MODE_ARTICLE' }">
			<div class="container" id="homediv">
				<div class="jumbotron text-center">
					<h1>Bienvenue à votre Espace GST</h1>
					<h3> Gestion des Articles</h3>
				</div>
			</div>
			
			<div class="container" id="homediv">
				<div class="jumbotron" style="background-color:hsla(290,60%,70%,0.3)" >
					
					<h3 class="text-success">Gestion des mouvements de Stock</h3>
					
					
					<h3><a class="btn btn-primary" data-toggle="collapse" href="/registerMovStock" role="button" aria-expanded="false" aria-controls="/registerCategorie">Ajouter des mouvements de stock</a> </h3>
					<h3><a class="btn btn-primary" data-toggle="collapse" href="/show-movstocks"role="button" aria-expanded="false" aria-controls="/show-categories">Liste des mouvements de stock</a></h3>
				</div>
			</div>

		</c:when>

		<c:when test="${mode=='MODE_REGISTER_ARTICLE' }">
			<div class="container text-center">
				<h3>Ajouter des Articles</h3>
				<hr>
				<form class="form-horizontal" method="POST" action="save-article">
					<input type="hidden" name="idArticle" value="${article.idArticle }" />
					<div class="form-group">
						<label class="control-label col-md-3">Code Article</label>
						<div class="col-md-7">
							<input type="text" class="form-control" name="codeArticle"
								value="${article.codeArticle }" />
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-3">Designation</label>
						<div class="col-md-7">
							<input type="text" class="form-control" name="designation"
								value="${article.designation }" />
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-3">Prix Unitaire HT</label>
						<div class="col-md-7">
							<input type="number" class="form-control" name="prixUnitaireHT"
								value="${article.prixUnitaireHT }" />
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-3">Taux Tva </label>
						<div class="col-md-3">
							<input type="number" class="form-control" name="tauxTva"
								value="${article.tauxTva }" />
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-3">Prix Unitaire TTC</label>
						<div class="col-md-7">
							<input type="number" class="form-control" name="prixUnitaireTTC"
								value="${article.prixUnitaireTTC }" />
						</div>
					</div>
				
					<div class="form-group ">
						<input type="submit" class="btn btn-primary" value="Register" />
						<input type="hidden" name="_csrf" value="${_csrf.token}"/>
					</div>
				</form>
			</div>
		</c:when>
		<c:when test="${mode=='ALL_ARTICLES' }">
			<div class="container text-center" id="tasksDiv">
				<h3>Liste des Articles</h3>
				<hr>
				<div class="table-responsive">
					<table class="table table-striped table-bordered">
						<thead>
							<tr>
								<th>IdArticle</th>
								<th>Code Article</th>
								<th>Designation</th>
								<th>Prix Unitaire HT</th>
								<th>Taux Tva</th>
								<th>Prix Unitaire TTC</th>
								<th>Delete</th>
								<th>Edit</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="article" items="${articles }">
								<tr>
									<td>${article.idArticle}</td>
									<td>${article.codeArticle}</td>
									<td>${article.designation}</td>
									<td>${article.prixUnitaireHT}</td>
									<td>${article.tauxTva}</td>
									<td>${article.prixUnitaireTTC}</td>
									<td><a href="/delete-article?id=${article.idArticle }"><span
											class="glyphicon glyphicon-trash"></span></a></td>
									<td><a href="/edit-article?id=${article.idArticle }"><span
											class="glyphicon glyphicon-pencil"></span></a></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</c:when>

		<c:when test="${mode=='MODE_UPDATE_ARTICLE' }">
			<div class="container text-center">
				<h3>Update Article</h3>
				<hr>
				<form class="form-horizontal" method="POST" action="save-article">
					<input type="hidden" name="idArticle" value="${article.idArticle }" />
					<div class="form-group">
						<label class="control-label col-md-3">Code Article</label>
						<div class="col-md-7">
							<input type="text" class="form-control" name="codeArticle"
								value="${article.codeArticle }" />
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-3">Designation</label>
						<div class="col-md-7">
							<input type="text" class="form-control" name="designation"
								value="${article.designation }" />
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-3">Prix Unitaire HT</label>
						<div class="col-md-7">
							<input type="number" class="form-control" name="prixUnitaireHT"
								value="${article.prixUnitaireHT }" />
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-3">Taux Tva </label>
						<div class="col-md-3">
							<input type="number" class="form-control" name="tauxTva"
								value="${article.tauxTva }" />
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-3">Prix Unitaire TTC</label>
						<div class="col-md-7">
							<input type="number" class="form-control" name="prixUnitaireTTC"
								value="${article.prixUnitaireTTC }" />
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