<!DOCTYPE html >
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv="Cache-Control" content="no-cache">
<meta http-equiv="Expires" content="sat, 01 Dec 2001 00:00:00 GMT">
<title>Gestion de stock| home</title>
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
			<a href="/login-user" class="navbar-brand">Votre Interface de gestion de stock</a>
			<div class="navbar-collapse collapse">
				<ul class="nav navbar-nav">
					<li><a href="/Log in">se connecter</a></li>
					<li><a href="/article">Gestion des articles</a></li>
					<li><a href="/vente">Gestion des ventes</a></li>
					<li><a href="/client">Gestion des clients</a></li>
					<li><a href="/fournisseur">Gestion des fournisseurs</a></li>
				</ul>
			</div>
		</div>
	</div>

	<div class="container" id="homediv">
		<div class="jumbotron text-center">
			<h1>Bienvenue à votre Espace GST</h1>
			<h3>   Gestion de stock </h3>
		</div>
	</div>

	<div class="container text-centered">
		<div class="alert alert-success">
			<h4>Gestion des articles</h4>
		</div>
		
		<h3><a class="btn btn-primary" data-toggle="collapse" href="/registerArticle" role="button" aria-expanded="false" aria-controls="/registerArticle">Ajouter des articles</a> </h3>
		<h3><a class="btn btn-primary" data-toggle="collapse" href="/show-articles"role="button" aria-expanded="false" aria-controls="/show-articles">Liste des articles</a></h3>
		
				
			<div class="alert alert-success">
			<h4>Gestion des Ventes</h4>
		</div>
		<h3><a class="btn btn-primary" data-toggle="collapse" href="/registerVente" role="button" aria-expanded="false" aria-controls="/registerVente">Ajouter des ventes</a> </h3>
		<h3><a class="btn btn-primary" data-toggle="collapse" href="/show-ventes"role="button" aria-expanded="false" aria-controls="/show-ventes">Liste des ventes</a></h3>
			<div class="alert alert-success">
			<h4>Gestion des Commandes</h4>
		</div>
		<h3><a class="btn btn-primary" data-toggle="collapse" href="/registerCommandeClient" role="button" aria-expanded="false" aria-controls="/registerCommandeClient">Gestion des commandes clients</a> </h3>
		<h3><a class="btn btn-primary" data-toggle="collapse" href="/registerCommandeFournisseur"role="button" aria-expanded="false" aria-controls="/registerCommandeFournisseur">Gestion des commandes fournisseurs</a></h3>
			<div class="alert alert-success">
			<h4>Gestion des Clients</h4>
		</div>
		<h3><a class="btn btn-primary" data-toggle="collapse" href="/registerClient" role="button" aria-expanded="false" aria-controls="/registerClient">Ajouter des clients</a> </h3>
		<h3><a class="btn btn-primary" data-toggle="collapse" href="/show-clients"role="button" aria-expanded="false" aria-controls="/show-clients">Liste des clients</a></h3>
			
			<div class="alert alert-success">
			<h4>Gestion des Fournisseurs</h4>
		</div>
		<h3><a class="btn btn-primary" data-toggle="collapse" href="/registerFournisseur" role="button" aria-expanded="false" aria-controls="/registerFournisseur">Ajouter des fournisseurs</a> </h3>
		<h3><a class="btn btn-primary" data-toggle="collapse" href="/show-fournisseurs"role="button" aria-expanded="false" aria-controls="/show-fournisseurs">Liste des fournisseurs</a></h3>
	</div>

	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	 <script src="static/js/bootstrap.min.js"></script>
      <script src="static/js/jquery-1.11.1.min.js"></script>
</body>
</html>