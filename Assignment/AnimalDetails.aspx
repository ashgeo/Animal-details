<%@ Page Title="Details" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="AnimalDetails.aspx.cs" Inherits="Assignment.AnimalDetails" %>

<asp:Content ID="HeaderContent" ContentPlaceHolderID="HeadContent" runat="server">
    <script src="Scripts/jquery.min.js" type="text/javascript"></script>
    <script src="Scripts/juery-ui.min.js" type="text/javascript"></script>
    <link href="Styles/jquery-ui.css" rel="Stylesheet" type="text/css" />
    <script type="text/javascript">
        $(function () {
            $("[id$=txtBirthday]").datepicker({
                showOn: 'button',
                buttonImageOnly: true,
                buttonImage: 'Images/calendar.gif',
                dateFormat: 'mm/dd/yy'
            });
        });
    </script>
</asp:Content>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div>
        <fieldset>
            <legend>Details</legend>
            <table>
                <tr>
                    <td>
                        Name
                    </td>
                    <td>
                        <asp:TextBox ID="txtName" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        Type
                    </td>
                    <td>
                        <asp:TextBox ID="txtType" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        Birthday
                    </td>
                    <td>
                        <asp:TextBox ID="txtBirthday" runat="server" ReadOnly="true" Width="120px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        Weight
                    </td>
                    <td>
                        <asp:TextBox ID="txtWeight" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        Horns?
                    </td>
                    <td>
                        <asp:CheckBox ID="chkHasHorns" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        &nbsp;
                    </td>
                </tr>
                <tr>
                    <td>
                        &nbsp;
                    </td>
                    <td>
                        <asp:Button ID="btnClose" runat="server" Text="Close" OnClick="btnClose_Click" />
                    </td>
                </tr>
            </table>
        </fieldset>
    </div>
</asp:Content>
