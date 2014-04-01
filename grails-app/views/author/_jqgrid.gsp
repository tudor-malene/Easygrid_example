<%@ page import="example.Author" %>
<r:script>
    function customWikiFormat(cellvalue, options, rowObject) {
        // format the cellvalue to new format
        var authorTokens = cellvalue.split(' ');
        var author = '';
        authorTokens.map(function (item) {
            author = author + "_" + item;
        });
        return "<a href='http://en.wikipedia.org/wiki/" + author.substring(1) + "'>" + cellvalue + "</a> ";
    }
    function wikiUnFormat( cellvalue, options){
        return cellvalue;
    }
</r:script>

<r:require modules="easygrid-jqgrid-dev,export"/>


<grid:grid id='jqgridinitial' name='authorJQGrid'>
    <grid:set  width="900" caption="Authors"/>
    <grid:set col="name" formatter='f:customWikiFormat' unformat="f:wikiUnFormat"/>
</grid:grid>

<grid:exportButton name='authorJQGrid'/>

<h1 id="source-code">Source Code</h1>

<markdown:renderHtml>

    def authorJQGridGrid = {
          domainClass Author
          gridImpl 'jqgrid'
          export {
              export_title 'Author'
              pdf {
                  'border.color' java.awt.Color.BLUE
              }
          }
          columns {
              actions {
                  type 'actions'
              }
              id {
                  type 'id'
              }
              name
              minEstSales {
                  formatName 'nrToString'
                  jqgrid {
                      editable false
                  }
              }
              maxEstSales {
                  formatName 'nrToString'
                  jqgrid {
                      editable false
                  }
              }
              language
              nrBooks
              nationality
              version {
                  type 'version'
              }
          }
      }


</markdown:renderHtml>
GSP:
<markdown:renderHtml>
    < grid:grid id='jqgridinitial' name='authorJQGrid'>
        < grid:set  width="900" caption="Authors"/>
        < grid:set col="name" formatter='f:customWikiFormat' unformat="f:wikiUnFormat"/>
    </ grid:grid>

</markdown:renderHtml>

