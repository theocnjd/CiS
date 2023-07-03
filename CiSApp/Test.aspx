<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Test.aspx.cs" Inherits="CiS.Test" %>

<%@ Register Assembly="DevExpress.Web.Bootstrap.v18.2, Version=18.2.18.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.Bootstrap" TagPrefix="dx" %>
<%@ Register assembly="DevExpress.Web.v18.2, Version=18.2.18.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

                        <dx:BootstrapSpinEdit runat="server"></dx:BootstrapSpinEdit>

    <dx:bootstrapformlayout runat="server" AlignItemCaptionsInAllGroups="True" DataSourceID="SqlDataSource1">
        <Items>
            <dx:BootstrapLayoutItem FieldName="Orgid">
                <ContentCollection>
                    <dx:ContentControl runat="server">
                        <dx:BootstrapTextBox runat="server">
                        </dx:BootstrapTextBox>
                    </dx:ContentControl>
                </ContentCollection>
            </dx:BootstrapLayoutItem>
            <dx:BootstrapLayoutItem FieldName="OrgName">
                <ContentCollection>
                    <dx:ContentControl runat="server">
                        <dx:BootstrapTextBox runat="server">
                        </dx:BootstrapTextBox>
                    </dx:ContentControl>
                </ContentCollection>
            </dx:BootstrapLayoutItem>
            <dx:BootstrapLayoutItem FieldName="OrgUniqueNo">
                <ContentCollection>
                    <dx:ContentControl runat="server">
                        <dx:BootstrapTextBox  runat="server">
                        </dx:BootstrapTextBox>
                    </dx:ContentControl>
                </ContentCollection>
            </dx:BootstrapLayoutItem>
            <dx:BootstrapLayoutItem FieldName="Email">
                <ContentCollection>
                    <dx:ContentControl runat="server">
                        <dx:BootstrapTextBox runat="server">
                        </dx:BootstrapTextBox>
                    </dx:ContentControl>
                </ContentCollection>
            </dx:BootstrapLayoutItem>
            <dx:BootstrapLayoutItem FieldName="Telephone">
                <ContentCollection>
                    <dx:ContentControl runat="server">
                        <dx:BootstrapTextBox runat="server">
                        </dx:BootstrapTextBox>
                    </dx:ContentControl>
                </ContentCollection>
            </dx:BootstrapLayoutItem>
            <dx:BootstrapLayoutItem FieldName="Mobile">
                <ContentCollection>
                    <dx:ContentControl runat="server">
                        <dx:BootstrapTextBox runat="server">
                        </dx:BootstrapTextBox>
                    </dx:ContentControl>
                </ContentCollection>
            </dx:BootstrapLayoutItem>
            <dx:BootstrapLayoutItem FieldName="userid">
                <ContentCollection>
                    <dx:ContentControl runat="server">
                    </dx:ContentControl>
                </ContentCollection>
            </dx:BootstrapLayoutItem>
            <dx:BootstrapLayoutItem FieldName="Fname">
                <ContentCollection>
                    <dx:ContentControl runat="server">
                        <dx:BootstrapTextBox runat="server">
                        </dx:BootstrapTextBox>
                    </dx:ContentControl>
                </ContentCollection>
            </dx:BootstrapLayoutItem>
            <dx:BootstrapLayoutItem FieldName="Lname">
                <ContentCollection>
                    <dx:ContentControl runat="server">
                        <dx:BootstrapTextBox runat="server">
                        </dx:BootstrapTextBox>
                    </dx:ContentControl>
                </ContentCollection>
            </dx:BootstrapLayoutItem>
            <dx:BootstrapLayoutItem FieldName="CreatedDate">
                <ContentCollection>
                    <dx:ContentControl runat="server">
                        <dx:BootstrapSpinEdit runat="server">
                        </dx:BootstrapSpinEdit>
                    </dx:ContentControl>
                </ContentCollection>
            </dx:BootstrapLayoutItem>
            <dx:BootstrapLayoutItem FieldName="CreatedDate">
                <ContentCollection>
                    <dx:ContentControl runat="server">

                        <dx:BootstrapButton ID="BootstrapButton1" CssClasses-Control="btn btn-primary"  runat="server" AutoPostBack="false" Text="Button"></dx:BootstrapButton>
                    </dx:ContentControl>
                </ContentCollection>
            </dx:BootstrapLayoutItem>
        </Items>
    </dx:bootstrapformlayout>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:CiSDBCS %>" InsertCommand="uspInsertOrganisation" 
        InsertCommandType="StoredProcedure" SelectCommand="uspGetOrganisation" SelectCommandType="StoredProcedure" UpdateCommand="uspUpdateOrganisation" UpdateCommandType="StoredProcedure">
        <InsertParameters>
            <asp:Parameter Name="OrgName" Type="String" />
            <asp:Parameter Name="OrgUniqueNo" Type="String" />
            <asp:Parameter Name="Email" Type="String" />
            <asp:Parameter Name="Telephone" Type="String" />
            <asp:Parameter Name="Mobile" Type="String" />
            <asp:Parameter Name="Fname" Type="String" />
            <asp:Parameter Name="Lname" Type="String" />
            <asp:Parameter Name="UserTypeid" Type="Byte" />
            <asp:Parameter Direction="InputOutput" Name="Orgid" Type="Object" />
        </InsertParameters>
        <SelectParameters>
            <asp:QueryStringParameter Name="Orgid" QueryStringField="Orgid"  DbType="Guid" />
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
            <asp:Parameter Name="userid" Type="Int32" />
            <asp:Parameter Name="Orgid" Type="Object" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>
