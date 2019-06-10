/* Copyright PRImA Research 2010-2011, Stefan Pletschacher */

function init() {
	regionClicked('init');
}

function panAndZoom(param) {
	var bgImage = document.getElementById("BgImageID");
	var docWidth = bgImage.getAttribute("width");
	var docHeight = bgImage.getAttribute("height");
	var ContentBox = document.getElementById("ContentBoxID");
	var ControlBox = document.getElementById("ControlBoxID");
	var viewBox = ContentBox.getAttribute("viewBox"); 
	var viewBoxArray = viewBox.split(" ");
	var newViewBox;
	var panByFactor = 20;
	var zoomFactor = 1.3;
	var panBy = (Math.round(Math.log(docWidth/viewBoxArray[2]) / Math.log(zoomFactor))+1) * -1 * panByFactor;
	
	switch(param) {
	case "resetPan":
		viewBoxArray[0] = 0;
		viewBoxArray[1] = 0;
		break;
	case "left":
		viewBoxArray[0] = parseInt(viewBoxArray[0]) + panBy;
		break;
	case "right":
		viewBoxArray[0] = parseInt(viewBoxArray[0]) - panBy;
		break;
	case "up":
		viewBoxArray[1] = parseInt(viewBoxArray[1]) + panBy;
		break;
	case "down":
		viewBoxArray[1] = parseInt(viewBoxArray[1]) - panBy;
		break;
	case "resetZoom":
		viewBoxArray[2] = docWidth;
		viewBoxArray[3] = docHeight;
		break;
	case "in":
		if (parseInt(viewBoxArray[2]) < 10 || parseInt(viewBoxArray[3]) < 10) {
			alert("Maximum zoom level reached!");
		} else {
			viewBoxArray[2] = Math.round(parseInt(viewBoxArray[2])/zoomFactor);
			viewBoxArray[3] = Math.round(parseInt(viewBoxArray[3])/zoomFactor);
		}
		break;
	case "out":
		if (parseInt(viewBoxArray[2]) > (docWidth * 10) || parseInt(viewBoxArray[3]) > (docHeight * 10)) {
			alert("Maximum zoom level reached!");
		} else {
			viewBoxArray[2] = Math.round(parseInt(viewBoxArray[2])*zoomFactor);
			viewBoxArray[3] = Math.round(parseInt(viewBoxArray[3])*zoomFactor);
		}
		break;
	default:
		alert("Not defined parameter: " + param);
	}

	// delete ContentBox temporarily to get around a redraw issue of Chrome (browser) 
	var parentNode = ContentBox.parentNode;
	var temp = ContentBox.cloneNode(true)
	parentNode.removeChild(ContentBox);

	newViewBox = viewBoxArray[0] + " " +
			viewBoxArray[1] + " " +
			viewBoxArray[2] + " " +
			viewBoxArray[3];
	temp.setAttributeNS(null,"viewBox",newViewBox);
	parentNode.appendChild(temp);

	// make sure that ControlBox is on top of everything (currently there is no support for z-index in SVG)
	ControlBox.parentNode.appendChild(ControlBox);

}

