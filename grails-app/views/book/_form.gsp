<%@ page import="example.Book" %>

<r:require modules="easygrid-visualization-dev,easygrid-jqgrid-dev,easygrid-datatables-dev,easygrid-selection"/>

<script type="text/javascript">

    function customWikiFormat(cellvalue, options, rowObject) {
        // format the cellvalue to new format
        var authorTokens = cellvalue.split(' ');
        var author = '';
        authorTokens.map(function (item) {
            author = author + "_" + item;
        })
        return "<a href='http://en.wikipedia.org/wiki/" + author.substring(1) + "'>" + cellvalue + "</a> ";
    }

</script>



<div class="fieldcontain ${hasErrors(bean: bookInstance, field: 'description', 'error')} ">
    <label for="description">
        <g:message code="book.description.label" default="Description"/>

    </label>
    <g:textField name="description" value="${bookInstance?.description}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: bookInstance, field: 'author', 'error')} required">
    <label for="author">
        <g:message code="book.author.label" default="Author"/>
        <span class="required-indicator">*</span>
    </label>

    <grid:selectionComp gridName="authorJQGrid" controller="author" name="author.id" id="author" />
</div>

<div class="fieldcontain ${hasErrors(bean: bookInstance, field: 'date', 'error')} required">
    <label for="date">
        <g:message code="book.date.label" default="Date"/>
        <span class="required-indicator">*</span>
    </label>
    <g:datePicker name="date" precision="day" value="${bookInstance?.date}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: bookInstance, field: 'title', 'error')} ">
    <label for="title">
        <g:message code="book.title.label" default="Title"/>

    </label>
    <g:textField name="title" value="${bookInstance?.title}"/>
</div>

