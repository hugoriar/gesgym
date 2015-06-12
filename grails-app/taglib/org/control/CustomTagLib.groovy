package org.control

//import org.apache.commons.validator.UrlValidator
import org.codehaus.groovy.grails.validation.routines.UrlValidator
import org.codehaus.groovy.grails.validation.routines.RegexValidator

/**
 * General use custom tags.
 * Some are taken from http://www.grails.org/Contribute+a+Tag#checkBoxList
 */
class CustomTagLib {
    static namespace = 'custom'

    private static final Object helpBalloonLockable = new Object();
    private static long helpBalloonCount = 0L;

    def resources = { attrs ->
        ///@todo: should include our javascript and do setup here.
    }

    /**
     * Checkbox list that can be used as a more user-friendly alternative to a multiselect list box.
     * Usage:
     * To map the selected ids to corresponding domain objects,
     * an additional set method is required in the containing domain class:
     *       //  This additional setter is used to convert the checkBoxList string or string array
     *       //  of ids selected to the corresponding domain objects.
     *       public void setAssetSubItemsFromCheckBoxList(ids) {
     *           def idList = []
     *           if(ids instanceof String) {
     *                   if(ids.isInteger())
     *                       idList << ids.toInteger()
     *           }
     *           else {
     *               ids.each() {
     *                   if(it.isInteger())
     *                       idList << it.toInteger()
     *               }
     *           }
     *           this.assetSubItems = idList.collect { AssetSubItem.get( it ) }
     *       }
     *
     * Then a line in the controller:
     *      assetInstance.setAssetSubItemsFromCheckBoxList(params.assetSubItems)
     *
     * Fields:
     *    name - the property name.
     *    from - the list to select from.
     *    value - the current value.
     *    optionKey - the key to use.
     *    sortBy - (optional) the attribute to sort the from list by.
     *    displayFields - (optional) defaults to the objects toString()
     *    displayFieldsSeparator - (optional) defaults to a space.
     *    linkController - (optional, requires linkAction.) the controller to use for a link to the objects in the checkBoxList.
     *    linkAction - (optional, requires linkController.) the action to use for a link to the objects in the checkBoxList.
     *
     * Example:
     *    <!--
     *    <custom:checkBoxList name="assetSubItems"
     *                                    from="${AssetSubItem.list()}"
     *                                    value="${assetInstance?.assetSubItems.collect{it.id}}"
     *                                    optionKey="id"
     *                                    sortBy="description"
     *                                    displayFields="['id', 'name']"
     *                                    displayFieldsSeparator=', '
     *                                    linkController="assetSubItemDetailed"
     *                                    linkAction="show"/>
     *    -->
     *
     */

    def checkBoxList = {attrs, body ->

        def from = attrs.from
        def value = attrs.value
        def cname = attrs.name
        def isChecked, ht, wd, style, html

        def sortBy = attrs.sortBy
        def displayFields = attrs.displayFields
        def displayFieldsSeparator = attrs.displayFieldsSeparator ?: ' '
        def linkController = attrs.linkController
        def linkAction = attrs.linkAction

        def displayValue = " "

        // sets the style to override height and/or width if either of them
        // is specified, else the default from the CSS is taken
        style = "style='"
        if(attrs.height)
            style += "height:${attrs.height};"
        if(attrs.width)
            style += "width:${attrs.width};"
        if(style.length() == "style='".length())
            style = ""
        else
            style += "'" // closing single quote

        html = "<ul class='CheckBoxList' " + style + ">"

        out << html

        if(sortBy)
            from.sort { p1, p2 -> p1[sortBy].compareToIgnoreCase(p2[sortBy]) }

        from.each { obj ->

            displayValue = " "

            if(linkController && linkAction)
                displayValue += "<a href=\"${createLink(controller: linkController, action: linkAction, id: obj.id).encodeAsHTML()}\">"

            if(displayFields) {
                displayValue += displayFields.collect { obj[it] }.join(displayFieldsSeparator)
            }
            else displayValue += obj // use the obj's default toString()

            if(linkController && linkAction)
                displayValue += "</a>"

            // if we wanted to select the checkbox using a click anywhere on the label (also hover effect)
            // but grails does not recognize index suffix in the name as an array:
            // cname = "${attrs.name}[${idx++}]"
            // and put this inside the li: <label for='$cname'>...</label>

            isChecked = (value?.contains(obj."${attrs.optionKey}"))? true: false

            out << "<li>" << checkBox(name:cname, value:obj."${attrs.optionKey}", checked: isChecked) << displayValue << "</li>"
        }

        out << "</ul>"

    } // checkBoxList

