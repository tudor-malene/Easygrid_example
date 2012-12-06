<%@ page import="example.Book" %>

<r:require modules="easygrid-selection-dev"/>
<r:script>
var firstTime = true;
</r:script>

<div class="fieldcontain ${hasErrors(bean: bookInstance, field: 'title', 'error')} ">
    <label for="title">
        <g:message code="book.title.label" default="Title"/>
    </label>
    <g:textField name="title" value="${bookInstance?.title}"/>
</div>


<div class="fieldcontain ">
    <label for="nationality">
        Nationality
    </label>

    <select size="1" id='nationality'>
        <option value="">----</option>
        <option value="British" selected="selected">British</option>
        <option value="American">American</option>
        <option value="Belgian">Belgian</option>
        <option value="Russian">Russian</option>
    </select>
</div>

<i>
    <br/><br/>
    - Type any 2 or more carachters in the textbox below( for ex: 'wi') and select an author. (if there is only 1 item you can just hit Tab) <br/>
    - You can also press 'Sel' and select from the grid shown in the popup. ( just click on any row ) <br/>
    - You can change the nationality from the combo, and see what happens. (These are dynamic constraints, useful to correlate the widget with other elements from the page ) <br/>
    - Double click on the name of the author - to clear the selection <br/>
</i>

<div class="fieldcontain ${hasErrors(bean: bookInstance, field: 'author', 'error')} required">
    <label for="author">
        <g:message code="book.author.label" default="Author"/>
        <span class="required-indicator">*</span>
    </label>

    <grid:selection id="author" title="Select the author of the book"
                    onChange="if(firstTime){firstTime=false;alert('Well done! ( This is the onchange event)')}"
                    gridName="authorJQGridSelection" controller="author"
                    name="author.id" value="${bookInstance?.author?.id}"
                    dynamicConstraints="[nationality: '#nationality']"/>
</div>


<div class="fieldcontain ${hasErrors(bean: bookInstance, field: 'date', 'error')} required">
    <label for="date">
        <g:message code="book.date.label" default="Date"/>
        <span class="required-indicator">*</span>
    </label>
    <g:datePicker name="date" precision="day" value="${bookInstance?.date}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: bookInstance, field: 'description', 'error')} ">
    <label for="description">
        <g:message code="book.description.label" default="Description"/>

    </label>
    <g:textField name="description" value="${bookInstance?.description}"/>
</div>

