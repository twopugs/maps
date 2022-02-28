<?xml version="1.0" encoding="UTF-16"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" xmlns:var="http://schemas.microsoft.com/BizTalk/2003/var" exclude-result-prefixes="msxsl var s0" version="1.0" xmlns:s0="http://www.cargowise.com/Schemas/Universal/2011/11" xmlns:cs="urn:cs">
  <xsl:output omit-xml-declaration="yes" method="xml" version="1.0" />

<xsl:template match="/">
    <xsl:apply-templates select="//Root" />
  </xsl:template>
  <xsl:template match="//Root">
    <Manifest_Rcd>
      <xsl:variable name="Carrier" select="InputMessagePart_0/AZTable/Carrier/text()"/>
      <xsl:variable name="AccountName" select="InputMessagePart_0/AZTable/AccountName/text()"/>
      <xsl:variable name="EdiRecipient" select="InputMessagePart_0/AZTable/EdiRecipient/text()"/>
      <xsl:variable name="CustomerName" select="InputMessagePart_0/AZTable/CustomerName/text()"/>
      <xsl:variable name="AccountNumber" select="InputMessagePart_0/AZTable/AccountNumber/text()"/>
            <xsl:variable name="Country" select="InputMessagePart_0/AZTable/Country/text()"/>
      <xsl:for-each select="InputMessagePart_1/s0:UniversalShipment/s0:Shipment/s0:ContainerCollection/s0:Container">
        <manifest>
          <msgtype>MANX2407</msgtype>          
          <carriername>            
              <xsl:value-of select="../../s0:SubShipmentCollection/s0:SubShipment/s0:OrganizationAddressCollection/s0:OrganizationAddress[s0:AddressType/text()='DeliveryLocalCartage']/s0:CompanyName/text()"/>
          </carriername>
          <carrier>
            <xsl:value-of select="$Carrier"/>
          </carrier>
          <manifestnumber>
            <xsl:value-of select="../../s0:SubShipmentCollection/s0:SubShipment/DataContext/s0:DataSourceCollection/s0:DataSource/s0:Key/text()"/>
          </manifestnumber>
          <accountname>
            <xsl:value-of select="$AccountName"/>
          </accountname>
          <xsl:variable name="v1">
              <xsl:value-of select="../../s0:SubShipmentCollection/s0:SubShipment/s0:OrganizationAddressCollection/s0:OrganizationAddress[s0:AddressType/text()='DeliveryLocalCartage']/s0:RegistrationNumberCollection/s0:RegistrationNumber[s0:Type/s0:Code/text() = 'EDR']/s0:Value/text()"/>
          </xsl:variable>
          <account>
            <xsl:choose>
              <xsl:when test="string-length($v1)!=0">
                <xsl:value-of select="$v1"/>
              </xsl:when>
              <xsl:otherwise>
                <xsl:value-of select="'0'"/>
              </xsl:otherwise>
            </xsl:choose>
          </account>
          <manifestdate>
            <xsl:value-of select="cs:GetDate()"/>
          </manifestdate>
          <manifesttime>
            <xsl:value-of select="cs:GetTime()"/>
          </manifesttime>
         <shipments>
            <shipment>
              <jobtype>
                <xsl:value-of select="string('3')"/>              
              </jobtype>
              <sitem>1</sitem>
              <shipmentreference>
                <xsl:value-of select="../../s0:SubShipmentCollection/s0:SubShipment/s0:DataContext/s0:DataSourceCollection/s0:DataSource/s0:Key/text()"/>
              </shipmentreference>
              <ordernumber>
                <xsl:value-of select="string('')"/>
              </ordernumber>
              <activityreqdate>
                <xsl:choose>
                  <xsl:when test="substring(../../s0:PortOfDischarge/s0:Code/text(),1,2)=$Country">
                    <xsl:value-of select="cs:GetDateTimeString(../../s0:SubShipmentCollection/s0:SubShipment/s0:LocalProcessing/s0:DeliveryRequiredBy/text())"/>
                  </xsl:when>
                  <xsl:when test="substring(../../s0:PortOfLoading/s0:Code/text(),1,2)=$Country">
                    <xsl:value-of select="cs:GetDateTimeString(../../s0:SubShipmentCollection/s0:SubShipment/s0:LocalProcessing/s0:PickupRequiredBy/text())"/>                  </xsl:when>
                  <xsl:otherwise>
                    <xsl:value-of select="string('')"/>
                  </xsl:otherwise>
                </xsl:choose>
              </activityreqdate>
              <contimpexpmove>
                <xsl:choose>
                  <xsl:when test="substring(../../s0:PortOfDischarge/s0:Code/text(),1,2)=$Country">
                    <xsl:value-of select="string('IMP')"/>
                  </xsl:when>
                 <xsl:when test="substring(../../s0:PortOfLoading/s0:Code/text(),1,2)=$Country">
                    <xsl:value-of select="string('EXP')"/>
                  </xsl:when>
                  <xsl:otherwise>
                    <xsl:value-of select="string('MOV')"/>
                  </xsl:otherwise>
                </xsl:choose>
              </contimpexpmove>
              <pupreqdate>
                <xsl:choose>
                  <xsl:when test="substring(../../s0:PortOfDischarge/s0:Code/text(),1,2)=$Country">
                    <xsl:value-of select="cs:GetDateString(../../s0:TransportLegCollection/s0:TransportLeg[s0:LegOrder=last()]/s0:EstimatedArrival/text())"/>
                  </xsl:when>
                  <xsl:when test="substring(../../s0:PortOfLoading/s0:Code/text(),1,2)=$Country">
                    <xsl:value-of select="cs:GetDateString(../../s0:TransportLegCollection/s0:TransportLeg[s0:LegOrder=1]/s0:EstimatedArrival/text())"/>
                  </xsl:when>
                  <xsl:otherwise>
                    <xsl:value-of select="string('')"/>
                  </xsl:otherwise>
                </xsl:choose>
              </pupreqdate>
              <pupreqtime>
                <xsl:choose>
                  <xsl:when test="substring(../../s0:PortOfDischarge/s0:Code/text(),1,2)=$Country">
                    <xsl:value-of select="cs:GetTimeString(../../s0:TransportLegCollection/s0:TransportLeg[s0:LegOrder=last()]/s0:EstimatedArrival/text())"/>
                  </xsl:when>
                  <xsl:when test="substring(../../s0:PortOfLoading/s0:Code/text(),1,2)=$Country">
                    <xsl:value-of select="cs:GetTimeString(../../s0:TransportLegCollection/s0:TransportLeg[s0:LegOrder=1]/s0:EstimatedArrival/text())"/>
                  </xsl:when>
                  <xsl:otherwise>
                    <xsl:value-of select="string('')"/>
                  </xsl:otherwise>
                </xsl:choose>
              </pupreqtime>
              <contfullempty>
                <xsl:value-of select="string('F')"/>
              </contfullempty>
              <edisource>
                <xsl:value-of select="&quot;TwoPugs&quot;"/>
              </edisource>
              <edisourceref>
                <xsl:value-of select="cs:GetGUID()"/>
              </edisourceref>
              <edirecipient>
                <xsl:value-of select="$EdiRecipient"/>
              </edirecipient>
              <customer>
                <custaccount>
                  <xsl:value-of select="$AccountNumber"/>
                </custaccount>
                <customername>
                  <xsl:value-of select="$CustomerName"/>
                </customername>
              </customer>
              <xsl:choose>
                <xsl:when test="substring(../../s0:PortOfDischarge/s0:Code/text(),1,2)=$Country">
                  <xsl:if test="../../s0:SubShipmentCollection/s0:SubShipment/s0:OrganizationAddressCollection/s0:OrganizationAddress[s0:AddressType/text()='ArrivalCTOAddress']">
                    <shipper>
                      <shippername>
                        <xsl:value-of select="../../s0:SubShipmentCollection/s0:SubShipment/s0:OrganizationAddressCollection/s0:OrganizationAddress[s0:AddressType/text()='ArrivalCTOAddress']/s0:CompanyName/text()"/>
                      </shippername>
                      <pickupaddress1>
                        <xsl:value-of select="../../s0:SubShipmentCollection/s0:SubShipment/s0:OrganizationAddressCollection/s0:OrganizationAddress[s0:AddressType/text()='ArrivalCTOAddress']/s0:Address1/text()"/>
                      </pickupaddress1>
                      <pickupaddress2>
                        <xsl:value-of select="../../s0:SubShipmentCollection/s0:SubShipment/s0:OrganizationAddressCollection/s0:OrganizationAddress[s0:AddressType/text()='ArrivalCTOAddress']/s0:Address2/text()"/>
                      </pickupaddress2>
                      <pickupaddress3>
                        <xsl:value-of select="../../s0:SubShipmentCollection/s0:SubShipment/s0:OrganizationAddressCollection/s0:OrganizationAddress[s0:AddressType/text()='ArrivalCTOAddress']/s0:City/text()"/>
                      </pickupaddress3>
                    </shipper>
                  </xsl:if>
                  <xsl:if test="../../s0:SubShipmentCollection/s0:SubShipment/s0:OrganizationAddressCollection/s0:OrganizationAddress[s0:AddressType/text()='ConsigneePickupDeliveryAddress']">
                    <activity>
                      <activityplacename>
                        <xsl:value-of select="../../s0:SubShipmentCollection/s0:SubShipment/s0:OrganizationAddressCollection/s0:OrganizationAddress[s0:AddressType/text()='ConsigneePickupDeliveryAddress']/s0:CompanyName/text()"/>
                      </activityplacename>
                      <activityaddress1>
                        <xsl:value-of select="../../s0:SubShipmentCollection/s0:SubShipment/s0:OrganizationAddressCollection/s0:OrganizationAddress[s0:AddressType/text()='ConsigneePickupDeliveryAddress']/s0:Address1/text()"/>
                      </activityaddress1>
                      <activityaddress2>
                        <xsl:value-of select="../../s0:SubShipmentCollection/s0:SubShipment/s0:OrganizationAddressCollection/s0:OrganizationAddress[s0:AddressType/text()='ConsigneePickupDeliveryAddress']/s0:Address2/text()"/>
                      </activityaddress2>
                      <activityaddress3>
                        <xsl:value-of select="../../s0:SubShipmentCollection/s0:SubShipment/s0:OrganizationAddressCollection/s0:OrganizationAddress[s0:AddressType/text()='ConsigneePickupDeliveryAddress']/s0:City/text()"/>
                      </activityaddress3>
                    </activity>
                  </xsl:if>
                  <consignee>
                    <xsl:for-each select="../../s0:SubShipmentCollection/s0:SubShipment/s0:OrganizationAddressCollection/s0:OrganizationAddress[s0:AddressType/text()='ContainerYardEmptyReturnAddress']">
                      <consigneename>
                        <xsl:value-of select="s0:CompanyName/text()"/>
                      </consigneename>
                      <cneeaddress1>
                        <xsl:value-of select="s0:Address1/text()"/>
                      </cneeaddress1>
                      <cneeaddress2>
                        <xsl:value-of select="s0:Address2/text()"/>
                      </cneeaddress2>
                      <cneeaddress3/>
                      <cneetown>
                        <xsl:value-of select="s0:City/text()"/>
                      </cneetown>
                    </xsl:for-each>
                  </consignee>
                </xsl:when>
                <xsl:when test="substring(../../s0:PortOfLoading/s0:Code/text(),1,2)=$Country">
                  <shipper>
                    <shippername>
                      <xsl:value-of select="../../s0:SubShipmentCollection/s0:SubShipment/s0:OrganizationAddressCollection/s0:OrganizationAddress[s0:AddressType/text()='ContainerYardEmptyPickupAddress']/s0:CompanyName/text()"/>
                    </shippername>
                    <pickupaddress1>
                      <xsl:value-of select="../../s0:SubShipmentCollection/s0:SubShipment/s0:OrganizationAddressCollection/s0:OrganizationAddress[s0:AddressType/text()='ContainerYardEmptyPickupAddress']/s0:Address1/text()"/>
                    </pickupaddress1>
                    <pickupaddress2>
                      <xsl:value-of select="../../s0:SubShipmentCollection/s0:SubShipment/s0:OrganizationAddressCollection/s0:OrganizationAddress[s0:AddressType/text()='ContainerYardEmptyPickupAddress']/s0:Address2/text()"/>
                    </pickupaddress2>
                    <pickupaddress3>
                      <xsl:value-of select="../../s0:SubShipmentCollection/s0:SubShipment/s0:OrganizationAddressCollection/s0:OrganizationAddress[s0:AddressType/text()='ContainerYardEmptyPickupAddress']/s0:City/text()"/>
                    </pickupaddress3>
                  </shipper>  
                 <xsl:if test="../../s0:SubShipmentCollection/s0:SubShipment/s0:OrganizationAddressCollection/s0:OrganizationAddress[s0:AddressType/text()='ConsignorPickupDeliveryAddress']">
              <activity>
                <activityplacename>
                  <xsl:value-of select="../../s0:SubShipmentCollection/s0:SubShipment/s0:OrganizationAddressCollection/s0:OrganizationAddress[s0:AddressType/text()='ConsignorPickupDeliveryAddress']/s0:CompanyName/text()"/>
                </activityplacename>
                <activityaddress1>
                  <xsl:value-of select="../../s0:SubShipmentCollection/s0:SubShipment/s0:OrganizationAddressCollection/s0:OrganizationAddress[s0:AddressType/text()='ConsignorPickupDeliveryAddress']/s0:Address1/text()"/>
                </activityaddress1>
                <activityaddress2>
                  <xsl:value-of select="../../s0:SubShipmentCollection/s0:SubShipment/s0:OrganizationAddressCollection/s0:OrganizationAddress[s0:AddressType/text()='ConsignorPickupDeliveryAddress']/s0:Address2/text()"/>
                </activityaddress2>
                <activityaddress3>
                  <xsl:value-of select="../../s0:SubShipmentCollection/s0:SubShipment/s0:OrganizationAddressCollection/s0:OrganizationAddress[s0:AddressType/text()='ConsignorPickupDeliveryAddress']/s0:City/text()"/>
                </activityaddress3>
              </activity>
              </xsl:if>
              <consignee>
                <xsl:for-each select="../../s0:SubShipmentCollection/s0:SubShipment/s0:OrganizationAddressCollection/s0:OrganizationAddress[s0:AddressType/text()='DepartureCTOAddress']">
                  <consigneename>
                    <xsl:value-of select="s0:CompanyName/text()"/>
                  </consigneename>
                  <cneeaddress1>
                    <xsl:value-of select="s0:Address1/text()"/>
                  </cneeaddress1>
                  <cneeaddress2>
                    <xsl:value-of select="s0:Address2/text()"/>
                  </cneeaddress2>
                  <cneeaddress3/>
                  <cneetown>
                    <xsl:value-of select="s0:City/text()"/>
                  </cneetown>
                </xsl:for-each>
              </consignee></xsl:when>
                <xsl:otherwise>
                  <shipper>
                    <shippername>
                      <xsl:value-of select="../../s0:SubShipmentCollection/s0:SubShipment/s0:OrganizationAddressCollection/s0:OrganizationAddress[s0:AddressType/text()='ConsignorDocumentaryAddress']/s0:CompanyName/text()"/>
                      </shippername>
                      <pickupaddress1>
                        <xsl:value-of select="../../s0:SubShipmentCollection/s0:SubShipment/s0:OrganizationAddressCollection/s0:OrganizationAddress[s0:AddressType/text()='ConsignorDocumentaryAddress']/s0:Address1/text()"/>
                      </pickupaddress1>
                      <pickupaddress2>
                        <xsl:value-of select="../../s0:SubShipmentCollection/s0:SubShipment/s0:OrganizationAddressCollection/s0:OrganizationAddress[s0:AddressType/text()='ConsignorDocumentaryAddress']/s0:Address2/text()"/>
                      </pickupaddress2>
                      <pickupaddress3>
                        <xsl:value-of select="../../s0:SubShipmentCollection/s0:SubShipment/s0:OrganizationAddressCollection/s0:OrganizationAddress[s0:AddressType/text()='ConsignorDocumentaryAddress']/s0:City/text()"/>
                      </pickupaddress3>
                    </shipper>
                  <xsl:if test="../../s0:SubShipmentCollection/s0:SubShipment/s0:OrganizationAddressCollection/s0:OrganizationAddress[s0:AddressType/text()='ArrivalCTOAddress']">
                    <activity>
                      <activityplacename>
                        <xsl:value-of select="../../s0:SubShipmentCollection/s0:SubShipment/s0:OrganizationAddressCollection/s0:OrganizationAddress[s0:AddressType/text()='ArrivalCTOAddress']/s0:CompanyName/text()"/>
                      </activityplacename>
                      <activityaddress1>
                        <xsl:value-of select="../../s0:SubShipmentCollection/s0:SubShipment/s0:OrganizationAddressCollection/s0:OrganizationAddress[s0:AddressType/text()='ArrivalCTOAddress']/s0:Address1/text()"/>
                      </activityaddress1>
                      <activityaddress2>
                        <xsl:value-of select="../../s0:SubShipmentCollection/s0:SubShipment/s0:OrganizationAddressCollection/s0:OrganizationAddress[s0:AddressType/text()='ArrivalCTOAddress']/s0:Address2/text()"/>
                      </activityaddress2>
                      <activityaddress3>
                        <xsl:value-of select="../../s0:SubShipmentCollection/s0:SubShipment/s0:OrganizationAddressCollection/s0:OrganizationAddress[s0:AddressType/text()='ArrivalCTOAddress']/s0:City/text()"/>
                      </activityaddress3>
                    </activity>
                  </xsl:if>
                  <consignee>
                    <xsl:for-each select="../../s0:SubShipmentCollection/s0:SubShipment/s0:OrganizationAddressCollection/s0:OrganizationAddress[s0:AddressType/text()='ConsigneePickupDeliveryAddress']">
                      <consigneename>
                        <xsl:value-of select="s0:CompanyName/text()"/>
                      </consigneename>
                      <cneeaddress1>
                        <xsl:value-of select="s0:Address1/text()"/>
                      </cneeaddress1>
                      <cneeaddress2>
                        <xsl:value-of select="s0:Address2/text()"/>
                      </cneeaddress2>
                      <cneeaddress3/>
                      <cneetown>
                        <xsl:value-of select="s0:City/text()"/>
                      </cneetown>
                    </xsl:for-each>
                  </consignee>
                </xsl:otherwise>
                </xsl:choose>
              
              
             
              <bookdate>
                <xsl:value-of select="cs:GetDate()"/>
              </bookdate>
              <booktime>
                <xsl:value-of select="cs:GetTimeWithSecond()"/>
              </booktime>
              <delreqdate>
                <xsl:value-of select="cs:GetDateString(string(../../s0:SubShipmentCollection/s0:SubShipment/s0:LocalProcessing/s0:DeliveryRequiredBy/text()))"/>
              </delreqdate>
              <delreqtime>
                <xsl:value-of select="cs:GetTimeString(string(../../s0:SubShipmentCollection/s0:SubShipment/s0:LocalProcessing/s0:DeliveryRequiredBy/text()))"/>
              </delreqtime>
              <servicecode>
                    <xsl:value-of select="'2'"/>
              </servicecode>          
              <spieces>
                <xsl:value-of select="string('1')"/>
              </spieces>
              <sweight>
                <xsl:value-of select="string(s0:GrossWeight/text())"/>
              </sweight>
              <scubic>
                <xsl:value-of select="string('0')"/>
              </scubic>
              <sgoodsdesc>
                <xsl:value-of select="../../s0:SubShipmentCollection/s0:SubShipment/s0:GoodsDescription/text()"/>
              </sgoodsdesc>
              <vesselname>
                <xsl:value-of select="../../s0:VesselName/text()"/>
              </vesselname>
              <voyage>
                <xsl:value-of select="../../s0:VoyageFlightNo/text()"/>
              </voyage>
              <containerno>
                <xsl:value-of select="s0:ContainerNumber/text()"/>
              </containerno>
              <conttype>
                <xsl:value-of select="substring(s0:ContainerType/s0:Code/text(),string-length(s0:ContainerType/s0:Code/text())-1,2)"/>
              </conttype>
              <contsize>
                <xsl:value-of select="substring(s0:ContainerType/s0:Code/text(),1,2)"/>
              </contsize>
              <contloadtype>
                <xsl:value-of select="string('STANDARD')"/>
              </contloadtype>
              <contrelease>
                <xsl:value-of select="s0:ContainerImportDORelease/text()"/>
              </contrelease>
              <commodity>
                <xsl:value-of select="s0:Commodity/s0:Code/text()"/>
              </commodity>
              <items>
                <item>
                  <ssitem>1</ssitem>
                  <ssdocket>
                    <xsl:value-of select="../../s0:SubShipmentCollection/s0:SubShipment/s0:DataContext/s0:DataSourceCollection/s0:DataSource/s0:Key/text()"/>
                  </ssdocket>
                  <sscommodity>
                    <xsl:value-of select="s0:Commodity/s0:Code/text()"/>
                  </sscommodity>
                  <ssdescription>
                    <xsl:value-of select="string('Container')"/>
                  </ssdescription>                  
                  <sspieces>
                    <xsl:value-of select="string('1.000') "/>
                  </sspieces>
                  <ssweight>
                    <xsl:value-of select="string(s0:GrossWeight/text())"/>
                  </ssweight>
                  <sscubic>
                    <xsl:value-of select="cs:SplitDecimal(../../s0:TotalVolume/text(),3)"/>
                  </sscubic>
                </item>
              </items>
              <shippingcompany>
                <xsl:value-of select="../../s0:OrganizationAddressCollection/s0:OrganizationAddress[s0:AddressType/text()='ShippingLineAddress']/s0:CompanyName/text()"/>
              </shippingcompany>
              <sgoodsdesc>
                <xsl:value-of select="../../s0:SubShipmentCollection/s0:SubShipment/s0:GoodsDescription/text()"/>
              </sgoodsdesc>
              <goodstype>
                <xsl:choose>
                  <xsl:when test="s0:ContainerType/s0:Category/s0:Code/text()='DRY' or s0:ContainerType/s0:Category/s0:Code/text()='Dry'">
                    <xsl:value-of select="string('AMBIENT')"/>
                  </xsl:when>
                  <xsl:otherwise>
                    <xsl:value-of select="string('REFRIGERATED')"/>
                  </xsl:otherwise>
                </xsl:choose>
              </goodstype>
              <requiredtemp>
                <xsl:choose>
                  <xsl:when test="s0:ContainerType/s0:Category/s0:Code/text()='DRY' or s0:ContainerType/s0:Category/s0:Code/text()='Dry'">
                    <xsl:value-of select="string('')"/>
                  </xsl:when>
                  <xsl:otherwise>
                    <xsl:value-of select="s0:SetPointTemp/text()"/>
                  </xsl:otherwise>
                </xsl:choose>
              </requiredtemp>
              <specialinstructions>
                <xsl:value-of select="../../s0:SubShipmentCollection/s0:SubShipment/s0:NoteCollection/s0:Note[s0:Description = 'Import Delivery Instructions']/s0:NoteText/text()"/>
              </specialinstructions>
            </shipment> 
          </shipments>
        </manifest>
      </xsl:for-each>
      </Manifest_Rcd>
  </xsl:template>
  <msxsl:script language="C#" implements-prefix="cs">
    <![CDATA[
      public static string GetDateString(string inputDateString)
      {
       string outDateString;
       if(inputDateString.Length!=0)
       {
        DateTime dt=Convert.ToDateTime(inputDateString);
        outDateString=dt.ToString("yyyy'-'MM'-'dd");
       }
       else
        {
          outDateString=DateTime.Now.ToString("yyyy'-'MM'-'dd");
        }
        return outDateString;
      }
      
       public static string GetDateTimeString(string inputDateString)
      {
       string outDateString;
       if(inputDateString.Length!=0)
       {
        DateTime dt=Convert.ToDateTime(inputDateString);
        outDateString=dt.ToString("yyyy'-'MM'-'dd hh:mm:ss");
       }
       else
        {
          outDateString=DateTime.Now.ToString("yyyy'-'MM'-'dd hh:mm:ss");
        }
        return outDateString;
      }
      public static string GetDate()
      {
       return DateTime.Now.ToString("yyyy'-'MM'-'dd");        
      }
       public string GetTime()
      {     
        return DateTime.Now.ToString("HH':'mm");      
      }
      public static string GetTimeString(string inputDateString)
      {
       string outDateString;
       if(inputDateString.Length!=0)
       {
        DateTime dt=Convert.ToDateTime(inputDateString);
        outDateString=dt.ToString("HH':'mm':'ss");
       }
       else
        {
          outDateString=DateTime.Now.ToString("HH':'mm':'ss");
        }
        return outDateString;
      }
     public static string GetTimeWithSecond()
     {
        return(DateTime.Now.ToString("HH':'mm':'ss"));
     }
     public static System.Int32 GetInteger(double inputValue)
      {
       return System.Convert.ToInt32(inputValue);        
      }
      
      public static string SplitDecimal(Decimal param1, int param3)
        {
            string s = param1.ToString("0.000", System.Globalization.CultureInfo.InvariantCulture);
            if(param3==4)
            {
            s = param1.ToString("0.0000", System.Globalization.CultureInfo.InvariantCulture);
            }            
            var values = s.Split('.');
            string firstValue = values[0];
            string secondValue = values[1];
            secondValue = secondValue.Length > param3 ? secondValue.Substring(0, param3) : secondValue; 
            var outValue = firstValue+"."+secondValue; 
            return outValue;
        }
        
        public static string GetGUID()
        {
          return System.Guid.NewGuid().ToString();
        }
      
     ]]>
  </msxsl:script>
</xsl:stylesheet>