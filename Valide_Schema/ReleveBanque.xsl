<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0">
    <xsl:template match="/">
        <head>
            <title>Relevés Bancaires</title>
        </head>
        <body>
            <h1 style = "text-align: center">Relevé Bancaire</h1>
            <h3> RIB: <xsl:value-of select="releve/@RIB"/></h3>
            <ul>
                <li> Date: <xsl:value-of select="releve/dateReleve"/></li>
                <li> Solde totale: <xsl:value-of select="releve/solde"/></li>
                <li> De: <xsl:value-of select="releve/operations/@dateDebut"/></li>
                <li> A: <xsl:value-of select="releve/operations/@dateFin"/></li>
                <li> Type d'opération: Crédit</li>
            </ul>
            
            <table border = "1" width="80%" style="text-align: center">
                <tr>
                    <th>Date</th>
                    <th>Montant</th>
                    <th>Description</th>
                </tr>
                <xsl:for-each select="releve/operations/operation[@type = 'CREDIT']">
                    <tr>
                        <td><xsl:value-of select="@date"/></td>
                        <td><xsl:value-of select="@montant"/></td>
                        <td><xsl:value-of select="@description"/></td>
                    </tr>    
                </xsl:for-each>
            </table>
        </body>
    </xsl:template>
</xsl:stylesheet>