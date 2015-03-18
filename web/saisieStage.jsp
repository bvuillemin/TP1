<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Ajout d'un stage </title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="WEB-INF/css/main.css"/>

    <script language=javascript>
        function verif() {
            if (document.getElementById("id").value == "" ||
                    document.getElementById("libelle").value == "" ||
                    document.getElementById("datedebut").value == "" ||
                    document.getElementById("datefin").value == "") {
                alert("Un des champs n'est pas rempli !");
                return false;
            }
            else
                return true;
        }
        function Chargement() {
            var obj = document.getElementById("id_erreur");
            if (obj.value != '')
                alert('Erreur signalée  : "' + obj.value + "'");
        }
    </script>
</head>
<body onLoad="Chargement();">
<P><A href="index.jsp" class="btn btn-info">Retour Accueil</A></P>

<h3>Formulaire d'ajout d'un stage</h3>

<br>

<input type="hidden" name="uneErreur" value="${MesErreurs}" id="id_erreur">

<form class="form-horizontal" method="post" action="Controleur" onsubmit="return verif();">
    <fieldset>
        <input type="hidden" name="type" value="ajout" id="type"/>
        <input type="hidden" name="action" value="ajoutStage"/>
        <!-- input fields -->
        <div class="control-group">
            <label class="control-label" for="id">Numéro</label>

            <div class="controls">
                <input type="text" name="id" value="${stage.id}" id="id">
            </div>
        </div>
        <div class="control-group">
            <label class="control-label" for="libelle">Libellé</label>

            <div class="controls">
                <input type="text" name="libelle" value="${stage.libelle}" id="libelle">
            </div>
        </div>
        <div class="control-group">
            <label class="control-label" for="datedebut">Date de début du stage</label>

            <div class="controls">
                <input type="text" name="datedebut" value="${stage.datedebut}" id="datedebut">
            </div>
        </div>
        <div class="control-group">
            <label class="control-label" for="datefin">Date de fin de stage</label>

            <div class="controls">
                <input type="text" name="datefin" value="${stage.datefin}" id="datefin">
            </div>
        </div>
        <div class="control-group">
            <label class="control-label" for="nbplaces">Nombre de places</label>

            <div class="controls">
                <input type="text" name="nbplaces" value="${stage.nbplaces}" id="nbplaces">
            </div>
        </div>
        <div class="control-group">
            <label class="control-label" for="nbinscrits">Nombre d'inscrits</label>

            <div class="controls">
                <input type="text" name="nbinscrits" value="${stage.nbinscrits}" id="nbinscrits">
            </div>
        </div>
        <!-- Boutons Ajouter/Reset -->
        <button class="btn" type="submit" name="ajouter" value="Ajouter">Ajouter</button>
        <button class="btn" type="reset" name="reset" value="Reset">Reset</button>
    </fieldset>
</form>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
</body>
</html>
