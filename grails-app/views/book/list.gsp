
<%@ page import="example.Book" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'book.label', default: 'Book')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
        <r:require modules="easygrid-jqgrid-dev"/>

    </head>
	<body>
		<a href="#list-book" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-book" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>

            <grid:exportButton name='customDatasourceBooks'/>
			<grid:grid  name="customDatasourceBooks"/>

            <h1 id="source-code">Source Code</h1>

            <pre><code>   customDatasourceBooks {
        gridImpl &#39;jqgrid&#39;
        labelPrefix &#39;book&#39;
        dataSourceType &#39;custom&#39;
        labelPrefix &#39;book&#39;
        dataProvider {gridConfig, filters, listParams -&gt;
            [
                    new Book( author: Author.findByNameIlike(&#39;%Tolstoy%&#39;), title: &#39;War and peace&#39;, description: &#39;bla bla&#39;, date:new GregorianCalendar(1821, 10, 11).time),
            ]
        }
        dataCount {filters -&gt;
            1
        }
        jqgrid{
            width 900
        }
        columns {
            id {
                type &#39;id&#39;
            }
            author {
                value {Book book -&gt;
                    book.author.name
                }
                jqgrid {
                    search false
                }
            }
            title{
                jqgrid {
                    search false
                }
            }
            description{
                jqgrid {
                    search false
                }
            }
            date{
                jqgrid {
                    search false
                }
            }
        }
    }</code></pre>

		</div>
	</body>
</html>
