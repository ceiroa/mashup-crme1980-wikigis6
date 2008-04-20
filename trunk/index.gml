<gm:page title="Wiki GIS 6" authenticate="true" onload="onLoad()">

<script type="text/javascript" src="resources/wikigis5.js"></script>

<link rel="stylesheet" href="resources/wikigisstyles3.css" type="text/css" />
  
<div id="header">
    <h1>Interactive GIS</h1>
</div>

<div id="leftCol">
  <table id="sidebarTABLE">
    <tbody id="sidebarTBODY"></tbody> 
  </table>
</div>

<div id="center">
  <gm:map id="myMap" data="${myAppList}" control="large"
      infotemplate="myMapDetailsTemplate" width="100%" height="100%" 
      lat="35.4607" lng="-12.6563" zoom="2" maptypes="true" create="true">
        <gm:handleEvent src="myAppList"/>
        <gm:handleEvent src="myUserList"/>
  </gm:map>     
</div>

<div id="rightCol">  
  <gm:list id="myAppList" data="${app}/markers" template="myListTemplate">
      <gm:handleEvent src="myMap"/>
  </gm:list>
  <br/>
  <a href="/feeds/app/markers">View feed</a>
  <br/>
  <gm:list id="myUserList" data="${user}/markers" template="myListTemplate">
      <gm:handleEvent src="myMap"/>
  </gm:list>
</div>
  
   <gm:template id="myMapDetailsTemplate">
    <table style="width:400px">
      <tr>
        <td colspan="2"><gm:text ref="atom:title"/></td>
      </tr>
      <tr>
        <td colspan="2"><gm:rating ref="gd:rating"/></td>
      </tr>
      <tr>
        <td colspan="2"><gm:textarea ref="atom:content"/></td>
      </tr>
      <tr>
        <td colspan="2"><gm:editButtons editonly="true" text="true"/></td>
      </tr>
    </table>
  </gm:template>

  <gm:template id="myListTemplate">
    <table class="blue-theme" style="width:100px; margin-top:20px">
      <thead>
        <tr>
          <td style="width:200px"></td>
          <td>Name</td>
          <td style="width:150px">Rating</td>
          <td style="width:150px"></td>
        </tr>
      </thead>
      <tfoot>
        <tr>
          <td colspan="2"><gm:pager/></td>
          <td colspan="2" align="right"><gm:create label="Add"/></td>
        </tr>
      </tfoot>
      <tbody repeat="true">
        <tr>
          <td align="center"><gm:toggle/></td>
          <td><gm:text ref="atom:title" hint="Enter title."/></td>
          <td><gm:rating ref="gd:rating"/></td>
          <td><gm:editButtons/></td>
        </tr>     
        <tr class="gm-toggled">
          <td colspan="4">
            <gm:textarea ref="atom:content"/>
            <p>
              <gm:text ref="georss:where/gml:Point/gml:pos" readonly="true"/>
            </p>
          </td>
        </tr>
      </tbody>
    </table>
  </gm:template>

</gm:page>