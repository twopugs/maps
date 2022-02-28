<?xml version="1.0" encoding="utf-16"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" xmlns:var="http://schemas.microsoft.com/BizTalk/2003/var" exclude-result-prefixes="msxsl var s0 userCSharp json" version="1.0" xmlns:s0="http://www.cargowise.com/Schemas/Universal/2011/11" xmlns:userCSharp="http://schemas.microsoft.com/BizTalk/2003/userCSharp" xmlns:json='http://james.newtonking.com/projects/json'>
  <xsl:output omit-xml-declaration="yes" method="xml" version="1.0" />
  <xsl:template match="/">
    <xsl:apply-templates select="/s0:UniversalInterchange" />
  </xsl:template>
  <xsl:template match="/s0:UniversalInterchange">
    <xsl:for-each select="s0:Body/s0:UniversalShipment">
      <OrderStatus>
        <xsl:for-each select="s0:Shipment/s0:Order">
          <Order json:Array='true'>
            <order_number>
              <xsl:value-of select="s0:OrderNumber/text()" />
            </order_number>
            <warehouse_id>
              <xsl:value-of select="'106'" />
            </warehouse_id>
            <order_status>
              <xsl:value-of select="../s0:DataContext/s0:TriggerDescription/text()" />
            </order_status>
            <order_status_date>
              <xsl:value-of select="userCSharp:DateCurrentDateTime(../s0:DataContext/s0:TriggerDate)"/>
            </order_status_date>
          </Order>
        </xsl:for-each>
      </OrderStatus>
    </xsl:for-each>
  </xsl:template>
  <msxsl:script language="C#" implements-prefix="userCSharp">
    <![CDATA[
public string StringConcat(string param0)
{
   return param0;
}
 
public string DateCurrentDateTime(string triggerdate)
{
     string outValue = string.Empty;
            var dateTimeValue = DateTime.Parse(System.TimeZoneInfo.ConvertTime(DateTime.Now, TimeZoneInfo.FindSystemTimeZoneById("New Zealand Standard Time")).ToString("HH:mm"));
            var dayValue = DateTime.Parse(System.TimeZoneInfo.ConvertTime(DateTime.Now, TimeZoneInfo.FindSystemTimeZoneById("New Zealand Standard Time")).ToString()).DayOfWeek;
            var compareValue = DateTime.Parse("15:30");
            
            if (dateTimeValue <= compareValue)
            {
                 outValue = System.TimeZoneInfo.ConvertTime(DateTime.Now, TimeZoneInfo.FindSystemTimeZoneById("New Zealand Standard Time")).ToString("yyyy-MM-dd hh:mm:ss");
            }
            else 
            {
              outValue = System.TimeZoneInfo.ConvertTime(DateTime.Now.AddDays(1), TimeZoneInfo.FindSystemTimeZoneById("New Zealand Standard Time")).ToString("yyyy-MM-dd hh:mm:ss");
              if (dayValue == DayOfWeek.Friday)
              {
                    outValue = System.TimeZoneInfo.ConvertTime(DateTime.Now.AddDays(3), TimeZoneInfo.FindSystemTimeZoneById("New Zealand Standard Time")).ToString("yyyy-MM-dd hh:mm:ss");
              }  
             }
            
            return outValue;
}
              


]]>
  </msxsl:script>
</xsl:stylesheet>