function tokenToName(input){
	switch (input) {
		case 'Afrikaans':             return 'Afrikaans';             break;
		case 'Albanian':              return 'Albanian';              break;
		case 'Amharic':               return 'Amharic';               break;
		case 'Arabic':                return 'Arabic';                break;
		case 'bar':                   return 'Bar';                   break;
		case 'Basque':                return 'Basque';                break;
		case 'Bengali':               return 'Bengali';               break;
		case 'bgColour':              return 'Background';            break;
		case 'bilevel':               return 'Bilevel';               break;
		case 'black':                 return 'Black';                 break;
		case 'blue':                  return 'Blue';                  break;
		case 'borderPresent':         return 'Border';                break;
		case 'bottom-to-top':         return 'Bottom to top';         break;
		case 'brown':                 return 'Brown';                 break;
		case 'Bulgarian':             return 'Bulgarian';             break;
		case 'Cambodian':             return 'Cambodian';             break;
		case 'Cantonese':             return 'Cantonese';             break;
		case 'caption':               return 'Caption';               break;
		case 'ChartRegion':           return 'Chart';                 break;
		case 'Chinese':               return 'Chinese';               break;
		case 'Chinese-simplified':    return 'Chinese (simplified)';  break;
		case 'Chinese-traditional':   return 'Chinese (traditional)'; break;
		case 'colour':                return 'Colour';                break;
		case 'colourDepth':           return 'Colour depth';          break;
		case 'columns':               return 'Num of columns';        break;
		case 'credit':                return 'Credit';                break;
		case 'cyan':                  return 'Cyan';                  break;
		case 'Cyrillic':              return 'Cyrillic';              break;
		case 'Czech':                 return 'Czech';                 break;
		case 'Danish':                return 'Danish';                break;
		case 'Devangari':             return 'Devangari';             break;
		case 'drop-capital':          return 'Drop capital';          break;
		case 'Dutch':                 return 'Dutch';                 break;
		case 'embText':               return 'Embedded text';         break;
		case 'English':               return 'English';               break;
		case 'Estonian':              return 'Estonian';              break;
		case 'Ethiopic':              return 'Ethiopic';              break;
		case 'false':                 return 'No';                    break;
		case 'Finnish':               return 'Finnish';               break;
		case 'floating':              return 'Floating';              break;
		case 'fontSize':              return 'Font size';             break;
		case 'footer':                return 'Footer';                break;
		case 'FrameRegion':           return 'Frame';                 break;
		case 'French':                return 'French';                break;
		case 'Gaelic':                return 'Gaelic';                break;
		case 'German':                return 'German';                break;
		case 'GraphicRegion':         return 'Graphic';               break;
		case 'Greek':                 return 'Greek';                 break;
		case 'green':                 return 'Green';                 break;
		case 'grey':                  return 'Grey';                  break;
		case 'greyscale':             return 'Greyscale';             break;
		case 'Gujarati':              return 'Gujarati';              break;
		case 'Gurmukhi':              return 'Gurmukhi';              break;
		case 'handwritten-annotation':return 'Handwritten annotation';break;
		case 'header':                return 'Header';                break;
		case 'heading':               return 'Heading';               break;
		case 'Hebrew':                return 'Hebrew';                break;
		case 'Hindi':                 return 'Hindi';                 break;
		case 'Hungarian':             return 'Hungarian';             break;
		case 'Icelandic':             return 'Icelandic';             break;
		case 'id':                    return 'ID';                    break;
		case 'ImageRegion':           return 'Image';                 break;
		case 'indented':              return 'Indented';              break;
		case 'indigo':                return 'Indigo';                break;
		case 'Italian':               return 'Italian';               break;
		case 'Japanese':              return 'Japanese';              break;
		case 'kerning':               return 'Kerning';               break;
		case 'Korean':                return 'Korean';                break;
		case 'Latin':                 return 'Latin';                 break;
		case 'Latvian':               return 'Latvian';               break;
		case 'leading':               return 'Leading';               break;
		case 'left-to-right':         return 'Left to right';         break;
		case 'letterhead':            return 'Letterhead';            break;
		case 'line':                  return 'Line';                  break;
		case 'lineColour':            return 'Line colour';           break;
		case 'LineDrawingRegion':     return 'Line drawing';          break;
		case 'lineSeparators':        return 'Line separators';       break;
		case 'logo':                  return 'Logo';                  break;
		case 'magenta':               return 'Magenta';               break;
		case 'Malay':                 return 'Malay';                 break;
		case 'MathsRegion':           return 'Maths';                 break;
		case 'NoiseRegion':           return 'Noise';                 break;
		case 'Norwegian':             return 'Norwegian';             break;
		case 'numColours':            return 'Num of colours';        break;
		case 'orange':                return 'Orange';                break;
		case 'orientation':           return 'Orientation';           break;
		case 'other':                 return 'Other';                 break;
		case 'page-number':           return 'Page number';           break;
		case 'paper-grow':            return 'Paper grow';            break;
		case 'paragraph':             return 'Paragraph';             break;
		case 'penColour':             return 'Pen colour';            break;
		case 'pie':                   return 'Pie';                   break;
		case 'pink':                  return 'Pink';                  break;
		case 'Polish':                return 'Polish';                break;
		case 'Portuguese':            return 'Portuguese';            break;
		case 'primaryLanguage':       return 'Primary language';      break;
		case 'primaryScript':         return 'Primary script';        break;
		case 'punch-hole':            return 'Punch hole';            break;
		case 'Punjabi':               return 'Punjabi';               break;
		case 'readingDirection':      return 'Reading direction';     break;
		case 'readingOrientation':    return 'Reading Orientation';   break;
		case 'red':                   return 'Red';                   break;
		case 'reverseVideo':          return 'Reverse video';         break;
		case 'right-to-left':         return 'Right to left';         break;
		case 'rows':                  return 'Num of rows';           break;
		case 'Russian':               return 'Russian';               break;
		case 'scatter':               return 'Scatter';               break;
		case 'secondaryLanguage':     return 'Secondary language';    break;
		case 'secondaryScript':       return 'Secondary script';      break;
		case 'SeparatorRegion':       return 'Separator';             break;
		case 'signature':             return 'Signature';             break;
		case 'Spanish':               return 'Spanish';               break;
		case 'stamp':                 return 'Stamp';                 break;
		case 'surface':               return 'Surface';               break;
		case 'Swedish':               return 'Swedish';               break;
		case 'TableRegion':           return 'Table';                 break;
		case 'textColour':            return 'Text colour';           break;
		case 'TextRegion':            return 'Text';                  break;
		case 'Thai':                  return 'Thai';                  break;
		case 'top-to-bottom':         return 'Top to bottom';         break;
		case 'true':                  return 'Yes';                   break;
		case 'Turkish':               return 'Turkish';               break;
		case 'turquoise':             return 'Turquoise';             break;
		case 'type':                  return 'Type';                  break;
		case 'UnknownRegion':         return 'Unknown';               break;
		case 'Urdu':                  return 'Urdu';                  break;
		case 'violet':                return 'Violet';                break;
		case 'Welsh':                 return 'Welsh';                 break;
		case 'white':                 return 'White';                 break;
		case 'yellow':                return 'Yellow';                break;
		default: return input;
	}
}

