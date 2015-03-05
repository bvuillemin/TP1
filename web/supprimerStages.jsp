<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Suppression d'un stage dans la liste</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="../../../Downloads/TP1/web/WEB-INF/css/main.css"/>
</head>
<body>
<P><A href="index.jsp">Retour Accueil</A></P>

<P align="center">
    <STRONG>Listing&nbsp;des Stages</STRONG></P>

<TABLE BORDER="1">
    <CAPTION> Tableau des Stages</CAPTION>
    <TR>
        <TH> Numero</TH>
        <TH> Libellé</TH>
        <TH> Date début</TH>
        <TH> Date fin</TH>
        <TH>Nombre de places</TH>
        <TH>Nombre d'inscrits</TH>
        <TH>Supprimer</TH>
        <TH>Modifier</TH>
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
            <td><form method="post" action="Controleur" >
                    <input type="hidden" name="id" value="${item.id}" />
                    <input type="hidden" name="action" value="suppressionStage"/>
                 <input type="submit" name="delete" value="Delete"/>
                </form>
            </td>
            <td><form method="post" action="Controleur" >
                <input type="hidden" name="id" value="${item.id}" />
                <input type="hidden" name="action" value="modifierStage"/>
                <input type="submit" name="modifier" value="Modifier"/>
            </form>
            </td>

        </tr>
    </c:forEach>
</TABLE>

</body>
</html>
