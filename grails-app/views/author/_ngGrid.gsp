
<r:require modules="angular,easygrid-ng-grid,export"/>

%{--<grid:grid id='jqgridinitial' name='authorJQGrid' jqgrid.caption="'Author List'" jqgrid.width='"900"' columns.name.jqgrid.formatter='customWikiFormat'/>--}%
%{----}%
%{--<grid:exportButton name='authorJQGrid'/>--}%

<div class="gridStyle" ng-grid="gridOptions"></div>

<r:script>
    var app = angular.module('myApp', ['ngGrid']);
    app.controller('MyCtrl', function($scope) {
        $scope.myData = [{name: "Moroni", age: 50},
            {name: "Tiancum", age: 43},
            {name: "Jacob", age: 27},
            {name: "Nephi", age: 29},
            {name: "Enos", age: 34}];
        $scope.gridOptions = {
            data: 'myData',
            columnDefs: [{field:'name', displayName:'Name'}, {field:'age', displayName:'Age'}]
        };
    });
</r:script>

<h1 id="source-code">Source Code</h1>

<markdown:renderHtml>

Bau

</markdown:renderHtml>
GSP:
<markdown:renderHtml>
    < grid:grid id='jqgridinitial' name='authorJQGrid'
    jqgrid.caption="'Author List'"
    jqgrid.width='"900"'
    columns.name.jqgrid.formatter='customWikiFormat'/>
</markdown:renderHtml>
