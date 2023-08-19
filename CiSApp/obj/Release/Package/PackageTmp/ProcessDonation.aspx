<%@ Page Title="Process Donations" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ProcessDonation.aspx.cs" Inherits="CiS.ProcessDonation" %>

<%@ Register Assembly="DevExpress.Web.v18.2, Version=18.2.18.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h2 style="color:black"><%: Title %></h2>
    <hr />
    <style>
        .banner{
            width:max-content;
            border-radius:5px;
            padding: 7px 7px 10px 7px;
            height:35px;
        }
    </style>
    <br />


     <div class="row">
        <div class="col-md-4">
            <div class="text-ms font-weight-bold text-primary text-capitalize mb-1">
                                Select 'Yes' to generate your donor list!
                            </div>
             <%-- <h6 style="color:black;"><b>Select 'Yes' to generate your donor list!</b></h6>--%>
                <div style="float:left;">
                    <dx:ASPxComboBox ID="ChkBxDnrList" runat="server" Theme="iOS" NullText="Select from the list" >
                        <Items>
                            <dx:ListEditItem Text="No" Value="0" />
                            <dx:ListEditItem Text="Yes" Value="1" />
                        </Items>
                    </dx:ASPxComboBox>
                </div>
          <div></div>
                <div style="padding-left:10px;">
           
                    <asp:Button ID="BtnDonor" OnClick="BtnDonor_Click" CssClass="btn btn-primary" runat="server" Text="Get Donors" Style="height: 35px" />
                </div>
            </div>

         <div class="col-md-8">
             <div class="text-ms font-weight-bold text-primary text-capitalize mb-1">
                                Validate total donation here!
                            </div>
                    <%--<h6  style="color:black;"><b>Validate total donation here!</b></h6>--%>
                    <dx:ASPxGridView ID="GdvwDonHead" runat="server" AutoGenerateColumns="False" DataSourceID="ds_DonHead" EnableTheming="True" KeyFieldName="DonationHeadid" Theme="iOS">
                        <SettingsDataSecurity AllowDelete="False" AllowInsert="False" />
                        <SettingsPopup>
                            <HeaderFilter MinHeight="140px"></HeaderFilter>
                        </SettingsPopup>
                        <Columns>
                            <dx:GridViewCommandColumn Caption="Action" ShowEditButton="True" VisibleIndex="0">
                            </dx:GridViewCommandColumn>
                            <dx:GridViewDataTextColumn FieldName="DonationHeadid" ReadOnly="True" Visible="false" VisibleIndex="1">
                                <EditFormSettings Visible="False" />
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Total" Caption="Manual Donation Total" VisibleIndex="2">
                                <PropertiesTextEdit>
                                    <ValidationSettings>
                                        <RegularExpression ErrorText="The value must be number" ValidationExpression="\d+" />
                                    </ValidationSettings>
                                </PropertiesTextEdit>
                            </dx:GridViewDataTextColumn>

                            <dx:GridViewDataTextColumn FieldName="DigitalDonationTotal" VisibleIndex="3">
                                <PropertiesTextEdit>
                                    <ValidationSettings ErrorTextPosition="Top">
                                        <RegularExpression ErrorText="The value must be number" ValidationExpression="\d+" />
                                    </ValidationSettings>
                                </PropertiesTextEdit>
                            </dx:GridViewDataTextColumn>

                            <dx:GridViewDataDateColumn FieldName="CheckedDate" VisibleIndex="4">
                            </dx:GridViewDataDateColumn>
                            <dx:GridViewDataDateColumn FieldName="LastUpdated" VisibleIndex="5">
                                <EditFormSettings Visible="False" />
                            </dx:GridViewDataDateColumn>
                            <dx:GridViewDataComboBoxColumn FieldName="CheckBy" VisibleIndex="6">
                                <PropertiesComboBox DataSourceID="ds_User" TextField="FullName" ValueField="Userid">
                                </PropertiesComboBox>
                            </dx:GridViewDataComboBoxColumn>
                            <dx:GridViewDataComboBoxColumn Caption="Cross-Check By" FieldName="xCheckBy" VisibleIndex="7">
                                <PropertiesComboBox DataSourceID="ds_xUser" TextField="FullName" ValueField="Userid">
                                </PropertiesComboBox>
                            </dx:GridViewDataComboBoxColumn>
                        </Columns>
                    </dx:ASPxGridView>
                    <asp:SqlDataSource ID="ds_DonHead" runat="server" ConnectionString="<%$ ConnectionStrings:CiSDBCS %>"
                        SelectCommand="uspGetDonationHead" SelectCommandType="StoredProcedure"
                        UpdateCommand="uspUpdateDonationHead" UpdateCommandType="StoredProcedure">
                        <SelectParameters>
                            <asp:Parameter Name="Orgid" DbType="Guid" />
                            <asp:Parameter DbType="Date" Name="cDate" />
                        </SelectParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="Total" Type="Decimal" />
                            <asp:Parameter Name="CheckBy" Type="Int32" />
                            <asp:Parameter Name="XCheckBy" Type="Int32" />
                            <asp:Parameter Name="CheckedDate" Type="DateTime" />
                            <asp:Parameter Name="DonHdOrgid" DbType="Guid" />
                            <asp:Parameter Name="DonationHeadid" Type="Int32" />
                            <asp:Parameter Name="DigitalDonationTotal" Type="Decimal" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
            </div>
         </div>
    <br />

    <table style="width:100%">
       <%-- <tr>
            <td style="width:10%" >

                <asp:Panel ID="PnlPrompt" CssClass="banner"  BackColor="RoyalBlue" ForeColor="White"  runat="server">Select and pick 'Yes' to generate your donor list!</asp:Panel>
                <div style="float:left; padding-top:15px">
                    <dx:ASPxComboBox ID="ChkBxDnrList" runat="server" Theme="iOS" NullText="Select from the list" >
                        <Items>
                            <dx:ListEditItem Text="No" Value="0" />
                            <dx:ListEditItem Text="Yes" Value="1" />
                        </Items>
                    </dx:ASPxComboBox>
                </div>
          <div></div>
                <div style="padding-left:10px; padding-top:15px">
           
                    <asp:Button ID="BtnDonor" OnClick="BtnDonor_Click" CssClass="btn btn-secondary" runat="server" Text="Get Donors" Style="height: 35px" />
                </div>
            </td>
           </tr>
        <tr><td><p></p></td></tr>
               <tr>
             <td >
                 <asp:Panel ID="PnlHeadBanner" CssClass="banner"  BackColor="RoyalBlue" ForeColor="White"  runat="server">Remember to get your total validated once you finish!</asp:Panel>
                    
                    <dx:ASPxGridView ID="GdvwDonHead" runat="server" AutoGenerateColumns="False" DataSourceID="ds_DonHead" EnableTheming="True" KeyFieldName="DonationHeadid" Theme="iOS">
                        <SettingsDataSecurity AllowDelete="False" AllowInsert="False" />
                        <SettingsPopup>
                            <HeaderFilter MinHeight="140px"></HeaderFilter>
                        </SettingsPopup>
                        <Columns>
                            <dx:GridViewCommandColumn Caption="Action" ShowEditButton="True" VisibleIndex="0">
                            </dx:GridViewCommandColumn>
                            <dx:GridViewDataTextColumn FieldName="DonationHeadid" ReadOnly="True" Visible="false" VisibleIndex="1">
                                <EditFormSettings Visible="False" />
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Total" VisibleIndex="2">
                                <PropertiesTextEdit>
                                    <ValidationSettings>
                                        <RegularExpression ErrorText="The value must be in decimal" ValidationExpression="\d+" />
                                    </ValidationSettings>
                                </PropertiesTextEdit>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataDateColumn FieldName="CheckedDate" VisibleIndex="5">
                            </dx:GridViewDataDateColumn>
                            <dx:GridViewDataDateColumn FieldName="LastUpdated" VisibleIndex="6">
                                <EditFormSettings Visible="False" />
                            </dx:GridViewDataDateColumn>
                            <dx:GridViewDataComboBoxColumn FieldName="CheckBy" VisibleIndex="3">
                                <PropertiesComboBox DataSourceID="ds_User" TextField="FullName" ValueField="Userid">
                                </PropertiesComboBox>
                            </dx:GridViewDataComboBoxColumn>
                            <dx:GridViewDataComboBoxColumn Caption="Cross-Check By" FieldName="xCheckBy" VisibleIndex="4">
                                <PropertiesComboBox DataSourceID="ds_xUser" TextField="FullName" ValueField="Userid">
                                </PropertiesComboBox>
                            </dx:GridViewDataComboBoxColumn>
                        </Columns>
                    </dx:ASPxGridView>
                    <asp:SqlDataSource ID="ds_DonHead" runat="server" ConnectionString="<%$ ConnectionStrings:CiSDBCS %>"
                        SelectCommand="uspGetDonationHead" SelectCommandType="StoredProcedure"
                        UpdateCommand="uspUpdateDonationHead" UpdateCommandType="StoredProcedure">
                        <SelectParameters>
                            <asp:Parameter Name="Orgid" DbType="Guid" />
                            <asp:Parameter DbType="Date" Name="cDate" />
                        </SelectParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="Total" Type="Decimal" />
                            <asp:Parameter Name="CheckBy" Type="Int32" />
                            <asp:Parameter Name="XCheckBy" Type="Int32" />
                            <asp:Parameter Name="CheckedDate" Type="DateTime" />
                            <asp:Parameter Name="DonHdOrgid" Type="Object" />
                            <asp:Parameter Name="DonationHeadid" Type="Int32" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
              
            </td>
        </tr>
   
        <tr>
            <td></td>
        </tr>--%>
        <tr>
            <td>
                <div class="text-ms font-weight-bold text-primary text-capitalize mb-1">
                                For anonymous donor, click on 'New' to enter the record!
                            </div>
               <%--  <h6  style="color:black;"><b>For anonymous donor, click on 'New' to enter the record!</b></h6>--%>
                <dx:ASPxGridView ID="GdvwDonDetails" runat="server" AutoGenerateColumns="False" DataSourceID="ds_Donation" EnableTheming="True" KeyFieldName="DonationDetailid" Theme="iOS" Width="100%" OnRowInserting="GdvwDonDetails_RowInserting" OnRowUpdating="GdvwDonDetails_RowUpdating" OnCustomCallback="GdvwDonDetails_CustomCallback">
                    <SettingsEditing Mode="Inline">
                    </SettingsEditing>
                    <SettingsDataSecurity AllowDelete="False" />
                    <SettingsPopup>
                        <HeaderFilter MinHeight="140px">
                        </HeaderFilter>
                    </SettingsPopup>
                    <SettingsSearchPanel Visible="True" />
                    <Columns>
                        <dx:GridViewCommandColumn ShowEditButton="True" ShowNewButtonInHeader="True" VisibleIndex="0">
                        </dx:GridViewCommandColumn>
                        <dx:GridViewDataTextColumn FieldName="DonationDetailid" ReadOnly="True" Visible="False" VisibleIndex="1">
                            <EditFormSettings Visible="False"></EditFormSettings>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="DonationHeadid" Visible="False" VisibleIndex="2">
                            <EditFormSettings Visible="False" />
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="Memberid" VisibleIndex="3" Visible="False">
                            <EditFormSettings Visible="False" />
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="Fname" VisibleIndex="4" Caption="First Name" ReadOnly="True">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="LName" VisibleIndex="5" Caption="Last Name" ReadOnly="True"></dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="Offering" VisibleIndex="7">
                            <PropertiesTextEdit>
                                <ValidationSettings>
                                    <RegularExpression ErrorText="Value must be in decimal" ValidationExpression="\d+" />
                                </ValidationSettings>
                            </PropertiesTextEdit>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="Tithe" VisibleIndex="8">
                            <PropertiesTextEdit>
                                <ValidationSettings>
                                    <RegularExpression ErrorText="Value must be in decimal" ValidationExpression="\d+" />
                                </ValidationSettings>
                            </PropertiesTextEdit>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="ThxGiving" VisibleIndex="9">
                            <PropertiesTextEdit>
                                <ValidationSettings>
                                    <RegularExpression ErrorText="Value must be in decimal" ValidationExpression="\d+" />
                                </ValidationSettings>
                            </PropertiesTextEdit>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="Pledges" VisibleIndex="10">
                            <PropertiesTextEdit>
                                <ValidationSettings>
                                    <RegularExpression ErrorText="Value must be in decimal" ValidationExpression="\d+" />
                                </ValidationSettings>
                            </PropertiesTextEdit>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="BuildingFund" VisibleIndex="11">
                            <PropertiesTextEdit>
                                <ValidationSettings>
                                    <RegularExpression ErrorText="Value must be in decimal" ValidationExpression="\d+" />
                                </ValidationSettings>
                            </PropertiesTextEdit>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="Others" VisibleIndex="12">
                            <PropertiesTextEdit>
                                <ValidationSettings>
                                    <RegularExpression ErrorText="Value must be in decimal" ValidationExpression="\d+" />
                                </ValidationSettings>
                            </PropertiesTextEdit>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="Amount" VisibleIndex="13">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataComboBoxColumn Caption="Donation Method" FieldName="DonationMethodid" VisibleIndex="6">
                            <PropertiesComboBox DataSourceID="ds_PayMthd" TextField="DonationMethod" ValueField="DonationMethodid">
                            </PropertiesComboBox>
                        </dx:GridViewDataComboBoxColumn>
                        <dx:GridViewDataMemoColumn FieldName="Remark" VisibleIndex="14">
                            <PropertiesMemoEdit Width="150px" >
                            </PropertiesMemoEdit>
                        </dx:GridViewDataMemoColumn>
                    </Columns>
                </dx:ASPxGridView>

            </td>
        </tr>
    </table>
    <asp:SqlDataSource ID="ds_Donation" runat="server" ConnectionString="<%$ ConnectionStrings:CiSDBCS %>"
        SelectCommand="uspPrepareDonationsForm" SelectCommandType="StoredProcedure"
        UpdateCommand="uspUpdateDonationDetails" UpdateCommandType="StoredProcedure"
        InsertCommand="uspInsertDonationDetails" InsertCommandType="StoredProcedure">
        <InsertParameters>
            <asp:Parameter Name="DonationHeadid" Type="Int32" />
            <asp:Parameter Name="Memberid" Type="Int32" />
            <asp:Parameter Name="DonationMethodid" Type="Byte" />
            <asp:Parameter Name="Fname" Type="String" />
            <asp:Parameter Name="Lname" Type="String" />
            <asp:Parameter Name="Offering" Type="Decimal" />
            <asp:Parameter Name="Tithe" Type="Decimal" />
            <asp:Parameter Name="ThxGiving" Type="Decimal" />
            <asp:Parameter Name="Pledges" Type="Decimal" />
            <asp:Parameter Name="BuildingFund" Type="Decimal" />
            <asp:Parameter Name="Others" Type="Decimal" />
            <asp:Parameter Name="Total" Type="Decimal" />
            <asp:Parameter Name="Remark" Type="String" />
            <asp:Parameter Name="orgid" DbType="Guid"/>
            <asp:Parameter Name="DataSource" Type="Byte"  />
            <asp:Parameter Name="DonationDetailid" Type="Int32" />
        </InsertParameters>
        <SelectParameters>
            <asp:Parameter Name="Orgid" DbType="Guid" />
            <asp:Parameter Name="Action" Type="Boolean" />
            <asp:Parameter Name="cDate" Type="DateTime" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="DonationHeadid" Type="Int32" />
            <asp:Parameter Name="Memberid" Type="Int32" />
            <asp:Parameter Name="DonationMethodid" Type="Byte" />
            <asp:Parameter Name="Fname" Type="String" />
            <asp:Parameter Name="Lname" Type="String" />
            <asp:Parameter Name="Offering" Type="Decimal" />
            <asp:Parameter Name="Tithe" Type="Decimal" />
            <asp:Parameter Name="ThxGiving" Type="Decimal" />
            <asp:Parameter Name="Pledges" Type="Decimal" />
            <asp:Parameter Name="BuildingFund" Type="Decimal" />
            <asp:Parameter Name="Others" Type="Decimal" />
            <asp:Parameter Name="Total" Type="Decimal" />
            <asp:Parameter Name="Remark" Type="String" />
            <asp:Parameter Name="Orgid" DbType="Guid" />
            <asp:Parameter Name="DonationDetailid" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="ds_PayMthd" runat="server" ConnectionString="<%$ ConnectionStrings:CiSDBCS %>" SelectCommand="uspGetDonationMethod" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
    <asp:SqlDataSource ID="ds_User" runat="server" ConnectionString="<%$ ConnectionStrings:CiSDBCS %>" SelectCommand="uspGetUsers" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:Parameter Name="orgid" DbType="Guid" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="ds_xUser" runat="server" ConnectionString="<%$ ConnectionStrings:CiSDBCS %>" SelectCommand="uspGetUsers" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:Parameter Name="orgid" DbType="Guid" />
        </SelectParameters>
    </asp:SqlDataSource>
    <br />

</asp:Content>