    def sortableColumnWithImg = { attrs, body ->
        def writer = out
        if(!attrs.property)
            throwTagError("Tag [sortableColumn] is missing required attribute [property]")

//         if(!attrs.title && !attrs.titleKey)
//             throwTagError("Tag [sortableColumn] is missing required attribute [title] or [titleKey]")

        def property = attrs.remove("property")
        def action = attrs.action ? attrs.remove("action") : (actionName ?: "list")

        def defaultOrder = attrs.remove("defaultOrder")
        if(defaultOrder != "desc") defaultOrder = "asc"

        // current sorting property and order
        def sort = params.sort
        def order = params.order

        // add sorting property and params to link params
        def linkParams = [:]
        if(params.id) linkParams.put("id",params.id)
        if(attrs.params) linkParams.putAll(attrs.remove("params"))
        linkParams.sort = property

        // determine and add sorting order for this column to link params
        attrs.class = (attrs.class ? "${attrs.class} sortable" : "sortable")
        if(property == sort) {
            attrs.class = attrs.class + " sorted " + order
            if(order == "asc")
                linkParams.order = "desc"
            else
                linkParams.order = "asc"
        }
        else
            linkParams.order = defaultOrder

        // determine column title
//         def title = attrs.remove("title")
//         def titleKey = attrs.remove("titleKey")
//         if(titleKey) {
//             if(!title) title = titleKey
//             def messageSource = grailsAttributes.getApplicationContext().getBean("messageSource")
//             def locale = RCU.getLocale(request)
//
//             title = messageSource.getMessage(titleKey, null, title, locale)
//         }

        // Image.
        def img = "<img "
        def imgAttrs = [:]
        imgAttrs.src = attrs.remove("imgSrc")
        imgAttrs.alt = attrs.remove("imgAlt")
        imgAttrs.title = attrs.remove("imgTitle")
        imgAttrs.each { k, v ->
            if(v)
                img += "${k}=\"${v.encodeAsHTML()}\" "
        }
        img += "/>"

        writer << "<th "

        // process remaining attributes
        attrs.each { k, v ->
            writer << "${k}=\"${v.encodeAsHTML()}\" "
        }
        writer << ">${link(action:action, params:linkParams) { img } }"
        writer << "</th>"

    } // sortableColumnWithImg

//Beginning of the new Tags added at plugin version 0.9.5
    @Deprecated
    def jasperForm = {attrs, body ->
        if(!attrs['jasper']) {
            throw new Exception(message(code:"jasper.taglib.missingAttribute", args:'jasper'))
        }

        String jasperName = attrs['jasper']
        String jasperNameNoPunct = jasperName.replaceAll(/[^a-zA-Z0-9]/, '')
        String appPath = grailsAttributes.getApplicationUri(request)
        String webAppPath = appPath + pluginContextPath
        String id = attrs['id'] ?: ""
        String historialMembresiasInstanceId = attrs['historialMembresiasInstanceId'] ?: ""
        String reportName = attrs['name'] ?: ""
        String formClass = attrs['class'] ?: "jasperReport"
        String controller = attrs['controller'] ?: "jasper"
        String action = attrs['action'] ?: "";

        out << """
            <form class="${formClass}" name="${jasperName}" action="${appPath}/${controller}/${action}/${id}">
            <input type="hidden" name="_format" />
            <input type="hidden" name="_name" value="${reportName}" />
            <input type="hidden" name="_file" value="${jasperName}" />
            <input type="hidden" name="historialMembresiasInstanceId" value="${historialMembresiasInstanceId}" />
        """
        request['_jasperFormName'] = jasperNameNoPunct
        out << body()
        request.removeAttribute '_jasperFormName'
        out << renderJavascriptForForm(jasperNameNoPunct)
        out << "</form>"
    }

