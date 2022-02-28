<?xml version="1.0" encoding="UTF-16"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" xmlns:var="http://schemas.microsoft.com/BizTalk/2003/var" exclude-result-prefixes="msxsl var s0" version="1.0" xmlns:s0="http://www.cargowise.com/Schemas/Universal/2011/11">
  <xsl:output omit-xml-declaration="yes" method="xml" version="1.0" />
  <xsl:template match="/">
    <xsl:apply-templates select="/s0:UniversalShipment" />
  </xsl:template>
  <xsl:template match="/s0:UniversalShipment">
    <Shipment><xsl:text>&#10;</xsl:text>
	<xsl:choose>
      <xsl:when test="s0:Shipment/s0:SubShipmentCollection/s0:SubShipment[s0:WayBillType/s0:Code = 'HWB']/s0:WayBillNumber">
        <ShipmentBrokerage>
          <xsl:value-of select="s0:Shipment/s0:SubShipmentCollection/s0:SubShipment[s0:WayBillType/s0:Code = 'HWB']/s0:WayBillNumber/text()" />
        </ShipmentBrokerage><xsl:text>&#10;</xsl:text>
      </xsl:when>
	  <xsl:otherwise>
        <ShipmentBrokerage>
          <xsl:value-of select="s0:Shipment[s0:WayBillType/s0:Code = 'MWB']/s0:WayBillNumber/text()" />
        </ShipmentBrokerage><xsl:text>&#10;</xsl:text>
	  </xsl:otherwise>
		
	</xsl:choose>
      <Orders><xsl:text>&#10;</xsl:text>
        <xsl:for-each select="s0:Shipment/s0:SubShipmentCollection">
          <xsl:for-each select="s0:SubShipment">
            <xsl:for-each select="s0:LocalProcessing">
              <xsl:for-each select="s0:OrderNumberCollection">
                <xsl:for-each select="s0:OrderNumber">
                  <Order><xsl:text>&#10;</xsl:text>
                    <xsl:if test="s0:OrderReference">
                      <OrderNumber>
                        <xsl:value-of select="s0:OrderReference/text()" />
                      </OrderNumber><xsl:text>&#10;</xsl:text>
                    </xsl:if>
                    <Milestones><xsl:text>&#10;</xsl:text>
                      <xsl:for-each select="../../../../../s0:TransportLegCollection">
                        <xsl:for-each select="s0:TransportLeg[s0:LegOrder=1]">
                          <Departure><xsl:text>&#10;</xsl:text>
                            <xsl:if test="s0:ActualDeparture">
                              <Actual>
                                <xsl:value-of select="s0:ActualDeparture/text()" />
                              </Actual><xsl:text>&#10;</xsl:text>
                            </xsl:if>
                          </Departure><xsl:text>&#10;</xsl:text>
                        </xsl:for-each>
                      </xsl:for-each>
                      <xsl:for-each select="../../../../../s0:TransportLegCollection">
                       
                          <Arrival><xsl:text>&#10;</xsl:text>
                            <xsl:if test="s0:TransportLeg/s0:EstimatedArrival">
                              <Estimated>
                                <xsl:value-of select="s0:TransportLeg/s0:EstimatedArrival/text()" />
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