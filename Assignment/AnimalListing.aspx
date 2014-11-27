<%@ Page Title="Animals" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="AnimalListing.aspx.cs" Inherits="Assignment.AnimalListing" %>

<asp:Content ID="HeaderContent" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <table>
        <tr>
            <td>
                <b>Search by Type :</b>
            </td>
            <td>
                <asp:TextBox ID="txtSearch" runat="server" />
            </td>
            <td>
                <asp:Button ID="btnSearch" runat="server" Text="Search" OnClick="btnSearch_Click" />
            </td>
            <td>
                <asp:Button ID="btnClear" runat="server" OnClick="btnClear_Click" Text="Clear" />
            </td>
        </tr>
        <tr>
            <td colspan="3">
                <asp:Label ID="lblResult" runat="server" Text="" ForeColor="Red"></asp:Label>
            </td>
        </tr>
    </table>
    <br />
    <div>
        <asp:GridView ID="gvwAnimals" runat="server" AutoGenerateColumns="false" AllowSorting="true"
            DataKeyNames="id" RowStyle-BackColor="#F5F5F5" AlternatingRowStyle-BackColor="#C7D0D5"
            HeaderStyle-BackColor="#EC583A" HeaderStyle-Height="30px" OnSorting="gvwAnimals_Sorting">
            <Columns>
                <asp:BoundField ItemStyle-Width="150px" DataField="id" HeaderText="ID" Visible="false" />
                <asp:BoundField ItemStyle-Width="150px" DataField="name" HeaderText="Name" SortExpression="name"
                    ItemStyle-VerticalAlign="Middle" ItemStyle-HorizontalAlign="Left" HeaderStyle-VerticalAlign="Middle"
                    HeaderStyle-HorizontalAlign="Left" />
                <asp:BoundField ItemStyle-Width="150px" DataField="type" HeaderText="Type" SortExpression="type"
                    ItemStyle-VerticalAlign="Middle" ItemStyle-HorizontalAlign="Left" HeaderStyle-VerticalAlign="Middle"
                    HeaderStyle-HorizontalAlign="Left" />
                <asp:BoundField ItemStyle-Width="120px" DataField="birthday" HeaderText="Birthday"
                    SortExpression="birthday" DataFormatString="{0:d}" ItemStyle-VerticalAlign="Middle"
                    ItemStyle-HorizontalAlign="Left" HeaderStyle-VerticalAlign="Middle" HeaderStyle-HorizontalAlign="Left" />
                <asp:BoundField ItemStyle-Width="100px" DataField="weight" HeaderText="Weight" SortExpression="weight"
                    ItemStyle-VerticalAlign="Middle" ItemStyle-HorizontalAlign="Right" HeaderStyle-VerticalAlign="Middle"
                    HeaderStyle-HorizontalAlign="Right" />
                <asp:CheckBoxField ItemStyle-Width="100px" DataField="hasHorns" SortExpression="hasHorns"
                    HeaderText="Horns?" ItemStyle-VerticalAlign="Middle" ItemStyle-HorizontalAlign="Center"
                    HeaderStyle-VerticalAlign="Middle" HeaderStyle-HorizontalAlign="Center" />
                <asp:HyperLinkField DataNavigateUrlFields="id" DataNavigateUrlFormatString="~\AnimalDetails.aspx?id={0}"
                    Text="Details" HeaderText="Action" ItemStyle-VerticalAlign="Middle" ItemStyle-HorizontalAlign="Center"
                    ItemStyle-Font-Underline="true" HeaderStyle-VerticalAlign="Middle" HeaderStyle-HorizontalAlign="Center"
                    ItemStyle-Width="100px" HeaderStyle-ForeColor="#F5F5F5" />
            </Columns>
        </asp:GridView>
    </div>
</asp:Content>
