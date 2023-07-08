<%@ Page Title="UploadFiles" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="UploadFiles.aspx.cs" Inherits="CiS.UploadFiles" %>

<%@ Register Assembly="DevExpress.Web.v18.2, Version=18.2.18.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h2 style="color: black"><%: Title %></h2>
    <hr />
    <style>
        html, body {
            height: 100%;
        }

        .center {
            width: 500px;
            height: 250px;
            margin-left: 15px;
            outline: solid 1px black;
            display: flex;
            justify-content: center;
            align-items: center;
            background-color: lightgray;
        }
    </style>
    <div style="width: 600px">
        <div>
            <ul style="color: black">
                <li>Click on 'In-house Template' button to download template to upload in-house donation records.</li>
                <li>If your bank spreadsheet is not from <b>'Natwest'</b> or <b>'Barclays'</b>, click on 'Statement Template' to see field's names that your spreadsheet must have.'</li>
            </ul>
        </div>
    
        <div class="row" style="margin:6px">
            <asp:Button ID="GenInhouseTemplateBtn" runat="server" CssClass="btn btn-primary" Text="In-house Template" OnClick="GenInhouseTemplateBtn_Click" />
            &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
            <asp:Button ID="GenStatementTemplate" runat="server" CssClass="btn btn-primary" Text="Statement Template" OnClick="GenStatementTemplateBtn_Click" />
        </div>

    </div>

    <div class="row">
        <div class="col-md-4 center">
            <table>
                <tr>
                    <td>
                        <dx:ASPxGridViewExporter ID="ExpInHseTemplate" GridViewID="GvInHseTemplate" FileName="Inhouse_Template" runat="server"></dx:ASPxGridViewExporter>
                        <dx:ASPxGridViewExporter ID="ExpStmntTemplate" GridViewID="GvStmntTemplate" FileName="Statement_Template" runat="server"></dx:ASPxGridViewExporter>
                    </td>
                </tr>
                <tr>
                    <td>
                        <dx:ASPxGridView ID="GvInHseTemplate" ClientVisible="False" runat="server" AutoGenerateColumns="False">
                            <SettingsPopup>
                                <HeaderFilter MinHeight="140px"></HeaderFilter>
                            </SettingsPopup>
                            <Columns>
                                <dx:GridViewDataTextColumn Name="ID" Caption="ID" VisibleIndex="0">
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn Name="First Name" Caption="first Name" VisibleIndex="1">
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn Name="Last Name" Caption="Last Name" VisibleIndex="2">
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn Name="Offering" Caption="Offering" VisibleIndex="3">
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn Name="Tithe" Caption="Tithe" VisibleIndex="4">
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn Name="Thanks Giving" Caption="Thanks Giving" VisibleIndex="5">
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn Name="Pledges" Caption="Pledges" VisibleIndex="6">
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn Name="Building Fund" Caption="Building Fund" VisibleIndex="7">
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn Name="Others" Caption="Others" VisibleIndex="8">
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn Name="Total" Caption="Total" VisibleIndex="9">
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn Name="Date" Caption="Date" VisibleIndex="10">
                                </dx:GridViewDataTextColumn>
                            </Columns>
                        </dx:ASPxGridView>
                        
                    </td>
                    <td>
                        <dx:ASPxGridView ID="GvStmntTemplate" runat="server" ClientVisible="False" AutoGenerateColumns="False">
                            <SettingsPopup>
                                <HeaderFilter MinHeight="140px"></HeaderFilter>
                            </SettingsPopup>
                            <Columns>
                                <dx:GridViewDataTextColumn Name="Transaction date" Caption="Transaction date" VisibleIndex="0">
                                </dx:GridViewDataTextColumn>
                                
                                <dx:GridViewDataTextColumn Name="Transaction Description" Caption="Transaction Description" VisibleIndex="1">
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn Name="Transaction Type" Caption="Transaction Type" VisibleIndex="2">
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn Name="Amount" Caption="Amount" VisibleIndex="3">
                                </dx:GridViewDataTextColumn>
                            </Columns>
                        </dx:ASPxGridView>
                    </td>
                </tr>
                <tr>
                    <td>
                        <dx:ASPxComboBox ID="CmbBoxFileType" runat="server" Width="250px" Theme="iOS" ForeColor="Black" NullText="Select from the list">
                            <Items>
                                <dx:ListEditItem Text="Bank Statement" Value="0" />
                                <dx:ListEditItem Text="In-house Spreadsheet" Value="1" />
                            </Items>
                        </dx:ASPxComboBox>
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>
                        <p>
                            <asp:FileUpload ID="UploadFile" ForeColor="Black" runat="server" />
                            &nbsp;
                        </p>
                        <p>
                            <asp:Button ID="BtnFileUpload" runat="server" CssClass="btn btn-primary" Text="Upload file" OnClick="BtnFileUpload_Click" />
                        </p>
                    </td>
                </tr>
            </table>

        </div>
    </div>





</asp:Content>
