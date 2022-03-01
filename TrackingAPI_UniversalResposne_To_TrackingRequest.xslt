<?xml version="1.0" encoding="UTF-16"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" xmlns:var="http://schemas.microsoft.com/BizTalk/2003/var" exclude-result-prefixes="msxsl var s0 userCSharp" version="1.0" xmlns:s0="http://www.cargowise.com/Schemas/Universal/2011/11" xmlns:userCSharp="http://schemas.microsoft.com/BizTalk/2003/userCSharp">
  <xsl:output omit-xml-declaration="yes" method="xml" version="1.0" />
  <xsl:template match="/">
    <xsl:apply-templates select="/TrackingMapResponse" />
  </xsl:template>
  <xsl:template match="/TrackingMapResponse">
    <xsl:variable name="vLegNumber" select="LastCharJobNum/text()" />
    <xsl:variable name="vInstructionLegLink" select="s0:UniversalResponse/s0:Data/s0:UniversalShipment/s0:Shipment/s0:TransportLegCollection/s0:TransportLeg[s0:CustomizedFieldCollection/s0:CustomizedField[s0:Key='Leg #']/s0:Value=$vLegNumber]/s0:Link" />
    <TrackingReq>
      <action>
      </action>
      <xsl:variable name="vLegOrderNo" select="s0:UniversalResponse/s0:Data/s0:UniversalShipment/s0:Shipment/s0:TransportLegCollection/s0:TransportLeg[s0:CustomizedFieldCollection/s0:CustomizedField[s0:Key='Leg #']/s0:Value=$vLegNumber]/s0:LegOrder"/>
      <xsl:variable name="vContainerLink" select="s0:UniversalResponse/s0:Data/s0:UniversalShipment/s0:Shipment/s0:InstructionCollection/s0:Instruction/s0:InstructionContainerLinkCollection/s0:InstructionContainerLink[s0:ConfirmationCollection/s0:Confirmation/s0:LegLink=$vInstructionLegLink]/s0:ContainerLink"/>
      <xsl:choose>
        <xsl:when test="string-length($vContainerLink)>0">
          <data>
            <cargoNumber>
              <xsl:value-of select="s0:UniversalResponse/s0:Data/s0:UniversalShipment/s0:Shipment/s0:ContainerCollection/s0:Container[s0:Link=$vContainerLink]/s0:ContainerNumber"/>
            </cargoNumber>
            <cargoTypeCode>
              <xsl:value-of select="s0:UniversalResponse/s0:Data/s0:UniversalShipment/s0:Shipment/s0:ContainerCollection/s0:Container[s0:Link=$vContainerLink]/s0:ContainerType/s0:Code"/>
            </cargoTypeCode>
            <companyId>2727DC68-B9D4-4A19-8333-97EEB62F7528</companyId>
            <description>
              <xsl:value-of select="normalize-space(s0:UniversalResponse/s0:Data/s0:UniversalShipment/s0:Shipment/s0:ContainerCollection/s0:Container[s0:Link=$vContainerLink]/s0:ContainerType/s0:Description)"/>
            </description>
            <delivery>
              <address>
                <xsl:value-of select="concat(s0:UniversalResponse/s0:Data/s0:UniversalShipment/s0:Shipment/s0:InstructionCollection/s0:Instruction[s0:Type/s0:Code='DLV']/s0:Address/s0:Address1,' ',s0:UniversalResponse/s0:Data/s0:UniversalShipment/s0:Shipment/s0:InstructionCollection/s0:Instruction[s0:Type/s0:Code='DLV']/s0:Address/s0:Address2,' ',s0:UniversalResponse/s0:Data/s0:UniversalShipment/s0:Shipment/s0:InstructionCollection/s0:Instruction[s0:Type/s0:Code='DLV']/s0:Address/s0:City,' ',s0:UniversalResponse/s0:Data/s0:UniversalShipment/s0:Shipment/s0:InstructionCollection/s0:Instruction[s0:Type/s0:Code='DLV']/s0:Address/s0:State,' ',s0:UniversalResponse/s0:Data/s0:UniversalShipment/s0:Shipment/s0:InstructionCollection/s0:Instruction[s0:Type/s0:Code='DLV']/s0:Address/s0:PostCode) "/>
              </address>
              <company>
                <xsl:value-of select="s0:UniversalResponse/s0:Data/s0:UniversalShipment/s0:Shipment/s0:InstructionCollection/s0:Instruction[s0:Type/s0:Code='DLV']/s0:Address/s0:CompanyName"/>
              </company>
              <xsl:if test="s0:UniversalResponse/s0:Data/s0:UniversalShipment/s0:Shipment/s0:InstructionCollection/s0:Instruction[s0:Type/s0:Code='DLV']/s0:InstructionContainerLinkCollection/s0:InstructionContainerLink/s0:ConfirmationCollection/s0:Confirmation[s0:LegLink=$vInstructionLegLink]/s0:EstimatedDate/text()">
                <estimatedTime>
                  <xsl:value-of select="s0:UniversalResponse/s0:Data/s0:UniversalShipment/s0:Shipment/s0:InstructionCollection/s0:Instruction[s0:Type/s0:Code='DLV']/s0:InstructionContainerLinkCollection/s0:InstructionContainerLink/s0:ConfirmationCollection/s0:Confirmation[s0:LegLink=$vInstructionLegLink]/s0:EstimatedDate"/>
                </estimatedTime>
              </xsl:if>
              <xsl:if test="s0:UniversalResponse/s0:Data/s0:UniversalShipment/s0:Shipment/s0:InstructionCollection/s0:Instruction[s0:Type/s0:Code='DLV']/s0:InstructionContainerLinkCollection/s0:InstructionContainerLink/s0:ConfirmationCollection/s0:Confirmation[s0:LegLink=$vInstructionLegLink]/s0:ServiceInstruction/text()">
                <instruction>
                  <xsl:value-of select="s0:UniversalResponse/s0:Data/s0:UniversalShipment/s0:Shipment/s0:InstructionCollection/s0:Instruction[s0:Type/s0:Code='DLV']/s0:InstructionContainerLinkCollection/s0:InstructionContainerLink/s0:ConfirmationCollection/s0:Confirmation[s0:LegLink=$vInstructionLegLink]/s0:ServiceInstruction"/>
                </instruction>
              </xsl:if>
            </delivery>            
            <driverCode>
              <xsl:value-of select="s0:UniversalResponse/s0:Data/s0:UniversalShipment/s0:Shipment/s0:TransportLegCollection/s0:TransportLeg[s0:Link=$vInstructionLegLink]/s0:CustomizedFieldCollection/s0:CustomizedField[s0:Key='Driver Code']/s0:Value/text()" />
            </driverCode>
            <jobId>
              <xsl:value-of select="Key"/>
            </jobId>
            <legId>
              <xsl:value-of select="$vLegNumber" />
            </legId>
            <multi>
              <address>
                <xsl:value-of select="concat(s0:UniversalResponse/s0:Data/s0:UniversalShipment/s0:Shipment/s0:InstructionCollection/s0:Instruction[s0:Type/s0:Code='MLT']/s0:Address/s0:Address1,' ',s0:UniversalResponse/s0:Data/s0:UniversalShipment/s0:Shipment/s0:InstructionCollection/s0:Instruction[s0:Type/s0:Code='MLT']/s0:Address/s0:Address2,' ',s0:UniversalResponse/s0:Data/s0:UniversalShipment/s0:Shipment/s0:InstructionCollection/s0:Instruction[s0:Type/s0:Code='MLT']/s0:Address/s0:City,' ',s0:UniversalResponse/s0:Data/s0:UniversalShipment/s0:Shipment/s0:InstructionCollection/s0:Instruction[s0:Type/s0:Code='MLT']/s0:Address/s0:State,' ',s0:UniversalResponse/s0:Data/s0:UniversalShipment/s0:Shipment/s0:InstructionCollection/s0:Instruction[s0:Type/s0:Code='MLT']/s0:Address/s0:PostCode) "/>
              </address>
              <company>
                <xsl:value-of select="s0:UniversalResponse/s0:Data/s0:UniversalShipment/s0:Shipment/s0:InstructionCollection/s0:Instruction[s0:Type/s0:Code='MLT']/s0:Address/s0:CompanyName"/>
              </company>
              <xsl:if test="s0:UniversalResponse/s0:Data/s0:UniversalShipment/s0:Shipment/s0:InstructionCollection/s0:Instruction[s0:Type/s0:Code='MLT']/s0:InstructionContainerLinkCollection/s0:InstructionContainerLink/s0:ConfirmationCollection/s0:Confirmation[s0:LegLink=$vInstructionLegLink]/s0:EstimatedDate/text()">
                <estimatedTime>
                  <xsl:value-of select="s0:UniversalResponse/s0:Data/s0:UniversalShipment/s0:Shipment/s0:InstructionCollection/s0:Instruction[s0:Type/s0:Code='MLT']/s0:InstructionContainerLinkCollection/s0:InstructionContainerLink/s0:ConfirmationCollection/s0:Confirmation[s0:LegLink=$vInstructionLegLink]/s0:EstimatedDate"/>
                </estimatedTime>
              </xsl:if>
              <xsl:if test="s0:UniversalResponse/s0:Data/s0:UniversalShipment/s0:Shipment/s0:InstructionCollection/s0:Instruction[s0:Type/s0:Code='MLT']/s0:InstructionContainerLinkCollection/s0:InstructionContainerLink/s0:ConfirmationCollection/s0:Confirmation[s0:LegLink=$vInstructionLegLink]/s0:ServiceInstruction/text()">
                <instruction>
                  <xsl:value-of select="s0:UniversalResponse/s0:Data/s0:UniversalShipment/s0:Shipment/s0:InstructionCollection/s0:Instruction[s0:Type/s0:Code='MLT']/s0:InstructionContainerLinkCollection/s0:InstructionContainerLink/s0:ConfirmationCollection/s0:Confirmation[s0:LegLink=$vInstructionLegLink]/s0:ServiceInstruction"/>
                </instruction>
              </xsl:if>
            </multi>
            <pickup>
              <address>
                <xsl:value-of select="concat(s0:UniversalResponse/s0:Data/s0:UniversalShipment/s0:Shipment/s0:InstructionCollection/s0:Instruction[s0:Type/s0:Code='PIC']/s0:Address/s0:Address1,' ',s0:UniversalResponse/s0:Data/s0:UniversalShipment/s0:Shipment/s0:InstructionCollection/s0:Instruction[s0:Type/s0:Code='PIC']/s0:Address/s0:Address2,' ',s0:UniversalResponse/s0:Data/s0:UniversalShipment/s0:Shipment/s0:InstructionCollection/s0:Instruction[s0:Type/s0:Code='PIC']/s0:Address/s0:City,' ',s0:UniversalResponse/s0:Data/s0:UniversalShipment/s0:Shipment/s0:InstructionCollection/s0:Instruction[s0:Type/s0:Code='PIC']/s0:Address/s0:State,' ',s0:UniversalResponse/s0:Data/s0:UniversalShipment/s0:Shipment/s0:InstructionCollection/s0:Instruction[s0:Type/s0:Code='PIC']/s0:Address/s0:PostCode) "/>
              </address>
              <company>
                <xsl:value-of select="s0:UniversalResponse/s0:Data/s0:UniversalShipment/s0:Shipment/s0:InstructionCollection/s0:Instruction[s0:Type/s0:Code='PIC']/s0:Address/s0:CompanyName"/>
              </company>
              <xsl:if test="s0:UniversalResponse/s0:Data/s0:UniversalShipment/s0:Shipment/s0:InstructionCollection/s0:Instruction[s0:Type/s0:Code='PIC']/s0:InstructionContainerLinkCollection/s0:InstructionContainerLink/s0:ConfirmationCollection/s0:Confirmation[s0:LegLink=$vInstructionLegLink]/s0:EstimatedDate/text()">
                <estimatedTime>
                  <xsl:value-of select="s0:UniversalResponse/s0:Data/s0:UniversalShipment/s0:Shipment/s0:InstructionCollection/s0:Instruction[s0:Type/s0:Code='PIC']/s0:InstructionContainerLinkCollection/s0:InstructionContainerLink/s0:ConfirmationCollection/s0:Confirmation[s0:LegLink=$vInstructionLegLink]/s0:EstimatedDate"/>
                </estimatedTime>
              </xsl:if>
              <xsl:if test="s0:UniversalResponse/s0:Data/s0:UniversalShipment/s0:Shipment/s0:InstructionCollection/s0:Instruction[s0:Type/s0:Code='PIC']/s0:InstructionContainerLinkCollection/s0:InstructionContainerLink/s0:ConfirmationCollection/s0:Confirmation[s0:LegLink=$vInstructionLegLink]/s0:ServiceInstruction/text()">
                <instruction>
                  <xsl:value-of select="s0:UniversalResponse/s0:Data/s0:UniversalShipment/s0:Shipment/s0:InstructionCollection/s0:Instruction[s0:Type/s0:Code='PIC']/s0:InstructionContainerLinkCollection/s0:InstructionContainerLink/s0:ConfirmationCollection/s0:Confirmation[s0:LegLink=$vInstructionLegLink]/s0:ServiceInstruction"/>
                </instruction>
              </xsl:if>
            </pickup>
            <quantity>
              <xsl:value-of select="s0:UniversalResponse/s0:Data/s0:UniversalShipment/s0:Shipment/s0:ContainerCollection/s0:Container[s0:Link=$vContainerLink]/s0:ContainerCount"/>
            </quantity>
            <runsheetSequence>
              <xsl:value-of select="s0:UniversalResponse/s0:Data/s0:UniversalShipment/s0:Shipment/s0:TransportLegCollection/s0:TransportLeg[s0:Link=$vInstructionLegLink]/s0:CustomizedFieldCollection/s0:CustomizedField[s0:Key='RunSheet Sequence']/s0:Value/text()" />
            </runsheetSequence>
            <volume>0</volume>
            <weight>
              <xsl:value-of select="s0:UniversalResponse/s0:Data/s0:UniversalShipment/s0:Shipment/s0:ContainerCollection/s0:Container[s0:Link=$vContainerLink]/s0:GrossWeight"/>
            </weight>
            <weightUnit>
              <xsl:value-of select="s0:UniversalResponse/s0:Data/s0:UniversalShipment/s0:Shipment/s0:ContainerCollection/s0:Container[s0:Link=$vContainerLink]/s0:WeightUnit/s0:Code"/>
            </weightUnit>
          </data>
        </xsl:when>
        <xsl:otherwise>
                <xsl:variable name="vPacklineLink" select="s0:UniversalResponse/s0:Data/s0:UniversalShipment/s0:Shipment/s0:InstructionCollection/s0:Instruction/s0:InstructionPackingLineLinkCollection/s0:InstructionPackingLineLink[s0:ConfirmationCollection/s0:Confirmation/s0:LegLink=$vInstructionLegLink]/s0:PackingLineLink"/>

            <data>
            <cargoNumber>
              <xsl:value-of select="s0:UniversalResponse/s0:Data/s0:UniversalShipment/s0:Shipment/s0:ContainerCollection/s0:Container[s0:Link=$vPacklineLink]/s0:ContainerNumber"/>
            </cargoNumber>
            <cargoTypeCode>
              <xsl:value-of select="s0:UniversalResponse/s0:Data/s0:UniversalShipment/s0:Shipment/s0:ContainerCollection/s0:Container[s0:Link=$vPacklineLink]/s0:ContainerType/s0:Code"/>
            </cargoTypeCode>
            <companyId>2727DC68-B9D4-4A19-8333-97EEB62F7528</companyId>
              <delivery>
                <address>
                  <xsl:value-of select="concat(s0:UniversalResponse/s0:Data/s0:UniversalShipment/s0:Shipment/s0:InstructionCollection/s0:Instruction[s0:Type/s0:Code='DLV']/s0:Address/s0:Address1,' ',s0:UniversalResponse/s0:Data/s0:UniversalShipment/s0:Shipment/s0:InstructionCollection/s0:Instruction[s0:Type/s0:Code='DLV']/s0:Address/s0:Address2,' ',s0:UniversalResponse/s0:Data/s0:UniversalShipment/s0:Shipment/s0:InstructionCollection/s0:Instruction[s0:Type/s0:Code='DLV']/s0:Address/s0:City,' ',s0:UniversalResponse/s0:Data/s0:UniversalShipment/s0:Shipment/s0:InstructionCollection/s0:Instruction[s0:Type/s0:Code='DLV']/s0:Address/s0:State,' ',s0:UniversalResponse/s0:Data/s0:UniversalShipment/s0:Shipment/s0:InstructionCollection/s0:Instruction[s0:Type/s0:Code='DLV']/s0:Address/s0:PostCode) "/>
                </address>
                <company>
                  <xsl:value-of select="s0:UniversalResponse/s0:Data/s0:UniversalShipment/s0:Shipment/s0:InstructionCollection/s0:Instruction[s0:Type/s0:Code='DLV']/s0:Address/s0:CompanyName"/>
                </company>
                <xsl:if test="s0:UniversalResponse/s0:Data/s0:UniversalShipment/s0:Shipment/s0:InstructionCollection/s0:Instruction[s0:Type/s0:Code='DLV']/s0:InstructionContainerLinkCollection/s0:InstructionContainerLink/s0:ConfirmationCollection/s0:Confirmation[s0:LegLink=$vInstructionLegLink]/s0:EstimatedDate/text()">
                  <estimatedTime>
                    <xsl:value-of select="s0:UniversalResponse/s0:Data/s0:UniversalShipment/s0:Shipment/s0:InstructionCollection/s0:Instruction[s0:Type/s0:Code='DLV']/s0:InstructionContainerLinkCollection/s0:InstructionContainerLink/s0:ConfirmationCollection/s0:Confirmation[s0:LegLink=$vInstructionLegLink]/s0:EstimatedDate"/>
                  </estimatedTime>
                </xsl:if>
                <xsl:if test="s0:UniversalResponse/s0:Data/s0:UniversalShipment/s0:Shipment/s0:InstructionCollection/s0:Instruction[s0:Type/s0:Code='DLV']/s0:InstructionContainerLinkCollection/s0:InstructionContainerLink/s0:ConfirmationCollection/s0:Confirmation[s0:LegLink=$vInstructionLegLink]/s0:ServiceInstruction/text()">
                  <instruction>
                    <xsl:value-of select="s0:UniversalResponse/s0:Data/s0:UniversalShipment/s0:Shipment/s0:InstructionCollection/s0:Instruction[s0:Type/s0:Code='DLV']/s0:InstructionContainerLinkCollection/s0:InstructionContainerLink/s0:ConfirmationCollection/s0:Confirmation[s0:LegLink=$vInstructionLegLink]/s0:ServiceInstruction"/>
                  </instruction>
                </xsl:if>
              </delivery>
            <description>
              <xsl:value-of select="normalize-space(s0:UniversalResponse/s0:Data/s0:UniversalShipment/s0:Shipment/s0:PackingLineCollection/s0:PackingLine[s0:Link=$vPacklineLink]/s0:PackType/s0:Description)"/>
            </description>
            <driverCode>
              <xsl:value-of select="s0:UniversalResponse/s0:Data/s0:UniversalShipment/s0:Shipment/s0:TransportLegCollection/s0:TransportLeg[s0:Link=$vInstructionLegLink]/s0:CustomizedFieldCollection/s0:CustomizedField[s0:Key='Driver Code']/s0:Value/text()" />
            </driverCode>
            <externalJobId>
              <xsl:value-of select="Key"/>
            </externalJobId>
            <externalLegId>
              <xsl:value-of select="$vInstructionLegLink" />
            </externalLegId>
                 <jobId>
              <xsl:value-of select="Key"/>
            </jobId>
            <legId>
              <xsl:value-of select="$vInstructionLegLink" />
            </legId>
            <multi>
              <address>
                <xsl:value-of select="concat(s0:UniversalResponse/s0:Data/s0:UniversalShipment/s0:Shipment/s0:InstructionCollection/s0:Instruction[s0:Type/s0:Code='MLT']/s0:Address/s0:Address1,' ',s0:UniversalResponse/s0:Data/s0:UniversalShipment/s0:Shipment/s0:InstructionCollection/s0:Instruction[s0:Type/s0:Code='MLT']/s0:Address/s0:Address2,' ',s0:UniversalResponse/s0:Data/s0:UniversalShipment/s0:Shipment/s0:InstructionCollection/s0:Instruction[s0:Type/s0:Code='MLT']/s0:Address/s0:City,' ',s0:UniversalResponse/s0:Data/s0:UniversalShipment/s0:Shipment/s0:InstructionCollection/s0:Instruction[s0:Type/s0:Code='MLT']/s0:Address/s0:State,' ',s0:UniversalResponse/s0:Data/s0:UniversalShipment/s0:Shipment/s0:InstructionCollection/s0:Instruction[s0:Type/s0:Code='MLT']/s0:Address/s0:PostCode) "/>
              </address>
              <company>
                <xsl:value-of select="s0:UniversalResponse/s0:Data/s0:UniversalShipment/s0:Shipment/s0:InstructionCollection/s0:Instruction[s0:Type/s0:Code='MLT']/s0:Address/s0:CompanyName"/>
              </company>
              <xsl:if test="s0:UniversalResponse/s0:Data/s0:UniversalShipment/s0:Shipment/s0:InstructionCollection/s0:Instruction[s0:Type/s0:Code='MLT']/s0:InstructionContainerLinkCollection/s0:InstructionContainerLink/s0:ConfirmationCollection/s0:Confirmation[s0:LegLink=$vInstructionLegLink]/s0:EstimatedDate/text()">
                <estimatedTime>
                  <xsl:value-of select="s0:UniversalResponse/s0:Data/s0:UniversalShipment/s0:Shipment/s0:InstructionCollection/s0:Instruction[s0:Type/s0:Code='MLT']/s0:InstructionContainerLinkCollection/s0:InstructionContainerLink/s0:ConfirmationCollection/s0:Confirmation[s0:LegLink=$vInstructionLegLink]/s0:EstimatedDate"/>
                </estimatedTime>
              </xsl:if>
              <xsl:if test="s0:UniversalResponse/s0:Data/s0:UniversalShipment/s0:Shipment/s0:InstructionCollection/s0:Instruction[s0:Type/s0:Code='MLT']/s0:InstructionContainerLinkCollection/s0:InstructionContainerLink/s0:ConfirmationCollection/s0:Confirmation[s0:LegLink=$vInstructionLegLink]/s0:ServiceInstruction/text()">
                <instruction>
                  <xsl:value-of select="s0:UniversalResponse/s0:Data/s0:UniversalShipment/s0:Shipment/s0:InstructionCollection/s0:Instruction[s0:Type/s0:Code='MLT']/s0:InstructionContainerLinkCollection/s0:InstructionContainerLink/s0:ConfirmationCollection/s0:Confirmation[s0:LegLink=$vInstructionLegLink]/s0:ServiceInstruction"/>
                </instruction>
              </xsl:if>
            </multi>
              <pickup>
                <address>
                  <xsl:value-of select="concat(s0:UniversalResponse/s0:Data/s0:UniversalShipment/s0:Shipment/s0:InstructionCollection/s0:Instruction[s0:Type/s0:Code='PIC']/s0:Address/s0:Address1,' ',s0:UniversalResponse/s0:Data/s0:UniversalShipment/s0:Shipment/s0:InstructionCollection/s0:Instruction[s0:Type/s0:Code='PIC']/s0:Address/s0:Address2,' ',s0:UniversalResponse/s0:Data/s0:UniversalShipment/s0:Shipment/s0:InstructionCollection/s0:Instruction[s0:Type/s0:Code='PIC']/s0:Address/s0:City,' ',s0:UniversalResponse/s0:Data/s0:UniversalShipment/s0:Shipment/s0:InstructionCollection/s0:Instruction[s0:Type/s0:Code='PIC']/s0:Address/s0:State,' ',s0:UniversalResponse/s0:Data/s0:UniversalShipment/s0:Shipment/s0:InstructionCollection/s0:Instruction[s0:Type/s0:Code='PIC']/s0:Address/s0:PostCode) "/>
                </address>
                <company>
                  <xsl:value-of select="s0:UniversalResponse/s0:Data/s0:UniversalShipment/s0:Shipment/s0:InstructionCollection/s0:Instruction[s0:Type/s0:Code='PIC']/s0:Address/s0:CompanyName"/>
                </company>
                <xsl:if test="s0:UniversalResponse/s0:Data/s0:UniversalShipment/s0:Shipment/s0:InstructionCollection/s0:Instruction[s0:Type/s0:Code='PIC']/s0:InstructionContainerLinkCollection/s0:InstructionContainerLink/s0:ConfirmationCollection/s0:Confirmation[s0:LegLink=$vInstructionLegLink]/s0:EstimatedDate/text()">
                  <estimatedTime>
                    <xsl:value-of select="s0:UniversalResponse/s0:Data/s0:UniversalShipment/s0:Shipment/s0:InstructionCollection/s0:Instruction[s0:Type/s0:Code='PIC']/s0:InstructionContainerLinkCollection/s0:InstructionContainerLink/s0:ConfirmationCollection/s0:Confirmation[s0:LegLink=$vInstructionLegLink]/s0:EstimatedDate"/>
                  </estimatedTime>
                </xsl:if>
                <xsl:if test="s0:UniversalResponse/s0:Data/s0:UniversalShipment/s0:Shipment/s0:InstructionCollection/s0:Instruction[s0:Type/s0:Code='PIC']/s0:InstructionContainerLinkCollection/s0:InstructionContainerLink/s0:ConfirmationCollection/s0:Confirmation[s0:LegLink=$vInstructionLegLink]/s0:ServiceInstruction/text()">
                  <instruction>
                    <xsl:value-of select="s0:UniversalResponse/s0:Data/s0:UniversalShipment/s0:Shipment/s0:InstructionCollection/s0:Instruction[s0:Type/s0:Code='PIC']/s0:InstructionContainerLinkCollection/s0:InstructionContainerLink/s0:ConfirmationCollection/s0:Confirmation[s0:LegLink=$vInstructionLegLink]/s0:ServiceInstruction"/>
                  </instruction>
                </xsl:if>
              </pickup>
            <quantity>
              <xsl:value-of select="s0:UniversalResponse/s0:Data/s0:UniversalShipment/s0:Shipment/s0:PackingLineCollection/s0:PackingLine[s0:Link=$vPacklineLink]/s0:PackQty"/>
            </quantity>
            <runsheetSequence>
              <xsl:value-of select="s0:UniversalResponse/s0:Data/s0:UniversalShipment/s0:Shipment/s0:TransportLegCollection/s0:TransportLeg[s0:Link=$vInstructionLegLink]/s0:CustomizedFieldCollection/s0:CustomizedField[s0:Key='RunSheet Sequence']/s0:Value/text()" />
            </runsheetSequence>
            <volume>0</volume>
            <weight>
              <xsl:value-of select="s0:UniversalResponse/s0:Data/s0:UniversalShipment/s0:Shipment/s0:PackingLineCollection/s0:PackingLine[s0:Link=$vPacklineLink]/s0:Weight"/>
            </weight>
            <weightUnit>
              <xsl:value-of select="s0:UniversalResponse/s0:Data/s0:UniversalShipment/s0:Shipment/s0:PackingLineCollection/s0:PackingLine[s0:Link=$vPacklineLink]/s0:WeightUnit/s0:Code"/>
            </weightUnit>
          </data></xsl:otherwise>
      </xsl:choose> 
  </TrackingReq>
  </xsl:template>
  <msxsl:script language="C#" implements-prefix="userCSharp">
    <![CDATA[
public string StringConcat(string param0)
{
   return param0;
}


public string StringRight(string str, string count)
{
	string retval = "";
	double d = 0;
	if (str != null && IsNumeric(count, ref d))
	{
		int i = (int) d;
		if (i > 0)
		{
			if (i <= str.Length)
			{
				retval = str.Substring(str.Length-i);
			}
			else
			{
				retval = str;
			}
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


]]>
  </msxsl:script>
</xsl:stylesheet>