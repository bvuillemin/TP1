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
        <div class="panel panel-default">
            <input type="hidden" name="type" value="ajout" id="type"/>
            <input type="hidden" name="action" value="ajoutStage"/>
            <!-- input fields -->
            <div class="panel-body">
                <div class="form-group">
                    <label for="id" class="col-sm-4 control-label">Numéro</label>

                    <div class="col-sm-6">
                        <input type="number" class="form-control" name="id" value="${stage.id}" id="id" required>
                    </div>
                </div>
                <div class="form-group">
                    <label for="libelle" class="col-sm-4 control-label">Libellé</label>

                    <div class="col-sm-6">
                        <input type="text" class="form-control" name="libelle" value="${stage.libelle}" id="libelle"
                               required>
                    </div>
                </div>
                <div class="form-group">
                    <label for="datedebut" class="col-sm-4 control-label">Date de début du stage</label>

                    <div class="col-sm-6">
                        <input type="text" class="form-control" name="datedebut" value="${stage.datedebut}"
                               id="datedebut"
                               required>
                    </div>
                </div>
                <div class="form-group">
                    <label for="datefin" class="col-sm-4 control-label">Date de fin de stage</label>

                    <div class="col-sm-6">
                        <input type="text" class="form-control" name="datefin" value="${stage.datefin}" id="datefin"
                               required>
                    </div>
                </div>
                <div class="form-group">
                    <label for="nbplaces" class="col-sm-4 control-label">Nombre de places</label>

                    <div class="col-sm-6">
                        <input type="number" class="form-control" name="nbplaces" value="${stage.nbplaces}" id="nbplaces"
                               required>
                    </div>
                </div>
                <div class="form-group">
                    <label for="nbinscrits" class="col-sm-4 control-label">Nombre d'inscrits</label>

                    <div class="col-sm-6">
                        <input type="number" class="form-control" name="nbinscrits" value="${stage.nbinscrits}"
                               id="nbinscrits" required>
                    </div>
                </div>
            </div>
            <!-- Boutons Ajouter/Reset -->
            <div class="panel-footer clearfix">
                <div class="form-group">
                    <button class="btn btn-lg btn-default" type="submit" name="ajouter" value="Ajouter">Ajouter</button>
                    <button class="btn btn-lg btn-default" type="reset" name="reset" value="Reset">Reset</button>
                </div>
            </div>
        </div>
    </fieldset>

</form>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
</body>
</html>
