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
		<div class="navbar navbar-inverse">
			<a href="/welcome" class="navbar-brand">Ligne Commande Client</a>
			<div class="navbar-collapse collapse">
				<ul class="nav navbar-nav">
					<li><a href="/Log in">Accueil</a></li>
					<li><a href="/client">Gestion de Client</a></li>
					<li><a href="/registerLigneCommandeClient">Ajout Ligne Commande Client</a></li>
					<li><a href="/show-lignecommandeclients">Liste des LignesCommandesClients</a></li>
				</ul>
			</div>
		</div>
	</div>

	<c:choose>
		<c:when test="${mode=='MODE_LIGNECOMMANDECLIENT' }">
			<div class="container" id="homediv">
				<div class="jumbotron text-center">
					<h1>Welcome to GST Webside</h1>
					<h3> LIGNE COMMANDES CLIENTS</h3>
				</div>
			</div>

		</c:when>

		<c:when test="${mode=='MODE_REGISTER_LIGNECOMMANDECLIENT' }">
			<div class="container text-center">
				<h3>Ajouter Ligne de Commande Client</h3>
				<hr>
				<form class="form-horizontal" method="POST" action="save-lignecommandeclient">
					<input type="hidden" name="ligneCommandeClient" value="${ligneCommandeClient.idLigneCdeClt }" />
					<div class="form-group">
						<label >Article</label>
						<select class="col-md-7"  id="listArticles">
                                        	<c:forEach items="${articles }" var="article">
                                        	  <option value="${ligneCommandeClient.getArticle().getIdArticle() }">${ligneCommandeClient.getArticle().geDesignation()}</option>
                                        	</c:forEach>
                                        
                                        </select>
					</div>
					<div class="form-group">
						<label class="control-label col-md-3">Commande Client</label>
						<div class="col-md-7">
							<input type="text" class="form-control" name="commandeClient"
								value="${ligneCommandeClient.commandeClient }" />
						</div>
					</div>
				
				
					<div class="form-group ">
						<input type="submit" class="btn btn-primary" value="Register" />
						<input type="hidden" name="_csrf" value="${_csrf.token}"/>
					</div>
				</form>
			</div>
		</c:when>
		<c:when test="${mode=='ALL_LIGNECOMMANDECLIENTS' }">
			<div class="container text-center" id="tasksDiv">
				<h3>Liste des Commandes Clients</h3>
				<hr>
				<div class="table-responsive">
					<table class="table table-striped table-bordered">
						<thead>
							<tr>
								<th>IdLiCmdClt</th>
								<th>Article</th>
								<th>Commande Client</th>					
								<th>Delete</th>
								<th>Edit</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="ligneCommandeClient" items="${ligneCommandeClients }">
								<tr>
									<td>${ligneCommandeClient.idLigneCdeClt}</td>
									<td>${ligneCommandeClient.getArticle().getDesignation()}</td>
									<td>${ligneCommandeClient.commandeClient}</td>
									<td><a href="/delete-lignecommandeclient?id=${ligneCommandeClient.idLigneCdeClt }"><span
											class="glyphicon glyphicon-trash"></span></a></td>
									<td><a href="/edit-lignecommandeclient?id=${ligneCommandeClient.idLigneCdeClt }"><span
											class="glyphicon glyphicon-pencil"></span></a></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</c:when>

		<c:when test="${mode=='MODE_UPDATE_LIGNECOMMANDECLIENT' }">
			<div class="container text-center">
				<h3>Update Ligne Commande Client</h3>
				<hr>
				<form class="form-horizontal" method="POST" action="save-ligneommandeclient">
					<input type="hidden" name="idLigneCdeClt" value="${ligneCommandeClient.idLigneCdeClt }" />
					<div class="form-group">
						<label >Article</label>
						<select class="form-control" id="listArticles">
                                        	<c:forEach items="${articles }" var="articles">
                                        	  <li> ${article.getDesignation()}</li>
                                        	</c:forEach>
                                        
                                        </select>
					</div>
					<div class="form-group">
						<label class="control-label col-md-3">Commande Client</label>
						<div class="col-md-7">
							<input type="text" class="form-control" name="commandeClient"
								value="${ligneCommandeClient.commandeClient }" />
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