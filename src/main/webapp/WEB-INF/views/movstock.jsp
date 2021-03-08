<!DOCTYPE html >
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv="Cache-Control" content="no-cache">
<meta http-equiv="Expires" content="sat, 01 Dec 2001 00:00:00 GMT">
<title> Gestion de stock| MOVEOFSTOCK</title>
<link href="static/css/bootstrap.min.css" rel="stylesheet">
<link href="static/css/style.css" rel="stylesheet">
<!--[if lt IE 9]>
      <script src="static/js/html5shiv.min.js"></script>
      <script src="static/js//respond.min.js"></script>
    <![endif]-->
<style>
    body {
  color: blue;
  background-image: url("Images/nature6.jpg");
}

</style>

</head>
<body>
	<div role="navigation">
		<div class="navbar navbar-inverse">
			<a href="/movstock" class="navbar-brand">Interface des Mouvements de stock</a>
			<div class="navbar-collapse collapse">
				<ul class="nav navbar-nav">
					<li><a href="/Log in">Accueil</a></li>
					<li><a href="/article">Gestion des articles</a></li>
					<li><a href="/registerMovstock">Ajout des stocks</a></li>
					<li><a href="/show-movstocks">Liste des movements de stock</a></li>
				</ul>
			</div>
		</div>
	</div>

	<c:choose>
		<c:when test="${mode=='MODE_MOVSTOCK' }">
			<div class="container" id="homediv">
				<div class="jumbotron text-center">
					<h1>Bienvenue à votre Espace GST</h1>
					<h3> Mouvement des Stocks</h3>
				</div>
			</div>

		</c:when>

		<c:when test="${mode=='MODE_REGISTER_MOVSTOCK' }">
			<div class="container text-center">
				<h3>Ajouter des stocks</h3>
				<hr>
				<form class="form-horizontal" method="POST" action="save-movstock">
					<input type="hidden" name="idMvtStk" value="${movstock.idMvtStk }" />
					<div class="form-group">
						<label class="control-label col-md-3">Date du mouvement du stock</label>
						<div class="col-md-7">
							<input type="date" class="form-control" name="dateMvt"
								value="${movstock.dateMvt }" />
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-3">Quantité</label>
						<div class="col-md-7">
							<input type="number" class="form-control" name="quantite"
								value="${movstock.quantite }" />
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-3">Type de Mouvement</label>
						<div class="col-md-7">
							<input type="number" class="form-control" name="typeMvt"
								value="${movstock.typeMvt }" />
						</div>
					</div>
			<div class="form-group" >
						<label class="control-label col-md-3">Article</label>
						<div class="col-md-7">
							<select class="form-control" id="listArticles" >
                                        	<c:forEach items="${articles }" var="article">
                                        	   <option value="${article.getIdArticle() }" selected >${article.getDesignation()}</option>
                                        	</c:forEach>
                                        
                                        </select>
                                       
						</div>
					</div>
				
					<div class="form-group ">
						<input type="submit" class="btn btn-primary" value="Register" />
						<input type="hidden" name="_csrf" value="${_csrf.token}"/>
					</div>
				</form>
			</div>
		</c:when>
		<c:when test="${mode=='MODE_ALL_MOVSTOCKS' }">
			<div class="container text-center" id="tasksDiv">
				<h3>Liste des mouvement de stock</h3>
				<hr>
				<div class="table-responsive">
					<table class="table table-striped table-bordered">
						<thead>
							<tr>
								<th>IdMovStock</th>
								<th>Date de mouvement</th>
								<th>Quantité</th>
								<th>Type de mouvement</th>
								<th>Article</th>
								<th>Delete</th>
								<th>Edit</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="movstock" items="${movstocks }">
								<tr>
									<td>${movstock.idMvtStk}</td>
									<td>${movstock.dateMvt}</td>
									<td>${movstock.quantite}</td>
									<td>${movstock.typeMvt}</td>
									<td>${movstock.getArticle().getDesignation()}</td>
									<td><a href="/delete-movstock?id=${movstock.idMvtStk }"><span
											class="glyphicon glyphicon-trash"></span></a></td>
									<td><a href="/edit-movstock?id=${movstock.idMvtStk }"><span
											class="glyphicon glyphicon-pencil"></span></a></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</c:when>

		<c:when test="${mode=='MODE_UPDATE_MOVSTOCK' }">
			<div class="container text-center">
				<h3>Update Moveofstock</h3>
				<hr>
				<form class="form-horizontal" method="POST" action="save-movstock">
					<input type="hidden" name="idMvtStk" value="${movstock.idMvtStk }" />
					<div class="form-group">
						<label class="control-label col-md-3">Code Categorie</label>
						<div class="col-md-7">
							<input type="date" class="form-control" name="dateMvt"
								value="${movstock.dateMvt }" />
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-3">Designation</label>
						<div class="col-md-7">
							<input type="number" class="form-control" name="quantite"
								value="${movstock.quantite }" />
						</div>
					</div>
				
					<div class="form-group">
						<label class="control-label col-md-3">Type de Mouvement Stock </label>
						<div class="col-md-3">
							<input type="number" class="form-control" name="typeMvt"
								value="${movstock.typeMvt }" />
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-3">Article </label>
					<div class="col-md-3">
							<select class="form-control" id="listArticles" >
                                        	<c:forEach items="${articles }" var="article">
                                        	   <option value="${article.getIdArticle() }" selected >${article.getDesignation()}</option>
                                        	</c:forEach>
                                        
                                        </select>
                                       
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