<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="CiS.Dashboard" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>

<%@ Register Assembly="DevExpress.Web.v18.2, Version=18.2.18.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <table><tr><td>
        <dx:ASPxDateEdit ID="DE_Date" Height="40px" runat="server"></dx:ASPxDateEdit>
               </td>
        <td>&nbsp&nbsp</td>
        <td>
        <asp:Button ID="ViewRptdashboardBtn" runat="server" Text="View Report" CssClass="btn btn-primary" OnClick="ViewRptdashboardBtn_Click" />
        </td>
           </tr>
    </table>
    <hr />
    <rsweb:ReportViewer ID="RV_Dashboard" Width="100%" Height="100%" runat="server" BackColor="" ClientIDMode="AutoID" HighlightBackgroundColor="" InternalBorderColor="204, 204, 204" InternalBorderStyle="Solid" InternalBorderWidth="1px" LinkActiveColor="" LinkActiveHoverColor="" LinkDisabledColor="" PrimaryButtonBackgroundColor="" PrimaryButtonForegroundColor="" PrimaryButtonHoverBackgroundColor="" PrimaryButtonHoverForegroundColor="" SecondaryButtonBackgroundColor="" SecondaryButtonForegroundColor="" SecondaryButtonHoverBackgroundColor="" SecondaryButtonHoverForegroundColor="" SplitterBackColor="" ToolbarDividerColor="" ToolbarForegroundColor="" ToolbarForegroundDisabledColor="" ToolbarHoverBackgroundColor="" ToolbarHoverForegroundColor="" ToolBarItemBorderColor="" ToolBarItemBorderStyle="Solid" ToolBarItemBorderWidth="1px" ToolBarItemHoverBackColor="" ToolBarItemPressedBorderColor="51, 102, 153" ToolBarItemPressedBorderStyle="Solid" ToolBarItemPressedBorderWidth="1px" ToolBarItemPressedHoverBackColor="153, 187, 226" style="margin-bottom: 11px">
        <LocalReport ReportPath="Reports\RPTDashboard.rdlc">
        </LocalReport>
    </rsweb:ReportViewer>
      <asp:SqlDataSource ID="Dsrc_AnonymousDonor" runat="server" ConnectionString="<%$ ConnectionStrings:CiSDBCS %>" SelectCommand="rptGetAnonymousDonorByDate" SelectCommandType="StoredProcedure">
          <SelectParameters>
              <asp:Parameter Name="OrgIdentity" DbType="Int32"  />
              <asp:ControlParameter ControlID="DE_Date" DbType="Date" Name="transDate" PropertyName="Value" />
          </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="Dsrc_DnYear" runat="server" ConnectionString="<%$ ConnectionStrings:CiSDBCS %>" SelectCommand="rptGetDonationYear" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
    <asp:SqlDataSource ID="Dsrc_ActMember" runat="server" ConnectionString="<%$ ConnectionStrings:CiSDBCS %>" SelectCommand="rptGetActiveMembers" SelectCommandType="StoredProcedure">
        <SelectParameters>
              <asp:Parameter Name="OrgIdentity" DbType="Int32" />
          </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="Dsrc_DonByPymntType" runat="server" ConnectionString="<%$ ConnectionStrings:CiSDBCS %>" SelectCommand="rptGetDonationByPaymentType" SelectCommandType="StoredProcedure">
        <SelectParameters>
              <asp:Parameter Name="OrgIdentity" DbType="Int32" />
              <asp:ControlParameter ControlID="DE_Date" DbType="Date" Name="transDate" PropertyName="Value" />
          </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="Dsrc_PymntCatVrsYear" runat="server" ConnectionString="<%$ ConnectionStrings:CiSDBCS %>" SelectCommand="rptGetDonationCategoryByYear" SelectCommandType="StoredProcedure">
        <SelectParameters>
              <asp:Parameter Name="OrgIdentity" DbType="Int32"/>
                <asp:ControlParameter ControlID="DE_Date" Name="transDate" PropertyName="Value" Type="DateTime" />
          </SelectParameters>
    </asp:SqlDataSource>

    <asp:ObjectDataSource ID="Objt_PymntCatVrsYear" SelectMethod="GetData"  runat="server" OldValuesParameterFormatString="original_{0}" TypeName="CiS.App_Codes.Dst_DonByPaymentTableAdapters.rptGetDonationByPaymentTypeTableAdapter">
        <SelectParameters>
            <asp:Parameter Name="OrgIdentity" Type="Int32" />
            <asp:ControlParameter ControlID="DE_Date" Name="transDate" PropertyName="Value" Type="DateTime" />
        </SelectParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="Objt_AnonymousDonor" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="CiS.App_Codes.Dst_AnonymousTableAdapters.rptGetAnonymousDonorByDateTableAdapter">
        <SelectParameters>
            <asp:Parameter Name="OrgIdentity" Type="Int32" />
            <asp:ControlParameter ControlID="DE_Date" Name="transDate" PropertyName="Value" Type="DateTime" />
        </SelectParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="Objt_DonByPymntType" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="CiS.App_Codes.Dst_DonByPaymentTableAdapters.rptGetDonationByPaymentTypeTableAdapter">
        <SelectParameters>
            <asp:Parameter Name="OrgIdentity" Type="Int32" />
            <asp:ControlParameter ControlID="DE_Date" Name="transDate" PropertyName="Value" Type="DateTime" />
        </SelectParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="Objt_ActMember" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="CiS.App_Codes.Dst_MemberTableAdapters.rptGetActiveMembersTableAdapter">
        <SelectParameters>
            <asp:Parameter Name="OrgIdentity" Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>

      <br />
</asp:Content>
