$xsltSettings = New-Object System.Xml.Xsl.XsltSettings

# 2. document() Funktion aktivieren
$xsltSettings.EnableDocumentFunction = $true

# 3. XmlUrlResolver (für Zugriff auf externe Dateien)
$xmlResolver = New-Object System.Xml.XmlUrlResolver

# 4. XslCompiledTransform-Objekt erstellen
$xslt = New-Object System.Xml.Xsl.XslCompiledTransform

# 5. XSLT laden mit den neuen Einstellungen
$xslt.Load("style.xsl", $xsltSettings, $xmlResolver)

# 6. Transformation ausführen
$xslt.Transform("input/input.xml", "output.xml")

pause