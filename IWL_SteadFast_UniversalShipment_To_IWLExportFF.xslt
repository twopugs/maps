<?xml version="1.0" encoding="UTF-16"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" xmlns:var="http://schemas.microsoft.com/BizTalk/2003/var" exclude-result-prefixes="msxsl var s0 userCSharp" version="1.0" xmlns:s0="http://www.cargowise.com/Schemas/Universal/2011/11" xmlns:ns0="http://Map.IWLSteadfastExportOutFF" xmlns:userCSharp="http://schemas.microsoft.com/BizTalk/2003/userCSharp">
  <xsl:output omit-xml-declaration="yes" method="xml" version="1.0" />
  <xsl:template match="/">
    <xsl:apply-templates select="/s0:UniversalInterchange" />
  </xsl:template>
  <xsl:template match="/s0:UniversalInterchange">
    <xsl:for-each select="s0:Body/s0:UniversalShipment/s0:Shipment/s0:Order">
    <ns0:IWLExportXml>
        <IWLExport_FF_Rcd>
          <Tripstatus>trip_status</Tripstatus>
          <customer>customer</customer>
          <ste_job_no>ste_job_no</ste_job_no>
          <date>date</date>
          <cust_ref>cust_ref</cust_ref>
          <del_name>del_name</del_name>
          <del_add1>del_add1</del_add1>
          <del_add2>del_add2</del_add2>
          <suburb>suburb</suburb>
          <del-post>del_post</del-post>
          <del_state>del_state</del_state>
          <carrier>carrier</carrier>
          <consignment_number>consignment_number</consignment_number>
          <reference_no>reference_no</reference_no>
          <job_cubic>job_cubic</job_cubic>
          <job_weight>job_weight</job_weight>
          <sku>sku</sku>
          <line_qty>line_qty</line_qty>
          <POD_Date>POD_Date</POD_Date>
        </IWLExport_FF_Rcd>

        <xsl:for-each select="s0:OrderLineCollection/s0:OrderLine">
          <IWLExport_FF_Details>
            <trip_status>
              <xsl:value-of select="../../../s0:DataContext/s0:ActionPurpose/s0:Code" />
            </trip_status>
            <customer>
              <xsl:value-of select="substring(../../s0:OrderNumber,1,3)" />
            </customer>
            <ste_job_no>
              <xsl:value-of select="substring(../../s0:OrderNumber,4)" />
            </ste_job_no>
            <date>
                            <xsl:value-of select="userCSharp:ConvertDateValue()"/>

            </date>
            <cust_ref>
              <xsl:value-of select="../../s0:ClientReference"></xsl:value-of>
            </cust_ref>
            <del_name>
              <xsl:value-of select="../../../s0:OrganizationAddressCollection/s0:OrganizationAddress[s0:AddressType='ConsigneeAddress']/s0:CompanyName"/>
            </del_name>
            <del_add1>
              <xsl:value-of select="../../../s0:OrganizationAddressCollection/s0:OrganizationAddress[s0:AddressType='ConsigneeAddress']/s0:Address1"/>
            </del_add1>
            <del_add2>
              <xsl:value-of select="../../../s0:OrganizationAddressCollection/s0:OrganizationAddress[s0:AddressType='ConsigneeAddress']/s0:Address2"/>
            </del_add2>
            <suburb>
              <xsl:value-of select="../../../s0:OrganizationAddressCollection/s0:OrganizationAddress[s0:AddressType='ConsigneeAddress']/s0:City"/>
            </suburb>
            <del_post>
              <xsl:value-of select="../../../s0:OrganizationAddressCollection/s0:OrganizationAddress[s0:AddressType='ConsigneeAddress']/s0:Postcode"/>
            </del_post>
            <del_state>
              <xsl:value-of select="../../../s0:OrganizationAddressCollection/s0:OrganizationAddress[s0:AddressType='ConsigneeAddress']/s0:State"/>
            </del_state>
            <carrier>
              <xsl:value-of select="../../../s0:OrganizationAddressCollection/s0:OrganizationAddress[s0:AddressType='TransportCompanyDocumentaryAddress']/s0:OrganizationCode"/>
            </carrier>
            <consignment_number>
              <xsl:value-of select="../../s0:TransportReference" />
            </consignment_number>
            <reference_no></reference_no>
            <job_cubic>
              <xsl:value-of select="../../../s0:TotalVolumne" />
            </job_cubic>
            <job_weight>
              <xsl:value-of select="../../../s0:TotalWeight" />
            </job_weight>
            <sku>
              <xsl:value-of select="s0:Product/s0:Code"/>
            </sku>
            <line_qty>
              <xsl:value-of select="s0:QuantityMet"/>
            </line_qty>
            <POD_Date>
              <xsl:value-of select="userCSharp:ConvertDateValue()"/>
            </POD_Date>
          </IWLExport_FF_Details>
        </xsl:for-each>
    </ns0:IWLExportXml>
    </xsl:for-each>
  </xsl:template>
  <msxsl:script language="C#" implements-prefix="userCSharp">
    <![CDATA[
public string StringConcat(string param0)
{
   return param0;
}
  public static string ConvertDateValueUTC()
              {
                string outDateString;
               outDateString = DateTime.Now.ToString("MM/dd/yy hh:mm tt");

                return outDateString;
              }  
              
            public string ConvertDateValue()
      {
       return System.TimeZoneInfo.ConvertTime(DateTime.Now, TimeZoneInfo.FindSystemTimeZoneById("AUS Eastern Standard Time")).ToString("MM/dd/yy hh:mm tt");
      }    
              


]]>
  </msxsl:script>
</xsl:stylesheet>