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
<P><A href="index.jsp">Retour Accueil</A></P>

<P align="center"><STRONG>Recherche d'un Stage</STRONG></P>
<input type="hidden" name="uneErreur" value="${MesErreurs}" id="id_erreur">

<form method="post" action="Controleur?action=chercheStage">
    <input type="text" name="recherche" id="recherche"/>
    <input type="submit" name="rechercher" value="Rechercher"/>
</form>
<c:if test="${resultats != null}">
    <TABLE BORDER="1">
        <CAPTION> R�sultat de la recherche pour "<c:out value="${resultats}"></c:out>"</CAPTION>
        <TR>
            <TH>Num�ro</TH>
            <TH>Libell�</TH>
            <TH>Date d�but</TH>
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
