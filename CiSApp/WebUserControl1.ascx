<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WebUserControl1.ascx.cs" Inherits="CiS.WebUserControl1" %>
<%@ Register Assembly="DevExpress.Web.v18.2, Version=18.2.18.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<dx:ASPxComboBox ID="ASPxComboBox1" runat="server" ValueType="System.String">
     <Items>
                            <dx:ListEditItem Text="No" Value="0" />
                            <dx:ListEditItem Text="Yes" Value="1" />
                        </Items>
</dx:ASPxComboBox>
