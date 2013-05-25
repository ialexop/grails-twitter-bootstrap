<% import grails.persistence.Event %>
<%=packageName%>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="\${message(code: '${domainClass.propertyName}.label', default: '${className}')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
        <div class="container-fluid">
            <div class="nav" role="navigation">
                <ul class="nav nav-pills">
                    <li class="active"><a class="home" href="\${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                    <li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
                    <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
                </ul>
            </div>
            <div id="show-${domainClass.propertyName}" class="content scaffold-show" role="main">
                <h1><g:message code="default.show.label" args="[entityName]" /></h1>
                <g:if test="\${flash.message}">
                <div class="alert alert-success" role="status">\${flash.message}</div>
                </g:if>
                <ul class="property-list ${domainClass.propertyName}">
                <%  excludedProps = Event.allEvents.toList() << 'id' << 'version'
                    allowedNames = domainClass.persistentProperties*.name << 'dateCreated' << 'lastUpdated'
                    props = domainClass.properties.findAll { allowedNames.contains(it.name) && !excludedProps.contains(it.name) }
                    Collections.sort(props, comparator.constructors[0].newInstance([domainClass] as Object[]))
                    props.each { p -> %>
                    <g:if test="\${${propertyName}?.${p.name}}">
                    <dl class="dl-horizontal">
                        <dt id="${p.name}-label"><g:message code="${domainClass.propertyName}.${p.name}.label" default="${p.naturalName}" /></dt>
                        <%  if (p.isEnum()) { %>
                            <dd class="property-value" aria-labelledby="${p.name}-label"><g:fieldValue bean="\${${propertyName}}" field="${p.name}"/></dd>
                        <%  } else if (p.oneToMany || p.manyToMany) { %>
                            <g:each in="\${${propertyName}.${p.name}}" var="${p.name[0]}">
                            <dd class="property-value" aria-labelledby="${p.name}-label"><g:link controller="${p.referencedDomainClass?.propertyName}" action="show" id="\${${p.name[0]}.id}">\${${p.name[0]}?.encodeAsHTML()}</g:link></dd>
                            </g:each>
                        <%  } else if (p.manyToOne || p.oneToOne) { %>
                            <dd class="property-value" aria-labelledby="${p.name}-label"><g:link controller="${p.referencedDomainClass?.propertyName}" action="show" id="\${${propertyName}?.${p.name}?.id}">\${${propertyName}?.${p.name}?.encodeAsHTML()}</g:link></dd>
                        <%  } else if (p.type == Boolean || p.type == boolean) { %>
                            <dd class="property-value" aria-labelledby="${p.name}-label"><g:formatBoolean boolean="\${${propertyName}?.${p.name}}" /></dd>
                        <%  } else if (p.type == Date || p.type == java.sql.Date || p.type == java.sql.Time || p.type == Calendar) { %>
                            <dd class="property-value" aria-labelledby="${p.name}-label"><g:formatDate date="\${${propertyName}?.${p.name}}" /></dd>
                        <%  } else if (!p.type.isArray()) { %>
                            <dd class="property-value" aria-labelledby="${p.name}-label"><g:fieldValue bean="\${${propertyName}}" field="${p.name}"/></dd>
                        <%  } %>
                    </dl>
                    </g:if>
                <%  } %>
                </ul>
                <g:form>
                    <fieldset class="buttons">
                        <g:hiddenField name="id" value="\${${propertyName}?.id}" />
                        <g:link class="btn btn-primary" action="edit" id="\${${propertyName}?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
                        <g:actionSubmit class="btn btn-danger" action="delete" value="\${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('\${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
                    </fieldset>
                </g:form>
            </div>
        </div>
	</body>
</html>
