<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>
<%@page import="java.util.Date,java.text.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Gestion des stages</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="css/main.css"/>
</head>
<body>
<H1> Gestion des Stages HIGH TECH </H1> <BR> <BR>

<H2> Nous sommes le <%= DateFormat.getDateTimeInstance(DateFormat.FULL, DateFormat.FULL).format(new Date()) %>
</H2>
<!-- Ancien Code de liste
<div id="menu">
  <ul>
      <li><a href="Controleur?action=saisieStage">Saisie d'un stage</a></li>
      <li><a href="Controleur?action=afficheStage">Affichage liste des stages</a></li>
      <li><a href="Controleur?action=rechercheStage">Recherche d'un stage</a></li>
  </ul>
</div>
-->
<dl class="dl-horizontal">
    <dt><a href="Controleur?action=saisieStage">Ajout</a></dt>
    <dd>Pour ajouter un stage dans la base</dd>
    <dt><a href="Controleur?action=afficheStage">Affichage</a></dt>
    <dd>Pour voir la liste de tous les stages et agir dessus</dd>
    <dt><a href="Controleur?action=rechercheStage">Recherche</a></dt>
    <dd>Pour rechercher un stage</dd>
</dl>

<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
</body>
</html> 