function escapeStr(inp){
	// generate escape sequence for special characters
	var out = "";
	for (var i = 0; i < inp.length; i++){
		var c = inp.charAt(i);
		if (c < "(" || c > "~" || c == "<" || c == ">"){
			c = "&#" + c.charCodeAt() + ";";
		}
		out += c;
	}
	return out;
}

function nl2br4escStr(inp){
	out=inp.replace(/(&#13;&#10;)|(&#13;)|(&#10;)/g,"<br />");
    return out;
}

function regionClicked(evt){
	// lookup used namespace
	var usedNamespace;
	var metadataList=document.getElementById("DocMetadataID");
	for (i=0; i<metadataList.childNodes.length; i++){
		if (metadataList.childNodes[i].nodeType==1) {
			usedNamespace=metadataList.childNodes[i].namespaceURI;
			break
		}
	}
	//alert(usedNamespace);
	
	if (evt!='init') {
		var targetShape = evt.target;
		var targetInfo = targetShape.getElementsByTagNameNS(usedNamespace,"RegionInfo")[0]; 
		var metadataArray = new Array();
	}
	var bgImage = document.getElementById("BgImageID");
	var docMetadata = document.getElementById("DocMetadataID")
	var ContentBox = document.getElementById("ContentBoxID");
	var topInfoBox = document.getElementById("TopInfoBoxID");
	var leftInfoBox = document.getElementById("LeftInfoBoxID");
	
	var xOffset = "350";
	var yOffset = "100";
	var topInfoBoxWidth = "1024";
	var leftInfoBoxHeight = "768";

	/* display RegionInfo */
	var svgNS = "http://www.w3.org/2000/svg";
    var xhtmlNS = "http://www.w3.org/1999/xhtml";

    // start with removing the old content then add empty groups
    topInfoBox.parentNode.removeChild(topInfoBox);
    var newTopInfoBox = document.createElementNS(svgNS,"g");
    newTopInfoBox.setAttributeNS(null,"id","TopInfoBoxID");
    document.getElementById("ContentBoxID").parentNode.appendChild(newTopInfoBox);
    
    leftInfoBox.parentNode.removeChild(leftInfoBox);
    var newLeftInfoBox = document.createElementNS(svgNS,"g");
    newLeftInfoBox.setAttributeNS(null,"id","LeftInfoBoxID");
    ContentBox.parentNode.appendChild(newLeftInfoBox);

    // top info box    
    var newForOb = document.createElementNS(svgNS,"foreignObject");
    newForOb.setAttributeNS(null,"id","FOID1");
    //newForOb.setAttributeNS(null,"x",evt.clientX);
    newForOb.setAttributeNS(null,"x","0");
    newForOb.setAttributeNS(null,"y","0");
    newForOb.setAttributeNS(null,"width",topInfoBoxWidth);
    newForOb.setAttributeNS(null,"height",yOffset);
    document.getElementById("TopInfoBoxID").appendChild(newForOb);

    var newBody = document.createElementNS(xhtmlNS,"body");
    newBody.setAttributeNS(null,"id","BodyID");
    newBody.setAttributeNS(null,"style","background-color:white;" +
    		"font-family:helvetica,sans-serif;font-size:0.8em;");
    // get data for top info box
    var documentId;
	if (docMetadata.getElementsByTagNameNS(usedNamespace,"DocID")[0].firstChild==null) {
		documentId ="";
	} else {
		documentId = docMetadata.getElementsByTagNameNS(usedNamespace,"DocID")[0].firstChild.nodeValue;
	}
    var documentCreator;
	if (docMetadata.getElementsByTagNameNS(usedNamespace,"Creator")[0].firstChild==null) {
		documentCreator ="";
	} else {
		documentCreator = escapeStr(docMetadata.getElementsByTagNameNS(usedNamespace,"Creator")[0].firstChild.nodeValue);
	}
    var documentCreated;
	if (docMetadata.getElementsByTagNameNS(usedNamespace,"Created")[0].firstChild==null) {
		documentCreated ="";
	} else {
		documentCreated = docMetadata.getElementsByTagNameNS(usedNamespace,"Created")[0].firstChild.nodeValue;
	}
    var documentLastChange;
	if (docMetadata.getElementsByTagNameNS(usedNamespace,"LastChange")[0].firstChild==null) {
		documentLastChange ="";
	} else {
		documentLastChange = docMetadata.getElementsByTagNameNS(usedNamespace,"LastChange")[0].firstChild.nodeValue;
	}
	var commentText;
	if (docMetadata.getElementsByTagNameNS(usedNamespace,"Comments").length==0) {
		commentText ="<i>N/A</i>";
	} else if (docMetadata.getElementsByTagNameNS(usedNamespace,"Comments")[0].firstChild==null) {
		commentText ="<i>There are no comments to display</i>";
	} else {
		commentText = escapeStr(docMetadata.getElementsByTagNameNS(usedNamespace,"Comments")[0].firstChild.nodeValue);
	}

	var topInnerHTML = "";
	topInnerHTML += "\n<div class='docInfo_topBox'>\n";
		topInnerHTML += "\t<div class='docInfo_leftCol'>\n";
			topInnerHTML += "\t\t<div class='docInfo_leftCol_row1'>\n";
				topInnerHTML += "\t\t\t<div class='docInfo_leftCol_head'><b>Document ID</b></div>\n";
				topInnerHTML += "\t\t\t<div class='docInfo_leftCol_body'>" + documentId + "</div>\n";
			topInnerHTML += "\t\t</div>\n";
			topInnerHTML += "\t\t<div class='docInfo_leftCol_row2'>\n";
				topInnerHTML += "\t\t\t<div class='docInfo_leftCol_head'><b>Document Creator</b></div>\n";
				topInnerHTML += "\t\t\t<div class='docInfo_leftCol_body'>" + documentCreator + "</div>\n";
			topInnerHTML += "\t\t</div>\n";
			topInnerHTML += "\t\t<div class='docInfo_leftCol_row1'>\n";
				topInnerHTML += "\t\t\t<div class='docInfo_leftCol_head'><b>Created</b></div>\n";
				topInnerHTML += "\t\t\t<div class='docInfo_leftCol_body'>" + documentCreated + "</div>\n";
			topInnerHTML += "\t\t</div>\n";
			topInnerHTML += "\t\t<div class='docInfo_leftCol_row2'>\n";
				topInnerHTML += "\t\t\t<div class='docInfo_leftCol_head'><b>Last Change</b></div>\n";
				topInnerHTML += "\t\t\t<div class='docInfo_leftCol_body'>" + documentLastChange + "</div>\n";
			topInnerHTML += "\t\t</div>\n";
		topInnerHTML += "\t</div>\n";
		topInnerHTML += "\t<div class='docInfo_rightCol'>\n";
			topInnerHTML += "\t\t<div class='docInfo_rightCol_versionHead'><b>Format Version</b></div>\n";
			topInnerHTML += "\t\t<div class='docInfo_rightCol_versionBody'>" + usedNamespace + "</div>\n";
			topInnerHTML += "\t\t<div class='docInfo_rightCol_commentsHead'><b>Comments</b></div>\n";
			topInnerHTML += "\t\t<div class='docInfo_rightCol_commentsBody'>" + commentText + "</div>\n";
		topInnerHTML += "\t</div>\n";
	topInnerHTML += "</div>\n"; 

    newBody.innerHTML = topInnerHTML;
    document.getElementById("FOID1").appendChild(newBody);

    // left info box	
    var newForOb2 = document.createElementNS(svgNS,"foreignObject");
    newForOb2.setAttributeNS(null,"id","FOID2");
    newForOb2.setAttributeNS(null,"x","0");
    newForOb2.setAttributeNS(null,"y",yOffset);
    newForOb2.setAttributeNS(null,"width",xOffset);
    newForOb2.setAttributeNS(null,"height",leftInfoBoxHeight);
    document.getElementById("LeftInfoBoxID").appendChild(newForOb2);

    var newBody2 = document.createElementNS(xhtmlNS,"body");
    newBody2.setAttributeNS(null,"id","BodyID");
    newBody2.setAttributeNS(null,"id","BodyID");
    newBody2.setAttributeNS(null,"style","background-color:white;" +
    		"font-family:helvetica,sans-serif;font-size:0.8em;");

    
    // read RegionInfo into metadataArray (Border and PrintSpace don't have such information)
    if ((evt!='init')&&(targetShape.getAttribute("class")!='Border')&&(targetShape.getAttribute("class")!='PrintSpace')) {
    	for (i=0; i<targetInfo.attributes.length; i++){
    		if (targetInfo.attributes[i].nodeName!="xmlns:pc") {
    			metadataArray[targetInfo.attributes[i].nodeName]=targetInfo.attributes[i].value;
    		}
    	}
    }

	// get text-equivalent if there is any
    var regionText;
    if (targetInfo==null) {
		regionText ="";
    } else if (targetInfo.getElementsByTagNameNS(usedNamespace,"Text").length==0) {
		regionText ="";
	} else if (targetInfo.getElementsByTagNameNS(usedNamespace,"Text")[0].firstChild==null) {
		//regionText ="<i>n/a</i>";
		regionText ="";
	} else {
		regionText = escapeStr(targetInfo.getElementsByTagNameNS(usedNamespace,"Text")[0].firstChild.nodeValue);
	}
    var regionUnicode;
    if (targetInfo==null) {
    	regionUnicode ="";
    } else if (targetInfo.getElementsByTagNameNS(usedNamespace,"Unicode").length==0) {
		regionUnicode ="";
	} else if (targetInfo.getElementsByTagNameNS(usedNamespace,"Unicode")[0].firstChild==null) {
		//regionUnicode ="<i>n/a</i>";
		regionUnicode ="";
	} else {
		regionUnicode = escapeStr(targetInfo.getElementsByTagNameNS(usedNamespace,"Unicode")[0].firstChild.nodeValue);
	}

	var rowClass = "regInfo_row1";
	var leftInnerHTML = "";
	if (evt!='init'){
		leftInnerHTML += "<div class='regInfo_topBox'>";
			leftInnerHTML += "<div class='regInfo_msg'>";
				leftInnerHTML += "<div class='regInfo_row1'>";
					leftInnerHTML += "<div class='regInfo_rowHead'><b>Region Type</b></div>";
					leftInnerHTML += "<div class='regInfo_rowBody'>" + tokenToName(targetShape.getAttribute("class")) + "</div>";
				leftInnerHTML += "</div>";
				for(var i in metadataArray) {
						if (rowClass == "regInfo_row1") rowClass = "regInfo_row2"; else rowClass = "regInfo_row1";
						leftInnerHTML += "<div class='" + rowClass + "'>";
							leftInnerHTML += "<div class='regInfo_rowHead'><b>" + tokenToName(i.substring(3)) + "</b></div>";
							leftInnerHTML += "<div class='regInfo_rowBody'>" + tokenToName(metadataArray[i]) + "</div>";
						leftInnerHTML += "</div>";
				}
			leftInnerHTML += "</div>";
			if (regionUnicode!="") {
				leftInnerHTML += "<div class='regInfo_msg'>";
					leftInnerHTML += "<div class='regInfo_row2'><b>Unicode</b></div>";
					leftInnerHTML += "<div class='regInfo_row1'>" + nl2br4escStr(regionUnicode) + "</div>";
				leftInnerHTML += "</div>";
			}
			if (regionText!="") {
				leftInnerHTML += "<div class='regInfo_msg'>";
					leftInnerHTML += "<div class='regInfo_row2'><b>Text</b></div>";
					leftInnerHTML += "<div class='regInfo_row1'>" + nl2br4escStr(regionText) + "</div>";
				leftInnerHTML += "</div>";
			}
		leftInnerHTML += "</div>";
	} else {
		leftInnerHTML = "<div class='regInfo_topBox'><div class='regInfo_msg'><b>Region level metadata will be displayed here when you click on a region.</b></div></div>";
	}
    
    newBody2.innerHTML = leftInnerHTML;
    document.getElementById("FOID2").appendChild(newBody2);
}