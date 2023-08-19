<%@ Page Title="Admin Panel" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AdminPanel.aspx.cs" Inherits="CiS.AdminPanel" %>

<%@ Register Assembly="DevExpress.Web.v18.2, Version=18.2.18.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <asp:SqlDataSource ID="dsrcAdminPanel" runat="server" ConnectionString="<%$ ConnectionStrings:CiSDBCS %>" DeleteCommand="uspDeleteAnOrganisation" DeleteCommandType="StoredProcedure" SelectCommand="uspGetAllOrganisation" SelectCommandType="StoredProcedure">
        <DeleteParameters>
            <asp:Parameter Name="Orgid" Type="Object" />
        </DeleteParameters>
    </asp:SqlDataSource>
    <dx:ASPxGridView ID="gvAdminPanel" runat="server" AutoGenerateColumns="False" DataSourceID="dsrcAdminPanel" Visible="False" KeyFieldName="Orgid" Width="100%" EnableTheming="True" Theme="iOS">
        <SettingsPager PageSize="30">
        </SettingsPager>
        <Settings HorizontalScrollBarMode="Auto" />
        <SettingsBehavior ConfirmDelete="True" />
<SettingsPopup>
<HeaderFilter MinHeight="140px"></HeaderFilter>
</SettingsPopup>
        <Columns>
            <dx:GridViewCommandColumn Caption="Action" ShowDeleteButton="True" VisibleIndex="0">
            </dx:GridViewCommandColumn>
            <dx:GridViewDataTextColumn FieldName="Orgid" VisibleIndex="1" ReadOnly="True" Visible="False">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="OrgName" ReadOnly="True" VisibleIndex="2">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="OrgUniqueNo" ReadOnly="True" VisibleIndex="3">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="OrgAbbName" VisibleIndex="4">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="OrgAdminEmail" VisibleIndex="5" Caption="Admin Email">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Email" VisibleIndex="6">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Telephone" VisibleIndex="7">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Mobile" VisibleIndex="8">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="AddressLine1" VisibleIndex="9">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="AddressLine2" VisibleIndex="10">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="City" VisibleIndex="11">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="PostCode" VisibleIndex="12">
            </dx:GridViewDataTextColumn>
        </Columns>
    </dx:ASPxGridView>
    </asp:Content>
