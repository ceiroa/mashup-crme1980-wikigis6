var myMap;

var layers = {
"states":
{"url": "http://webpages.cs.luc.edu/~cramirez/usPop.kml",
"name": "States"},
"path":
{"url": "http://webpages.cs.luc.edu/~cramirez/TestPath1.kml",
"name": "Path"},
"polygon":
{"url" : "http://webpages.cs.luc.edu/~cramirez/TestPolygon1.kml",
"name": "Polygon"},
"london":
{"url" : "http://www.geograph.org.uk/feed/recent.rss",
"name" : "London"},
"mart":
{"url" : "http://webpages.cs.luc.edu/~cramirez/ChicagoMerchandiseMart.kml",
"name" : "MMart"},
"dinos":
{"url" : "http://webpages.cs.luc.edu/~cramirez/DinosaurCollection.kml",
"name" : "Dinos"},
"hurtley":
{"url" : "http://webpages.cs.luc.edu/~cramirez/FLWArthurHeurtley.kml",
"name" : "Arthur"},
"hospitals":
{"url" : "http://webpages.cs.luc.edu/~cramirez/HospitalsWithGEarth.kml",
"name" : "Hospitals"}
};

function onLoad() {
	myMap = google.mashups.getObjectById('myMap').getMap();
	for(var layer in layers) {
		addTR(layer, layers[layer].name);
	}
	myMap.addOverlay(${myUserList});
}

function addTR(id) {
	var layerTR = document.createElement("tr");
	var inputTD = document.createElement("td");
	var input = document.createElement("input");
	input.type = "checkbox";
	input.id = id;
	input.onclick = function () { toggleGeoXML(this.id, this.checked) };
	inputTD.appendChild(input);

	var nameTD = document.createElement("td");
	var nameA = document.createElement("a");
	nameA.href = layers[id].url;
	var name = document.createTextNode(layers[id].name);
	nameA.appendChild(name);
	nameTD.appendChild(nameA);

	layerTR.appendChild(inputTD);
	layerTR.appendChild(nameTD);
	document.getElementById("sidebarTBODY").appendChild(layerTR);
}

function toggleGeoXML(id, checked) {
	if (checked) {
		var geoXml = new GGeoXml(layers[id].url, function() {
			if (geoXml.loadedCorrectly()) {
				geoXml.gotoDefaultViewport(myMap);
				layers[id].geoxml = geoXml;
			}
		});
		layers[id].geoXml = geoXml;
		myMap.addOverlay(layers[id].geoXml);
	} else if (layers[id].geoXml) {
		myMap.removeOverlay(layers[id].geoXml);
	}
}


function refresh(){
	myMap = google.mashups.getObjectById('myMap').getMap();
	myMap.clearOverlays();
}