<%@ Page Title="Organisation Details" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Organisation.aspx.cs" Inherits="CiS.Organisation" %>
<%@ Register Assembly="DevExpress.Web.Bootstrap.v18.2, Version=18.2.18.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.Bootstrap" TagPrefix="dx" %>
<%@ Register assembly="DevExpress.Web.v18.2, Version=18.2.18.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>


<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style type="text/css">
        .pac-container {
            z-index: 100000;
        }
    </style>
     <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDgo66dmE1AIiRvFBquYzyltWZwHM5Ka9U &sensor=false&libraries=places"></script>
    <script type="text/javascript">
        function OnInit(s, e) {
            var places = new google.maps.places.Autocomplete(s.GetInputElement());
            google.maps.event.addListener(places, 'place_changed', function () {
                var place = places.getPlace();
                var address = place.formatted_address;
                //var mesg = address;
                //adln1.SetText(mesg);

                const addArray = address.split(",");
                let length = addArray.length;
                if (length == 3) {
                    adln1.SetText(addArray[0]);
                    adln3.SetText(addArray[1]);
                    /*lbl3.SetText(addArray[2]);*/
                }
                else if (length > 3) {
                    adln1.SetText(addArray[0]);
                    adln2.SetText(addArray[1]);
                    adln3.SetText(addArray[2]);
                    /*lbl4.SetText(addArray[3]);*/
                }
            });
        }
    </script>

    <table id="TblOrd" runat="server" style="width:100%">
        <tr>
            <td><h2><%: Title %></h2></td>
            <td style="float:right; align-items:end">
                <dx:BootstrapButton ID="BtnEdit" runat="server" AutoPostBack="false" CssClasses-Control="btn btn-secondary" Text="Edit" OnClick="BtnEdit_Click"></dx:BootstrapButton>
 
                </td>
        </tr>
    </table>
    
     <br />


    <dx:bootstrapformlayout runat="server" AlignItemCaptionsInAllGroups="True" DataSourceID="DS_Org">
        <Items>
            <dx:BootstrapLayoutItem FieldName="Orgid" Visible="false">
                <ContentCollection>
                    <dx:ContentControl runat="server">
                        <dx:BootstrapTextBox ID="txbxOrgid" runat="server">
                        </dx:BootstrapTextBox>
                    </dx:ContentControl>
                </ContentCollection>
            </dx:BootstrapLayoutItem>
            <dx:BootstrapLayoutItem FieldName="OrgName">
                <ContentCollection>
                    <dx:ContentControl runat="server">
                        <dx:BootstrapTextBox ID="txbxOrgName"  Enabled="false" runat="server">
                            <ValidationSettings>
                                <RequiredField IsRequired="True" />
                            </ValidationSettings>
                        </dx:BootstrapTextBox>
                    </dx:ContentControl>
                </ContentCollection>
            </dx:BootstrapLayoutItem>
            <dx:BootstrapLayoutItem FieldName="OrgUniqueNo">
                <ContentCollection>
                    <dx:ContentControl runat="server">
                        <dx:BootstrapTextBox  ID="txbxUniqueNo"  Enabled="false"  runat="server">
                        </dx:BootstrapTextBox>
                    </dx:ContentControl>
                </ContentCollection>
            </dx:BootstrapLayoutItem>
            <dx:BootstrapLayoutItem FieldName="Email">
                <ContentCollection>
                    <dx:ContentControl runat="server">
                        <dx:BootstrapTextBox   ID="txbxEmail"  Enabled="false" runat="server">
                        </dx:BootstrapTextBox>
                    </dx:ContentControl>
                </ContentCollection>
            </dx:BootstrapLayoutItem>
            <dx:BootstrapLayoutItem FieldName="Telephone">
                <ContentCollection>
                    <dx:ContentControl runat="server">
                        <dx:BootstrapTextBox  ID="txbxTel"  Enabled="false" runat="server">
                        </dx:BootstrapTextBox>
                    </dx:ContentControl>
                </ContentCollection>
            </dx:BootstrapLayoutItem>
            <dx:BootstrapLayoutItem FieldName="Mobile">
                <ContentCollection>
                    <dx:ContentControl runat="server">
                        <dx:BootstrapTextBox  ID="txbxMobile"  Enabled="false" runat="server">
                        </dx:BootstrapTextBox>
                    </dx:ContentControl>
                </ContentCollection>
            </dx:BootstrapLayoutItem>
            <dx:BootstrapLayoutItem FieldName="userid" Visible="false">
                <ContentCollection>
                    <dx:ContentControl runat="server">
                        <dx:BootstrapSpinEdit runat="server"></dx:BootstrapSpinEdit>
                    </dx:ContentControl>
                </ContentCollection>
            </dx:BootstrapLayoutItem>
            <dx:BootstrapLayoutItem FieldName="Fname" Caption="First Name">
                <ContentCollection>
                    <dx:ContentControl runat="server">
                        <dx:BootstrapTextBox  ID="txbxFName"  Enabled="false" runat="server">
                        </dx:BootstrapTextBox>
                    </dx:ContentControl>
                </ContentCollection>
            </dx:BootstrapLayoutItem>
            <dx:BootstrapLayoutItem FieldName="Lname" Caption="Last Name">
                <ContentCollection>
                    <dx:ContentControl runat="server">
                        <dx:BootstrapTextBox  ID="txbxLName"  Enabled="false" runat="server">
                        </dx:BootstrapTextBox>
                    </dx:ContentControl>
                </ContentCollection>
            </dx:BootstrapLayoutItem>
            <dx:BootstrapLayoutItem FieldName="UserTypeid" Caption="User Type">
                <ContentCollection>
                    <dx:ContentControl runat="server">
                        <dx:BootstrapComboBox ID="cmbxUserType" CssClasses-Button="btn btn-primary dropdown-toggle"   Enabled="false" DataSourceID="DS_userType" 
                            runat="server" TextField="UserTypeDesc" ValueField="UserTypeid">