    protected String renderJavascriptForForm(jasperNameNoPunct) {
        // function gets a unique name in case this tag is repeated on the page
        """
      <script type="text/javascript">
        function submit_${jasperNameNoPunct}(link) {
          link.parentNode._format.value = link.title;
          link.parentNode.submit();
          return false;
        }
      </script>
        """
    }

    /**
     * Customised version of jasperButton as found in jaser plugin.
     * custom:jasperButtons is intended to be wrapped by g:jasperForm
     */
    def jasperButtons = {attrs ->
        if(!attrs['format']){throw new Exception(message(code:"jasper.taglib.missingAttribute", args:'format'))}
        if(!attrs['jasper']){throw new Exception(message(code:"jasper.taglib.missingAttribute", args:'jasper'))}
        String jasper = attrs['jasper']
        String buttonClass = attrs['class'] ?:  "jasperButton"
        String format = attrs['format'].toUpperCase()
        String text = attrs['text']
        String target= attrs['target']
        String heightAttr = attrs['height'] ? ' height="' + attrs['height'] + '"' : '' // leading space on purpose
        String imgSrc = attrs['imgSrc']
        String delimiter = attrs['delimiter'] ?: "|"
        String delimiterBefore = attrs['delimiterBefore'] ?: delimiter
        String delimiterAfter = attrs['delimiterAfter'] ?: delimiter

        out << '''
                    <script type="text/javascript">
                        function submit_jasperForm(name, fmt) {
                            var jasperForm = document.getElementsByName(name).item(0)
                            jasperForm._format.value = fmt;
                            jasperForm.submit();
                            return false;
                        }
                    </script>
                    '''

        out << delimiterBefore

        attrs['format'].toUpperCase().split(",").eachWithIndex { it, i ->
            if (i > 0) out << delimiter
//            imgSrc = g.resource(dir:'/images/buttons', file:imgSrc)
            def fmt = it.trim()
            out << """
                        <a href="#" class="${buttonClass}" target="${target}" title="${it.trim()}" onClick="return submit_jasperForm('${jasper}', '${fmt}')">
                        <img border="0" src="${g.resource(dir: 'images/buttons', file: imgSrc)}"${heightAttr} /></a>
                        """
        }

        out << delimiterAfter
    } // jasperButtons

    /**
     * Easily create a link from a hopeful url string.
     * If the supplied url is not considered a valid url the string is simply displayed.
     *
     * Fields:
     *  url - String url to use.
     *  body - If no body is supplied in the GSP then url.encodeAsHTML() is displayed.
     *
     * Example:
     * <!--
     * <custom:easyUrl url="${docRef.location}" />
     * -->
     */
    def easyUrl = {attrs, body ->

        def url = attrs.url

        def html

        body = body()
        if(!body)
            body = url.encodeAsHTML()

        html = "${body}"

        if(isURLValid(url)) {
            html = """
                        <a href="${url}">
                            ${html}
                        </a>
                        """
        }

        out << html
    }

    /**
     * Get a list of the machines assigned on a taskProcedureRevision.
     *
     * Fields:
     *  taskProcedureRevision - TaskProcedureRevision to use.
     *
     * Example:
     * <!--
     * <custom:taskProcedureMachines taskProcedureRevision="${taskInstance.taskProcedureRevision}" />
     * -->
     */
    def taskProcedureMachines = {attrs ->
        def taskProcedureRevision = attrs.taskProcedureRevision
        def machines = taskProcedureRevision.maintenanceActions.collect {it.assetSubItem.parentItem}.unique()
        out << machines.encodeAsHTML()
    }

