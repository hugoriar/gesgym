<footer class="footer">
    <div class="container">
%{--        <div class="row">
            <div class="span2">
                <h4>Product</h4>
                <ul class="unstyled">
                    <li>
                        <i class="icon-home"></i>
                        <a href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a>
                    </li>
                    <li>
                        <i class="icon-eye-open"></i>
                        <a href="${createLink(uri: '/')}"><g:message code="default.tour.label"/></a>
                    </li>
                    <li>
                        <i class="icon-money"></i>
                        <a href="${createLink(uri: '/')}"><g:message code="default.pricing.label"/></a>
                    </li>
                    <li>
                        <i class="icon-comments"></i>
                        <a href="${createLink(uri: '/')}"><g:message code="default.faq.label"/></a>
                    </li>
                </ul>
            </div>

            <div class="span2">
                <h4>Company</h4>
                <ul class="unstyled">
                    <li>
                        <i class="icon-info-sign"></i>
                        <a href="${createLink(uri: '/about')}">
                            <g:message code="default.about.label"/>
                        </a>
                    </li>
                    <li>
                        <i class="icon-envelope"></i>
                        <a href="${createLink(uri: '/contact')}">
                            <g:message code="default.contact.label"/>
                        </a>
                    </li>
                </ul>
            </div>

            <div class="span8">
                <h4>Information</h4>

                <p>Designed and built with Twitter's <a href="http://twitter.github.com/bootstrap/"
                                                        target="_blank">Bootstrap</a>.
                Code licensed under the <a href="http://www.apache.org/licenses/LICENSE-2.0"
                                           target="_blank">Apache License v2.0</a>.
                Documentation licensed under <a href="http://creativecommons.org/licenses/by/3.0/">CC BY 3.0</a>.</p>

                <p>Icons from <a href="http://fortawesome.github.com/Font-Awesome">Font Awesome</a> and <a
                        href="http://glyphicons.com">Glyphicons Free</a>, licensed under <a
                        href="http://creativecommons.org/licenses/by/3.0/">CC BY 3.0</a>.</p>
            </div>
        </div>--}%
        <h4>Copyright</h4>

        %{--<p>This Web site may contain other proprietary notices and copyright information, the terms of which must be observed and followed.
        Information on this Web site may contain technical inaccuracies or typographical errors.
        Information may be changed or updated without notice.
        </p>--}%

        <p>Sistema desarrollado por Hugo Riveros para SPA Marcos Cafena
        </p>
        <ul class="unstyled">
            <li>
                <i class="icon-mobile-phone"></i>
                %{--<a href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a>--}%
                +56983168826
            </li>
            <li>
                <i class="icon-envelope-alt"></i>
                <a href="${createLink(url: 'mailto:hugoriar@gmail.com')}">hugoriar@gmail.com</a>
            </li>
            %{--<li>
                <i class="icon-money"></i>
                <a href="${createLink(uri: '/')}"><g:message code="default.pricing.label"/></a>
            </li>
            <li>
                <i class="icon-comments"></i>
                <a href="${createLink(uri: '/')}"><g:message code="default.faq.label"/></a>
            </li>--}%
        </ul>

        <p class="pull-right"><a href="#">Ir arriba</a></p>
    </div>
</footer>