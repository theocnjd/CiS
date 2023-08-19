<%@ Page Title="Dashboard" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CiSDashboard.aspx.cs" Inherits="CiS.CiSDashboard" %>

<%@ Register Assembly="DevExpress.XtraCharts.v18.2.Web, Version=18.2.18.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.XtraCharts.Web.Designer" TagPrefix="dxchartdesigner" %>

<%@ Register Assembly="DevExpress.Web.v18.2, Version=18.2.18.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.XtraCharts.v18.2.Web, Version=18.2.18.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.XtraCharts.Web" TagPrefix="dx" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>
<%@ Register Assembly="DevExpress.XtraCharts.v18.2, Version=18.2.18.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.XtraCharts" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <style>
        .KPI {
            margin-left: 50px;
            padding-top: 10px;
            padding-bottom: 10px;
            width: 250px;
            height: 120px;
            background-color: lightgray;
            align-items: center;
        }

        .auto-style1 {
            margin-right: 433px;
        }

        .auto-style2 {
            width: 433px;
        }
    </style>

    <table style="width=100%">
        <tr>
            <td>
                <dx:ASPxDateEdit ID="DE_Date" Height="40px" runat="server"></dx:ASPxDateEdit>
            </td>
            <td>&nbsp&nbsp</td>
            <td>
                <asp:Button ID="ViewRptDashboardBtn" runat="server" Text="View Report" CssClass="btn btn-primary" OnClick="ViewRptDashboardBtn_Click" />
            </td>
        </tr>
    </table>

    <hr />
    <div class="row">
        <div class="col-xl-3 col-md-6 mb-4">
            <div class="card border-left-primary shadow h-100 py-2">
                <div class="card-body">
                    <div class="row no-gutters align-items-center">
                        <div class="col mr-2">
                            <div class="text-ms font-weight-bold text-primary text-capitalize mb-1">
                                Active Members
                            </div>
                            <div class="h2 mb-0 font-weight-bold text-gray-800">

                                <asp:Label ID="lblMemberCnt" runat="server"></asp:Label>
                            </div>
                        </div>
                        <div class="col-auto">
                            <i class="fas fa-user fa-2x text-gray-300"></i>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-xl-3 col-md-6 mb-4">
            <div class="card border-left-info shadow h-100 py-2">
                <div class="card-body">
                    <div class="row no-gutters align-items-center">
                        <div class="col mr-2">
                            <div class="text-ms font-weight-bold text-info text-capitalize mb-1">
                                Anonymous Donor
                            </div>
                            <div class="h2 mb-0 font-weight-bold text-gray-800">

                                <asp:Label ID="lblAnonymousDonor" runat="server"></asp:Label>
                            </div>
                        </div>
                        <div class="col-auto">
                            <i class="fas fa-user fa-2x text-gray-300"></i>
                        </div>
                    </div>
                </div>
            </div>
        </div>
          <div class="col-xl-3 col-md-6 mb-4">
            <div class="card border-left-success shadow h-100 py-2">
                <div class="card-body">
                    <div class="row no-gutters align-items-center">
                        <div class="col mr-2">
                            <div class="text-ms font-weight-bold text-success text-capitalize mb-1">
                                Donation Till Date
                            </div>
                            <div class="h2 mb-0 font-weight-bold text-gray-800">

                                <asp:Label ID="lblDonMonthTotal" runat="server"></asp:Label>
                            </div>
                        </div>
                        <div class="col-auto">
                            <i class="fas fa-pound-sign fa-2x text-gray-300"></i>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>

    <table style="width: 100%">

        <tr>
            <td style="width:550px" >

                <div class="text-ms font-weight-bold text-primary text-capitalize mb-1">
                    Chart Showing Donors' Total Number $ Amount Donated for each Donation Method.
                </div>

                <dx:WebChartControl ID="WCC_paymthd" runat="server" CrosshairEnabled="True" DataSourceID="Dsrc_DonPymntType" Height="350px" Width="600px" BackColor="#D8D8D8">
                    <DiagramSerializable>
                        <dx:XYDiagram>
                            <AxisX VisibleInPanesSerializable="-1">
                            </AxisX>
                            <AxisY VisibleInPanesSerializable="-1">
                            </AxisY>
                        </dx:XYDiagram>
                    </DiagramSerializable>
                    <Legend Name="Default Legend" Direction="BottomToTop" Visibility="True">
                        <Border Visibility="False" />
                        <Title Visible="True"></Title></Legend>
                    <SeriesSerializable>
                        <dx:Series ArgumentDataMember="PaymentMethod" Name="Total Donated" ValueDataMembersSerializable="TotalDonated">
                        </dx:Series>
                        <dx:Series ArgumentDataMember="PaymentMethod" Name="Number of Donor" ValueDataMembersSerializable="CountOfDonors">
                        </dx:Series>
                    </SeriesSerializable>
                    <SeriesTemplate ArgumentDataMember="PaymentMethod" ValueDataMembersSerializable="TotalDonated">
                    </SeriesTemplate>
                </dx:WebChartControl>
            </td>
            <td>&nbsp&nbsp&nbsp</td>

            <td>
                <div class="text-ms font-weight-bold text-primary text-capitalize mb-1">
                    Chart Showing Amount donated for each donation types.
                </div>
                <dx:WebChartControl ID="WCC_DonByType" runat="server" CrosshairEnabled="True" Height="350px" Width="600px" DataSourceID="Dsrc_DonTypeByDate" BackColor="#D8D8D8" PaletteName="Flow">
                    <DiagramSerializable>
                        <dx:XYDiagram Rotated="True">
                            <AxisX VisibleInPanesSerializable="-1">
                            </AxisX>
                            <AxisY VisibleInPanesSerializable="-1">
                            </AxisY>
                            <PaneLayout Direction="Horizontal">
                            </PaneLayout>
                        </dx:XYDiagram>
                    </DiagramSerializable>
                    <Legend Name="Default Legend"></Legend>
                    <SeriesSerializable>
                        <dx:Series ArgumentDataMember="DonationType" Name="Donation Type" ValueDataMembersSerializable="TotalDonated">
                            <ViewSerializable>
                                <dx:SideBySideBarSeriesView ColorEach="True">
                                </dx:SideBySideBarSeriesView>
                            </ViewSerializable>
                        </dx:Series>
                    </SeriesSerializable>
                </dx:WebChartControl>
            </td>

        </tr>
        <tr>
            <td >&nbsp;</td>
        </tr>
        
    </table>
    <table>
        <tr>
            <td >
                <div class="text-ms font-weight-bold text-primary text-capitalize mb-1">
                    Line Chart showing Total Amount Donated for Each Month of the Year.
                </div>
                <dx:WebChartControl ID="WCC_DonCatByYear" runat="server" CrosshairEnabled="True" DataSourceID="Dsrc_DonCatByYear" Height="450px" Width="1000px" BackColor="#D8D8D8" CssClass="auto-style1">
                    <DiagramSerializable>
                        <dx:XYDiagram>
                            <AxisX VisibleInPanesSerializable="-1">
                            </AxisX>
                            <AxisY VisibleInPanesSerializable="-1">
                            </AxisY>
                        </dx:XYDiagram>
                    </DiagramSerializable>
                    <Legend Name="Default Legend"></Legend>
                    <SeriesSerializable>
                        <dx:Series Name="Month" ArgumentDataMember="MonthName" ValueDataMembersSerializable="TotalByMonth">
                            <ViewSerializable>
                                <dx:LineSeriesView>
                                </dx:LineSeriesView>
                            </ViewSerializable>
                        </dx:Series>
                    </SeriesSerializable>
                </dx:WebChartControl>
            </td>
        </tr>
    </table>





    <asp:SqlDataSource ID="Dsrc_DonCatByYear" runat="server" ConnectionString="<%$ ConnectionStrings:CiSDBCS %>" SelectCommand="rptGetDonationCategoryByYear" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:Parameter DefaultValue="1" Name="OrgIdentity" Type="Int32" />
            <asp:ControlParameter ControlID="DE_Date"  Name="transDate" PropertyName="Value" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="Dsrc_DonTypeByDate" runat="server" ConnectionString="<%$ ConnectionStrings:CiSDBCS %>" SelectCommand="rptGetTotalDonationByType" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:Parameter DefaultValue="1" Name="OrgIdentity" Type="Int32" />
            <asp:ControlParameter ControlID="DE_Date"  Name="transDate" PropertyName="Value" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="Dsrc_DonPymntType" runat="server" ConnectionString="<%$ ConnectionStrings:CiSDBCS %>" SelectCommand="rptGetDonationByPaymentType" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:Parameter Name="OrgIdentity" Type="Int32" DefaultValue="1" />
            <asp:ControlParameter ControlID="DE_Date" Type="String"  Name="transDate" PropertyName="Value" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>
