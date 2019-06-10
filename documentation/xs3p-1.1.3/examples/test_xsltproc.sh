#!bin/bash
RESULTS_DIR=xsltproc-results
LINKS_FILE=links.xml
XSLT_FILE=xs3p.xsl
ORIGINAL_XSLT_FILE=../$XSLT_FILE
#    Copy XSLT file to local directory
cp $ORIGINAL_XSLT_FILE .
#    Create results directory
if [ ! -d $RESULTS_DIR ] ;
then
  mkdir $RESULTS_DIR
fi
#    Loop through schema files
for f in *.xsd
do
  echo "Generating documentation for: $f"
  xsltproc --nonet --output $RESULTS_DIR/$f.html $XSLT_FILE $f
done
#    Test external links
# XSD_FILE=address.xsd
# echo "Generating documentation for: $XSD_FILE"
# xsltproc --nonet --output $RESULTS_DIR/$XSD_FILE.html $XSLT_FILE $XSD_FILE
# XSD_FILE=ipo.xsd
# echo "Generating documentation for: $XSD_FILE"
# xsltproc --param searchIncludedSchemas "'true'" --param linksFile "'links.xml'" --nonet --output $RESULTS_DIR/$XSD_FILE.html $XSLT_FILE $XSD_FILE
# XSD_FILE=report.xsd
# echo "Generating documentation for: $XSD_FILE"
# xsltproc --param searchIncludedSchemas "'true'" --param linksFile "'links.xml'" --nonet --output $RESULTS_DIR/$XSD_FILE.html $XSLT_FILE $XSD_FILE
#    Delete local copy of stylesheet
rm $XSLT_FILE
