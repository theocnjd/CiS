<%@ Page Title="Organisation Details" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="CiS._Default" %>

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

    <asp:Label ID="lblTest" runat="server" ></asp:Label>
    <table id="TblOrd" runat="server" style="width:100%">
        <tr>
            <td><h2><%: Title %></h2></td>
            <td style="float:right; align-items:end">
              
 
                </td>
        </tr>
    </table>
    
     <br />


   <%-- <dx:BootstrapTabControl ID="BootstrapTabControl1" runat="server"></dx:BootstrapTabControl>--%>

    <dx:ASPxPageControl ID="pgcrtl" runat="server" ActiveTabIndex="0" Theme="iOS" Width="100%">
        <TabPages>
           
            <dx:TabPage Name="Your Detail" Text="Your Detail">
                <ContentCollection>
                    <dx:ContentControl runat="server">
                   

    <br />
    <dx:ASPxFormLayout ID="FLOrg" runat="server" DataSourceID="DS_Org" EnableTheming="True" Theme="iOS" Width="100%">
        <Items>
            <dx:LayoutItem ColSpan="1" FieldName="Orgid" ClientVisible="false">
                <LayoutItemNestedControlCollection>
                    <dx:LayoutItemNestedControlContainer runat="server">
                        <dx:ASPxTextBox ID="txbxOrgid" runat="server" Width="500px">
                        </dx:ASPxTextBox>
                    </dx:LayoutItemNestedControlContainer>
                </LayoutItemNestedControlCollection>
            </dx:LayoutItem>
            <dx:LayoutItem ColSpan="1" FieldName="OrgName" Caption="Organisation Name">
                <LayoutItemNestedControlCollection>
                    <dx:LayoutItemNestedControlContainer runat="server">
                        <dx:ASPxTextBox ID="txbxOrgName" runat="server" Enabled="false" Width="500px">
                        </dx:ASPxTextBox>
                    </dx:LayoutItemNestedControlContainer>
                </LayoutItemNestedControlCollection>
            </dx:LayoutItem>
            <dx:LayoutItem ColSpan="1" FieldName="OrgUniqueNo">
                <LayoutItemNestedControlCollection>
                    <dx:LayoutItemNestedControlContainer runat="server">
                        <dx:ASPxTextBox ID="txbxUniqueNo" runat="server" Enabled="false" Width="500px">
                        </dx:ASPxTextBox>
                    </dx:LayoutItemNestedControlContainer>
                </LayoutItemNestedControlCollection>
            </dx:LayoutItem>
            <dx:LayoutItem ColSpan="1" FieldName="Email" >
                <LayoutItemNestedControlCollection>
                    <dx:LayoutItemNestedControlContainer runat="server">
                        <dx:ASPxTextBox ID="txbxEmail" runat="server" Enabled="false" Width="500px">
                        </dx:ASPxTextBox>
                    </dx:LayoutItemNestedControlContainer>
                </LayoutItemNestedControlCollection>
            </dx:LayoutItem>
            <dx:LayoutItem ColSpan="1" FieldName="Telephone">
                <LayoutItemNestedControlCollection>
                    <dx:LayoutItemNestedControlContainer runat="server">
                        <dx:ASPxTextBox ID="txbxTel" runat="server" Enabled="false" Width="500px">
                        </dx:ASPxTextBox>
                    </dx:LayoutItemNestedControlContainer>
                </LayoutItemNestedControlCollection>
            </dx:LayoutItem>
            <dx:LayoutItem ColSpan="1" FieldName="Mobile">
                <LayoutItemNestedControlCollection>
                    <dx:LayoutItemNestedControlContainer runat="server">
                        <dx:ASPxTextBox ID="txbxMobile" runat="server" Enabled="false" Width="500px">
                        </dx:ASPxTextBox>
                    </dx:LayoutItemNestedControlContainer>
                </LayoutItemNestedControlCollection>
            </dx:LayoutItem>
            <dx:LayoutItem ColSpan="1" FieldName="userid" ClientVisible="false">
                <LayoutItemNestedControlCollection>
                    <dx:LayoutItemNestedControlContainer runat="server">
                        <dx:ASPxSpinEdit ID="seUser" runat="server" Enabled="false" Number="0">
                        </dx:ASPxSpinEdit>
                    </dx:LayoutItemNestedControlContainer>
                </LayoutItemNestedControlCollection>
            </dx:LayoutItem>
            <dx:LayoutItem ColSpan="1" FieldName="Fname">
                <LayoutItemNestedControlCollection>
                    <dx:LayoutItemNestedControlContainer runat="server">
                        <dx:ASPxTextBox ID="txbxFName" runat="server" Enabled="false" Width="500px">
                        </dx:ASPxTextBox>
                    </dx:LayoutItemNestedControlContainer>
                </LayoutItemNestedControlCollection>
            </dx:LayoutItem>
            <dx:LayoutItem ColSpan="1" FieldName="Lname">
                <LayoutItemNestedControlCollection>
                    <dx:LayoutItemNestedControlContainer runat="server">
                        <dx:ASPxTextBox ID="txbxLName" runat="server" Enabled="false" Width="500px">
                        </dx:ASPxTextBox>
                    </dx:LayoutItemNestedControlContainer>
                </LayoutItemNestedControlCollection>
            </dx:LayoutItem>
            <dx:LayoutItem ColSpan="1" FieldName="UserTypeid" Caption="Usert Type">
                <LayoutItemNestedControlCollection>
                    <dx:LayoutItemNestedControlContainer runat="server">
                        <dx:ASPxComboBox ID="cmbxUserType" runat="server" DataSourceID="DS_userType" Enabled="false" TextField="UserTypeDesc" ValueField="UserTypeid">
                        </dx:ASPxComboBox>
                    </dx:LayoutItemNestedControlContainer>
                </LayoutItemNestedControlCollection>
            </dx:LayoutItem>
            <dx:LayoutItem ColSpan="1" Caption="Search Address">
                <LayoutItemNestedControlCollection>
                    <dx:LayoutItemNestedControlContainer runat="server">
                        <dx:ASPxTextBox ID="txbxAddsearch" runat="server" Enabled="false"  Width="500px">
                            <ClientSideEvents Init="OnInit" />
                        </dx:ASPxTextBox>
                    </dx:LayoutItemNestedControlContainer>
                </LayoutItemNestedControlCollection>
            </dx:LayoutItem>


            <dx:LayoutItem ColSpan="1" FieldName="Addressid" ClientVisible="false">
                <LayoutItemNestedControlCollection>
                    <dx:LayoutItemNestedControlContainer runat="server">
                        <dx:ASPxSpinEdit ID="seAddid" runat="server" Number="0">
                        </dx:ASPxSpinEdit>
                    </dx:LayoutItemNestedControlContainer>
                </LayoutItemNestedControlCollection>
            </dx:LayoutItem>
            <dx:LayoutItem ColSpan="1" FieldName="AddressLine1" Caption="Address Line 1">
                <LayoutItemNestedControlCollection>
                    <dx:LayoutItemNestedControlContainer runat="server">
                        <dx:ASPxTextBox ID="txbxAdLn1" runat="server" Enabled="false" ClientInstanceName="adln1" Width="500px">
                        </dx:ASPxTextBox>
                    </dx:LayoutItemNestedControlContainer>
                </LayoutItemNestedControlCollection>
            </dx:LayoutItem>
            <dx:LayoutItem ColSpan="1" FieldName="AddressLine2" Caption="Address Line 2">
                <LayoutItemNestedControlCollection>
                    <dx:LayoutItemNestedControlContainer runat="server">
                        <dx:ASPxTextBox ID="txbxAdLn2" runat="server" Enabled="false" ClientInstanceName="adln2" Width="500px">
                        </dx:ASPxTextBox>
                    </dx:LayoutItemNestedControlContainer>
                </LayoutItemNestedControlCollection>
            </dx:LayoutItem>
            <dx:LayoutItem ColSpan="1" FieldName="City">
                <LayoutItemNestedControlCollection>
                    <dx:LayoutItemNestedControlContainer runat="server">
                        <dx:ASPxTextBox ID="txbxCity" runat="server" Enabled="false" ClientInstanceName="adln3" Width="500px">
                        </dx:ASPxTextBox>
                    </dx:LayoutItemNestedControlContainer>
                </LayoutItemNestedControlCollection>
            </dx:LayoutItem>
            <dx:LayoutItem ColSpan="1" FieldName="PostCode">
                <LayoutItemNestedControlCollection>
                    <dx:LayoutItemNestedControlContainer runat="server">
                        <dx:ASPxTextBox ID="txbxPostCode" runat="server" Enabled="false" ClientInstanceName="adln4" Width="500px">
                        </dx:ASPxTextBox>
                    </dx:LayoutItemNestedControlContainer>
                </LayoutItemNestedControlCollection>
            </dx:LayoutItem>

           <dx:EmptyLayoutItem ColSpan="1">
            </dx:EmptyLayoutItem>

             <dx:LayoutItem ColSpan="1" ShowCaption="False">
                <LayoutItemNestedControlCollection>
                    <dx:LayoutItemNestedControlContainer runat="server">

                          <dx:BootstrapButton ID="BtnEdit" runat="server" AutoPostBack="false" CssClasses-Control="btn btn-secondary" Text="Edit" OnClick="BtnEdit_Click">
