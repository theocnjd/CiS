<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Org.aspx.cs" Inherits="CiS.Org" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    
    <asp:FormView ID="FLOrg" runat="server" DataSourceID="DS_Org" CellPadding="4" ForeColor="#333333" Width="500px" >
        <EditRowStyle BackColor="#999999" />
        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <ItemTemplate>
            <div class="row" >
                <h2>Your Profile.</h2>
                <hr />
                <br />
                <br />
                <div class="col-md-12">
                    <section id="ReadForm">
                        <div class="form-horizontal">
                            Orgid:
            <asp:Label ID="OrgidLabel" runat="server" Text='<%# Bind("Orgid") %>' />
                            <br />
                            Organisation Name:
            <asp:Label ID="OrgNameLabel" runat="server" Height="10px" Text='<%# Bind("OrgName") %>' />
                            <br />
                            Unique No:
            <asp:Label ID="OrgUniqueNoLabel" runat="server" Text='<%# Bind("OrgUniqueNo") %>' />
                            <br />
                            OrgAbbName:
            <asp:Label ID="OrgAbbNameLabel" runat="server" Text='<%# Bind("OrgAbbName") %>' />
                            <br />
                            Email:
            <asp:Label ID="EmailLabel" runat="server" Text='<%# Bind("Email") %>' />
                            <br />
                            Telephone:
            <asp:Label ID="TelephoneLabel" runat="server" Text='<%# Bind("Telephone") %>' />
                            <br />
                            Mobile:
            <asp:Label ID="MobileLabel" runat="server" Text='<%# Bind("Mobile") %>' />
                            <br />
                            userid:
            <asp:Label ID="useridLabel" runat="server"  Text='<%# Eval("userid") %>' />
                            <br />
                            First name:
            <asp:Label ID="FnameLabel" runat="server" Text='<%# Bind("Fname") %>' />
                            <br />
                            Last name:
            <asp:Label ID="LnameLabel" runat="server" Text='<%# Bind("Lname") %>' />
                            <br />
                            UserTypeid:
            <asp:Label ID="UserTypeidLabel" runat="server"  Text='<%# Bind("UserTypeid") %>' />
                            <br />
                            Addressid:
            <asp:Label ID="AddressidLabel" runat="server"  Text='<%# Eval("Addressid") %>' />
                            <br />
                            Address Line 1:
            <asp:Label ID="AddressLine1Label" runat="server" Text='<%# Bind("AddressLine1") %>' />
                            <br />
                            Address Line 2:
            <asp:Label ID="AddressLine2Label" runat="server" Text='<%# Bind("AddressLine2") %>' />
                            <br />
                            City:
            <asp:Label ID="CityLabel" runat="server" Text='<%# Bind("City") %>' />
                            <br />
                            PostCode:
            <asp:Label ID="PostCodeLabel" runat="server" Text='<%# Bind("PostCode") %>' />
                            <%--<br />
                            <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" />--%>
                            <br />
                           
                        </div>
                    </section>
                </div>
            </div>
            <div style="margin-top: 15px">
            <asp:Button ID="BtnShowEdit" runat="server" Text="Edit" CssClass="btn btn-primary" OnClick="BtnShowEdit_Click" />
           </div>
        </ItemTemplate>
         
        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
         
    </asp:FormView>
   

     <br />
    <div id="dvEdit" runat="server" class="row" visible="false" style="align-content: flex-start;">
        <div class="col-md-12">
            <section id="EditForm">
                <div class="form-horizontal">

                    <p class="text-danger">
                        <asp:Literal runat="server" ID="ErrorMessage" />
                    </p>
                    <hr />
                    <asp:ValidationSummary runat="server" CssClass="text-danger" />

                    <div class="form-group">
                        <asp:Label runat="server" CssClass="col-md-2 control-label">Organisation Name</asp:Label>
                        <div class="col-md-10">
                            <asp:TextBox ID="txbxOrgName" runat="server" AutoPostBack="false" CssClass="form-control" Width="400px" />
                        </div>
                    </div>
                    <div class="form-group">
                        <asp:Label runat="server" CssClass="col-md-2 control-label">Organisation Short Name</asp:Label>
                        <div class="col-md-10">
                            <asp:TextBox ID="txbxOrgAbbName" runat="server" AutoPostBack="false" CssClass="form-control" Width="400px" />
                        </div>
                    </div>

                     <div class="form-group">
                        <asp:Label runat="server" CssClass="col-md-2 control-label">Unique No</asp:Label>
                        <div class="col-md-10">
                            <asp:TextBox ID="txbxUniqueNo" runat="server" AutoPostBack="false" CssClass="form-control" Width="400px" />
                        </div>
                    </div>
                     <div class="form-group">
                        <asp:Label runat="server" CssClass="col-md-2 control-label">Email</asp:Label>
                        <div class="col-md-10">
                            <asp:TextBox ID="txbxEmail" runat="server" AutoPostBack="false" Enabled="false" CssClass="form-control" Width="400px" />
                        </div>
                    </div>

                      <div class="form-group">
                        <asp:Label runat="server" AutoPostBack="false" AssociatedControlID="txbxTel" CssClass="col-md-2 control-label">Telephone</asp:Label>
                        <div class="col-md-10">
                            <asp:TextBox ID="txbxTel" runat="server" TextMode="Phone" CssClass="form-control" Width="400px" ToolTip="Phone number must start with '0'" />
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="txbxTel"
                                CssClass="text-danger" ErrorMessage="Phone number is not valid."  />
                        </div>
                    </div>
                     <div class="form-group">
                        <asp:Label runat="server" AutoPostBack="false" AssociatedControlID="txbxMobile" CssClass="col-md-2 control-label">Mobile</asp:Label>
                        <div class="col-md-10">
                            <asp:TextBox ID="txbxMobile" runat="server" TextMode="Phone" CssClass="form-control" Width="400px" ToolTip="Phone number must start with '0'" />
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="txbxMobile"
                                CssClass="text-danger" ErrorMessage="Phone number is not valid."  />
                        </div>
                    </div>
                    
                    <div class="form-group">
                        <asp:Label runat="server" CssClass="col-md-2 control-label">First Name</asp:Label>
                        <div class="col-md-10">
                            <asp:TextBox ID="txbxFName" runat="server" AutoPostBack="false" CssClass="form-control" Width="400px" />
                        </div>
                    </div>

                    <div class="form-group">
                        <asp:Label runat="server" CssClass="col-md-2 control-label">Last Name</asp:Label>
                        <div class="col-md-10">
                            <asp:TextBox ID="txbxLName" runat="server" AutoPostBack="false" CssClass="form-control" Width="400px" />
                        </div>
                    </div>

                    <div class="form-group">
                        <asp:Label runat="server" CssClass="col-md-2 control-label">Gender</asp:Label>
                        <div class="col-md-10">
                            <asp:DropDownList
                                ID="cmbxUserType"
                                runat="server"
                                CssClass="form-control"
                                DataSourceID="DS_userType"
                                DataTextField="UserTypeDesc"
                                DataValueField="UserTypeid"
                                Width="400px" />
                        </div>
                    </div>
                  
                    <div class="form-group">
                        <asp:Label runat="server" CssClass="col-md-2 control-label">Address Line 1</asp:Label>
                        <div class="col-md-10">
                            <asp:TextBox ID="txbxAdLn1" runat="server" TextMode="Email" CssClass="form-control" Width="400px" ReadOnly="True" />
                        </div>
                    </div>
                      <div class="form-group">
                        <asp:Label runat="server"  CssClass="col-md-2 control-label">Address Line 2</asp:Label>
                        <div class="col-md-10">
                            <asp:TextBox ID="txbxAdLn2" runat="server" TextMode="Email" CssClass="form-control" Width="400px" ReadOnly="True" />
                        </div>
                    </div>

                     <div class="form-group">
                        <asp:Label runat="server" CssClass="col-md-2 control-label">City</asp:Label>
                        <div class="col-md-10">
                            <asp:TextBox ID="txbxCity" runat="server" TextMode="Email" CssClass="form-control" Width="400px" ReadOnly="True" />
                        </div>
                    </div>
                      <div class="form-group">
                        <asp:Label runat="server"  CssClass="col-md-2 control-label">PostCode</asp:Label>
                        <div class="col-md-10">
                            <asp:TextBox ID="txbxPostCode" runat="server" TextMode="Email" CssClass="form-control" Width="400px" ReadOnly="True" />
                        </div>
                    </div>
                    
                     <div style="margin-left: 25px">
                        <asp:Button ID="BtnEdit" runat="server" CssClass="row btn btn-primary"  Text="Save" OnClick="BtnEdit_Click" />
                        &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;
                         <asp:Button ID="BtnCancel" runat="server" CssClass="row btn btn-secondary"  Text="Cancel" OnClick="BtnCancel_Click" />
                    </div>



                </div>
            </section>
        </div>
    </div>


    <asp:SqlDataSource ID="DS_Org" runat="server" ConnectionString="<%$ ConnectionStrings:CiSDBCS %>"
        SelectCommand="uspGetOrganisation" SelectCommandType="StoredProcedure"
        UpdateCommand="uspUpdateOrganisation" UpdateCommandType="StoredProcedure">
        <SelectParameters>
            <asp:QueryStringParameter DbType="Guid" Name="Orgid" QueryStringField="Orgid" />
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
            <asp:Parameter Name="Addressid" Type="Int32" />
            <asp:Parameter Name="AddressLine1" Type="String" />
            <asp:Parameter Name="AddressLine2" Type="String" />
            <asp:Parameter Name="City" Type="String" />
            <asp:Parameter Name="PostCode" Type="String" />
            <asp:Parameter Name="OrgAbbName" Type="String" />
            <asp:Parameter Name="Orgid" DbType="Guid" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="DS_userType" runat="server" ConnectionString="<%$ ConnectionStrings:CiSDBCS %>" SelectCommand="uspGetUserType" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
</asp:Content>

