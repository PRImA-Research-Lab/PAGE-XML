rem You can make xsltproc.exe available on Windows by using Chocolatey package manager.
rem If you are using Chocolatey, just run "choco install strawberryperl" and after that the batch file should work.

set RESULTS_DIR=msxsl-results
set LINKS_FILE=links.xml

set XSLT_FILE=xs3p.xsl
set ORIGINAL_XSLT_FILE=..\%XSLT_FILE%
rem Copy XSLT file to local directory
copy %ORIGINAL_XSLT_FILE% .
rem Create results directory
if not exist %RESULTS_DIR% mkdir %RESULTS_DIR%
rem Loop through schema files
for %%f in (*.xsd) do xsltproc.exe --nonet --output %RESULTS_DIR%\%%f.html %XSLT_FILE% %%f

rem Test external links
rem set XSD_FILE=address.xsd
rem xsltproc.exe --nonet --stringparam searchImportedSchemas true --stringparam searchIncludedSchemas true --stringparam linksFile %LINKS_FILE% --output %RESULTS_DIR%\%XSD_FILE%.html %XSLT_FILE% %XSD_FILE%

rem Delete local copy of stylesheet
del %XSLT_FILE%
