<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" xmlns:var="http://schemas.microsoft.com/BizTalk/2003/var" exclude-result-prefixes="msxsl var s0" version="1.0" xmlns:s0="http://www.cargowise.com/Schemas/Universal/2011/11">
  <xsl:output omit-xml-declaration="yes" method="xml" version="1.0" />
  <xsl:template match="/">
    <xsl:apply-templates select="UniversalInterchange/Body/UniversalShipment" />
  </xsl:template>
  <xsl:template match="UniversalInterchange/Body/UniversalShipment">
    <Shipment><xsl:text>&#10;</xsl:text>
	<xsl:choose>
      <xsl:when test="Shipment/SubShipmentCollection/SubShipment[WayBillType/Code = 'HWB']/WayBillNumber">
        <ShipmentBrokerage>
          <xsl:value-of select="Shipment/SubShipmentCollection/SubShipment[WayBillType/Code = 'HWB']/WayBillNumber/text()" />
        </ShipmentBrokerage><xsl:text>&#10;</xsl:text>
      </xsl:when>
	  <xsl:otherwise>
        <ShipmentBrokerage>
          <xsl:value-of select="Shipment[WayBillType/Code = 'MWB']/WayBillNumber/text()" />
        </ShipmentBrokerage><xsl:text>&#10;</xsl:text>
	  </xsl:otherwise>
		
	</xsl:choose>
      <Orders><xsl:text>&#10;</xsl:text>
        <xsl:for-each select="Shipment/SubShipmentCollection">
          <xsl:for-each select="SubShipment">
            <xsl:for-each select="LocalProcessing">
              <xsl:for-each select="OrderNumberCollection">
                <xsl:for-each select="OrderNumber">
                  <Order><xsl:text>&#10;</xsl:text>
                    <xsl:if test="OrderReference">
                      <OrderNumber>
                        <xsl:value-of select="OrderReference/text()" />
                      </OrderNumber><xsl:text>&#10;</xsl:text>
                    </xsl:if>
                    <Milestones><xsl:text>&#10;</xsl:text>
                      <xsl:for-each select="../../../../../TransportLegCollection">
                        <xsl:for-each select="TransportLeg[LegOrder=1]">
                          <Departure><xsl:text>&#10;</xsl:text>
                            <xsl:if test="ActualDeparture">
                              <Actual>
                                <xsl:value-of select="ActualDeparture/text()" />
                              </Actual><xsl:text>&#10;</xsl:text>
                            </xsl:if>
                          </Departure><xsl:text>&#10;</xsl:text>
                        </xsl:for-each>
                      </xsl:for-each>
                      <xsl:for-each select="../../../../../TransportLegCollection">
                       
                          <Arrival><xsl:text>&#10;</xsl:text>
                            <xsl:if test="TransportLeg/EstimatedArrival">
                              <Estimated>
                                <xsl:value-of select="TransportLeg/EstimatedArrival/text()" />
                              </Estimated><xsl:text>&#10;</xsl:text>
                            </xsl:if>
                          </Arrival><xsl:text>&#10;</xsl:text>
                  
                      </xsl:for-each>
                    </Milestones><xsl:text>&#10;</xsl:text>
                  </Order><xsl:text>&#10;</xsl:text>
                </xsl:for-each>
              </xsl:for-each>
            </xsl:for-each>
          </xsl:for-each>
        </xsl:for-each>
      </Orders><xsl:text>&#10;</xsl:text>
    </Shipment>
  </xsl:template>
</xsl:stylesheet>
