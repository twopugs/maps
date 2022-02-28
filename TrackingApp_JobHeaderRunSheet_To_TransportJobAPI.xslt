<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" xmlns:var="http://schemas.microsoft.com/BizTalk/2003/var" exclude-result-prefixes="msxsl var json userCSharp" version="1.0" xmlns:userCSharp="http://schemas.microsoft.com/BizTalk/2003/userCSharp"  xmlns:json='http://james.newtonking.com/projects/json'>
  <xsl:output omit-xml-declaration="yes" method="xml" version="1.0" />
  <xsl:template match="/">
    <xsl:apply-templates select="/Output" />
  </xsl:template>
  <xsl:template match="/Output">
    <TransportJobs>
      <xsl:for-each select="Run">
        <xsl:for-each select="JobHeader">
          <xsl:variable name="var:v1" select="userCSharp:StringConcat(string(col_add1/text()) , &quot;   &quot; , string(col_add2/text()) , &quot;  &quot; , string(col_loc/text()) , &quot;  &quot; , string(col_state/text()) , &quot;  &quot; , string(col_post/text()))" />
          <xsl:variable name="var:v2" select="userCSharp:StringConcat(string(del_add1/text()) , &quot;   &quot; , string(del_add2/text()) , &quot;  &quot; , string(del_loc/text()) , &quot;  &quot; , string(del_state/text()) , &quot;  &quot; , string(del_post/text()))" />
          <TransportJob>
            
			<xsl:choose>
                <xsl:when test="master_no !=''">
					<jobId>
						<xsl:value-of select="master_no/text()" />
					</jobId>
                </xsl:when>
                <xsl:otherwise>
					<jobId>
						<xsl:value-of select="job_no/text()" />
					</jobId>
				</xsl:otherwise>
			</xsl:choose>
			
			 <legId>
              <!-- <xsl:value-of select="position()" /> -->
			  <xsl:value-of select="job_no/text()" />
            </legId>
			
			
           
            <runsheetSequence>
              <xsl:value-of select="run_order/text()" />
            </runsheetSequence>
            <legNote>
              <xsl:value-of select="instructions/text()" />
            </legNote>
            <driverCode>
              <xsl:value-of select="drv_code/text()" />
            </driverCode>
            <pickup>
              <company>
                <xsl:value-of select="col_name/text()" />
              </company>
              <address>
                <xsl:value-of select="$var:v1" />
              </address>
              <instruction>
                <xsl:value-of select="col_comment/text()" />
              </instruction>
             
			 <xsl:if test="../RunDate/text()" >
              <xsl:choose>
                <xsl:when test="translate(../RunDate/text(),'123456789','000000000')='00/00/0000 00:00'">
					<estimatedTime>
						<xsl:value-of select="userCSharp:ConvertDateValue(../RunDate/text())" />
					</estimatedTime>
                </xsl:when>
                <xsl:otherwise>
					<estimatedTime>
						 <xsl:value-of select="../RunDate/text()" />
					</estimatedTime>
				</xsl:otherwise>
			</xsl:choose>
			 </xsl:if>
			 
                 
               
             
            </pickup>
            <delivery>
              <company>
                <xsl:value-of select="del_name/text()" />
              </company>
              <address>
                <xsl:value-of select="$var:v2" />
              </address>
              <instruction>
                <xsl:value-of select="del_comment/text()" />
              </instruction>
              <xsl:choose>
                <xsl:when test="del_est_time/text()='00/00/0 00:00'">
                </xsl:when>
                <xsl:otherwise>
                  <estimatedTime>
                <xsl:value-of select="userCSharp:ConvertDateValue(del_est_time/text())" />
                  </estimatedTime>
                </xsl:otherwise>
              </xsl:choose>
            </delivery>
            <xsl:for-each select="JobItems">
              <items json:Array='true'>
                <weight>
                  <xsl:value-of select="jobs_item_weight/text()" />
                </weight>
                <volume>
                  <xsl:value-of select="jobs_item_cubic/text()" />
                </volume>
                <quantity>
                  <xsl:value-of select="jobs_item_quantity/text()" />
                </quantity>
                <description>
                  <xsl:value-of select="jobs_item_description/text()" />
                </description>
                <spaces>
                  <xsl:value-of select="jobs_item_space/text()" />
                </spaces>
                <length>
                  <xsl:value-of select="jobs_item_length/text()" />
                </length>
                <width>
                  <xsl:value-of select="jobs_item_width/text()" />
                </width>
              </items>
            </xsl:for-each>
            <xsl:if test="cus_ref/text()" >
              <references>
                <type>
                  <xsl:value-of select="'Customer Reference'" />
                </type>
                <number>
                  <xsl:value-of select="cus_ref/text()" />
                </number>
              </references>
            </xsl:if>
            <xsl:if test="diary_ref/text()" >
              <references>
                <type>
                  <xsl:value-of select="'Diary Reference'" />
                </type>
                <number>
                  <xsl:value-of select="diary_ref/text()" />
                </number>
              </references>
            </xsl:if>
            <xsl:if test="srv_code/text()" >
              <references>
                <type>
                  <xsl:value-of select="'Service Code'" />
                </type>
                <number>
                  <xsl:value-of select="srv_code/text()" />
                </number>
              </references>
            </xsl:if>
            <xsl:if test="../RunNumber/text()" >
              <references>
                <type>
                  <xsl:value-of select="'Run Number'" />
                </type>
                <number>
                  <xsl:value-of select="../RunNumber/text()" />
                </number>
              </references>
            </xsl:if>
            <xsl:if test="work_code/text()" >
              <references>
                <type>
                  <xsl:value-of select="'Work Reference'" />
                </type>
                <number>
                  <xsl:value-of select="work_code/text()" />
                </number>
              </references>
            </xsl:if>
			<customer>
				<xsl:value-of select="cus_name/text()" />
			</customer>
          </TransportJob>
        </xsl:for-each>
      </xsl:for-each>
    </TransportJobs>
  </xsl:template>
  <msxsl:script language="C#" implements-prefix="userCSharp">
    <![CDATA[
public string StringConcat(string param0, string param1, string param2, string param3, string param4, string param5, string param6, string param7, string param8)
{
   return param0 + param1 + param2 + param3 + param4 + param5 + param6 + param7 + param8;
}


public string StringConcat(string param0)
{
   return param0;
}


 public static string ConvertDateValue(string inputDateString)
              {
                string outDateString="";
                 System.DateTime dt ;
             
               dt = DateTime.ParseExact(inputDateString, "dd/MM/yyyy hh:mm", System.Globalization.CultureInfo.InvariantCulture);
                            outDateString = dt.ToString("yyyy-MM-ddTHH:mm");             

                return outDateString;
              }  



]]>
  </msxsl:script>
</xsl:stylesheet>