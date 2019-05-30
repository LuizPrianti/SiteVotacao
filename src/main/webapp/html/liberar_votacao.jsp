<%@page import="model.Eleitor"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<% 
    String contexto = request.getContextPath();
    if (!contexto.equals(""))
        contexto = contexto + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Liberar Vota�ao</title>
</head>
<body>
	
	<a href="/SiteVotacao">Sair</a>
	<a href="javascript:window.history.go(-1)">Voltar</a>
	<div>
	<% Eleitor e = (Eleitor)request.getSession().getAttribute("votacao"); 
	%>
	<form class="baseForm" action="LiberarVotacao.action" method="post">
		<h1>Liberar a Vota�ao</h1>
		<label>Digite o n�mero de Eleitor</label> <input type="text"
			id="titulo" name="titulo">

		<button id="myBtn">Habilitar</button>
		<% if (e != null){ %>
		<%if (e.getLiberado() == 1){ %>
			<p style="color:green;"> Cidadao <%= e.getNome() + " de t�tulo " + e.getTitulo() + " est� liberado para votar!" %></p>
		<% }else{%>
			<p style="color:red;"> Cidadao <%= e.getNome() + " de t�tulo " + e.getTitulo() + " est� impedido de votar por alguma razao!" %></p>
		<%}}else if (request.getParameter("titulo") != null){ %>
			<p style="color:red;"> Cidadao referente a esse t�tulo nao foi encontrado</p>
		<%} %>

	</form>
	</div>
</body>
</html>