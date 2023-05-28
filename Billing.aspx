<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Billing.aspx.cs" Inherits="Pediatric.Billing" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Billing</title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style5 {
            width: 273px;
            text-align: center;
            height: 25px;
        }
        .auto-style6 {
            text-align: center;
            height: 25px;
            width: 161px;
        }
        .auto-style9 {
            width: 569px;
            text-align: right;
        }
        .auto-style10 {
            width: 213px;
            text-align: right;
        }
        .auto-style12 {
            width: 569px;
        }
        .auto-style14 {
            width: 569px;
            height: 25px;
        }
        .auto-style20 {
            width: 79px;
            height: 25px;
        }
        .auto-style21 {
            width: 79px;
        }
        .auto-style22 {
            width: 213px;
            height: 25px;
            text-align: right;
        }
        .auto-style23 {
            width: 213px;
        }
        .auto-style24 {
            width: 273px;
        }
        .auto-style25 {
            width: 569px;
            text-align: right;
            height: 23px;
        }
        .auto-style27 {
            width: 273px;
            height: 23px;
        }
        .auto-style28 {
            width: 213px;
            height: 23px;
        }
        .auto-style29 {
            width: 79px;
            height: 23px;
        }
        .auto-style30 {
            text-align: center;
        }
        .auto-style31 {
            width: 161px;
        }
        .auto-style32 {
            width: 161px;
            height: 23px;
        }
    </style>

    
</script>

