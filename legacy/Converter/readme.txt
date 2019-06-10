Aletheia to PAGE converter

To convert old ground truth files follow these steps:
* make sure all ground truth files have been saved using the
  last version of Aletheia before the redesign
  (there must not be a <!DOCTYPE... element)
* change the name of all XML files to ID.xml if necessary
* execute the converter
* check the link to the image within the XML file - can be done automatically
  using the converter (tick "Change file name of referenced image...")
* check image dimensions within XML files if necessary - can be done automatically
  using the converter (tick "Check and correct image dimensions...")
* convert all files
* change all image file names to ID.tif


What the converter does: 

Phase 1
* change namespace to http://schema.primaresearch.org/gt/gts/pagecontent/2009-04-27
	find: xmlns="http://schema.primaresearch.org/PAGE/gts/pagecontent/2009-03-16" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://schema.primaresearch.org/PAGE/gts/pagecontent/2009-03-16 http://schema.primaresearch.org/PAGE/gts/pagecontent/2009-03-16/pagecontent.xsd"
	replace with: xmlns="http://schema.primaresearch.org/gt/gts/pagecontent/2009-04-27"
* check and correct image dimensions by reading the corresponding image file (optional)
* change the referenced image file name to match the name of the XML file (optional)

Phase 2 (DeleteTextEquiv.xsl):
* delete all <text_equiv> (including <plain_text> and <unicode>) elements
* strip white spaces

Phase 3 (AletheiaToPAGE.xsl):
* convert to PAGE format
* set namespace back to http://schema.primaresearch.org/gt/gts/pagecontent/2009-03-16

Phase 4
* validate against PAGE XML Schema



------------
--- ToDo ---
------------

* set pcGtsId properly
* handle text within AletheiaToPAGE stylesheet (and copy any existing text to the right position)
* display reading order and layers in SVG

* check and delete unused attributes