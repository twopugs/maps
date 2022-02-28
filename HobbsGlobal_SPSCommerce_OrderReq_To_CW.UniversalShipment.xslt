<?xml version="1.0" encoding="UTF-16"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" xmlns:var="http://schemas.microsoft.com/BizTalk/2003/var" exclude-result-prefixes="msxsl var s0 userCSharp" version="1.0" xmlns:s0="http://www.spscommerce.com/RSX" xmlns:ns0="http://www.cargowise.com/Schemas/Universal/2011/11" xmlns:userCSharp="http://schemas.microsoft.com/BizTalk/2003/userCSharp">
  <xsl:output omit-xml-declaration="yes" method="xml" version="1.0" />
  <xsl:key name="Key_Console" match="//s0:Order" use="s0:Header/s0:OrderHeader/s0:PurchaseOrderNumber"/>
  <xsl:template match="/">
    <xsl:apply-templates select="/s0:Orders" />
  </xsl:template>
  <xsl:template match="/s0:Orders">
    <xsl:variable name="char-in">"</xsl:variable>
    <xsl:variable name="char-out"></xsl:variable>
    <xsl:variable name="var:v1" select="&quot;1.1&quot;" />
    <UniversalShipments>
      <xsl:for-each select="//s0:Order[generate-id(.)=generate-id(key('Key_Console', s0:Header/s0:OrderHeader/s0:PurchaseOrderNumber)[1])]">
        <xsl:sort select="s0:Header/s0:OrderHeader/s0:PurchaseOrderNumber"/>
        <UniversalShipment>
          <xsl:variable name="var:CurrentLoop_OrderNumber" select="s0:Header/s0:OrderHeader/s0:PurchaseOrderNumber" />
          <Shipment>
            <DataContext>
              <DataTargetCollection>
                <DataTarget>
                  <Type>
                    <xsl:value-of select="string('WarehouseOrder')" />
                  </Type>
                </DataTarget>
              </DataTargetCollection>
              <DataProvider>KAHAKLAKL</DataProvider>
            </DataContext>
            <LocalProcessing>
              <DeliveryRequiredBy>
                <xsl:value-of select="userCSharp:ConvertDateValue(s0:Header/s0:Dates[s0:DateTimeQualifier='002']/s0:Date/text())" />
              </DeliveryRequiredBy>
            </LocalProcessing>
            <Order>
              <OrderNumber>
                <xsl:value-of select="translate(s0:Header/s0:OrderHeader/s0:PurchaseOrderNumber/text(), $char-in, $char-out)" />
              </OrderNumber>
              <!--<xsl:if test="Header/OrderHeader/CustomerOrderNumber">-->
              <ClientReference>
                <xsl:value-of select="translate(s0:Header/s0:OrderHeader/s0:DepositorOrderNumber/text(), $char-in, $char-out)" />
              </ClientReference>
              <!--</xsl:if>-->
              <Type>
                <Code>
                  <xsl:value-of select="&quot;ORD&quot;" />
                </Code>
              </Type>
              <Warehouse>
                <Code>
                  <xsl:value-of select="&quot;HOB&quot;"/>
                </Code>
              </Warehouse>
              <OrderLineCollection>
                <xsl:for-each select="//s0:Order[s0:Header/s0:OrderHeader/s0:PurchaseOrderNumber = $var:CurrentLoop_OrderNumber]">
                  <xsl:for-each select="s0:LineItem">
                    <xsl:for-each select="s0:OrderLine">
                      <OrderLine>
                        <xsl:if test="s0:LineSequenceNumber">
                          <LineNumber>
                            <xsl:value-of select="translate(s0:LineSequenceNumber/text(), $char-in, $char-out)" />
                          </LineNumber>
                        </xsl:if>
                        <xsl:if test="s0:OrderQty">
                          <OrderedQty>
                            <xsl:value-of select="translate(s0:OrderQty/text(), $char-in, $char-out)" />
                          </OrderedQty>
                        </xsl:if>
                        <OrderedQtyUnit>
                          <!--<xsl:if test="OrderQtyUOM">-->
                          <Code>
                            <!--<xsl:value-of select="translate(OrderQtyUOM/text(), $char-in, $char-out)" />-->
                            <xsl:value-of select="&quot;UNT&quot;" />
                          </Code>
                          <!--</xsl:if>-->
                        </OrderedQtyUnit>
                        <Product>
                          <xsl:if test="s0:VendorPartNumber">
                            <Code>
                              <xsl:value-of select="translate(s0:VendorPartNumber/text(), $char-in, $char-out)" />
                            </Code>
                          </xsl:if>
                        </Product>

                      </OrderLine>
                    </xsl:for-each>
                  </xsl:for-each>
                </xsl:for-each>
              </OrderLineCollection>
            </Order>
            <CustomizedFieldCollection>
              <CustomizedField>
                <Key>TradingPartnerId</Key>
                <DataType>String</DataType>
                <Value>
                  <xsl:value-of select="translate(s0:Header/s0:OrderHeader/s0:TradingPartnerId/text(), $char-in, $char-out)" />
                </Value>
              </CustomizedField>
              <CustomizedField>
                <Key>PurchaseOrderDate</Key>
                <DataType>DateTime</DataType>
                <Value>
                  <xsl:value-of select="s0:Header/s0:OrderHeader/s0:PurchaseOrderDate/text()" />
                </Value>
              </CustomizedField>
              <CustomizedField>
                <Key>TsetPurposeCode</Key>
                <DataType>String</DataType>
                <Value>
                  <xsl:value-of select="s0:Header/s0:OrderHeader/s0:TsetPurposeCode/text()" />
                </Value>
              </CustomizedField>
              <CustomizedField>
                <Key>BuyersCurrency</Key>
                <DataType>String</DataType>
                <Value>
                  <xsl:value-of select="s0:Header/s0:OrderHeader/s0:BuyersCurrency/text()" />
                </Value>
              </CustomizedField>

            </CustomizedFieldCollection>
            <xsl:if test="string-length(s0:Header/s0:Notes/s0:Note/text())!=0">
              <NoteCollection>
                <Note>
                  <Description>Delivery Instructions</Description>
                  <IsCustomDescription>false</IsCustomDescription>
                  <NoteContext>
                    <Code>AAA</Code>
                  </NoteContext>
                  <NoteText>
                    <xsl:value-of select="s0:Header/s0:Notes/s0:Note/text()"/>
                  </NoteText>
                </Note>
              </NoteCollection>
            </xsl:if>
            <OrganizationAddressCollection>
              <xsl:variable name="var:v2" select="&quot;ConsigneeAddress&quot;" />
              <xsl:variable name="var:v3" select="&quot;GoodsBillToAddress&quot;" />
              <OrganizationAddress>
                <xsl:for-each select="s0:Header/s0:Address[s0:AddressTypeCode='ST']">
                  <AddressType>
                    <xsl:value-of select="$var:v2" />
                  </AddressType>
				  <SuppressAddressValidationError>
				                <xsl:value-of select="string('true')" />
				  </SuppressAddressValidationError>
                  <xsl:if test="s0:Address1">
                    <Address1>
                      <xsl:value-of select="s0:Address1/text()" />
                    </Address1>
                  </xsl:if>
                  <xsl:if test="s0:Address2">
                    <Address2>
                      <xsl:value-of select="s0:Address2/text()" />
                    </Address2>
                  </xsl:if>
                  <AddressOverride>
                    <xsl:value-of select="&quot;true&quot;"/>
                  </AddressOverride>
                  <City>
                    <xsl:value-of select="s0:City/text()" />
                  </City>
                  <CompanyName>
                    <xsl:value-of select="s0:AddressName/text()" />
                  </CompanyName>
                  <Country>
                    <Code>
                      <xsl:value-of select="substring(s0:Country/text(),1,2)" />
                    </Code>
                  </Country>
                  <Postcode>
                    <xsl:value-of select="s0:PostalCode/text()" />
                  </Postcode>
                  <State>
                    <xsl:value-of select="s0:State/text()" />
                  </State>
                </xsl:for-each>
              </OrganizationAddress>
              <OrganizationAddress>
                <AddressType>ConsignorDocumentaryAddress</AddressType>
                <OrganizationCode>GSIOPEAKL</OrganizationCode>
              </OrganizationAddress>
              <OrganizationAddress>
                <AddressType>SendersLocalClient</AddressType>
                <OrganizationCode>GSI</OrganizationCode>
              </OrganizationAddress>
              <OrganizationAddress>
                <AddressType>ConsignorPickupDeliveryAddress</AddressType>
                <OrganizationCode>GSI</OrganizationCode>
              </OrganizationAddress>
            </OrganizationAddressCollection>
            <!--<SubShipmentCollection>
            <SubShipment>
              <NoteCollection>
                <Note>
                  <Description>Goods Handling Instructions</Description>
                  <IsCustomDescription>false</IsCustomDescription>
                  <NoteContext>
                    <Code>AAA</Code>
                  </NoteContext>
                  <NoteText>
                    <xsl:value-of select="Header/Notes/Note/text()"/>
                  </NoteText>
                </Note>
              </NoteCollection>
            </SubShipment>
          </SubShipmentCollection>-->
          </Shipment>
        </UniversalShipment>
      </xsl:for-each>
    </UniversalShipments>
  </xsl:template>
  <msxsl:script language="C#" implements-prefix="userCSharp">
    <![CDATA[      
      public static string ReturnDateValue()
        {
            string outValue = string.Empty;
             outValue = DateTime.Now.ToString("yyyy-MM-ddTHH:mm:ss");
             
            return outValue;
        } 
           
             public static string ConvertDateValue(string inputDateString)
              {
                string outDateString;
                System.DateTime dt = DateTime.ParseExact(inputDateString, "yyyy-MM-dd", System.Globalization.CultureInfo.InvariantCulture);
                outDateString = dt.ToString("yyyy-MM-ddTHH:mm:ss");

                return outDateString;
              }  
      public static string ReturnCountryCode(string inputDataString)
      {
            string OutDataString=string.Empty;
            if(inputDataString.Length!=0 && inputDataString.Length>2)
            {
              OutDataString = inputDataString.Substring(0,2);
            }
            else if(inputDataString.Length ==2)
            {
            OutDataString=inputDataString;
            }
            return OutDataString;
      }

]]>
  </msxsl:script>
</xsl:stylesheet>