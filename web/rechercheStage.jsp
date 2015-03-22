<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Recherche d'un stage</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="css/main.css"/>
</head>
<body>
<A href="index.jsp" class="btn btn-sm btn-default">
    <span class="glyphicon glyphicon-home" aria-hidden="true"></span>
    <span class="glyphicon-class">Retour accueil</span>
</A>
<h3>Recherche d'un Stage</h3>
<input type="hidden" name="uneErreur" value="${MesErreurs}" id="id_erreur">

<form method="post" class="recherche" action="Controleur?action=chercheStage">
    <input class="input-medium search-query" type="text" name="recherche" id="recherche"/>
    <button class="btn" type="submit" name="rechercher" value="Rechercher">Rechercher</button>
</form>


<c:if test="${resultats != null}">
    <TABLE class="table table-striped">
        <CAPTION> Résultat de la recherche pour "<c:out value="${resultats}"></c:out>"</CAPTION>
        <TR>
            <TH class="perso">Numéro</TH>
            <TH class="perso">Libellé</TH>
            <TH class="perso">Date début</TH>
            <TH class="perso">Date fin</TH>
            <TH class="perso">Nombre de places</TH>
            <TH class="perso">Nombre d'inscrits</TH>
            <TH class="perso">Modifier</TH>
            <TH class="perso">Supprimer</TH>
        </TR>

        <c:forEach items="${liste}" var="item">
            <tr>
                <td>${item.id}</td>
                <td>${item.libelle}</td>
                <td>
                    <fmt:formatDate type="both" dateStyle="short"
                                    timeStyle="short" value="${item.datedebut}" pattern="dd/MM/yyyy"/>
                </td>
                <td>
                    <fmt:formatDate type="both" dateStyle="short"
                                    timeStyle="short" value="${item.datefin}" pattern="dd/MM/yyyy"/>
                </td>

                <td>${item.nbplaces}</td>
                <td>${item.nbinscrits}</td>
                <td>
                    <form method="post" action="Controleur">
                        <input type="hidden" name="id" value="${item.id}"/>
                        <input type="hidden" name="libelle" value="${item.libelle}"/>
                        <input type="hidden" name="datedebut" value=
                                <fmt:formatDate type="both" dateStyle="short"
                                                timeStyle="short" value="${item.datedebut}" pattern="dd/MM/yyyy"/>/>
                        <input type="hidden" name="datefin" value=
                                <fmt:formatDate type="both" dateStyle="short"
                                                timeStyle="short" value="${item.datefin}" pattern="dd/MM/yyyy"/>/>
                        <input type="hidden" name="nbplaces" value="${item.nbplaces}"/>
                        <input type="hidden" name="nbinscrits" value="${item.nbinscrits}"/>
                        <input type="hidden" name="action" value="modifierStage"/>
                        <input class="btn btn-xs btn-default" type="submit" name="modifier" value="Modifier"/>
                    </form>
                </td>
                <td>
                    <form method="post" action="Controleur">
                        <input type="hidden" name="id" value="${item.id}"/>
                        <input type="hidden" name="action" value="suppressionStage"/>
                        <input class="btn btn-xs btn-default" type="submit" name="supprimer" value="Supprimer"/>
                    </form>
                </td>

            </tr>
        </c:forEach>
    </TABLE>
</c:if>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
</body>
</html>