<CssClasses Control="btn btn-secondary"></CssClasses>
                          </dx:BootstrapButton>
                        <dx:BootstrapButton ID="BtnSave" runat="server" OnClick="BtnSave_Click" AutoPostBack="false" CssClasses-Control="btn btn-primary" ClientVisible="false" Text="Save">
<CssClasses Control="btn btn-primary"></CssClasses>
                        </dx:BootstrapButton>
                        <dx:BootstrapButton ID="BtnCancel" runat="server" OnClick="BtnCancel_Click" AutoPostBack="false" CssClasses-Control="btn btn-secondary" ClientVisible="false" Text="Cancel">
<CssClasses Control="btn btn-secondary"></CssClasses>
                        </dx:BootstrapButton>
                      
                    </dx:LayoutItemNestedControlContainer>
                </LayoutItemNestedControlCollection>
            </dx:LayoutItem>
            
        </Items>
        <SettingsItemCaptions Location="Top" />
    </dx:ASPxFormLayout>
 </dx:ContentControl>
                </ContentCollection>
            </dx:TabPage>
             <dx:TabPage Name="Add Users" Text="Add Users">
                <ContentCollection>
                    <dx:ContentControl runat="server">
                        <dx:ASPxGridView ID="GdvwUser" runat="server" DataSourceID="DS_User" AutoGenerateColumns="False" KeyFieldName="Userid" OnRowInserting="GdvwUser_RowInserting" Theme="iOS">
                            <SettingsPopup>
                                <HeaderFilter MinHeight="140px">
                                </HeaderFilter>
                            </SettingsPopup>
                            <Columns>
                                <dx:GridViewCommandColumn ShowEditButton="True" ShowInCustomizationForm="True" ShowNewButtonInHeader="True" VisibleIndex="0">
                                </dx:GridViewCommandColumn>
                                <dx:GridViewDataTextColumn FieldName="Userid" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="1">
                                    <EditFormSettings Visible="False" />
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="Fname" Caption="First Name" ShowInCustomizationForm="True" VisibleIndex="3">
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="Lname" Caption="Last Name" ShowInCustomizationForm="True" VisibleIndex="4">
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataComboBoxColumn FieldName="UserTypeid" Caption="User Type" ShowInCustomizationForm="True" VisibleIndex="2">
                                    <PropertiesComboBox DataSourceID="DS_userType" TextField="UserTypeDesc" ValueField="UserTypeid">
                                    </PropertiesComboBox>
                                </dx:GridViewDataComboBoxColumn>
                            </Columns>
                        </dx:ASPxGridView>
                        <br />
                        <asp:SqlDataSource ID="DS_User" runat="server" ConnectionString="<%$ ConnectionStrings:CiSDBCS %>" 
                            InsertCommand="uspInsertUser" InsertCommandType="StoredProcedure" 
                            SelectCommand="uspGetUsers" SelectCommandType="StoredProcedure" 
                            UpdateCommand="uspUpdateUser" UpdateCommandType="StoredProcedure" >
                            <InsertParameters>
                                <asp:Parameter Name="UserTypeid" Type="Byte" />
                                <asp:Parameter Name="UserOrgid" DbType="Guid" />
                                <asp:Parameter Name="Fname" Type="String" />
                                <asp:Parameter Name="Lname" Type="String" />
                                <asp:Parameter Direction="InputOutput" Name="Userid" Type="Int32" />
                            </InsertParameters>
                            <SelectParameters>
                                <asp:QueryStringParameter Name="orgid" QueryStringField="UserOrgid" DbType="Guid" />
                            </SelectParameters>
                            <UpdateParameters>
                                <asp:Parameter Name="UserTypeid" Type="Byte" />
                                <asp:Parameter Name="Fname" Type="String" />
                                <asp:Parameter Name="Lname" Type="String" />
                                <asp:Parameter Name="Userid" Type="Int32" />
                            </UpdateParameters>
                        </asp:SqlDataSource>
                    </dx:ContentControl>
                </ContentCollection>
            </dx:TabPage>
        </TabPages>
    </dx:ASPxPageControl>


    <asp:SqlDataSource ID="DS_Org" runat="server" ConnectionString="<%$ ConnectionStrings:CiSDBCS %>" 
        SelectCommand="uspGetOrganisation" SelectCommandType="StoredProcedure" 
        UpdateCommand="uspUpdateOrganisation" UpdateCommandType="StoredProcedure">
   
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
            <asp:Parameter Name="userid" Type="Int32"/>
            <asp:Parameter Name="Addressid" Type="Int32"  />
            <asp:Parameter Name="AddressLine1" Type="String" />
            <asp:Parameter Name="AddressLine2" Type="String" />
            <asp:Parameter Name="City" Type="String" />
            <asp:Parameter Name="PostCode" Type="String" />
            <asp:Parameter Name="Orgid"  DbType="Guid" />
        </UpdateParameters>
    </asp:SqlDataSource>
  
    <asp:SqlDatasource  ID="DS_userType" runat="server" ConnectionString="<%$ ConnectionStrings:CiSDBCS %>" SelectCommand="uspGetUserType" SelectCommandType="StoredProcedure" ></asp:SqlDatasource>
</asp:Content>