    /**
     * Customised version of helpBalloon as found in help-balloon plugin.
     * This version can be used in ajax rendered templates where the original fails.
     *
     * Fields added:
     * iconId - Optional to specify the anchor elements id, by default an id is generated if iconSrc is supplied.
     * iconSrc - Optional to specify anchor image src, if not supplied no anchor image is output by the taglib.
     *
     * Example:
     * <!--
     * <custom:helpBalloon code="entry.date.done" iconSrc="${resource(plugin:'help-balloons', dir:'images', file:'balloon-icon.gif')}"/>
     * or
     * <a href="#" id="mynewanchor" onclick="return false;">this</a>
     * <custom:helpBalloon code="entry.date.done" iconId="mynewanchor" />
     * -->
     */
    def helpBalloon = {attrs, body ->
        def mb = new groovy.xml.MarkupBuilder(out)

        def title = attrs["title"]
        def content = attrs["content"]
        def code = attrs["code"]
        def suffix = attrs["suffix"] ?: ".help"
        def encodeAs = attrs["encodeAs"]
        def iconId = attrs["iconId"]
        def iconSrc =  attrs["iconSrc"]

        if (!title && code) title = g.message(code: code)
        if (!content && code) content = g.message(code: code + suffix)

        title = title ?: ""
        content = content ?: ""

        if (encodeAs) {
            switch (encodeAs.toUpperCase()) {

                case "HTML":
                    title = title.encodeAsHTML()
                    content = content.encodeAsHTML()
                    break

                case "XML":
                    title = title.encodeAsXML()
                    content = content.encodeAsXML()
                    break
            }
        }

        def num
        synchronized (helpBalloonLockable) {
            num = helpBalloonCount++;
        }

        if(iconSrc) {
            iconId = iconId ?: "customHb$num"
            mb.img(id: iconId, src: iconSrc)
        }

        def javascript = """var customHb$num = new HelpBalloon({
    title: '${title.encodeAsJavaScript()}',
    content: '${content.encodeAsJavaScript()}'"""

        if(iconId) {
            javascript +=""",
    icon: \$('$iconId')"""
        }

        javascript += """
});"""

        mb.script(type: "text/javascript") {
            mkp.yieldUnescaped(javascript)
        }

    }

    /**
     * Returns the correct headerId for the main header div.
     */
    def headerId = { attrs, body ->
        def headerId = ''
        if(grails.util.Environment.isDevelopmentMode()) headerId = 'HeaderDev'
        else if(grailsApplication.config.demoMode.enabled) headerId = 'HeaderDemo'
        else headerId = 'Header'
        out << headerId
    }

    /**
     * Determine if a supplied string is considered a url or not.
     * The scheme/protocol can be adjusted, file:// has been excluded here.
     * A domainValidator regex is used to allow localhost domain.
     * A Grails branched version of commons.validator is used, this should
     * be compatible with the apache 1.4 version release.
     * See: http://jira.codehaus.org/browse/GRAILS-1692 for more on Grails url validation.
     */
    private Boolean isURLValid(url) {

        def schemes = ["http","https", "ftp"] as String[]
        //def domainValidator = new RegexValidator("localhost(:(\\d{1,5}))?")
        def domainValidator = new RegexValidator(".*(:(\\d{1,5}))?") // Any domain, incl user@host:port
        def validator = new UrlValidator(schemes, domainValidator, UrlValidator.ALLOW_2_SLASHES)
        return validator.isValid(url)

    }

    def ifProfileAvatar = {attrs, body ->
        /*def username = session.user.login
        def currentUser = Account.findByLogin(username)
        if (currentUser.profile && currentUser.profile.avatar) {
            out << "avatar found"
            out << body() // Use () not {}
        }

            html = """
                        <a href="${url}">
                            ${html}
                        </a>
<img class="logo" src="${createLink(controller:'configuracionBytes', action:'avatar_image', id:"logoEmpresa")}"/>
                        """

        out << html
*/

        // Image.
        def img = "<img "
        def imgAttrs = [:]
        imgAttrs.src = ${createLink(controller:'configuracionBytes', action:'avatar_image', id:"logoEmpresa")}
//        imgAttrs.src = attrs.remove("imgSrc")
        imgAttrs.alt = attrs.remove("imgAlt")
        imgAttrs.title = attrs.remove("imgTitle")
        imgAttrs.each { k, v ->
            if(v)
                img += "${k}=\"${v.encodeAsHTML()}\" "
        }
        img += "/>"

        // process remaining attributes
        attrs.each { k, v ->
            out << "${k}=\"${v.encodeAsHTML()}\" "
        }
        out << img
    }
//    <img class="logo" src="${createLink(controller:'configuracionBytes', action:'avatar_image', id:"logoEmpresa")}"/>

} // end class