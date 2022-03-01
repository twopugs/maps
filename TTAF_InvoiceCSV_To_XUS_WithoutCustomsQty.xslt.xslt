<?xml version="1.0" encoding="utf-16"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" xmlns:var="http://schemas.microsoft.com/BizTalk/2003/var" exclude-result-prefixes="msxsl var s0 userCSharp" version="1.0" xmlns:s0="http://Map.TTAF_InvoiceUpload" xmlns:ns0="http://www.cargowise.com/Schemas/Universal/2011/11" xmlns:userCSharp="http://schemas.microsoft.com/BizTalk/2003/userCSharp">
  <xsl:output omit-xml-declaration="yes" method="xml" version="1.0" />
  <xsl:key name="InvoiceDate" match="TTAFInvoiceUpload_Rcds" use="concat(InvoiceDate,InvoiceNumber)"/>
  <xsl:key name="InvoiceNum" match="TTAFInvoiceUpload_Rcds" use="concat(JobNumber,InvoiceNumber)"/>
  <xsl:key name="EntryInstruct" match="TTAFInvoiceUpload_Rcds" use="concat(JobNumber,Buyer,IRDP,InvoiceNumber)"/>

  <xsl:template match="/">
    <xsl:apply-templates select="/s0:TTAFInvoiceUpload" />
  </xsl:template>
  <xsl:template match="/s0:TTAFInvoiceUpload">

    <UniversalShipment>

      <Shipment>
        <DataContext>
          <DataTargetCollection>
            <xsl:variable name="var:v1" select="userCSharp:StringConcat(&quot;CustomsDeclaration&quot;)" />
            <DataTarget>
              <Type>
                <xsl:value-of select="$var:v1" />
              </Type>
              <Key>
                <xsl:value-of select="TTAFInvoiceUpload_Rcds/JobNumber/text()" />
              </Key>
            </DataTarget>
          </DataTargetCollection>
        </DataContext>
        <CommercialInfo>
          <CommercialInvoiceCollection>

            <xsl:for-each select="TTAFInvoiceUpload_Rcds[generate-id(.)=generate-id(key('InvoiceNum',concat(JobNumber,InvoiceNumber)))]">
              <xsl:variable name="var:v5" select="userCSharp:StringConcat(&quot;ZAR&quot;)" />

              <CommercialInvoice>
                <InvoiceNumber>
                  <xsl:value-of select="InvoiceNumber/text()" />
                </InvoiceNumber>
                <IncoTerm>
                  <Code>
                    <xsl:value-of select="Incoterm/text()" />
                  </Code>
                </IncoTerm>
                <xsl:variable name="var:v2" select="userCSharp:InitCumulativeSum(0)" />
                <xsl:for-each select="key('InvoiceNum',concat(JobNumber,InvoiceNumber))">
                  <xsl:variable name="var:v3" select="userCSharp:AddToCumulativeSum(0,string(Price/text()),&quot;1000&quot;)" />
                </xsl:for-each>
                <xsl:variable name="var:v4" select="userCSharp:GetCumulativeSum(0)" />
                <InvoiceAmount>
                  <xsl:value-of select="$var:v4" />
                </InvoiceAmount>
                <InvoiceCurrency>
                  <Code>
                    <xsl:value-of select="$var:v5" />
                  </Code>
                </InvoiceCurrency>
                <InvoiceDate>
                  <xsl:value-of select="userCSharp:ConvertDateValue(InvoiceDate/text())" />
                </InvoiceDate>
                <CommercialInvoiceLineCollection>
                  <xsl:for-each select="key('InvoiceNum',concat(JobNumber,InvoiceNumber))">

                    <CommercialInvoiceLine>
                      <LineNo>
                        <xsl:value-of select="position()" />
                      </LineNo>
                      <PrimaryPreference>
                        <xsl:value-of select="Preference/text()" />
                      </PrimaryPreference>
                      <EntryInstructionLink>
                        <xsl:variable name="EntryLink" select="concat('1',GoodsOrigin/text(),'COTH',IRDP,Buyer/text(),InvoiceNumber,JobNumber)" />
                     
                        <xsl:for-each select="../TTAFInvoiceUpload_Rcds[generate-id(.)=generate-id(key('EntryInstruct',concat(JobNumber,Buyer,IRDP,InvoiceNumber)))]">
                          <xsl:if test="concat('1',GoodsOrigin/text(),'COTH',IRDP,Buyer/text(),InvoiceNumber,JobNumber)=$EntryLink">

                            <xsl:value-of select="position()"/>
                          </xsl:if>
                        </xsl:for-each>
                      </EntryInstructionLink>
                      <CountryOfOrigin>
                        <Code>
                          <xsl:value-of select="GoodsOrigin/text()" />
                        </Code>
                      </CountryOfOrigin>
                     <!--<CustomsQuantity>
                        <xsl:value-of select="CustomsQty/text()" />
                      </CustomsQuantity>
                      <CustomsQuantityUnit>
                        <Code>
                          <xsl:value-of select="CustomsQtyUnit/text()" />
                        </Code>
                      </CustomsQuantityUnit>-->
                      <LinePrice>
                        <xsl:value-of select="Price/text()" />
                      </LinePrice>
                      <CustomsValue>
                        <xsl:value-of select="Price/text()" />
                      </CustomsValue>
                      <InvoiceQuantity>
                        <xsl:value-of select="InvoiceQty/text()" />
                      </InvoiceQuantity>
                      <InvoiceQuantityUnit>
                        <Code>
                          <xsl:value-of select="InvoiceQtyUnit/text()" />
                        </Code>
                      </InvoiceQuantityUnit>
                      <PartNo>
                        <xsl:value-of select="ProductCode/text()" />
                      </PartNo>
                      <Weight>
                        <xsl:choose>
                          <xsl:when test="GrossWeight/text()">
                            <xsl:value-of select="GrossWeight/text()" />
                          </xsl:when>
                          <xsl:otherwise>0</xsl:otherwise>
                        </xsl:choose>
                      </Weight>
                    </CommercialInvoiceLine>
                  </xsl:for-each>
                </CommercialInvoiceLineCollection>
              </CommercialInvoice>
            </xsl:for-each>
          </CommercialInvoiceCollection>
        </CommercialInfo>
        <EntryInstructionCollection>
          <xsl:for-each select="TTAFInvoiceUpload_Rcds[generate-id(.)=generate-id(key('EntryInstruct',concat(JobNumber,Buyer,IRDP,InvoiceNumber)))]">
            <EntryInstruction>          
              <Style>
                <xsl:choose>
                  <xsl:when test="IRDP='DP'">
                    <xsl:text>11</xsl:text>
                  </xsl:when>
                  <xsl:when test="IRDP='IR'">
                    <xsl:text>85</xsl:text>
                  </xsl:when>
                  <xsl:otherwise>
                    <xsl:text>0</xsl:text>
                  </xsl:otherwise>
                </xsl:choose>
              </Style>
              <Link>
                <xsl:value-of select="position()" />
              </Link>
              <Description>
                <xsl:value-of select="Buyer/text()"/>
              </Description>
              <AddInfoCollection>
                <AddInfo>
                  <Value>
                    <xsl:value-of select="'M'" />
                  </Value>
                  <Key>Scope</Key>
                </AddInfo>
                <AddInfo>
                  <Value>
                    <xsl:value-of select="'Y'" />
                  </Value>
                  <Key>IsUCROverridden</Key>
                </AddInfo>
                <AddInfo>
                  <Value>
                    <xsl:value-of select="concat('1',GoodsOrigin/text(),'COTH',Buyer/text())" />
                  </Value>
                  <Key>UCROverridde</Key>
                </AddInfo>
              </AddInfoCollection>
            </EntryInstruction>
          </xsl:for-each>
        </EntryInstructionCollection>
      </Shipment>
    </UniversalShipment>
  </xsl:template>
  <msxsl:script language="C#" implements-prefix="userCSharp">
    <![CDATA[
public string StringConcat(string param0)
{
   return param0;
}


public string InitCumulativeSum(int index)
{
	if (index >= 0)
	{
		if (index >= myCumulativeSumArray.Count)
		{
			int i = myCumulativeSumArray.Count;
			for (; i<=index; i++)
			{
				myCumulativeSumArray.Add("");
			}
		}
		else
		{
			myCumulativeSumArray[index] = "";
		}
	}
	return "";
}

public System.Collections.ArrayList myCumulativeSumArray = new System.Collections.ArrayList();

public string AddToCumulativeSum(int index, string val, string notused)
{
	if (index < 0 || index >= myCumulativeSumArray.Count)
	{
		return "";
    }
	double d = 0;
	if (IsNumeric(val, ref d))
	{
		if (myCumulativeSumArray[index] == "")
		{
			myCumulativeSumArray[index] = d;
		}
		else
		{
			myCumulativeSumArray[index] = (double)(myCumulativeSumArray[index]) + d;
		}
	}
	return (myCumulativeSumArray[index] is double) ? ((double)myCumulativeSumArray[index]).ToString(System.Globalization.CultureInfo.InvariantCulture) : "";
}

public string GetCumulativeSum(int index)
{
	if (index < 0 || index >= myCumulativeSumArray.Count)
	{
		return "";
	}
	return (myCumulativeSumArray[index] is double) ? ((double)myCumulativeSumArray[index]).ToString(System.Globalization.CultureInfo.InvariantCulture) : "";
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


 public static string ConvertDateValue(string inputDateString)
              {
                string outDateString="";
                 System.DateTime dt ;
                 if(inputDateString.Length==9)
                 {
                 inputDateString="0"+inputDateString;
                 }
              if(inputDateString.Contains("/"))
              {
               dt = DateTime.ParseExact(inputDateString, "dd/MM/yyyy", System.Globalization.CultureInfo.InvariantCulture);
                            outDateString = dt.ToString("yyyy-MM-ddTHH:mm:ss");
  }
               else if(inputDateString.Contains("-"))
              {
                dt = DateTime.ParseExact(inputDateString, "dd-MM-yyyy", System.Globalization.CultureInfo.InvariantCulture);
                            outDateString = dt.ToString("yyyy-MM-ddTHH:mm:ss");

             }

                return outDateString;
              }  

]]>
  </msxsl:script>
</xsl:stylesheet>