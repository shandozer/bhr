<apex:page id="Registration" showHeader="false" controller="SiteRegisterController" cache="false" title="{!$Label.site.register}" action="{!checkLogin}" standardStylesheets="false">

<apex:includeScript value="{!URLFOR($Resource.TBI_Resource, 'inc/jquery.min.js')}" />
<apex:includeScript value="{!URLFOR($Resource.TBI_Resource, 'inc/jquery-ui.js')}" />
<apex:stylesheet value="{!URLFOR($Resource.TBI_Resource, 'css/jquery-ui.css')}"/>

<apex:includeScript value="{!URLFOR($Resource.TBI_Resource, 'lib/chosen/chosen.jquery.min.js')}" />

<apex:stylesheet value="{!URLFOR($Resource.TBI_Resource, 'lib/chosen/chosen.css')}" />

    <c:SiteCSS id="siteCSS" />
    <style>
        .select-container{
/*             padding: 3%; */
/*             border: 1px solid rgb(245, 126, 33); */
               width: 377px;
        } 
        
        .chzn-select{
            width: 100%;
        }
        
        .chzn-container {
/*             width: 109% !important; */
            width: 377px;
            font-size: 15px; 
            margin-top: 2%;
            margin-bottom: 2%;
        }
        .chzn-container .chzn-single{
            font-size: 150%;
            height: 1.2em;
/*             padding: 1%; */
            vertical-align: middle;  
            padding: 5px 1px 1px 8px;
        }
        
        .chzn-container .chzn-single span{
            padding-bottom: 1%;
        }
        
        .ie-align-fix {
            text-align:left;
        } 
    </style>
    
    <c:TBI_Header id="siteHeader"/>
    
    <c:TBI_MenuTabs id="menuTabs"/>

    <center><apex:outputPanel layout="block" styleClass="topPanel">
        <apex:form id="theForm" forceSSL="true" style="margin-bottom: 4%; margin-top: 2%;">
            <apex:panelGrid columns="1" styleClass="primary-style large-font ie-align-fix" style="background-color: rgba(255, 255, 255, 0.598039);">
            <apex:pageMessages id="error" />
            <apex:panelGrid columns="2" >
                <apex:outputLabel value="{!$ObjectType.Contact.Fields.FirstName.Label}" for="firstname" />
                
                <apex:panelGroup >
                    <apex:inputText id="firstname" value="{!firstname}" /><br/>
                    <apex:outputText value="{!errorMessageFirstName}"  rendered="{!LEN(errorMessageFirstName)>0}" id="err" style="font-size:17px;color:red;"  />
                </apex:panelGroup>
                
                <apex:outputLabel value="{!$ObjectType.Contact.Fields.LastName.Label}" for="lastname" />
                
                <apex:panelGroup >
                    <apex:inputText id="lastname" value="{!lastname}" /><br/>
                    <apex:outputText value="{!errorMessageLastName}" rendered="{!LEN(errorMessageLastName)>0}" style="font-size:17px;color:red;"  />
                </apex:panelGroup>

                <apex:outputLabel value="{!$Label.site.email}" for="email" />
                
                <apex:panelGroup >
                    <apex:inputText id="email" value="{!email}" /><br/>
                    <apex:outputText value="{!errorMessageEmail}" rendered="{!LEN(errorMessageEmail)>0}" style="font-size:17px;color:red;"  />
                </apex:panelGroup>
                
                <apex:outputLabel value="{!$Label.site.password}" for="password" />
                
                <apex:panelGroup >
                    <apex:inputSecret id="password" value="{!password}" /><br/>
                    <apex:outputText value="{!errorMessagePassword}" rendered="{!LEN(errorMessagePassword)>0}" style="font-size:17px;color:red;"  />
                </apex:panelGroup>
                
                <apex:outputLabel value="{!$Label.site.confirm_password}" for="confirmPassword" />
                
                <apex:panelGroup >
                    <apex:inputSecret id="confirmPassword" value="{!confirmPassword}" /><br/>
                    <apex:outputText value="{!errorMessageConfirmPassword}" rendered="{!LEN(errorMessageConfirmPassword)>0}" style="font-size:17px;color:red;"  />
                </apex:panelGroup>
                
                <apex:panelGroup />
                <!-- <apex:outputLabel style="font-size:21px;" value="How did you find out about us?" 
                                  for="leadsource_pl" /> -->

                <apex:panelGroup >
                    <div class="select-container" >    
                        <apex:inputField id="leadsource_pl" styleClass="chzn-select" value="{!portalContact.LeadSource}"/>
                    </div>
                </apex:panelGroup> 
                
                <apex:outputText value=""/>
                <apex:panelGroup >
                    <apex:inputCheckBox value="{!isConfirmNewsletter}" id="newsletterCheckBox"/>&nbsp;
                    <apex:outputLabel value="{!$Label.TBINewsletter}" for="newsletterCheckBox" style="font-size:21px;"/>
                </apex:panelGroup>
                
                <apex:outputText value="" />
                <apex:panelGroup id="theLinks" styleClass="links">
                    <apex:commandButton action="{!registerUser}" value="Join Us"/>
                    <apex:outputPanel style="padding-left: 1em;">&nbsp;</apex:outputPanel>
                    <apex:outputLink value="{!$Page.SiteLogin}" rendered="{!$Site.LoginEnabled}" styleClass="linkcls">{!$Label.site.login}</apex:outputLink>
                    <apex:outputPanel style="padding-left: 1em;">&nbsp;</apex:outputPanel>
                    <apex:outputLink value="{!$Page.ForgotPassword}" styleClass="linkcls"> {!$Label.site.forgot_your_password_q}</apex:outputLink>
                </apex:panelGroup>
            </apex:panelGrid>
            </apex:panelGrid>
        </apex:form>
    </apex:outputPanel></center>
    <c:TBI_Footer id="siteFooter"/>
    
    <script>
        $(document).ready(function(){
        //$('.joinUsTab').addClass('active');
        $('.joinUsCls').addClass('active');
    });
    </script>
    <!-- Decorate drop down -->
    <script type="text/javascript">  
                jQuery(document).ready(function() {
                    
                    $(".chzn-select").prop("tabindex","2"); 
                    var selectedOption = $('.chzn-select').find(":selected").text();
                    if(selectedOption==="--None--"){
                        $('.chzn-select').find(":selected").text(''); 
                    } 
                    var chosenObj = $(".chzn-select").chosen({disable_search_threshold: 100,
                                                              placeholder_text:"How did you find us?"});
                    //chosenObj.default_text="How did you find us?";
                    
                    //alert('------');
                }); 
                
               // window.onbeforeunload = function() { return "You work will be lost."; };
    </script>
</apex:page>