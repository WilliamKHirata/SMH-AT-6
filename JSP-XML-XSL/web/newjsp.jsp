<%@page import="mack.smh.Mensagem"%>
<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.io.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml"%>
<!DOCTYPE html> 
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <title>Insert title here</title>
    </head>
    <body>

        <%
            //Mensagem msg = null;
            //msg = (Mensagem) session.getAttribute("mensagens");
            //if (msg != null) {
            if(true){
                //File creation
                String strPath = getServletContext().getRealPath("example.xml");
                out.println(strPath);
                File strFile = new File(strPath);
                boolean fileCreated = strFile.createNewFile();
                //File appending
                Writer objWriter = new BufferedWriter(new FileWriter(strFile));
                objWriter.write("<?xml version=\"1.0\" encoding=\"ISO-8859-1\"?>");
                objWriter.write("\n<msg>");
                objWriter.write("\n<mensagem>");
                objWriter.write("\n<titulo>Teste</titulo>");
                objWriter.write("\n<mensagem>de mensagem</mensagem>");
                objWriter.write("\n</mensagem>");
                objWriter.write("\n</msg>");
                objWriter.flush();
                objWriter.close();

        %> 
        Written directly in jsp: ÆØÅ æøå aa
        <h3>xml transformed with jstl:</h3>
        <c:import url="/chromeForm.xsl" var="xsltdoc" />
        <c:import url="/example.xml" var="xmldoc" />
        <x:transform xml="${xmldoc}" xslt="${xsltdoc}" />

        <%
            strFile.delete();
        } else {
        %>
        Erro na geracao do arquivo
        <%            }
        %>
    </body>
</html>