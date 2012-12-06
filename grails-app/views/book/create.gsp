<%@ page import="example.Book" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'book.label', default: 'Book')}" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#create-book" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="create-book" class="content scaffold-create" role="main">
			<h1><g:message code="default.create.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${bookInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${bookInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			<g:form action="save" >
				<fieldset class="form">
					<g:render template="form"/>
				</fieldset>
				<fieldset class="buttons">
					<g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" />
				</fieldset>
			</g:form>

            <div>
                <h1 id="source-code">Source Code</h1>

                <b >Tag</b>
                <pre><code>&lt;grid:selection id=&quot;author&quot; title=&quot;Select the author of the book&quot;
                gridName=&quot;authorJQGridSelection&quot; controller=&quot;author&quot;
                name=&quot;author.id&quot; value=&quot;${bookInstance?.author?.id}&quot;
                dynamicConstraints=&quot;[nationality: &#39;#nationality&#39;]&quot;
                onChange=&quot;if(firstTime){firstTime=false;alert(&#39;Well done! ( This is the onchange event)&#39;)}&quot;
                /&gt;
                </code></pre>
                <br/><br/><br/>
                <b>Grid definition</b>
                <pre><code>
  authorJQGridSelection {
        dataSourceType &#39;domain&#39;
        domainClass Author
        gridImpl &#39;jqgrid&#39;
        inlineEdit false
        jqgrid {
            width &#39;&quot;900&quot;&#39;
        }
        columns {
            id {
                type &#39;id&#39;
            }
            name {
                filterClosure {params -&gt;
                    ilike(&#39;name&#39;, &quot;%${params.name}%&quot;)
                }
            }
            minEstSales {
                formatName &#39;nrToString&#39;
                jqgrid {
                    search false
                }
            }
            maxEstSales {
                formatName &#39;nrToString&#39;
                jqgrid {
                    search false
                }
            }
            language {
                filterClosure {params -&gt;
                    ilike(&#39;language&#39;, &quot;%${params.language}%&quot;)
                }
            }
            nrBooks {
                jqgrid {
                    search false
                }
            }
            nationality {
                filterClosure {params -&gt;
                    ilike(&#39;nationality&#39;, &quot;%${params.nationality}%&quot;)
                }
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
    }</code></pre>

            </div>

		</div>
	</body>
</html>
