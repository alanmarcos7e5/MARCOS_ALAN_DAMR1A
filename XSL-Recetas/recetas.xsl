<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="/receptes">
        <!-- Mostramos todas las cabeceras-->
        <xsl:for-each select="recepta">
            <xsl:sort select="@fecha" data-type="text" order="descending"></xsl:sort>

            <article class="content-recetas">
                <img>

                    <xsl:attribute name="src">
                        <xsl:value-of select="informacio_general/foto" />
                    </xsl:attribute>

                    <xsl:attribute name="alt">
                        <xsl:value-of select="categoria" />
                    </xsl:attribute>
                </img>

                <a>
                    <xsl:attribute name="href">
                        detalle/<xsl:value-of select="informacio_general/enllaç" />
                    </xsl:attribute>
                    <xsl:value-of select="nom" />
                </a>
                <p class="fecha">
                    <xsl:value-of select="@fecha" />
                </p>
                <p>
                    <xsl:value-of select="informacio_general/resum" />
                </p>
            </article>
        </xsl:for-each>
    </xsl:template>
</xsl:stylesheet>