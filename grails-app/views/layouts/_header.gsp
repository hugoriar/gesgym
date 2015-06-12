%{--<%@ page import="org.control.ConfiguracionBytes" %>--}%
<header id="Header" class="jumbotron masthead">
    <div class="inner">
    %{--<div class="inner" style="background-image: url(./images/header.png) !important;">--}%
        <div class="container">
            <table style="width: 100%">
                <tr>
                    <td%{-- style="min-width: 50%"--}%>
                        %{--<img class="logo" src="${resource(dir:'images',file:'logo.png')}" alt="${meta(name:'app.name')}" />--}%
                        %{--<img class="logo" src="${session['logoEmpresa']?:ConfiguracionBytes.findByNombre('logoEmpresa', [cache: true])?.valor}"/>--}%
                        <img class="logo" src="${createLink(controller:'configuracionBytes', action:'avatar_image', id:"logoEmpresa")}"/>
                    </td>
                    <td style="text-align: right;/* max-width: 50%*/"><h1 class="title"><g:layoutTitle default="${meta(name: 'app.name')}"/></h1></td>
                </tr>
                </table>
        </div>
    </div>
</header>
