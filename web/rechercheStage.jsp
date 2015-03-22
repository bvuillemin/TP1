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
<P><A href="index.jsp" class="btn btn-info">Retour Accueil</A></P>

<h3>Recherche d'un Stage</h3>
<input type="hidden" name="uneErreur" value="${MesErreurs}" id="id_erreur">

<form method="post" action="Controleur?action=chercheStage">
    <input class="input-medium search-query" type="text" name="recherche" id="recherche"/>
    <button class="btn" type="submit" name="rechercher" value="Rechercher">Rechercher</button>
</form>
<c:if test="${resultats != null}">
    <TABLE class="table table-hover">
        <CAPTION> Résultat de la recherche pour "<c:out value="${resultats}"></c:out>"</CAPTION>
        <TR>
            <TH>Numéro</TH>
            <TH>Libellé</TH>
            <TH>Date début</TH>
            <TH>Date fin</TH>
            <TH>Nombre de places</TH>
            <TH>Nombre d'inscrits</TH>
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

            </tr>
        </c:forEach>
    </TABLE>
</c:if>
</body>
</html>
