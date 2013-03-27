<%-- 
    Document   : restrito
    Created on : 07/02/2013, 18:46:45
    Author     : 30809169
--%>
<%@page import="mack.smh.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Restrito</title>
    </head>
    <body>
        <%
            String res = null;
            try {
                res = (String) session.getAttribute("logado");
            } catch (Exception e) {
                res = null;
            }

            if (res != null) {
                if (res.equals("Sim")) {
        %>Deslogado =)<%                    } else {
        %>Nao estava logado<%                        }
        } else {
                %>Houve um erro no sistema<%
        }
            
        %>
        <br>
        <form action="index.jsp">
            <input type="submit" value="voltar ao index">
        </form>
    </body>
</html>
