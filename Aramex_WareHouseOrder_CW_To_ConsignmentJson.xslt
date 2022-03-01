<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" xmlns:var="http://schemas.microsoft.com/BizTalk/2003/var" exclude-result-prefixes="msxsl var s0 json userCSharp" version="1.0" xmlns:s0="http://www.cargowise.com/Schemas/Universal/2011/11" xmlns:userCSharp="http://schemas.microsoft.com/BizTalk/2003/userCSharp" xmlns:json='http://james.newtonking.com/projects/json'>
  <xsl:output omit-xml-declaration="yes" method="xml" version="1.0" />
  <xsl:template match="/">
    <xsl:apply-templates select="/s0:UniversalInterchange" />
  </xsl:template>
  <xsl:template match="/s0:UniversalInterchange">
    <xsl:variable name="Senderid" select="s0:Header/s0:SenderID"/>
    <xsl:variable name="var:v1" select="userCSharp:StringConcat(string(s0:Shipment/s0:CarrierCorrectedWeight/text()))" />
    <xsl:for-each select="s0:Body/s0:UniversalShipment">
      <xsl:if test="s0:Shipment/s0:DataContext/s0:ActionPurpose/s0:Code='MFW' and s0:Shipment/s0:DataContext/s0:DataSourceCollection/s0:DataSource/s0:Type = 'WarehouseOrder'">
        <Consignment>
          <To>
            <BusinessName>
              <xsl:value-of select="s0:Shipment/s0:OrganizationAddressCollection/s0:OrganizationAddress[s0:AddressType='ConsigneeAddress']/s0:CompanyName "/>
            </BusinessName>
            <ContactName>
              <xsl:choose>
                <xsl:when test="string-length(s0:Shipment/s0:OrganizationAddressCollection/s0:OrganizationAddress[s0:AddressType='ConsigneeAddress']/s0:ContactName)>1">
                  <xsl:value-of select="s0:Shipment/s0:OrganizationAddressCollection/s0:OrganizationAddress[s0:AddressType='ConsigneeAddress']/s0:ContactName"/>
                </xsl:when>
                <xsl:otherwise>
                  <xsl:value-of select="s0:Shipment/s0:OrganizationAddressCollection/s0:OrganizationAddress[s0:AddressType='ConsigneeAddress']/s0:CompanyName "/>
                </xsl:otherwise>
              </xsl:choose>
            </ContactName>
            <xsl:variable name="Phone">
              <xsl:choose>
                <xsl:when test="string-length(s0:Shipment/s0:OrganizationAddressCollection/s0:OrganizationAddress[s0:AddressType='ConsigneeAddress']/s0:Phone)>1">
                  <xsl:value-of select="s0:Shipment/s0:OrganizationAddressCollection/s0:OrganizationAddress[s0:AddressType='ConsigneeAddress']/s0:Phone" />
                </xsl:when>
                <xsl:otherwise>
                  <xsl:value-of select="s0:Shipment/s0:OrganizationAddressCollection/s0:OrganizationAddress[s0:AddressType='ConsigneeAddress']/s0:Mobile" />
                </xsl:otherwise>
              </xsl:choose>
            </xsl:variable>
            <PhoneNumber>
              <xsl:choose>
                <xsl:when test="string-length($Phone)>1">
                  <xsl:value-of select="$Phone" />
                </xsl:when>
                <xsl:otherwise>
                  <xsl:value-of select="string('1234567')" />
                </xsl:otherwise>
              </xsl:choose>
            </PhoneNumber>
            <Email>
              <xsl:choose>
                <xsl:when test="string-length(s0:Shipment/s0:OrganizationAddressCollection/s0:OrganizationAddress[s0:AddressType='ConsigneeAddress']/s0:Email)>1">
                  <xsl:value-of select="s0:Shipment/s0:OrganizationAddressCollection/s0:OrganizationAddress[s0:AddressType='ConsigneeAddress']/s0:Email"/>
                </xsl:when>
                <xsl:otherwise>
                  
                  <xsl:choose>
                    <xsl:when test="starts-with($Senderid,'KAH')">
                      <xsl:value-of select="string('warehouse@hobbsglobal.co.nz')"/>
                    </xsl:when>
                    <xsl:when test="starts-with($Senderid,'EIF')">
                      <xsl:value-of select="string('warehouse@hobbsglobal.co.nz')"/>
                    </xsl:when>
                  </xsl:choose>
                </xsl:otherwise>
              </xsl:choose>
              
            </Email>

            <Address>
              <StreetAddress>
                <xsl:value-of select="s0:Shipment/s0:OrganizationAddressCollection/s0:OrganizationAddress[s0:AddressType='ConsigneeAddress']/s0:Address1"/>
              </StreetAddress>
              <AdditionalDetails/>
              <Locality>
              
				  <xsl:choose>
					<xsl:when test="string-length(s0:Shipment/s0:OrganizationAddressCollection/s0:OrganizationAddress[s0:AddressType='ConsigneeAddress']/s0:Address2)>1">
						<xsl:value-of select="s0:Shipment/s0:OrganizationAddressCollection/s0:OrganizationAddress[s0:AddressType='ConsigneeAddress']/s0:Address2" />
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="s0:Shipment/s0:OrganizationAddressCollection/s0:OrganizationAddress[s0:AddressType='ConsigneeAddress']/s0:City" />
					</xsl:otherwise>
				  </xsl:choose>
				
              </Locality>
              <StateOrProvince>
                <xsl:value-of select="s0:Shipment/s0:OrganizationAddressCollection/s0:OrganizationAddress[s0:AddressType='ConsigneeAddress']/s0:State"/>
              </StateOrProvince>
              <PostalCode>
                <xsl:value-of select="s0:Shipment/s0:OrganizationAddressCollection/s0:OrganizationAddress[s0:AddressType='ConsigneeAddress']/s0:Postcode"/>
              </PostalCode>
              <Country>
                <xsl:choose>
                  <xsl:when test="string-length(s0:Shipment/s0:OrganizationAddressCollection/s0:OrganizationAddress[s0:AddressType='ConsigneeAddress']/s0:Country/s0:Code)>0">
                    <xsl:value-of select="s0:Shipment/s0:OrganizationAddressCollection/s0:OrganizationAddress[s0:AddressType='ConsigneeAddress']/s0:Country/s0:Code"/>
                  </xsl:when>
                  <xsl:otherwise>
                    <xsl:value-of select="string('NZ')"/>
                  </xsl:otherwise>
                </xsl:choose>
              </Country>
            </Address>
          </To>
          <xsl:for-each select ="s0:Shipment/s0:PackingLineCollection/s0:PackingLine">
            <xsl:variable name="packtypecode" select="s0:PackType/s0:Code/text()"/>
            <xsl:choose>
              <xsl:when test="$packtypecode='A4' or $packtypecode='A5' or $packtypecode='A2' or $packtypecode='A3' or $packtypecode='DL'">
                <Items json:Array='true'>
                  <Quantity>
                    <xsl:value-of select="s0:PackQty"/>
                  </Quantity>
                  <PackageType>
                    <xsl:value-of select="string('S')"/>
                  </PackageType>

                  <SatchelSize>
                    <xsl:value-of select="$packtypecode"/>
                  </SatchelSize>
                  <Reference>
                    <xsl:value-of select="../../s0:DataContext/s0:DataSourceCollection/s0:DataSource/s0:Key/text()"/>
                  </Reference>
                </Items>

              </xsl:when>
              <xsl:otherwise>
                <Items json:Array='true'>
                  <Quantity>
                    <xsl:value-of select="s0:PackQty"/>
                  </Quantity>
                  <PackageType>
                    <xsl:value-of select="string('P')"/>
                  </PackageType>
                  <WeightDead>
                    <xsl:value-of select="s0:Weight/text()"/>
                  </WeightDead>
                  <Length>
                    <xsl:variable name="Length" select="s0:Length"/>
                    <xsl:variable name="LengthUnit" select="s0:LengthUnit/s0:Code/text()"/>
                    <xsl:choose>
                      <xsl:when test="$LengthUnit='M'">
                        <xsl:value-of select="$Length*100"/>
                      </xsl:when>
                      <xsl:otherwise>
                        <xsl:value-of select="$Length"/>
                      </xsl:otherwise>
                    </xsl:choose>
                  </Length>
                  <Width>
                    <xsl:variable name="Width" select="s0:Width"/>
                    <xsl:variable name="WidthUnit" select="s0:WidthUnit/s0:Code/text()"/>
                    <xsl:choose>
                      <xsl:when test="$WidthUnit='M'">
                        <xsl:value-of select="$Width*100"/>
                      </xsl:when>
                      <xsl:otherwise>
                        <xsl:value-of select="$Width"/>
                      </xsl:otherwise>
                    </xsl:choose>
                  </Width>
                  <Height>
                    <xsl:variable name="Height" select="s0:Height"/>
                    <xsl:variable name="HeightUnit" select="s0:HeightUnit/s0:Code/text()"/>
                    <xsl:choose>
                      <xsl:when test="$HeightUnit='M'">
                        <xsl:value-of select="$Height*100"/>
                      </xsl:when>
                      <xsl:otherwise>
                        <xsl:value-of select="$Height"/>
                      </xsl:otherwise>
                    </xsl:choose>
                  </Height>
                  <Reference>
                    <xsl:value-of select="../../s0:DataContext/s0:DataSourceCollection/s0:DataSource/s0:Key/text()"/>
                  </Reference>
                </Items>
              </xsl:otherwise>
            </xsl:choose>

          </xsl:for-each>
          <InstructionsPublic>
            <xsl:value-of select="s0:Shipment/s0:NoteCollection/s0:Note[s0:Description='Goods Handling Instructions']/s0:NoteText/text()"/>
          </InstructionsPublic>
          <ExternalRef1>
            <xsl:value-of select="s0:Shipment/s0:DataContext/s0:DataSourceCollection/s0:DataSource/s0:Key/text()"/>
          </ExternalRef1>

        </Consignment>
      </xsl:if>
    </xsl:for-each>
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
