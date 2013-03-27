<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/">
<html>

<body>
<h2>Mensagens com xsl para o chrome</h2>
<table border="1">
	<tr bgcolor="#9acd32">
		<th align="left">Titulo</th>
		<th align="left">Mensagem</th>
	</tr>
        <xsl:for-each select="msg/mensagem">
	<tr>
		<td><xsl:value-of select="titulo"/></td>
		<td><xsl:value-of select="mensagem"/></td>
	</tr>
        </xsl:for-each>
</table>
</body>
</html>
</xsl:template>
</xsl:stylesheet>