<%@ Page Title="Member Details" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MemberDetails.aspx.cs" Inherits="CiS.MemberDetails" %>
<%@ Register assembly="DevExpress.Web.v18.2, Version=18.2.18.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h2 style="color:black">Manage Your <%: Title %></h2>
    <dx:ASPxGridView ID="GdvwMember" runat="server" DataSourceID="DS_Member" AutoGenerateColumns="False" Width="100%" KeyFieldName="Memberid" Theme="iOS" OnRowInserting="GDvwMember_RowInserting">
        <SettingsPager PageSize="20">
        </SettingsPager>
        <Settings HorizontalScrollBarMode="Visible" />
<SettingsPopup>
<HeaderFilter MinHeight="140px"></HeaderFilter>
</SettingsPopup>
        <SettingsSearchPanel Visible="True" />
        <Columns>
            <dx:GridViewCommandColumn ShowEditButton="True" ShowNewButtonInHeader="True" VisibleIndex="0">
            </dx:GridViewCommandColumn>
            <dx:GridViewDataTextColumn FieldName="Memberid" Visible="false" ReadOnly="True" VisibleIndex="1">
                <EditFormSettings Visible="False" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Fname" Caption="First Name" VisibleIndex="2">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="LName" Caption="Last Name" VisibleIndex="3">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Addressid" Visible="false" ReadOnly="True" VisibleIndex="4">
                <EditFormSettings Visible="False" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="AddressLine1" VisibleIndex="5">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="AddressLine2" VisibleIndex="6">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="City" VisibleIndex="7">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="PostCode" VisibleIndex="8">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Telephone" VisibleIndex="9">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Gender" VisibleIndex="10">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Email" VisibleIndex="11">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataCheckColumn FieldName="IsActive" VisibleIndex="12">
            </dx:GridViewDataCheckColumn>
            <dx:GridViewDataDateColumn FieldName="MembershipExpire" VisibleIndex="13">
            </dx:GridViewDataDateColumn>
            <dx:GridViewDataCheckColumn FieldName="IsTaxPayer" VisibleIndex="14">
            </dx:GridViewDataCheckColumn>
            <dx:GridViewDataCheckColumn FieldName="GiftAidConsentReceived" VisibleIndex="15">
            </dx:GridViewDataCheckColumn>
        </Columns>
</dx:ASPxGridView>
<asp:SqlDataSource ID="DS_Member" runat="server" ConnectionString="<%$ ConnectionStrings:CiSDBCS %>" 
    InsertCommand="uspInsertMenber" InsertCommandType="StoredProcedure" 
    SelectCommand="uspGetMember" SelectCommandType="StoredProcedure" 
    UpdateCommand="uspUpdateMember" UpdateCommandType="StoredProcedure">
    <InsertParameters>
        <asp:Parameter Name="Fname" Type="String" />
        <asp:Parameter Name="LName" Type="String" />
        <asp:Parameter Name="AddressLine1" Type="String" />
        <asp:Parameter Name="AddressLine2" Type="String" />
        <asp:Parameter Name="City" Type="String" />
        <asp:Parameter Name="PostCode" Type="String" />
        <asp:Parameter Name="Telephone" Type="String" />
        <asp:Parameter Name="Gender" Type="String" />
        <asp:Parameter Name="Email" Type="String" />
        <asp:Parameter Name="IsActive" Type="Boolean" />
        <asp:Parameter DbType="Date" Name="MembershipExpire" />
        <asp:Parameter Name="IsTaxPayer" Type="Boolean" />
        <asp:Parameter Name="GiftAidConsentReceived" Type="Boolean" />
        <asp:Parameter Name="Orgid" DbType="Guid" />
        <asp:Parameter Direction="InputOutput" Name="Memberid" Type="Int32" />
    </InsertParameters>
    <SelectParameters>
        <asp:QueryStringParameter DefaultValue="" Name="Orgid" QueryStringField="MemOrgid"   DbType="Guid" />
    </SelectParameters>
    <UpdateParameters>
        <asp:Parameter Name="Fname" Type="String" />
        <asp:Parameter Name="LName" Type="String" />
        <asp:Parameter Name="Addressid" Type="Int32" />
        <asp:Parameter Name="AddressLine1" Type="String" />
        <asp:Parameter Name="AddressLine2" Type="String" />
        <asp:Parameter Name="City" Type="String" />
        <asp:Parameter Name="PostCode" Type="String" />
        <asp:Parameter Name="Telephone" Type="String" />
        <asp:Parameter Name="Gender" Type="String" />
        <asp:Parameter Name="Email" Type="String" />
        <asp:Parameter Name="IsActive" Type="Boolean" />
        <asp:Parameter DbType="Date" Name="MembershipExpire" />
        <asp:Parameter Name="IsTaxPayer" Type="Boolean" />
        <asp:Parameter Name="GiftAidConsentReceived" Type="Boolean" />
        <asp:Parameter Name="Memberid" Type="Int32" />
    </UpdateParameters>
</asp:SqlDataSource>

</asp:Content>
