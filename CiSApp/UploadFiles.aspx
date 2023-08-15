<%@ Page Title="UploadFiles" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="UploadFiles.aspx.cs" Inherits="CiS.UploadFiles" %>

<%@ Register Assembly="DevExpress.Web.v18.2, Version=18.2.18.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h2 style="color: black"><%: Title %></h2>
    <hr />
    <div>
        <dx:ASPxLabel ID="lblErrorAlert" runat="server" Visible="false"></dx:ASPxLabel>
    </div>
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
                <li>Click on <b>'Manual Donation'</b> button to download template to upload in-house donation records.</li>
                <li>Click on <b>'Donor List'</b> button to download template to bulk upload donors. Also, answer <b>'Yes'</b> or <b>'No'</b> to confirm that a donor is a <b>tax payer</b> and has agreed 
                    that your organisation can claim <b>Gift Aid</b> on their donations.</li>
                <li>If your bank spreadsheet is not from <b>'Llyods'</b> or <b>'Barclays'</b> bank, click on 'Statement Template' to see field's names that your spreadsheet must have.'</li>
            </ul>
        </div>
    <hr />
        <div class="row" style="margin:6px">
            <asp:Button ID="GenInhouseTemplateBtn" runat="server" CssClass="btn btn-primary" Text="Manual Donation" OnClick="GenInhouseTemplateBtn_Click" />
            &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
            <asp:Button ID="GenStatementTemplate" runat="server" CssClass="btn btn-primary" Text="Bank Statement" OnClick="GenStatementTemplateBtn_Click" />
             &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
            <asp:Button ID="GenDonorListBtn" runat="server" CssClass="btn btn-primary" Text="Donor List" OnClick="GenDonorListBtn_Click" />
        </div>

    </div>
    <div class="row">
        <div class="col-md-4 center">
            <table>
                <tr>
                    <td>
                        <dx:ASPxGridViewExporter ID="ExpInHseTemplate" GridViewID="GvInHseTemplate" FileName="Historical_Donation_Template" runat="server"></dx:ASPxGridViewExporter>
                        <dx:ASPxGridViewExporter ID="ExpStmntTemplate" GridViewID="GvStmntTemplate" FileName="Bank_Statement_Template" runat="server"></dx:ASPxGridViewExporter>
                        <dx:ASPxGridViewExporter ID="ExpDnrList" GridViewID="GvDnrList" FileName="Donor_List_Template" runat="server"></dx:ASPxGridViewExporter>
                    </td>
                </tr>
                <tr>
                    <td>
                        <dx:ASPxGridView ID="GvInHseTemplate" ClientVisible="False" runat="server" AutoGenerateColumns="False">
                            <SettingsPopup>
                                <HeaderFilter MinHeight="140px"></HeaderFilter>
                            </SettingsPopup>
                            <Columns>
                                <dx:GridViewDataTextColumn Name="Donor_ID" Caption="Donor_ID" VisibleIndex="0">
                                </dx:GridViewDataTextColumn>
                                 <dx:GridViewDataTextColumn Name="Donation_Date" Caption="Donation_Date" VisibleIndex="1">
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn Name="First Name" Caption="first Name" VisibleIndex="2">
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn Name="Last Name" Caption="Last Name" VisibleIndex="3">
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn Name="Offering" Caption="Offering" VisibleIndex="4">
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn Name="Tithe" Caption="Tithe" VisibleIndex="5">
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn Name="Thanks Giving" Caption="Thanks Giving" VisibleIndex="6">
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn Name="Pledges" Caption="Pledges" VisibleIndex="7">
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn Name="Building Fund" Caption="Building Fund" VisibleIndex="8">
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn Name="Others" Caption="Others" VisibleIndex="9">
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn Name="Total" Caption="Total" VisibleIndex="10">
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


                      <td>
                        <dx:ASPxGridView ID="GvDnrList" ClientVisible="False" runat="server" AutoGenerateColumns="False">
                            <SettingsPopup>
                                <HeaderFilter MinHeight="140px"></HeaderFilter>
                            </SettingsPopup>
                            <Columns>
                                <dx:GridViewDataTextColumn Name="Donor ID" Caption="Donor ID" VisibleIndex="0">
                                </dx:GridViewDataTextColumn>
                               <dx:GridViewDataTextColumn Name="First Name" Caption="First Name" VisibleIndex="1">
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn Name="Last Name" Caption="Last Name" VisibleIndex="2">
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn Name="AddressLine1" Caption="AddressLine1" VisibleIndex="3">
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn Name="AddressLine2" Caption="AddressLine2" VisibleIndex="4">
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn Name="City" Caption="City" VisibleIndex="5">
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn Name="PostCode" Caption="PostCode" VisibleIndex="6">
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn Name="Telephone" Caption="Telephone" VisibleIndex="7">
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn Name="Email" Caption="Email" VisibleIndex="8">
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn Name="Gender" Caption="Gender" VisibleIndex="9">
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn Name="IsTaxPayer" Caption="IsTaxPayer"  VisibleIndex="10" >
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn Name="GiftAidConsentReceived" Caption="GiftAidConsentReceived" VisibleIndex="11">
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
                                <dx:ListEditItem Text="Bulk Upload Manual Donations" Value="1" />
                                <dx:ListEditItem Text="Bulk Upload Donors List" Value="2" />
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