<CssClasses Button="btn btn-primary dropdown-toggle"></CssClasses>

                        </dx:BootstrapComboBox>
                    </dx:ContentControl>
                </ContentCollection>
            </dx:BootstrapLayoutItem>
            <dx:BootstrapLayoutItem FieldName="Addressid" Visible="false">
                <ContentCollection>
                    <dx:ContentControl runat="server">

                        <dx:BootstrapSpinEdit  runat="server">
                        </dx:BootstrapSpinEdit>
                    </dx:ContentControl>
                </ContentCollection>
            </dx:BootstrapLayoutItem>

            <dx:BootstrapLayoutItem Caption="Address Search" >
              <ContentCollection>
                    <dx:ContentControl runat="server">
                        <dx:BootstrapTextBox  ID="autocomplete"   HelpText="Type here to search for an address......"  ClientInstanceName="autocom"  Enabled="false" runat="server">
                            
                           <ClientSideEvents Init="OnInit" />
                            
                        </dx:BootstrapTextBox>
                    </dx:ContentControl>
                </ContentCollection>
            </dx:BootstrapLayoutItem>

            <dx:BootstrapLayoutItem FieldName="AddressLine1" Caption="Address Line 1">
                <ContentCollection>
                    <dx:ContentControl runat="server">
                        <dx:BootstrapTextBox  ID="txbxAdLn1" Enabled="false" ClientInstanceName="adln1"  runat="server">
                        </dx:BootstrapTextBox>
                    </dx:ContentControl>
                </ContentCollection>
            </dx:BootstrapLayoutItem>
            <dx:BootstrapLayoutItem FieldName="AddressLine2">
                <ContentCollection>
                    <dx:ContentControl runat="server">
                        <dx:BootstrapTextBox ID="txbxAdLn2" ClientInstanceName="adln2" Enabled="false" runat="server">
                        </dx:BootstrapTextBox>
                    </dx:ContentControl>
                </ContentCollection>
            </dx:BootstrapLayoutItem>
            <dx:BootstrapLayoutItem FieldName="City">
                <ContentCollection>
                    <dx:ContentControl runat="server">
                        <dx:BootstrapTextBox ID="txbxCity" ClientInstanceName="adln3" Enabled="false" runat="server">
                        </dx:BootstrapTextBox>
                    </dx:ContentControl>
                </ContentCollection>
            </dx:BootstrapLayoutItem>
            <dx:BootstrapLayoutItem FieldName="PostCode">
                <ContentCollection>
                    <dx:ContentControl runat="server">
                        <dx:BootstrapTextBox ID="txbxPostCode" ClientInstanceName="adln4"  Enabled="false" runat="server">
                        </dx:BootstrapTextBox>
                    </dx:ContentControl>
                </ContentCollection>
            </dx:BootstrapLayoutItem>
             <dx:BootstrapLayoutItem ShowCaption="False" >
                <ContentCollection>
                    <dx:ContentControl runat="server">
                       
                    </dx:ContentControl>
                </ContentCollection>
            </dx:BootstrapLayoutItem>
             <dx:BootstrapLayoutItem ShowCaption="False" >
                <ContentCollection>
                    <dx:ContentControl runat="server">
                        <dx:BootstrapButton ID="BtnSave" runat="server" CssClasses-Control="btn btn-primary" AutoPostBack="false" Text="Save" Enabled="false" OnClick="BtnSave_Click">
