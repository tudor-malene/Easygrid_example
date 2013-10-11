<script type="text/javascript">
    google.load('visualization', '1', {'packages':['corechart']});
    google.setOnLoadCallback(init${attrs.id});
    var baseDataSourceUrl = '${g.createLink(action: "${gridConfig.id}Rows")}';
    var dataSourceUrl = baseDataSourceUrl;

    var query, options, container;

    function init${attrs.id}() {
        query = new google.visualization.Query(dataSourceUrl);
        container = document.getElementById("${attrs.id}_div");

        // Send the query with a callback function.
        query.send(handleQueryResponse${attrs.id});

    }

    function handleQueryResponse${attrs.id}(response) {
        if (response.isError()) {
            alert('Error in query: ' + response.getMessage() + ' ' + response.getDetailedMessage());
            return;
        }

        var data = response.getDataTable();
        var visualization = new google.visualization.BarChart(container);
        var options = {
            <g:each in="${gridConfig.visualization}" var="property" status="idx">
            <g:if test="${idx>0}">,</g:if> "${property.key}":${property.value}
            </g:each>
        };

        var view = new google.visualization.DataView(data);
        console.log(view);
        visualization.draw(view, options);
    }

</script>


<div id="${attrs.id}_div" style="width: 900px; height: 3500px;"></div>

