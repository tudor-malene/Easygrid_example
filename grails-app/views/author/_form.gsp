<%@ page import="example.Author" %>



<div class="fieldcontain ${hasErrors(bean: authorInstance, field: 'books', 'error')} ">
	<label for="books">
		<g:message code="author.books.label" default="Books" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${authorInstance?.books?}" var="b">
    <li><g:link controller="book" action="show" id="${b.id}">${b?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="book" action="create" params="['author.id': authorInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'book.label', default: 'Book')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: authorInstance, field: 'language', 'error')} ">
	<label for="language">
		<g:message code="author.language.label" default="Language" />
		
	</label>
	<g:textField name="language" value="${authorInstance?.language}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: authorInstance, field: 'maxEstSales', 'error')} required">
	<label for="maxEstSales">
		<g:message code="author.maxEstSales.label" default="Max Est Sales" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="maxEstSales" type="number" value="${authorInstance.maxEstSales}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: authorInstance, field: 'minEstSales', 'error')} required">
	<label for="minEstSales">
		<g:message code="author.minEstSales.label" default="Min Est Sales" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="minEstSales" type="number" value="${authorInstance.minEstSales}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: authorInstance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="author.name.label" default="Name" />
		
	</label>
	<g:textField name="name" value="${authorInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: authorInstance, field: 'nationality', 'error')} ">
	<label for="nationality">
		<g:message code="author.nationality.label" default="Nationality" />
		
	</label>
	<g:textField name="nationality" value="${authorInstance?.nationality}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: authorInstance, field: 'nrBooks', 'error')} ">
	<label for="nrBooks">
		<g:message code="author.nrBooks.label" default="Nr Books" />
		
	</label>
	<g:textField name="nrBooks" value="${authorInstance?.nrBooks}"/>
</div>

