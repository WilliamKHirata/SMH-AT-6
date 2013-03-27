<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/">
<html>
<body>
<h2>Mensagens com xsl para o IE</h2>
<table border="1">
        <xsl:for-each select="msg/mensagem">
	<tr>
		<td align="left">Titulo</td><td><xsl:value-of select="titulo"/></td>
        </tr>
        <tr>
		<td align="left">Mensagem</td><td><xsl:value-of select="mensagem"/></td>
	</tr>
        <tr>
            <td colspan="2"></td>
        </tr>
        </xsl:for-each>
</table>
</body>
</html>
</xsl:template>
</xsl:stylesheet>