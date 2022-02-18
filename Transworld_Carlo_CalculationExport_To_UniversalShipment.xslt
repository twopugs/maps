<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" xmlns:var="http://schemas.microsoft.com/BizTalk/2003/var" exclude-result-prefixes="msxsl var userCSharp" version="1.0" xmlns:ns0="http://www.cargowise.com/Schemas/Universal/2011/11" xmlns:userCSharp="http://schemas.microsoft.com/BizTalk/2003/userCSharp">
  <xsl:output omit-xml-declaration="yes" method="xml" version="1.0" />
  <xsl:template match="/">
    <xsl:apply-templates select="/CarloAbrechnung" />
  </xsl:template>
  <xsl:template match="/CarloAbrechnung">
    <UniversalShipment>
      <Shipment>
        <DataContext>
          <DataTargetCollection>
            <DataTarget>
			  <Key>
                <xsl:value-of select="NK/ABRECHNUNG/SENDUNG/EXTNR/text()" />
              </Key>	
              <Type>
                <xsl:value-of select="'ForwardingShipment'" />
              </Type>
            </DataTarget>
          </DataTargetCollection>
        </DataContext>
         <SubShipmentCollection>
			<SubShipment>
				<JobCosting>
					<ChargeLineCollection>
							<xsl:for-each select="NK/ABRECHNUNG">
								<ChargeLine>
									<xsl:choose>             
										<xsl:when test="substring(BETRAG,0,9) = '0.000000'"> 
											<SellOSAmount>
												<xsl:value-of select="BETRAGSTP/text()" />
											</SellOSAmount>
										</xsl:when>
										<xsl:when test="BETRAG = '0.00000'"> 
											<SellOSAmount>
												<xsl:value-of select="BETRAGSTP/text()" />
											</SellOSAmount>
										</xsl:when>
										<xsl:when test="BETRAG = '0.0000'"> 
											<SellOSAmount>
												<xsl:value-of select="BETRAGSTP/text()" />
											</SellOSAmount>
										</xsl:when>
										<xsl:when test="BETRAG = '0.000'"> 
											<SellOSAmount>
												<xsl:value-of select="BETRAGSTP/text()" />
											</SellOSAmount>
										</xsl:when>
										<xsl:when test="BETRAG = '0.00'"> 
											<SellOSAmount>
												<xsl:value-of select="BETRAGSTP/text()" />
											</SellOSAmount>
										</xsl:when>
										<xsl:when test="BETRAG = '0.0'"> 
											<SellOSAmount>
												<xsl:value-of select="BETRAGSTP/text()" />
											</SellOSAmount>
										</xsl:when>
										<xsl:when test="BETRAG = '0'"> 
											<SellOSAmount>
												<xsl:value-of select="BETRAGSTP/text()" />
											</SellOSAmount>
										</xsl:when>
										<xsl:otherwise>
											<SellOSAmount>
												<xsl:value-of select="BETRAG/text()" />
											</SellOSAmount>
										</xsl:otherwise>
									</xsl:choose>
									<SellOSCurrency>
										<Code>
											<xsl:value-of select="WAEHRUNG/text()" />
										</Code>
									</SellOSCurrency>
								</ChargeLine>
							</xsl:for-each>
					</ChargeLineCollection>
				</JobCosting>
			</SubShipment>
          </SubShipmentCollection>
      </Shipment>
    </UniversalShipment>
  </xsl:template>
</xsl:stylesheet>