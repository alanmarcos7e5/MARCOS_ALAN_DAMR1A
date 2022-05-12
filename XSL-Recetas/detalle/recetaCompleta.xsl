<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <!--Salía mal si ponía /receptes/recepta-->
    <!--Creaba otro html más al final, con los datos de las otras recetas-->
    <xsl:template match="/"> 
        <!--en la variable especifico el id-->
        <xsl:variable name="recetaId" select="recepta"></xsl:variable>
                
                <main class="receta">

                    <section class="descripcion">
                        <figure>
                            <!--Quizás podría crear un xsl:atribute para declarar el src-->
                            <img src="{concat('../',$recetaId/informacio_general/foto)}" alt="image description"/>
                        </figure>
                    
                        <article>
                            <h4>
                                <xsl:value-of select="$recetaId/nom"></xsl:value-of>
                            </h4>
                            <p>
                                <xsl:value-of select="$recetaId/informacio_general/resum"></xsl:value-of>
                            </p>
                        </article>
                    </section>

                    <!-- El atribute src debe ser declarado en xsl:attribute y colocarle un valor
                         que será obtenido del path info_general/enllac-->
                    <section class="video">
                        <iframe width="853" height="480" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen="true">
                        <xsl:attribute name="src"> <xsl:value-of select="$recetaId/informacio_general/enllac"/> </xsl:attribute>
                        </iframe>
                    </section>

                    <section class="ingredientes">
                        <h4>Ingredientes:</h4>
                        <ul>
                            <!--Aplico el template de ingredientes-->
                            <xsl:apply-templates select="$recetaId/ingredients"/>
                        </ul>
                    </section>

                    <section class="pasos">
                        <h4>Pasos:</h4>
                        <ol>
                            <!--Aplico el template de preparacion-->
                            <xsl:apply-templates select="$recetaId/preparacio"/>
                        </ol>
                    </section>
                    
                    <section class="descripcionFinal">
                        <p>Saludos y no olviden dejar sus comentarios <a href="../contacto/contacto.html">aquí!</a></p>
                    </section>
                    
                </main>
    </xsl:template>

    <xsl:template match="ingredients">
        <xsl:variable name="space" select="' '"></xsl:variable>
        <xsl:for-each select="ingredient">
            <li><a href=""></a>
                <xsl:value-of select="@quantitat"></xsl:value-of>
                <xsl:value-of select="$space"></xsl:value-of>
                <xsl:value-of select="@unitat"></xsl:value-of>
                <xsl:value-of select="$space"></xsl:value-of>
                <xsl:value-of select="text()"></xsl:value-of>
            </li><br></br>
        </xsl:for-each>
    </xsl:template>
    
    <xsl:template match="preparacio">
        <xsl:for-each select="pas">
            <li><a href=""></a>
                <xsl:value-of select="text()"></xsl:value-of>
            </li><br></br><br></br>
        </xsl:for-each>
    </xsl:template> 

</xsl:stylesheet>