<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="Pediatric.Home" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Home</title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style4 {
            height: 23px;
        }
        .auto-style5 {
            width: 306px;
        }
        .auto-style6 {
            height: 23px;
            width: 306px;
        }
        .auto-style7 {
            width: 100px;
        }
        .auto-style8 {
            width: 100px;
            height: 23px;
        }
        .auto-style9 {
            width: 306px;
            text-align: right;
        }
        .auto-style11 {
            width: 306px;
            height: 32px;
        }
        .auto-style12 {
            width: 100px;
            height: 32px;
        }
        .auto-style13 {
            height: 32px;
        }
        .auto-style14 {
            width: 345px;
        }
        .auto-style15 {
            height: 23px;
            width: 345px;
        }
        .auto-style16 {
            width: 345px;
            height: 32px;
            text-decoration: underline;
        }
        .auto-style17 {
            width: 345px;
            text-decoration: underline;
        }
        .auto-style18 {
            height: 23px;
            width: 345px;
            text-align: center;
        }
        .auto-style19 {
            width: 345px;
            text-align: center;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table class="auto-style1">
                <tr>
                    <td class="auto-style17" style="font-family: &quot;Tw Cen MT Condensed&quot;"><strong style="font-size: x-large">Menu</strong></td>
                    <td class="auto-style9" style="font-family: 'Tw Cen MT Condensed'"><strong>Logged in as:</strong></td>
                    <td class="auto-style7" style="font-family: 'Tw Cen MT Condensed'">
                        <asp:Label ID="PreparedByLabel" runat="server" Text=""></asp:Label>
                    </td>
                    <td style="font-family: 'Tw Cen MT Condensed'">
                        <asp:LinkButton ID="LogoutLinkButton" runat="server" OnClick="LogoutLinkButton_Click">Logout</asp:LinkButton>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style14" style="font-family: &quot;Tw Cen MT Condensed&quot;">
                        <asp:LinkButton ID="BillingLinkButton" runat="server" OnClick="BillingLinkButton_Click">Billing</asp:LinkButton>
                    </td>
                    <td class="auto-style5">&nbsp;</td>
                    <td class="auto-style7">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style14" style="font-family: &quot;Tw Cen MT Condensed&quot;">
                        <asp:LinkButton ID="PrescriptionLinkButton" runat="server" OnClick="PrescriptionLinkButton_Click">Prescription</asp:LinkButton>
                    </td>
                    <td class="auto-style5">&nbsp;</td>
                    <td class="auto-style7">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style15" style="font-family: &quot;Tw Cen MT Condensed&quot;">
                        <asp:LinkButton ID="ImmunizationLinkButton" runat="server" OnClick="LinkButton3_Click">Immunization</asp:LinkButton>
                    </td>
                    <td class="auto-style6"></td>
                    <td class="auto-style8">&nbsp;</td>
                    <td class="auto-style4"></td>
                </tr>
                <tr>
                    <td class="auto-style15" style="font-family: &quot;Tw Cen MT Condensed&quot;">
                        <asp:LinkButton ID="PatientLinkButton" runat="server" OnClick="PatientLinkButton_Click">Patient Registration</asp:LinkButton>
                    </td>
                    <td class="auto-style6"></td>
                    <td class="auto-style8">&nbsp;</td>
                    <td class="auto-style4"></td>
                </tr>
                <tr>
                    <td class="auto-style16" style="font-family: &quot;Tw Cen MT Condensed&quot;">
                        <strong style="font-size: x-large">Disclaimer</strong></td>
                    <td class="auto-style11"></td>
                    <td class="auto-style12"></td>
                    <td class="auto-style13"></td>
                </tr>
                <tr>
                    <td class="auto-style14" style="font-family: 'Tw Cen MT Condensed'">
                        System not perfect.Please don&#39;t include whitespaces in your input. Thankyou!</td>
                    <td class="auto-style5">&nbsp;</td>
                    <td class="auto-style7">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style15" style="font-family: 'Tw Cen MT Condensed'">
                        Accounts:</td>
                    <td class="auto-style6"></td>
                    <td class="auto-style8"></td>
                    <td class="auto-style4"></td>
                </tr>
                <tr>
                    <td class="auto-style19" style="font-family: 'Tw Cen MT Condensed'">
                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="EMPLOYEECODE" DataSourceID="SqlDataSource1">
                            <Columns>
                                <asp:CommandField ShowDeleteButton="True" />
                                <asp:BoundField DataField="EMPLOYEECODE" HeaderText="EMPLOYEECODE" ReadOnly="True" SortExpression="EMPLOYEECODE" />
                                <asp:BoundField DataField="EMPUSERNAME" HeaderText="EMPUSERNAME" SortExpression="EMPUSERNAME" />
                                <asp:BoundField DataField="EMPFNAME" HeaderText="EMPFNAME" SortExpression="EMPFNAME" />
                                <asp:BoundField DataField="EMPLNAME" HeaderText="EMPLNAME" SortExpression="EMPLNAME" />
                                <asp:BoundField DataField="EMPMNAME" HeaderText="EMPMNAME" SortExpression="EMPMNAME" />
                                <asp:BoundField DataField="EMPPASSWORD" HeaderText="EMPPASSWORD" SortExpression="EMPPASSWORD" />
                                <asp:BoundField DataField="EMPPOSITION" HeaderText="EMPPOSITION" SortExpression="EMPPOSITION" />
                                <asp:BoundField DataField="EMPSTATUS" HeaderText="EMPSTATUS" SortExpression="EMPSTATUS" />
                            </Columns>
                        </asp:GridView>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ELDNETConnectionString %>" DeleteCommand="DELETE FROM [EMPLOYEEFILE] WHERE [EMPLOYEECODE] = @EMPLOYEECODE" InsertCommand="INSERT INTO [EMPLOYEEFILE] ([EMPLOYEECODE], [EMPUSERNAME], [EMPFNAME], [EMPLNAME], [EMPMNAME], [EMPPASSWORD], [EMPPOSITION], [EMPSTATUS]) VALUES (@EMPLOYEECODE, @EMPUSERNAME, @EMPFNAME, @EMPLNAME, @EMPMNAME, @EMPPASSWORD, @EMPPOSITION, @EMPSTATUS)" SelectCommand="SELECT * FROM [EMPLOYEEFILE]" UpdateCommand="UPDATE [EMPLOYEEFILE] SET [EMPUSERNAME] = @EMPUSERNAME, [EMPFNAME] = @EMPFNAME, [EMPLNAME] = @EMPLNAME, [EMPMNAME] = @EMPMNAME, [EMPPASSWORD] = @EMPPASSWORD, [EMPPOSITION] = @EMPPOSITION, [EMPSTATUS] = @EMPSTATUS WHERE [EMPLOYEECODE] = @EMPLOYEECODE">
                            <DeleteParameters>
                                <asp:Parameter Name="EMPLOYEECODE" Type="String" />
                            </DeleteParameters>
                            <InsertParameters>
                                <asp:Parameter Name="EMPLOYEECODE" Type="String" />
                                <asp:Parameter Name="EMPUSERNAME" Type="String" />
                                <asp:Parameter Name="EMPFNAME" Type="String" />
                                <asp:Parameter Name="EMPLNAME" Type="String" />
                                <asp:Parameter Name="EMPMNAME" Type="String" />
                                <asp:Parameter Name="EMPPASSWORD" Type="String" />
                                <asp:Parameter Name="EMPPOSITION" Type="String" />
                                <asp:Parameter Name="EMPSTATUS" Type="String" />
                            </InsertParameters>
                            <UpdateParameters>
                                <asp:Parameter Name="EMPUSERNAME" Type="String" />
                                <asp:Parameter Name="EMPFNAME" Type="String" />
                                <asp:Parameter Name="EMPLNAME" Type="String" />
                                <asp:Parameter Name="EMPMNAME" Type="String" />
                                <asp:Parameter Name="EMPPASSWORD" Type="String" />
                                <asp:Parameter Name="EMPPOSITION" Type="String" />
                                <asp:Parameter Name="EMPSTATUS" Type="String" />
                                <asp:Parameter Name="EMPLOYEECODE" Type="String" />
                            </UpdateParameters>
                        </asp:SqlDataSource>
                    </td>
                    <td class="auto-style5">&nbsp;</td>
                    <td class="auto-style7">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style18" style="font-family: 'Tw Cen MT Condensed'">
                        &nbsp;</td>
                    <td class="auto-style6"></td>
                    <td class="auto-style8"></td>
                    <td class="auto-style4"></td>
                </tr>
                <tr>
                    <td class="auto-style18" style="font-family: 'Tw Cen MT Condensed'">
                        &nbsp;</td>
                    <td class="auto-style6">&nbsp;</td>
                    <td class="auto-style8">&nbsp;</td>
                    <td class="auto-style4">&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style18" style="font-family: 'Tw Cen MT Condensed'">
                        &nbsp;</td>
                    <td class="auto-style6">&nbsp;</td>
                    <td class="auto-style8">&nbsp;</td>
                    <td class="auto-style4">&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style15" style="font-family: 'Tw Cen MT Condensed'">
                        &nbsp;</td>
                    <td class="auto-style6">&nbsp;</td>
                    <td class="auto-style8">&nbsp;</td>
                    <td class="auto-style4">&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style15" style="font-family: 'Tw Cen MT Condensed'">
                        &nbsp;</td>
                    <td class="auto-style6">&nbsp;</td>
                    <td class="auto-style8">&nbsp;</td>
                    <td class="auto-style4">&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style15" style="font-family: 'Tw Cen MT Condensed'">
                        &nbsp;</td>
                    <td class="auto-style6">&nbsp;</td>
                    <td class="auto-style8">&nbsp;</td>
                    <td class="auto-style4">&nbsp;</td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
