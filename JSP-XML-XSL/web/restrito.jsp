<%-- 
    Document   : restrito
    Created on : 07/02/2013, 18:46:45
    Author     : 30809169
--%>
<%@page import="java.util.List"%>
<%@page import="mack.smh.Mensagem"%>
<%@page import="mack.smh.Usuario"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.io.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml"%>
<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Restrito</title>
    </head>
    <body>
        <%
            Usuario u = null;
            u = (Usuario) session.getAttribute("user");
        %>
        <h1>TA DENTRO! Bem vindo: <%=u.getLogin()%></h1>
        <form action="restrito.jsp">
            <h3>Inserir nova mensagem</h3>
            Titulo:<input type="text" name="titulo"><br>
            Mensagem:<input type="text" name="mensagem"><br>
            <input type="submit" value="inserir">
            
        </form>

        <%
            List<Mensagem> msg = null;
            msg = (List<Mensagem>) session.getAttribute("mensagens");
            out.println(msg.size());
            if (msg != null) {
                String strPath = getServletContext().getRealPath("example.xml");
                out.println(strPath);
                File strFile = new File(strPath);
                boolean fileCreated = strFile.createNewFile();
                Writer objWriter = new BufferedWriter(new FileWriter(strFile));
                objWriter.write("<?xml version=\"1.0\" encoding=\"ISO-8859-1\"?>");
                objWriter.write("\n<msg>");
                for (Mensagem msgIt : msg) {
                    objWriter.write("\n<mensagem>");
                    objWriter.write("\n<titulo>" + msgIt.getTitulo() + "</titulo>");
                    objWriter.write("\n<mensagem>" + msgIt.getMsg()+ "</mensagem>");
                    objWriter.write("\n</mensagem>");
                }
                objWriter.write("\n</msg>");
                objWriter.flush();
                objWriter.close();
                String meuXSL = "chromeForm.xsl";
                String ua = request.getHeader("User-Agent");
                boolean isIE = (ua != null && ua.indexOf("MSIE") != -1);
                if(isIE)
                {
                    meuXSL = "ieForm.xsl";
                }else
                {
                    meuXSL = "chromeForm.xsl";
                }
                request.setAttribute("xslFile", meuXSL);
        %> 

        <c:import url="/${xslFile}" var="xsltdoc" />
        <c:import url="/example.xml" var="xmldoc" />
        <x:transform xml="${xmldoc}" xslt="${xsltdoc}" />

        <%
            strFile.delete();
        } else {
        %>
        Erro na geracao do arquivo
        <%            }
        %>
        <br>
        <form action="logoff.jsp">
            <input type="submit" value="LogOff">
        </form>
    </body>
</html>
