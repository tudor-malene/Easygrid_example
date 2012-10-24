
<%@ page import="example.Author" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'author.label', default: 'Author')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-author" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-author" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list author">
			
				<g:if test="${authorInstance?.books}">
				<li class="fieldcontain">
					<span id="books-label" class="property-label"><g:message code="author.books.label" default="Books" /></span>
					
						<g:each in="${authorInstance.books}" var="b">
						<span class="property-value" aria-labelledby="books-label"><g:link controller="book" action="show" id="${b.id}">${b?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${authorInstance?.language}">
				<li class="fieldcontain">
					<span id="language-label" class="property-label"><g:message code="author.language.label" default="Language" /></span>
					
						<span class="property-value" aria-labelledby="language-label"><g:fieldValue bean="${authorInstance}" field="language"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${authorInstance?.maxEstSales}">
				<li class="fieldcontain">
					<span id="maxEstSales-label" class="property-label"><g:message code="author.maxEstSales.label" default="Max Est Sales" /></span>
					
						<span class="property-value" aria-labelledby="maxEstSales-label"><g:fieldValue bean="${authorInstance}" field="maxEstSales"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${authorInstance?.minEstSales}">
				<li class="fieldcontain">
					<span id="minEstSales-label" class="property-label"><g:message code="author.minEstSales.label" default="Min Est Sales" /></span>
					
						<span class="property-value" aria-labelledby="minEstSales-label"><g:fieldValue bean="${authorInstance}" field="minEstSales"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${authorInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="author.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${authorInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${authorInstance?.nationality}">
				<li class="fieldcontain">
					<span id="nationality-label" class="property-label"><g:message code="author.nationality.label" default="Nationality" /></span>
					
						<span class="property-value" aria-labelledby="nationality-label"><g:fieldValue bean="${authorInstance}" field="nationality"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${authorInstance?.nrBooks}">
				<li class="fieldcontain">
					<span id="nrBooks-label" class="property-label"><g:message code="author.nrBooks.label" default="Nr Books" /></span>
					
						<span class="property-value" aria-labelledby="nrBooks-label"><g:fieldValue bean="${authorInstance}" field="nrBooks"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${authorInstance?.id}" />
					<g:link class="edit" action="edit" id="${authorInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
