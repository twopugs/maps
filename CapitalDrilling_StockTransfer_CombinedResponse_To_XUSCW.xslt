<?xml version="1.0" encoding="UTF-16"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" xmlns:var="http://schemas.microsoft.com/BizTalk/2003/var" exclude-result-prefixes="msxsl var userCSharp" version="1.0" xmlns:ns0="http://www.cargowise.com/Schemas/Universal/2011/11" xmlns:userCSharp="http://schemas.microsoft.com/BizTalk/2003/userCSharp">
  <xsl:output omit-xml-declaration="yes" method="xml" version="1.0" />
  <xsl:template match="/">
    <xsl:apply-templates select="/StockTransfer_OrderDetails" />
  </xsl:template>
  <xsl:template match="/StockTransfer_OrderDetails">
    <UniversalShipment>
      <Shipment>
        <DataContext>
          <DataTargetCollection>
            <DataTarget>
              <Type>
                <xsl:value-of select="CWOrderResponse/ns0:UniversalResponse/ns0:Data/ns0:UniversalShipment/ns0:Shipment/ns0:DataContext/ns0:DataSourceCollection/ns0:DataSource/ns0:Type/text()" />
              </Type>
              <Key>
                <xsl:value-of select="CWOrderResponse/ns0:UniversalResponse/ns0:Data/ns0:UniversalShipment/ns0:Shipment/ns0:DataContext/ns0:DataSourceCollection/ns0:DataSource/ns0:Key/text()" />
              </Key>
            </DataTarget>
          </DataTargetCollection>
        </DataContext>
        <Order>
          <OrderNumber>
            <xsl:value-of select="CWOrderResponse/ns0:UniversalResponse/ns0:Data/ns0:UniversalShipment/ns0:Shipment/ns0:Order/ns0:OrderNumber/text()" />
          </OrderNumber>
          <OrderLineCollection>
            <xsl:attribute name="Content">
              <xsl:value-of select="'Partial'" />
            </xsl:attribute>
            <xsl:for-each select="CWOrderResponse/ns0:UniversalResponse/ns0:Data/ns0:UniversalShipment/ns0:Shipment/ns0:Order/ns0:OrderLineCollection/ns0:OrderLine">
              <xsl:variable name="LineNum" select="ns0:LineNumber/text()" />
              <xsl:variable name="QuantityMetFromST" select="../../../../../../../../StockTransferRcds/StockTransfers_Rcd/OrderLine[LineNumber=$LineNum]/QuantityMet/text()" />
              <xsl:variable name="QuantityMetYesOrNoFromST" select="../../../../../../../../StockTransferRcds/StockTransfers_Rcd/OrderLine[LineNumber=$LineNum]/QuantityMetYesOrNo/text()" />
              <xsl:choose>
                <xsl:when test="$QuantityMetFromST">
                  <OrderLine>
                    <LineNumber>
                      <xsl:value-of select="ns0:LineNumber/text()" />
                    </LineNumber>
                                        <!--<xsl:variable name="QuantityMetCW" select="format-number(userCSharp:Add(format-number(ns0:OrderedQty/text(),'0'),format-number(ns0:QuantityMet/text(),'0'),$QuantityMetFromST,$QuantityMetYesOrNoFromST),'0')" />-->

                    <QuantityMet>
                      <xsl:value-of select="$QuantityMetFromST" />
                    </QuantityMet>
                    <CustomizedFieldCollection>
                      <CustomizedField>
                        <DataType>Decimal</DataType>
                        <Key>Mine Site Qty Received</Key>
                        <Value>
                          <xsl:value-of select="$QuantityMetFromST" />
                        </Value>
                      </CustomizedField>
                    </CustomizedFieldCollection>
                  </OrderLine>
                </xsl:when>
              </xsl:choose>


            </xsl:for-each>
          </OrderLineCollection>
        </Order>
      </Shipment>
    </UniversalShipment>
  </xsl:template>

  <msxsl:script language="C#" implements-prefix="userCSharp">
    <![CDATA[
///*Uncomment the following code for a sample Inline C# function
//that concatenates two inputs. Change the number of parameters of
//this function to be equal to the number of inputs connected to this functoid.*/

 public string Add(string OrderedQnty,string QuantityMetFromCW, string param2, string param3)
        {
            int param5 = 0;
            int QuantityMet = 0;
            int QuantityMetFromST = 0;

            if (param2.Length == 0)
            {
                QuantityMetFromST = 0;
            }
            else
            {
            decimal vOut = Convert.ToDecimal(param2);

                QuantityMetFromST = Convert.ToInt32(vOut);
            }
            if (param3 == "YES")
            {
                        decimal vOut = Convert.ToDecimal(OrderedQnty);

                param5 = Convert.ToInt32(vOut);
            }
            else if (param3 == "")
            {
                                    decimal vOut = Convert.ToDecimal(OrderedQnty);

             QuantityMet = Convert.ToInt32(vOut);
                param5 = QuantityMet;
            }
            else
            {
             QuantityMet = Convert.ToInt32(QuantityMetFromCW);
                param5 = QuantityMet + QuantityMetFromST;
            }
            return param5.ToString();
        }

]]>
  </msxsl:script>
</xsl:stylesheet>