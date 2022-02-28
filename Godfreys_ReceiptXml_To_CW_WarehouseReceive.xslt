<?xml version="1.0" encoding="utf-16"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" xmlns:var="http://schemas.microsoft.com/BizTalk/2003/var" exclude-result-prefixes="msxsl var userCSharp" version="1.0" xmlns:ns0="http://www.cargowise.com/Schemas/Universal/2011/11" xmlns:userCSharp="http://schemas.microsoft.com/BizTalk/2003/userCSharp">
  <xsl:output omit-xml-declaration="yes" method="xml" version="1.0" />
  <xsl:template match="/">
    <xsl:apply-templates select="/Receipts" />
  </xsl:template>
  <xsl:template match="/Receipts">
    <xsl:variable name="var:v3" select="userCSharp:StringConcat(&quot;SupplierDocumentaryAddress&quot;)" />
    <UniversalShipment>
      <Shipment>
        <DataContext>
          <DataTargetCollection>
            <DataTarget>
              <Type>WarehouseReceive</Type>
            </DataTarget>
          </DataTargetCollection>
        </DataContext>
        <xsl:for-each select="PurchaseOrder">
          <Order>
            <OrderNumber>
              <xsl:value-of select="PurchaseOrderId/text()" />
            </OrderNumber>
            <ClientReference>
              <xsl:value-of select="UserDef1/text()" />
            </ClientReference>
            <Warehouse>
              <Code>BNE</Code>
            </Warehouse>
            <OrderLineCollection>
              <xsl:for-each select="Details/PurchaseOrderDetail">

                <OrderLine>
                  <LineNumber>
                    <xsl:value-of select="LineNumber/text()" />
                  </LineNumber>
                  <OrderedQty>
                    <xsl:value-of select="SKU/Quantity/text()" />
                  </OrderedQty>
                  <OrderedQtyUnit>
                    <Code>
                      <xsl:value-of select="QtyUM/text()" />
                    </Code>
                  </OrderedQtyUnit>
                  <Product>
                    <Code>
                      <xsl:value-of select="SKU/Item/text()" />
                    </Code>
                  </Product>
                </OrderLine>
              </xsl:for-each>
            </OrderLineCollection>
          </Order>
        </xsl:for-each>
        <CustomizedFieldCollection>
          <CustomizedField>
            <Key>
              <xsl:value-of select="string('USERDEF')" />
            </Key>
            <DataType>
              <xsl:value-of select="string('String')" />
            </DataType>
            <Value>
              <xsl:value-of select="PurchaseOrder/UserDef2/text()" />
            </Value>
          </CustomizedField>
          <CustomizedField>
            <Key>
              <xsl:value-of select="string('CNTNO')" />
            </Key>
            <DataType>
              <xsl:value-of select="string('String')" />
            </DataType>
            <Value>
              <xsl:value-of select="PurchaseOrder/UserDef3/text()" />
            </Value>
          </CustomizedField>
        </CustomizedFieldCollection>
        <OrganizationAddressCollection>
          <OrganizationAddress>
            <AddressType>
              <xsl:value-of select="string('SupplierDocumentaryAddress')" />
            </AddressType>
            <OrganizationCode>
              <xsl:value-of select="PurchaseOrder/Company/text()" />
            </OrganizationCode>
          </OrganizationAddress>
          <OrganizationAddress>
            <AddressType>
              <xsl:value-of select="string('ConsignorDocumentaryAddress')" />
            </AddressType>
            <OrganizationCode>
              <xsl:value-of select="string('GODFREYS')" />
            </OrganizationCode>
          </OrganizationAddress>
        </OrganizationAddressCollection>
      </Shipment>
    </UniversalShipment>
  </xsl:template>
  <msxsl:script language="C#" implements-prefix="userCSharp">
    <![CDATA[
public string StringConcat(string param0)
{
   return param0;
}



]]>
  </msxsl:script>
</xsl:stylesheet>