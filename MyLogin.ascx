<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="MyLogin.ascx.cs" Inherits="apsnetexam.MyLogin" %>
<table class="auto-style1">
    <tr>
        <td class="auto-style2">User Name</td>
        <td>
            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td class="auto-style2">Password</td>
        <td>
            <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td class="auto-style2">&nbsp;</td>
        <td>
            <asp:Button ID="Button1" runat="server" Text="Login" OnClick="Button1_Click" />
        </td>
    </tr>
</table>