</head>
<body>
    <form id="form1" runat="server" autocomplete="off">
        <div>
            <table class="auto-style1">
                <tr>
                    <td class="auto-style14" style="font-family: 'Tw Cen MT Condensed'"></td>
                    <td class="auto-style6" style="font-family: 'Tw Cen MT Condensed'"><strong style="font-size: x-large">BILLING FORM</strong></td>
                    <td class="auto-style5" style="font-family: 'Tw Cen MT Condensed'">&nbsp;</td>
                    <td class="auto-style22" style="font-family: 'Tw Cen MT Condensed'">
                        &nbsp;</td>
                    <td class="auto-style20" style="font-family: 'Tw Cen MT Condensed'">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style9" style="font-family: 'Tw Cen MT Condensed'"><strong>Billing No.</strong></td>
                    <td class="auto-style31" style="font-family: 'Tw Cen MT Condensed'">
                        <asp:TextBox ID="BillingNoTextBox" runat="server" Width="62px" Placeholder="BIL00"></asp:TextBox>
                        <asp:Button ID="SearchBillingButton" runat="server" Text="Search" CausesValidation="False" OnClick="SearchBillingButton_Click" />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Required!" ForeColor="Red" ControlToValidate="BillingNoTextBox"></asp:RequiredFieldValidator>
                    </td>
                    <td class="auto-style24" style="font-family: 'Tw Cen MT Condensed'"><strong>Date</strong><asp:TextBox ID="DateTextBox" runat="server" Width="89px"  TextMode="Date"></asp:TextBox>                     
                    </td>
                    <td class="auto-style10" style="font-family: 'Tw Cen MT Condensed'">
                        &nbsp;</td>
                    <td class="auto-style21" style="font-family: 'Tw Cen MT Condensed'">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style9" style="font-family: 'Tw Cen MT Condensed'"><strong>Patient Code</strong></td>
                    <td class="auto-style31" style="font-family: 'Tw Cen MT Condensed'">
                        <asp:TextBox ID="PatientCodeTextBox" runat="server" Width="60px" Placeholder="PAT00"></asp:TextBox>
                        <asp:Button ID="SearchPatientButton" runat="server" Text="Search" CausesValidation="False" OnClick="SearchPatientButton_Click" />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Required" ForeColor="Red" ControlToValidate="PatientCodeTextBox"></asp:RequiredFieldValidator>
                    </td>
                    <td class="auto-style24" style="font-family: 'Tw Cen MT Condensed'">&nbsp;</td>
                    <td class="auto-style23" style="font-family: 'Tw Cen MT Condensed'">&nbsp;</td>
                    <td class="auto-style21" style="font-family: 'Tw Cen MT Condensed'">&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style25" style="font-family: 'Tw Cen MT Condensed'"><strong>Firstname</strong></td>
                    <td class="auto-style32" style="font-family: 'Tw Cen MT Condensed'">
                        <asp:Label ID="FirstNameLabel" runat="server" BackColor="#FFCC99"></asp:Label>
                    </td>
                    <td class="auto-style27" style="font-family: 'Tw Cen MT Condensed'"></td>
                    <td class="auto-style28" style="font-family: 'Tw Cen MT Condensed'"></td>
                    <td class="auto-style29" style="font-family: 'Tw Cen MT Condensed'"></td>
                </tr>
                <tr>
                    <td class="auto-style25" style="font-family: 'Tw Cen MT Condensed'"><strong>Middlename</strong></td>
                    <td class="auto-style32" style="font-family: 'Tw Cen MT Condensed'">
                        <asp:Label ID="MiddleNameLabel" runat="server" BackColor="#FFCC99"></asp:Label>
                    </td>
                    <td class="auto-style27" style="font-family: 'Tw Cen MT Condensed'">&nbsp;</td>
                    <td class="auto-style28" style="font-family: 'Tw Cen MT Condensed'">&nbsp;</td>
                    <td class="auto-style29" style="font-family: 'Tw Cen MT Condensed'">&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style9" style="font-family: 'Tw Cen MT Condensed'"><strong>Lastname</strong></td>
                    <td class="auto-style31" style="font-family: 'Tw Cen MT Condensed'">
                        <asp:Label ID="LastNameLabel" runat="server" BackColor="#FFCC99"></asp:Label>
                    </td>
                    <td class="auto-style24" style="font-family: 'Tw Cen MT Condensed'">&nbsp;</td>
                    <td class="auto-style23" style="font-family: 'Tw Cen MT Condensed'">&nbsp;</td>
                    <td class="auto-style21" style="font-family: 'Tw Cen MT Condensed'">&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style9" style="font-family: 'Tw Cen MT Condensed'"><strong>Age</strong></td>
                    <td class="auto-style31" style="font-family: 'Tw Cen MT Condensed'">
                        <asp:Label ID="AgeLabel" runat="server" BackColor="#FFCC99"></asp:Label>
                    </td>
                    <td class="auto-style24" style="font-family: 'Tw Cen MT Condensed'">&nbsp;</td>
                    <td class="auto-style23" style="font-family: 'Tw Cen MT Condensed'">&nbsp;</td>
                    <td class="auto-style21" style="font-family: 'Tw Cen MT Condensed'">&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style9" style="font-family: 'Tw Cen MT Condensed'">
                        <strong>Service Type</strong></td>
                    <td class="auto-style31" style="font-family: 'Tw Cen MT Condensed'">
                        <asp:CheckBox ID="ConsultationCheckBox" runat="server" GroupName="ServiceType"  Text="Consultation" />
                        <asp:CheckBox ID="ImmunizationCheckBox" runat="server" GroupName="ServiceType" Text="Immunization" />
                    </td>
                    <td class="auto-style24" style="font-family: 'Tw Cen MT Condensed'">&nbsp;</td>
                    <td class="auto-style23" style="font-family: 'Tw Cen MT Condensed'">&nbsp;</td>
                    <td class="auto-style21" style="font-family: 'Tw Cen MT Condensed'">&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style9" style="font-family: 'Tw Cen MT Condensed'"><strong>Immunization No.</strong></td>
                    <td class="auto-style31" style="font-family: 'Tw Cen MT Condensed'">
                        <asp:TextBox ID="ImmunizationNoTextBox" runat="server" Width="75px" Placeholder="IMM00"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Required" ForeColor="Red" ControlToValidate="ImmunizationNoTextBox"></asp:RequiredFieldValidator>
                    </td>
                    <td class="auto-style24" style="font-family: 'Tw Cen MT Condensed'">&nbsp;</td>
                    <td class="auto-style23" style="font-family: 'Tw Cen MT Condensed'">&nbsp;</td>
                    <td class="auto-style21" style="font-family: 'Tw Cen MT Condensed'">&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style12" style="font-family: 'Tw Cen MT Condensed'">&nbsp;</td>
                    <td class="auto-style30" style="font-family: 'Tw Cen MT Condensed'" colspan="4">
                        <asp:GridView ID="GridView1" runat="server" ShowHeaderWhenEmpty="true" EmptyDataText="<span style='color: red;'>VACCINE NOT FOUND!</span>" Width="422px">
                        </asp:GridView>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style9" style="font-family: 'Tw Cen MT Condensed'"><strong>Prepared By</strong></td>
                    <td class="auto-style31" style="font-family: 'Tw Cen MT Condensed'">
                        <asp:Label ID="PreparedByLabel" runat="server" BackColor="#FFCC99"></asp:Label>
                    </td>
                    <td class="auto-style24" style="font-family: 'Tw Cen MT Condensed'">&nbsp;</td>
                    <td class="auto-style23" style="font-family: 'Tw Cen MT Condensed'">
                        &nbsp;</td>
                    <td class="auto-style21" style="font-family: 'Tw Cen MT Condensed'">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style9" style="font-family: 'Tw Cen MT Condensed'"><strong>Total Amount</strong></td>
                    <td class="auto-style31" style="font-family: 'Tw Cen MT Condensed'">
                        <asp:Label ID="TotalAmountLabel" runat="server" BackColor="#FFCC99"></asp:Label>
                    </td>
                    <td class="auto-style24" style="font-family: 'Tw Cen MT Condensed'">
                        &nbsp;</td>
                    <td class="auto-style23" style="font-family: 'Tw Cen MT Condensed'">
                        &nbsp;</td>
                    <td class="auto-style21" style="font-family: 'Tw Cen MT Condensed'">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style9" style="font-family: 'Tw Cen MT Condensed'">&nbsp;</td>
                    <td class="auto-style31" style="font-family: 'Tw Cen MT Condensed'">
                        <asp:Button ID="SaveButton" runat="server" Text="Save" OnClick="SaveButton_Click" />
                        <asp:Button ID="ClearButton" runat="server" Text="Clear" OnClick="ClearButton_Click" CausesValidation="False" />
                    </td>
                    <td class="auto-style24" style="font-family: 'Tw Cen MT Condensed'">
                        &nbsp;</td>
                    <td class="auto-style23" style="font-family: 'Tw Cen MT Condensed'">
                        <asp:LinkButton ID="LogoutLinkButton" runat="server" OnClick="LogoutLinkButton_Click" CausesValidation="False">Logout</asp:LinkButton>
                    </td>
                    <td class="auto-style21" style="font-family: 'Tw Cen MT Condensed'">
                        &nbsp;</td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
