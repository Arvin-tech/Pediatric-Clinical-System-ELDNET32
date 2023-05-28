<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Prescription.aspx.cs" Inherits="Pediatric.Prescription1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Prescription</title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style3 {
            width: 141px;
        }
        .auto-style4 {
            width: 114px;
        }
        .auto-style5 {
            width: 178px;
        }
        .auto-style6 {
            width: 52px;
        }
        .auto-style7 {
            width: 291px;
            text-align: right;
        }
        .auto-style8 {
            width: 114px;
            text-align: right;
        }
        .auto-style9 {
            width: 52px;
            text-align: right;
        }
        .auto-style10 {
            text-align: right;
        }
        .auto-style11 {
            width: 178px;
            text-align: center;
        }
        .auto-style12 {
            width: 141px;
            text-align: right;
        }
        .auto-style13 {
            width: 291px;
        }
        .auto-style14 {
            text-align: center;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server" autocomplete="off">
        <table class="auto-style1" style="font-family: 'Tw Cen MT Condensed'">
            <tr>
                <td class="auto-style7">&nbsp;</td>
                <td class="auto-style12">&nbsp;</td>
                <td class="auto-style8">&nbsp;</td>
                <td class="auto-style11"><strong style="font-size: x-large">PRESCRIPTION</strong></td>
                <td class="auto-style9">&nbsp;</td>
                <td class="auto-style10">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style7">Prescription No</td>
                <td class="auto-style3">
                    <asp:TextBox ID="PrescriptionTextBox" runat="server" Width="92px" Placeholder="PRE00"></asp:TextBox>
                    <asp:Button ID="SearchPrescriptionButton" runat="server" Text="Search" CausesValidation="False" OnClick="SearchPrescriptionButton_Click" />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Required!" ForeColor ="Red" ControlToValidate="PrescriptionTextBox"></asp:RequiredFieldValidator>
                </td>
                <td class="auto-style8">Consultation No</td>
                <td class="auto-style5">
                    <asp:TextBox ID="ConsultationTextBox" runat="server" Width="90px" Placeholder="CON00"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Required!" ForeColor ="Red" ControlToValidate="ConsultationTextBox"></asp:RequiredFieldValidator>
                </td>
                <td class="auto-style9">Date</td>
                <td>
                    <asp:TextBox ID="DateTextBox" runat="server" TextMode="Date"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style7">Patient Code</td>
                <td class="auto-style3">
                    <asp:TextBox ID="PatientCodeTextBox" runat="server" Width="93px" Placeholder="PAT00"></asp:TextBox>
                    <asp:Button ID="SearchPatientButton" runat="server" Text="Search" CausesValidation="False" OnClick="SearchPatientButton_Click" />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Required!" ForeColor ="Red" ControlToValidate="PatientCodeTextBox"></asp:RequiredFieldValidator>
                </td>
                <td class="auto-style4">&nbsp;</td>
                <td class="auto-style5">&nbsp;</td>
                <td class="auto-style6">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style7">Patient Name</td>
                <td class="auto-style3">
                    <asp:Label ID="NameLabel" runat="server" BackColor="#FFCC99"></asp:Label>
                </td>
                <td class="auto-style4">&nbsp;</td>
                <td class="auto-style5">&nbsp;</td>
                <td class="auto-style6">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style7">Age</td>
                <td class="auto-style3">
                    <asp:Label ID="AgeLabel" runat="server" BackColor="#FFCC99"></asp:Label>
                </td>
                <td class="auto-style4">&nbsp;</td>
                <td class="auto-style5">&nbsp;</td>
                <td class="auto-style6">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style13">&nbsp;</td>
                <td class="auto-style3">&nbsp;</td>
                <td class="auto-style4">&nbsp;</td>
                <td class="auto-style5">&nbsp;</td>
                <td class="auto-style6">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style7">Medicine Code</td>
                <td class="auto-style3">
                    <asp:TextBox ID="MedicineTextBox" runat="server" Width="106px" Placeholder="VAX00"></asp:TextBox>
                    <asp:Button ID="SearchMedicineButton" runat="server" Text="Search" OnClick="SearchMedicineButton_Click" CausesValidation="False" />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Required!" ForeColor ="Red" ControlToValidate="MedicineTextBox"></asp:RequiredFieldValidator>
                </td>
                <td class="auto-style4">&nbsp;</td>
                <td class="auto-style5">&nbsp;</td>
                <td class="auto-style6">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style7">Quantity</td>
                <td class="auto-style3">
                    <asp:TextBox ID="QuantityTextBox" runat="server" Width="47px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Required!" ForeColor ="Red" ControlToValidate="QuantityTextBox"></asp:RequiredFieldValidator>
                </td>
                <td class="auto-style4">&nbsp;</td>
                <td class="auto-style5">&nbsp;</td>
                <td class="auto-style6">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style7">Remarks</td>
                <td class="auto-style3">
                    <asp:TextBox ID="RemarksTextBox" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style4">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Required!" ForeColor ="Red" ControlToValidate="RemarksTextBox"></asp:RequiredFieldValidator>
                </td>
                <td class="auto-style5">&nbsp;</td>
                <td class="auto-style6">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style13">&nbsp;</td>
                <td colspan="5" class="auto-style14">
                    <asp:GridView ID="GridView1" runat="server" ShowHeaderWhenEmpty="true" EmptyDataText="<span style='color: red;'>VACCINE NOT FOUND!</span>" Width="586px">
                    </asp:GridView>
                </td>
            </tr>
            <tr>
                <td class="auto-style7">Prepared by</td>
                <td class="auto-style3">
                    <asp:Label ID="PreparedByLabel" runat="server" BackColor="#FFCC99"></asp:Label>
                </td>
                <td class="auto-style4">&nbsp;</td>
                <td class="auto-style5">&nbsp;</td>
                <td class="auto-style6">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style13">&nbsp;</td>
                <td class="auto-style3">&nbsp;</td>
                <td class="auto-style4">&nbsp;</td>
                <td class="auto-style5">
                    <asp:Button ID="SaveButton" runat="server" Text="Save" OnClick="SaveButton_Click" />
                    <asp:Button ID="ClearButton" runat="server" Text="Clear" OnClick="ClearButton_Click" CausesValidation="False" />
                </td>
                <td class="auto-style6">&nbsp;</td>
                <td>
                    <asp:LinkButton ID="LogoutLinkButton" runat="server" OnClick="LogoutLinkButton_Click" CausesValidation="False">Logout</asp:LinkButton>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
