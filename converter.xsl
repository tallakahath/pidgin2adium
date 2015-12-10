<?xml version="1.0" encoding="UTF-8"?>


<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:adium="http://purl.org/net/ulf/ns/0.4-02">

	<xsl:template match="adium:event">
		<xsl:choose>
			<xsl:when test="@type = 'windowOpened'">
				<xsl:text>Conversation with WETWETHWEIUGTWIEUG at </xsl:text>
				<xsl:value-of select="translate(@time, 'T', ' ')"/>
				<xsl:text> on </xsl:text>
				<xsl:value-of select="@sender"/>
				<xsl:text> (</xsl:text>
				<xsl:value-of select="../@service"/>
				<xsl:text>) 
				</xsl:text>
			</xsl:when>
			<xsl:when test="@type = 'windowClosed'">
			</xsl:when>
			<xsl:otherwise>
				<xsl:text>(</xsl:text>
				<xsl:value-of select="substring-before(substring-after(@time, 'T'), '-')"/>
				<xsl:text>) </xsl:text>
				<xsl:value-of select="@type"/>
				<xsl:text>: </xsl:text>
				<xsl:value-of select="."/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<xsl:template match="adium:message">
		<xsl:text>(</xsl:text>
		<xsl:value-of select="substring-before(substring-after(@time, 'T'), '-')"/>
		<xsl:text>) </xsl:text>
		<xsl:value-of select="@sender"/>
		<xsl:text>: </xsl:text>
		<xsl:value-of select="."/>

	</xsl:template>
	

</xsl:stylesheet>