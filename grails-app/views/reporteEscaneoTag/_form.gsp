<%@ page import="org.control.tag.ReporteEscaneoTag" %>



			<div class="control-group fieldcontain ${hasErrors(bean: reporteEscaneoTagInstance, field: 'ROSpecID', 'error')} ">
				<label for="ROSpecID" class="control-label"><g:message code="reporteEscaneoTag.ROSpecID.label" default="ROS pec ID" /></label>
				<div class="controls">
					<g:textField name="ROSpecID" value="${reporteEscaneoTagInstance?.ROSpecID}"/>
					<span class="help-inline">${hasErrors(bean: reporteEscaneoTagInstance, field: 'ROSpecID', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: reporteEscaneoTagInstance, field: 'antennaID', 'error')} ">
				<label for="antennaID" class="control-label"><g:message code="reporteEscaneoTag.antennaID.label" default="Antenna ID" /></label>
				<div class="controls">
					<g:textField name="antennaID" value="${reporteEscaneoTagInstance?.antennaID}"/>
					<span class="help-inline">${hasErrors(bean: reporteEscaneoTagInstance, field: 'antennaID', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: reporteEscaneoTagInstance, field: 'channelIndex', 'error')} ">
				<label for="channelIndex" class="control-label"><g:message code="reporteEscaneoTag.channelIndex.label" default="Channel Index" /></label>
				<div class="controls">
					<g:textField name="channelIndex" value="${reporteEscaneoTagInstance?.channelIndex}"/>
					<span class="help-inline">${hasErrors(bean: reporteEscaneoTagInstance, field: 'channelIndex', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: reporteEscaneoTagInstance, field: 'epc', 'error')} ">
				<label for="epc" class="control-label"><g:message code="reporteEscaneoTag.epc.label" default="Epc" /></label>
				<div class="controls">
					<g:textField name="epc" value="${reporteEscaneoTagInstance?.epc}"/>
					<span class="help-inline">${hasErrors(bean: reporteEscaneoTagInstance, field: 'epc', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: reporteEscaneoTagInstance, field: 'firstSeenTimestampUTC', 'error')} ">
				<label for="firstSeenTimestampUTC" class="control-label"><g:message code="reporteEscaneoTag.firstSeenTimestampUTC.label" default="First Seen Timestamp UTC" /></label>
				<div class="controls">
					<g:textField name="firstSeenTimestampUTC" value="${reporteEscaneoTagInstance?.firstSeenTimestampUTC}"/>
					<span class="help-inline">${hasErrors(bean: reporteEscaneoTagInstance, field: 'firstSeenTimestampUTC', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: reporteEscaneoTagInstance, field: 'inventoryParameterSpecID', 'error')} ">
				<label for="inventoryParameterSpecID" class="control-label"><g:message code="reporteEscaneoTag.inventoryParameterSpecID.label" default="Inventory Parameter Spec ID" /></label>
				<div class="controls">
					<g:textField name="inventoryParameterSpecID" value="${reporteEscaneoTagInstance?.inventoryParameterSpecID}"/>
					<span class="help-inline">${hasErrors(bean: reporteEscaneoTagInstance, field: 'inventoryParameterSpecID', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: reporteEscaneoTagInstance, field: 'lastSeenTimestampUTC', 'error')} ">
				<label for="lastSeenTimestampUTC" class="control-label"><g:message code="reporteEscaneoTag.lastSeenTimestampUTC.label" default="Last Seen Timestamp UTC" /></label>
				<div class="controls">
					<g:textField name="lastSeenTimestampUTC" value="${reporteEscaneoTagInstance?.lastSeenTimestampUTC}"/>
					<span class="help-inline">${hasErrors(bean: reporteEscaneoTagInstance, field: 'lastSeenTimestampUTC', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: reporteEscaneoTagInstance, field: 'peakRSSI', 'error')} ">
				<label for="peakRSSI" class="control-label"><g:message code="reporteEscaneoTag.peakRSSI.label" default="Peak RSSI" /></label>
				<div class="controls">
					<g:textField name="peakRSSI" value="${reporteEscaneoTagInstance?.peakRSSI}"/>
					<span class="help-inline">${hasErrors(bean: reporteEscaneoTagInstance, field: 'peakRSSI', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: reporteEscaneoTagInstance, field: 'tagSeenCount', 'error')} ">
				<label for="tagSeenCount" class="control-label"><g:message code="reporteEscaneoTag.tagSeenCount.label" default="Tag Seen Count" /></label>
				<div class="controls">
					<g:textField name="tagSeenCount" value="${reporteEscaneoTagInstance?.tagSeenCount}"/>
					<span class="help-inline">${hasErrors(bean: reporteEscaneoTagInstance, field: 'tagSeenCount', 'error')}</span>
				</div>
			</div>

