<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0">
    <xsl:template match="/">
        <head>
            <title>Relevés Bancaires</title>
        </head>
        <body>
            <h1 style = "text-align: center">Relevé bancaires</h1>
            <h3> RIB: <xsl:value-of select="releve/@RIB"/></h3>
            <ul>
                <li> Date: <xsl:value-of select="releve/dateReleve"/></li>
                <li> Solde totale: <xsl:value-of select="releve/solde"/></li>
            </ul>
            
            <table border = "1" width="80%" style="text-align: center">
                <tr>
                    <th>Type</th>
                    <th>Date</th>
                    <th>Montant</th>
                    <th>Description</th>
                </tr>
                
                <xsl:for-each select="releve/operations/operation">
                    <tr>
                        <td><xsl:value-of select="@type"/></td>
                        <td><xsl:value-of select="@date"/></td>
                        <td><xsl:value-of select="@montant"/></td>
                        <td><xsl:value-of select="@description"/></td>
                    </tr>    
                </xsl:for-each>
                <tr>
                    <td colspan="2">Total débit:</td>
                    <td><xsl:value-of select="sum(releve/operations/operation[@type = 'DEBIT']/@montant)"/></td>
                </tr>
                <tr>
                    <td colspan="2">Total crédit:</td>
                    <td><xsl:value-of select="sum(releve/operations/operation[@type = 'CREDIT']/@montant)"/></td>
                </tr>
            </table>
        </body>
    </xsl:template>
</xsl:stylesheet>