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
<h1>Formulaire d'ajout d'un stage</h1>
<br>

<input type="hidden" name="uneErreur" value="${MesErreurs}" id="id_erreur">

<form method="post" action="Controleur" onsubmit="return verif();">
    <input type="hidden" name="type" value="ajout" id="type"/>
    <input type="hidden" name="action" value="modifierStage"/>
    <table>
        <!-- input fields -->
        <tr>
            <td>Numéro</td>
            <td><input type="text" name="id" value="${id}" id="id"/></td>
        </tr>
        <tr>
            <td>Libellé</td>
            <td><input type="text" name="libelle" value="${libelle}" id="libelle"/></td>
        </tr>
        <tr>
            <td>Date de début du stage</td>
            <td><input type="text" name="datedebut" value="${datedebut}" id="datedebut"/></td>
        </tr>
        <tr>
            <td>Date de fin de stage</td>
            <td><input type="text" name="datefin" value="${datefin}" id="datefin"/></td>
        </tr>

        <tr>
            <td>Nombre de places</td>
            <td><input type="text" name="nbplaces" value="${nbplaces}" id="nbplaces"/></td>
        </tr>
        <tr>
            <td>Nombre d'inscrits</td>
            <td><input type="text" name="nbinscrits" value="${nbinscrits}" id="nbinscrits"/></td>
        </tr>
        <!-- Boutons Ajouter/Reset -->
        <tr>
            <td colspan="2">
                <input type="submit" name="editer" value="editer"/>
                &nbsp;&nbsp;
                <input type="reset" name="reset" value="Reset"/>
            </td>
        </tr>
    </table>
</form>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
</body>
</html>
