<!DOCTYPE html >
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv="Cache-Control" content="no-cache">
<meta http-equiv="Expires" content="sat, 01 Dec 2001 00:00:00 GMT">
<title> Gestion de stock| Commandes Clients</title>
<link href="static/css/bootstrap.min.css" rel="stylesheet">
<link href="static/css/style.css" rel="stylesheet">
<!--[if lt IE 9]>
      <script src="static/js/html5shiv.min.js"></script>
      <script src="static/js//respond.min.js"></script>
    <![endif]-->
<style>
    body {
  color: black;
  background-image: url("Images/nature3.jpg");
}

</style>

</head>
<body>
	<div role="navigation">
		<div class="navbar navbar-inverse">
			<a href="/commandeclient" class="navbar-brand">Gestion des Commandes Clients</a>
			<div class="navbar-collapse collapse">
				<ul class="nav navbar-nav">
				    <li><a href="/Log in">Accueil</a></li>
					<li><a href="/registerCommandeClient">Ajouter des commandes Clients</a></li>
					<li><a href="/show-commandeclients">Liste des Commandes Clients</a></li>
				</ul>
			</div>
		</div>
	</div>

	<c:choose>
		<c:when test="${mode=='MODE_COMMANDECLIENT' }">
			<div class="container" id="homediv">
				<div class="jumbotron text-center">
					<h1>Bienvenue à votre Espace GST</h1>
					<h3> Gestion des commandes des clients</h3>
				</div>
			</div>

		</c:when>

		<c:when test="${mode=='MODE_REGISTER_COMMANDECLIENT' }">
			<div class="container text-center">
				<h3>Ajouter des commandes clients</h3>
				<hr>
				<form class="form-horizontal" method="POST" action="save-commandeclient">
					<input type="hidden" name="id" value="${commandeclient.idCommandeClient }" />
					<div class="form-group">
						<label class="control-label col-md-3">Code</label>
						<div class="col-md-7">
							<input type="text" class="form-control" name="code"
								value="${commandeclient.code }" />
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-3">Date de Commande Client</label>
						<div class="col-md-7">
							<input type="date" class="form-control" name="dateCommande"
								value="${commandeclient.dateCommande }" />
						</div>
					</div>
					
					<div class="form-group" >
						<label class="control-label col-md-3">Client</label>
						<div class="col-md-7">
							<select class="form-control" id="listClients" >
                                        	<c:forEach items="${clients }" var="client">
                                        	   <option value="${client.getIdClient() }" selected >${client.getNom()}</option>
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
		<c:when test="${mode=='ALL_COMMANDECLIENTS' }">
			<div class="container text-center" id="tasksDiv">
				<h3>Liste des Commandes Clients</h3>
				<hr>
				<div class="table-responsive">
					<table class="table table-striped table-bordered">
						<thead>
							<tr>
								<th>IdCommandeClient</th>
								<th>Code</th>
								<th>Date de Commande Client</th>
								<th>Client</th>
								<th>Delete</th>
								<th>Edit</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="commandeclient" items="${commandeclients }">
								<tr>
									<td>${commandeclient.getIdCommandeClient()}</td>
									<td><c:out value="${commandeclient.getCode()}"/></td>
									<td><c:out value="${commandeclient.getDateCommande()}"/></td>
									<td><c:out value="${commandeclient.getClient().getNom()}"/></td>								
									<td><a href="/delete-commandeclient?id=${commandeclient.idCommandeClient }"><span
											class="glyphicon glyphicon-trash"></span></a></td>
									<td><a href="/edit-commandeclient?id=${commandeclient.idCommandeClient }"><span
											class="glyphicon glyphicon-pencil"></span></a></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
			
		</c:when>

		<c:when test="${mode=='MODE_UPDATE_COMMANDECLIENT' }">
			<div class="container text-center">
				<h3>Update CommandeClient</h3>
				<hr>
				<form class="form-horizontal" method="POST" action="save-commandeclient">
					<input type="hidden" name="id" value="${commandeclient.idCommandeClient }" />
					<div class="form-group">
						<label class="control-label col-md-3">Code</label>
						<div class="col-md-7">
							<input type="text" class="form-control" name="code"
								value="${commandeclient.code }" />
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-3">Date de Commande</label>
						<div class="col-md-7">
							<input type="date" class="form-control" name="dateCommande"
								value="${commandeclient.dateCommande }" />
						</div>
					</div>
				<div class="form-group">
						<label class="control-label col-md-3">Client</label>
						<div class="col-md-7">
							<select class="form-control" id="listClients">
                                        	<c:forEach items="${clients }" var="client">
                                        	   <option value="${client.idClient }">${client.nom}</option>
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