<CssClasses Control="btn btn-primary"></CssClasses>
                        </dx:BootstrapButton>
                        <dx:BootstrapButton ID="BtnCancel" runat="server" CssClasses-Control="btn btn-secondary" AutoPostBack="false" Text="Cancel" Enabled="false" OnClick="BtnCancel_Click">
<CssClasses Control="btn btn-secondary"></CssClasses>
                        </dx:BootstrapButton>
                    </dx:ContentControl>
                </ContentCollection>
            </dx:BootstrapLayoutItem>
        </Items>
    </dx:bootstrapformlayout>
    <asp:SqlDataSource ID="DS_Org" runat="server" ConnectionString="<%$ ConnectionStrings:CiSDBCS %>" 
        InsertCommand="uspInsertOrganisation" InsertCommandType="StoredProcedure" 
        SelectCommand="uspGetOrganisation" SelectCommandType="StoredProcedure" 
        UpdateCommand="uspUpdateOrganisation" UpdateCommandType="StoredProcedure">
        <InsertParameters>
            <asp:Parameter Name="OrgName" Type="String" />
            <asp:Parameter Name="OrgUniqueNo" Type="String" />
            <asp:Parameter Name="Email" Type="String" />
            <asp:Parameter Name="Telephone" Type="String" />
            <asp:Parameter Name="Mobile" Type="String" />
            <asp:Parameter Name="Fname" Type="String" />
            <asp:Parameter Name="Lname" Type="String" />
            <asp:Parameter Name="UserTypeid" Type="Byte"  />
            <asp:Parameter Name="AddressLine1" Type="String" />
            <asp:Parameter Name="AddressLine2" Type="String" />
            <asp:Parameter Name="City" Type="String" />
            <asp:Parameter Name="PostCode" Type="String" />
            <asp:Parameter Direction="InputOutput" Name="Orgid" Type="Object" />
        </InsertParameters>
        <SelectParameters>
            <asp:QueryStringParameter Name="Orgid" QueryStringField="Orgid" DbType="Guid" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="OrgName" Type="String" />
            <asp:Parameter Name="OrgUniqueNo" Type="String" />
            <asp:Parameter Name="Email" Type="String" />
            <asp:Parameter Name="Telephone" Type="String" />
            <asp:Parameter Name="Mobile" Type="String" />
            <asp:Parameter Name="Fname" Type="String" />
            <asp:Parameter Name="Lname" Type="String" />
            <asp:Parameter Name="UserTypeid" Type="Byte" />
            <asp:Parameter Name="userid" Type="Int32" DefaultValue="0" />
            <asp:Parameter Name="Addressid" Type="Int32"  DefaultValue="0" />
            <asp:Parameter Name="AddressLine1" Type="String" />
            <asp:Parameter Name="AddressLine2" Type="String" />
            <asp:Parameter Name="City" Type="String" />
            <asp:Parameter Name="PostCode" Type="String" />
             <asp:Parameter Name="OrgAbbName" Type="String" DefaultValue="All" />
            <asp:Parameter Name="Orgid"  DbType="Guid" />
        </UpdateParameters>
    </asp:SqlDataSource>
  
    <asp:SqlDatasource  ID="DS_userType" runat="server" ConnectionString="<%$ ConnectionStrings:CiSDBCS %>" SelectCommand="uspGetUserType" SelectCommandType="StoredProcedure" ></asp:SqlDatasource>
</asp:Content>
