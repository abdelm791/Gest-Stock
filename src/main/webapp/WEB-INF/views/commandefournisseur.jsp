<!DOCTYPE html >
<%@ page import = "java.io.*,java.util.*, javax.servlet.*" %>
<%@ page import="java.sql.*" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv="Cache-Control" content="no-cache">
<meta http-equiv="Expires" content="sat, 01 Dec 2001 00:00:00 GMT">
<title> GST /Commande Fournisseur</title>
<link href="static/css/bootstrap.min.css" rel="stylesheet">
<link href="static/css/style.css" rel="stylesheet">
<!--[if lt IE 9]>
      <script src="static/js/html5shiv.min.js"></script>
      <script src="static/js//respond.min.js"></script>
    <![endif]-->
 <style>
    body {
  color: green;
  background-image: url("Images/nature2.jpg");
}

</style>


</head>
<body>
	<div role="navigation">
		<div class="navbar navbar-inverse">
			<a href="/welcome" class="navbar-brand">Interface Commandes Fournisseurs</a>
			<div class="navbar-collapse collapse">
				<ul class="nav navbar-nav">
					<li><a href="/Log in">Accueil</a></li>
					<li><a href="/fournisseur">Gestion des Fournisseurs</a></li>
					<li><a href="/registerCommandeFournisseur">Ajout des Commandes Fournisseurs</a></li>
					<li><a href="/show-commandefournisseurs">Liste des Commandes Fournisseurs</a></li>
				</ul>
			</div>
		</div>
	</div>

	<c:choose>
		<c:when test="${mode=='MODE_COMMANDEFOURNISSEUR' }">
			<div class="container" id="homediv">
				<div class="jumbotron text-center">
					<h1>Bienvenue à votre Espace GST</h1>
					<h3> COMMANDE FOURNISSEUR</h3>
				</div>
			</div>

		</c:when>

		<c:when test="${mode=='MODE_REGISTER_COMMANDEFOURNISSEUR' }">
			<div class="container text-center">
				<h3>Ajouter des Commandes Fournisseurs</h3>
				<hr>
				<form class="form-horizontal" method="POST" action="save-commandefournisseur">
					<input type="hidden" name="idCommandeFournisseur" value="${commandefournisseur.idCommandeFournisseur }" />
					<div class="form-group">
						<label class="control-label col-md-3">Date de Commande</label>
						<div class="col-md-7">
							<input type="date" class="form-control" name="dateCommande"
								value="${commandefournisseur.dateCommande }" />
						</div>
					</div>
					<div class="form-group" >
						<label class="control-label col-md-3">Fournisseur</label>
						<div class="col-md-7">
							<select class="form-control" id="listFournisseurs" >
                                        	<c:forEach items="${fournisseurs }" var="fournisseur">
                                        	   <option value="${fournisseur.getIdFournisseur() }" selected >${fournisseur.getNom()}</option>
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
		<c:when test="${mode=='ALL_COMMANDEFOURNISSEURS' }">
			<div class="container text-center" id="tasksDiv">
				<h3>All Users</h3>
				<hr>
				<div class="table-responsive">
					<table class="table table-striped table-bordered">
						<thead>
							<tr>
								<th>IdCommandeFournisseur</th>
								<th>Date de Commande</th>
								<th>Fournisseur</th>
								<th>Delete</th>
								<th>Edit</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="commandefournisseur" items="${commandefournisseurs }">
								<tr>
									<td>${commandefournisseur.idCommandeFournisseur}</td>
									<td>${commandefournisseur.getDateCommande()}</td>
									<td>${commandefournisseur.getFournisseur().getNom()}</td>
									<td><a href="/delete-commandefournisseur?id=${commandefournisseur.idCommandeFournisseur }"><span
											class="glyphicon glyphicon-trash"></span></a></td>
									<td><a href="/edit-commandefournisseur?id=${commandefournisseur.idCommandeFournisseur }"><span
											class="glyphicon glyphicon-pencil"></span></a></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</c:when>

		<c:when test="${mode=='MODE_UPDATE_COMMANDEFOURNISSEUR' }">
			<div class="container text-center">
				<h3>Update Commande Fournisseur</h3>
				<hr>
				<form class="form-horizontal" method="POST" action="save-commandefournisseur">
					<input type="hidden" name="idCommandeFournisseur" value="${commandefournisseur.idCommandeFournisseur }" />
					<div class="form-group">
						<label class="control-label col-md-3">Date de commande</label>
						<div class="col-md-7">
							<input type="date" class="form-control" name="dateCommande"
								value="${commandefournisseur.getDateCommande() }" />
						</div>
					</div>
					<div class="form-group" >
						<label class="control-label col-md-3">Fournisseur</label>
						<div class="col-md-7">
							<select class="form-control" id="listFournisseurs" >
                                        	<c:forEach items="${fournisseurs }" var="fournisseur">
                                        	   <option value="${fournisseur.getIdFournisseur() }" selected >${fournisseur.getNom()}</option>
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
