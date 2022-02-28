<?xml version="1.0" encoding="UTF-16"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" xmlns:var="http://schemas.microsoft.com/BizTalk/2003/var" exclude-result-prefixes="msxsl var s0 userCSharp" version="1.0" xmlns:ns0="http://Godfrey.OrderConfirmation_FILEHEAD_FF" xmlns:s0="http://www.cargowise.com/Schemas/Universal/2011/11" xmlns:userCSharp="http://schemas.microsoft.com/BizTalk/2003/userCSharp">
  <xsl:output omit-xml-declaration="yes" method="xml" version="1.0" />
  <xsl:template match="/">
    <xsl:apply-templates select="/s0:UniversalInterchange" />
  </xsl:template>
  <xsl:template match="/s0:UniversalInterchange">
    <xsl:variable name="var:v1" select="userCSharp:StringConcat(&quot;FILEHEAD&quot;)" />
    <xsl:variable name="var:v6" select="userCSharp:StringConcat(&quot;FILETAIL&quot;)" />
    <ns0:OrderConfirmation_FF>
      <FileHead>
        <FILEHEAD>
          <xsl:value-of select="$var:v1" />
        </FILEHEAD>
      </FileHead>
      <xsl:for-each select="s0:Body/s0:UniversalShipment/s0:Shipment/s0:Order">
        <xsl:variable name="var:v2" select="userCSharp:StringConcat(&quot;DATAHEAD&quot;)" />
        <xsl:variable name="ActionPurposeCode" select="../s0:DataContext/s0:ActionPurpose/s0:Code"/>
        <DataHead>
          <DataHead>
            <xsl:value-of select="$var:v2" />
          </DataHead>
          <OrderNum>
            <xsl:value-of select="s0:OrderNumber/text()" />
          </OrderNum>
          <Ignore/>
          <Ignore/>          
          <OrderNum>
            <xsl:value-of select="s0:OrderNumber/text()" />
          </OrderNum>
        </DataHead>
        <xsl:for-each select="s0:OrderLineCollection/s0:OrderLine">
             <xsl:variable name="var:v3" select="userCSharp:StringConcat(&quot;DATADETL&quot;)" />
            <xsl:variable name="var:v4" select="userCSharp:MathRound(string(s0:OrderedQty/text()) , &quot;3&quot;)" />
            <xsl:variable name="var:v5" select="userCSharp:MathRound(string(s0:QuantityMet/text()) , &quot;3&quot;)" />
            <DataDetail>
              <DATADETL>
                <xsl:value-of select="$var:v3" />
              </DATADETL>
              <xsl:if test="s0:LineNumber">
                <LineNumber>
                  <xsl:value-of select="s0:LineNumber/text()" />
                </LineNumber>
              </xsl:if>
              <ProductCode>
                <xsl:value-of select="s0:Product/s0:Code/text()" />
              </ProductCode>
              <OrderQnty>
                <xsl:value-of select="s0:OrderedQty/text()" />
              </OrderQnty>
              <QuantityMet>
                <xsl:choose>
                  <xsl:when test="$ActionPurposeCode='CNF'">
                    <xsl:value-of select="s0:OrderedQty/text()" />
                  </xsl:when>
                  <xsl:otherwise>
                    <xsl:value-of select="s0:QuantityMet/text()" />
                  </xsl:otherwise>
                </xsl:choose>
              </QuantityMet>
            </DataDetail>
          </xsl:for-each>
        </xsl:for-each>
      
      <FileTail>
        <FILETAIL>
          <xsl:value-of select="$var:v6" />
        </FILETAIL>
      </FileTail>
    </ns0:OrderConfirmation_FF>
  </xsl:template>
  <msxsl:script language="C#" implements-prefix="userCSharp"><![CDATA[
public string StringConcat(string param0)
{
   return param0;
}


public string MathRound(string val, string decimals)
{
	string retval = "";
	double v = 0;
	double db = 0;
	if (IsNumeric(val, ref v) && IsNumeric(decimals, ref db))
	{
		try
		{
			int d = (int) db;
			double ret = Math.Round(v, d);
			retval = ret.ToString(System.Globalization.CultureInfo.InvariantCulture);
		}
		catch (Exception)
		{
		}
	}
	return retval;
}


public bool IsNumeric(string val)
{
	if (val == null)
	{
		return false;
	}
	double d = 0;
	return Double.TryParse(val, System.Globalization.NumberStyles.AllowThousands | System.Globalization.NumberStyles.Float, System.Globalization.CultureInfo.InvariantCulture, out d);
}

public bool IsNumeric(string val, ref double d)
{
	if (val == null)
	{
		return false;
	}
	return Double.TryParse(val, System.Globalization.NumberStyles.AllowThousands | System.Globalization.NumberStyles.Float, System.Globalization.CultureInfo.InvariantCulture, out d);
}


]]></msxsl:script>
</xsl:stylesheet>