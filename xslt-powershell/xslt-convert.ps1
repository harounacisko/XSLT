$xslt = New-Object System.Xml.Xsl.XslCompiledTransform;
$xslt.load( "style.xslt" )
$xslt.Transform( "input.xml", "output.xml")
Write-Host "Die Datei output.xml wurde erzeugt."
pause