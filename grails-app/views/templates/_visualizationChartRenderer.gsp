<%@ page import="org.grails.plugin.easygrid.JsUtils" defaultCodec="none" %>
<jq:jquery>
   google.load('visualization', '1', {'packages':['corechart'],"callback":function(){
       var query = new google.visualization.Query('${g.createLink(action: "${gridConfig.id}Rows")}');
        query.send(function(response) {
            if (response.isError()) {
                alert('Error in query: ' + response.getMessage() + ' ' + response.getDetailedMessage());
                return;
            }
            var container = $('#${attrs.id}_div');
            var visualization = new google.visualization.BarChart(container[0]);
            var options =  ${JsUtils.convertToJs(gridConfig.visualization-[width:gridConfig.visualization.width]-[height:gridConfig.visualization.height])};
            var view = new google.visualization.DataView(response.getDataTable());
            visualization.draw(view, options);
        });
     }
   });
</jq:jquery>


<div id="${attrs.id}_div"
     style="width: ${gridConfig.visualization.width}; height: ${gridConfig.visualization.height};"></div>

