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

    <select size="1" id='nationality'>
        <option value="" >----</option>
        <option value="British" selected="selected">British</option>
        <option value="American">American</option>
        <option value="Belgian">Belgian</option>
        <option value="Russian">Russian</option>
    </select>
    <grid:selection gridName="authorJQGrid" controller="author" name="author.id" value="${bookInstance?.author?.id}" id="author"
        dynamicConstraints="[nationality:'#nationality']"  />
</div>
Type any 2 carachters in the textbox ( for ex: 'wi') and select an author.
You can also press 'Sel' and select.
You can change the nationality from the combo, and see what happens.
Double click on the name of the author - to clear.

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


     <pre><code>


        authorJQGrid {
            dataSourceType &#39;domain&#39;
            domainClass Author
            gridImpl &#39;jqgrid&#39;
            inlineEdit true
            jqgrid {
                width &#39;&quot;900&quot;&#39;
            }
            columns {
                &#39;actions&#39; {
                    type &#39;actions&#39;
                }
                &#39;author.id.label&#39; {
                    type &#39;id&#39;
                }
                &#39;author.name.label&#39; {
                    property &#39;name&#39;
                    filterClosure {params -&gt;
                        ilike(&#39;name&#39;, &quot;%&#36;{params.name}%&quot;)
                    }
                    jqgrid {
                        editable false
                        // this will create a link to the wikipedia page
                        formatter &#39;customWikiFormat&#39;
                    }
                }
                &#39;author.minEstSales.label&#39; {
                    property &#39;minEstSales&#39;
                    formatName &#39;nrToString&#39;
                    jqgrid {
                        editable false
                        search false
                    }
                }
                &#39;author.maxEstSales.label&#39; {
                    property &#39;maxEstSales&#39;
                    formatName &#39;nrToString&#39;
                    jqgrid {
                        editable false
                        search false
                    }
                }
                &#39;author.language.label&#39; {
                    property &#39;language&#39;
                    filterClosure {params -&gt;
                        ilike(&#39;language&#39;, &quot;%&#36;{params.language}%&quot;)
                    }
                    jqgrid {
                        editable true
                    }
                }
                &#39;author.nrBooks.label&#39; {
                    property &#39;nrBooks&#39;
                    jqgrid {
                        editable true
                        search false
                    }
                }
                &#39;author.nationality.label&#39; {
                    property &#39;nationality&#39;
                    filterClosure {params -&gt;
                        ilike(&#39;nationality&#39;, &quot;%&#36;{params.nationality}%&quot;)
                    }
                    jqgrid {
                        editable true
                    }
                }
                &#39;version&#39; {
                    type &#39;version&#39;
                }
            }
            autocomplete {
                idProp &#39;id&#39;
                labelValue { val, params -&gt;
                    &quot;&#36;{val.name} (&#36;{val.nationality})&quot;
                }
                textBoxFilterClosure { params -&gt;
                    ilike(&#39;name&#39;, &quot;%&#36;{params.term}%&quot;)
                }
                constraintsFilterClosure { params -&gt;
                    if (params.nationality) {
                        eq(&#39;nationality&#39;, params.nationality)
                    }
                }
            }
        }

         and the tag:
            grid:selection
                    id="author"
                    name="author.id"
                    value="${bookInstance?.author?.id}"
                    gridName="authorJQGrid"
                    controller="author"
                    dynamicConstraints="[nationality:'#nationality']"


     </code></pre>
