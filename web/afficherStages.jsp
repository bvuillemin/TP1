<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Affichage des stages</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="css/main.css"/>
</head>
<body>
<P><A href="index.jsp" class="btn btn-info">Retour Accueil</A></P>

<h3>Listing des Stages</h3>

<TABLE class="table table-hover">
    <thead>
    <TR>
        <TH>Numero</TH>
        <TH>Libellé</TH>
        <TH>Date début</TH>
        <TH>Date fin</TH>
        <TH>Nombre de places</TH>
        <TH>Nombre d'inscrits</TH>
        <TH>Modifier</TH>
        <TH>Supprimer</TH>
    </TR>
    <thead>
    <tbody>
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
                <input class="btn btn-warning" type="submit" name="modifier" value="Modifier"/>
            </form>
        </td>
        <td>
            <form method="post" action="Controleur">
                <input type="hidden" name="id" value="${item.id}"/>
                <input type="hidden" name="action" value="suppressionStage"/>
                <input class="btn btn-danger" type="submit" name="delete" value="Delete"/>
            </form>
        </td>

    </tr>
    </c:forEach>
    <tbody>
</TABLE>

</body>
</html>
