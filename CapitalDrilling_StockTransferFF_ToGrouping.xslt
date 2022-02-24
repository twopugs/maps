<?xml version="1.0" encoding="UTF-16"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" xmlns:var="http://schemas.microsoft.com/BizTalk/2003/var" exclude-result-prefixes="msxsl var userCSharp" version="1.0" xmlns:ns0="http://Map.CP_StackTransfer" xmlns:userCSharp="http://schemas.microsoft.com/BizTalk/2003/userCSharp">
  <xsl:output omit-xml-declaration="yes" method="xml" version="1.0" />
  <xsl:key name="OrderGroup" match="StockTransfers_Rcd" use="PurchaseOrderNumber"/>

  <xsl:template match="/">
    <xsl:apply-templates select="/ns0:StockTransfers" />
  </xsl:template>
  <xsl:template match="/ns0:StockTransfers">
    <ns0:StockTransfers>
      <xsl:for-each select="StockTransfers_Rcd[generate-id(.)=generate-id(key('OrderGroup',PurchaseOrderNumber))]">

        <StockTransfers_Rcd>
          <PODate>
            <xsl:value-of select="PODate/text()" />
          </PODate>
          <POYear>
            <xsl:value-of select="POYear/text()" />
          </POYear>
          <POMonth>
            <xsl:value-of select="POMonth/text()" />
          </POMonth>
          <TRFNumber>
            <xsl:value-of select="TRFNumber/text()" />
          </TRFNumber>
          <OrderNumber>
            <xsl:value-of select="OrderNumber/text()" />
          </OrderNumber>
          <PurchaseOrderNumber>
            <xsl:value-of select="userCSharp:MyConcat(PurchaseOrderNumber/text())" />
          </PurchaseOrderNumber>
          <BuyerName>
            <xsl:value-of select="BuyerName/text()" />
          </BuyerName>
          <StockAddress>
            <xsl:value-of select="StockAddress/text()" />
          </StockAddress>
          <StockTransfers_Rcd_Child9>
            <xsl:value-of select="StockTransfers_Rcd_Child9/text()" />
          </StockTransfers_Rcd_Child9>
          <xsl:for-each select="key('OrderGroup',PurchaseOrderNumber)">
            <OrderLine>     <LineNumber>
              <xsl:value-of select="LineNumber/text()" />
            </LineNumber>
            <ItemPartNumber>
              <xsl:value-of select="ItemPartNumber/text()" />
            </ItemPartNumber>
            <StockTransfers_Rcd_Child12>
              <xsl:value-of select="StockTransfers_Rcd_Child12/text()" />
            </StockTransfers_Rcd_Child12>
            <StockTransfers_Rcd_Child14>
              <xsl:value-of select="StockTransfers_Rcd_Child14/text()" />
            </StockTransfers_Rcd_Child14>
            <StockTransfers_Rcd_Child15>
              <xsl:value-of select="StockTransfers_Rcd_Child15/text()" />
            </StockTransfers_Rcd_Child15>
            <StockTransfers_Rcd_Child16>
              <xsl:value-of select="StockTransfers_Rcd_Child16/text()" />
            </StockTransfers_Rcd_Child16>
            <StockTransfers_Rcd_Child17>
              <xsl:value-of select="StockTransfers_Rcd_Child17/text()" />
            </StockTransfers_Rcd_Child17>
            <StockTransfers_Rcd_Child18>
              <xsl:value-of select="StockTransfers_Rcd_Child18/text()" />
            </StockTransfers_Rcd_Child18>
            <QuantityMet>
              <xsl:value-of select="QuantityMet/text()" />
            </QuantityMet>
            <QuantityMetYesOrNo>
              <xsl:value-of select="QuantityMetYesOrNo/text()" />
            </QuantityMetYesOrNo>
            </OrderLine>
          </xsl:for-each>
        </StockTransfers_Rcd>
      </xsl:for-each>
    </ns0:StockTransfers>
  </xsl:template>

  <msxsl:script language="C#" implements-prefix="userCSharp"><![CDATA[
///*Uncomment the following code for a sample Inline C# function
//that concatenates two inputs. Change the number of parameters of
//this function to be equal to the number of inputs connected to this functoid.*/

  public string MyConcat(string param1)
        {
            string param2 = "";
            string[] arrValue = param1.Split("-".ToCharArray());
            int arrlength = arrValue.Length;
            if (arrlength > 2)
            {
                param2 = arrValue[0] + '-' + arrValue[1] + '~' + arrValue[2];
            }
            else if (arrlength == 2)
            {
                param2 = arrValue[0] + '-' + arrValue[1]+'~'+'0';
                    }
            return param2;
        }


]]></msxsl:script>
</xsl:stylesheet>