<%@ Page Title="UploadFiles" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="UploadFiles.aspx.cs" Inherits="CiS.UploadFiles" %>

<%@ Register Assembly="DevExpress.Web.v18.2, Version=18.2.18.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h2 style="color: black"><%: Title %></h2>
   
    <style>
        html, body {
            height: 100%;
        }
        .center {
            width: 500px;
            height: 250px;
            margin: auto;
            outline: solid 1px black;
            display: flex;
            justify-content: center;
            align-items: center;
            background-color: lightgray;
        }
                
    </style>

    <div class="row">
        <div class="col-md-4 center">
            <table>
                <tr>
                    <td>
                        <dx:ASPxComboBox ID="CmbBoxFileTypes" runat="server" Width="250px" Theme="iOS" ForeColor="Black" NullText="Select from the list">
                            <Items>
                                <dx:ListEditItem Text="Bank Statement" Value="0" />
                                <dx:ListEditItem Text="In-house Spreadsheet" Value="1" />
                            </Items>
                        </dx:ASPxComboBox>
                    </td>
                </tr>
                <tr><td>&nbsp</td></tr>
                <tr>
                    <td>
                        <p>
                            <asp:FileUpload ID="UploadFile" ForeColor="Black"  runat="server" />
                        </p>
                        <p>
                            <asp:Button ID="BtnFileUpload" runat="server" CssClass="btn btn-primary" Text="Upload file" />
                        </p>
                    </td>
                </tr>
            </table>

        </div>
        </div>


</asp:Content>
