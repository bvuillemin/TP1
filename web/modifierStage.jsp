<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Ajout d'un stage </title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="css/main.css"/>

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
<A href="index.jsp" class="btn btn-sm btn-default">
    <span class="glyphicon glyphicon-home" aria-hidden="true"></span>
    <span class="glyphicon-class">Retour accueil</span>
</A>

<h3>Formulaire d'ajout d'un stage</h3>
<br>

<input type="hidden" name="uneErreur" value="${MesErreurs}" id="id_erreur">

<form class="form-horizontal" method="post" action="Controleur" onsubmit="return verif();">
    <fieldset>
        <input type="hidden" name="type" value="ajout" id="type"/>
        <input type="hidden" name="action" value="ajoutStage"/>
        <!-- input fields -->
        <div class="form-group">
            <label for="id" class="col-sm-4
             control-label">Numéro</label>
            <div class="col-sm-6">
                <input type="text" class="form-control" name="id" value="${id}" id="id">
            </div>
        </div>
        <div class="form-group">
            <label for="libelle" class="col-sm-4
             control-label">Libellé</label>
            <div class="col-sm-6">
                <input type="text" class="form-control" name="libelle" value="${libelle}" id="libelle">
            </div>
        </div>
        <div class="form-group">
            <label for="datedebut" class="col-sm-4
             control-label">Date de début du stage</label>
            <div class="col-sm-6">
                <input type="text" class="form-control" name="datedebut" value="${datedebut}" id="datedebut">
            </div>
        </div>
        <div class="form-group">
            <label for="datefin" class="col-sm-4
             control-label">Date de fin de stage</label>
            <div class="col-sm-6">
                <input type="text" class="form-control" name="datefin" value="${datefin}" id="datefin">
            </div>
        </div>
        <div class="form-group">
            <label for="nbplaces" class="col-sm-4
             control-label">Nombre de places</label>
            <div class="col-sm-6">
                <input type="text" class="form-control" name="nbplaces" value="${nbplaces}" id="nbplaces">
            </div>
        </div>
        <div class="form-group">
            <label for="nbinscrits" class="col-sm-4
             control-label">Nombre d'inscrits</label>
            <div class="col-sm-6">
                <input type="text" class="form-control" name="nbinscrits" value="${nbinscrits}" id="nbinscrits">
            </div>
        </div>
        <!-- Boutons Ajouter/Reset -->
        <div class="form-group">
            <button class="btn btn-lg btn-default" type="submit" name="ajouter" value="Ajouter">Ajouter</button>
            <button class="btn btn-lg btn-default" type="reset" name="reset" value="Reset">Reset</button>

        </div>
    </fieldset>
</form>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
</body>
</html>
