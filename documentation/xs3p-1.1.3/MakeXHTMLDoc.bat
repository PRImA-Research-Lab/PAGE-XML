java -classpath "C:\Users\spl\Documents\IMPACT\XSD for IMPACT Objects, GT and Evaluation\Testing\xalan-j_2_7_0\xalan.jar";"C:\Users\spl\Documents\IMPACT\XSD for IMPACT Objects, GT and Evaluation\Testing\xalan-j_2_7_0\xalan-j_2_7_0\xml-apis.jar";"C:\Users\spl\Documents\IMPACT\XSD for IMPACT Objects, GT and Evaluation\Testing\xalan-j_2_7_0\xalan-j_2_7_0\xercesImpl.jar";"C:\Users\spl\Documents\IMPACT\XSD for IMPACT Objects, GT and Evaluation\Testing\xalan-j_2_7_0\xalan-j_2_7_0\serializer.jar" org.apache.xalan.xslt.Process -IN "C:\Users\spl\eclipse3.4.0\workspace\XML-Schema\PAGE\root\root.xsd" -XSL xs3pROOT.xsl -OUT ..\rootDoc.html
java -classpath "C:\Users\spl\Documents\IMPACT\XSD for IMPACT Objects, GT and Evaluation\Testing\xalan-j_2_7_0\xalan.jar";"C:\Users\spl\Documents\IMPACT\XSD for IMPACT Objects, GT and Evaluation\Testing\xalan-j_2_7_0\xalan-j_2_7_0\xml-apis.jar";"C:\Users\spl\Documents\IMPACT\XSD for IMPACT Objects, GT and Evaluation\Testing\xalan-j_2_7_0\xalan-j_2_7_0\xercesImpl.jar";"C:\Users\spl\Documents\IMPACT\XSD for IMPACT Objects, GT and Evaluation\Testing\xalan-j_2_7_0\xalan-j_2_7_0\serializer.jar" org.apache.xalan.xslt.Process -IN "C:\Users\spl\eclipse3.4.0\workspace\XML-Schema\PAGE\gts\binarisation.xsd" -XSL xs3pBN.xsl -OUT ..\binarisationDoc.html
java -classpath "C:\Users\spl\Documents\IMPACT\XSD for IMPACT Objects, GT and Evaluation\Testing\xalan-j_2_7_0\xalan.jar";"C:\Users\spl\Documents\IMPACT\XSD for IMPACT Objects, GT and Evaluation\Testing\xalan-j_2_7_0\xalan-j_2_7_0\xml-apis.jar";"C:\Users\spl\Documents\IMPACT\XSD for IMPACT Objects, GT and Evaluation\Testing\xalan-j_2_7_0\xalan-j_2_7_0\xercesImpl.jar";"C:\Users\spl\Documents\IMPACT\XSD for IMPACT Objects, GT and Evaluation\Testing\xalan-j_2_7_0\xalan-j_2_7_0\serializer.jar" org.apache.xalan.xslt.Process -IN "C:\Users\spl\eclipse3.4.0\workspace\XML-Schema\PAGE\gts\deskew.xsd" -XSL xs3pDS.xsl -OUT ..\deskewDoc.html
java -classpath "C:\Users\spl\Documents\IMPACT\XSD for IMPACT Objects, GT and Evaluation\Testing\xalan-j_2_7_0\xalan.jar";"C:\Users\spl\Documents\IMPACT\XSD for IMPACT Objects, GT and Evaluation\Testing\xalan-j_2_7_0\xalan-j_2_7_0\xml-apis.jar";"C:\Users\spl\Documents\IMPACT\XSD for IMPACT Objects, GT and Evaluation\Testing\xalan-j_2_7_0\xalan-j_2_7_0\xercesImpl.jar";"C:\Users\spl\Documents\IMPACT\XSD for IMPACT Objects, GT and Evaluation\Testing\xalan-j_2_7_0\xalan-j_2_7_0\serializer.jar" org.apache.xalan.xslt.Process -IN "C:\Users\spl\eclipse3.4.0\workspace\XML-Schema\PAGE\gts\dewarping.xsd" -XSL xs3pDW.xsl -OUT ..\dewarpingDoc.html
java -classpath "C:\Users\spl\Documents\IMPACT\XSD for IMPACT Objects, GT and Evaluation\Testing\xalan-j_2_7_0\xalan.jar";"C:\Users\spl\Documents\IMPACT\XSD for IMPACT Objects, GT and Evaluation\Testing\xalan-j_2_7_0\xalan-j_2_7_0\xml-apis.jar";"C:\Users\spl\Documents\IMPACT\XSD for IMPACT Objects, GT and Evaluation\Testing\xalan-j_2_7_0\xalan-j_2_7_0\xercesImpl.jar";"C:\Users\spl\Documents\IMPACT\XSD for IMPACT Objects, GT and Evaluation\Testing\xalan-j_2_7_0\xalan-j_2_7_0\serializer.jar" org.apache.xalan.xslt.Process -IN "C:\Users\spl\eclipse3.4.0\workspace\XML-Schema\PAGE\gts\pagecontent.xsd" -XSL xs3pPC.xsl -OUT ..\pagecontentDoc.html
java -classpath "C:\Users\spl\Documents\IMPACT\XSD for IMPACT Objects, GT and Evaluation\Testing\xalan-j_2_7_0\xalan.jar";"C:\Users\spl\Documents\IMPACT\XSD for IMPACT Objects, GT and Evaluation\Testing\xalan-j_2_7_0\xalan-j_2_7_0\xml-apis.jar";"C:\Users\spl\Documents\IMPACT\XSD for IMPACT Objects, GT and Evaluation\Testing\xalan-j_2_7_0\xalan-j_2_7_0\xercesImpl.jar";"C:\Users\spl\Documents\IMPACT\XSD for IMPACT Objects, GT and Evaluation\Testing\xalan-j_2_7_0\xalan-j_2_7_0\serializer.jar" org.apache.xalan.xslt.Process -IN "C:\Users\spl\eclipse3.4.0\workspace\XML-Schema\PAGE\eval\layouteval.xsd" -XSL xs3pLE.xsl -OUT ..\layoutevalDoc.html

pause