<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" xmlns:var="http://schemas.microsoft.com/BizTalk/2003/var" exclude-result-prefixes="msxsl var json userCSharp" version="1.0"  xmlns:userCSharp="http://schemas.microsoft.com/BizTalk/2003/userCSharp" xmlns:json='http://james.newtonking.com/projects/json'>
  <xsl:output omit-xml-declaration="yes" method="xml" version="1.0"/>
  <xsl:key name="OrderGroup" match="ZaggSOH_Rcd" use="Product"/>

  <xsl:template match="/">
    <xsl:apply-templates select="/ZaggSOH"/>
  </xsl:template>
  <xsl:template match="/ZaggSOH">
     <IWLZaggInventory>
        <Location_ID>106</Location_ID>
        <xsl:for-each select="ZaggSOH_Rcd[generate-id(.)=generate-id(key('OrderGroup',Product))]">
          <Items json:Array='true'>
          <!-- <Items> -->
            <Item_Number>
              <xsl:value-of select="Product"/>
            </Item_Number>
            <Quantity_Onhand>
              <xsl:value-of select="TotalQty"/>
            </Quantity_Onhand>
            <Quantity_Available>
              <xsl:value-of select="Available"/>
            </Quantity_Available>
            <Quantity_Allocated>              <xsl:value-of select="Committed"/>
</Quantity_Allocated>
          </Items>
      </xsl:for-each>
    </IWLZaggInventory>
  </xsl:template>
  <msxsl:script language="C#" implements-prefix="userCSharp">
    <![CDATA[
public string StringConcat(string param0)
{
   return param0;
}

  public static string ConvertDateValue(string inputDateString)
              {
                string outDateString;
              try{  System.DateTime dt = DateTime.ParseExact(inputDateString, "yyyy-MM-dd", System.Globalization.CultureInfo.InvariantCulture);
                outDateString = dt.ToString("yyyy-MM-ddTHH:mm:ss");
}
 catch (Exception e)
 {
 outDateString="";
  }              return outDateString;
              }  
              
                public static string ConvertDateNowValue()
              {
                string outDateString;
                outDateString = DateTime.Now.ToString("yyyy-MM-ddTHH:mm:ss");

                return outDateString;
              }  


]]>
  </msxsl:script>
</xsl:stylesheet>
