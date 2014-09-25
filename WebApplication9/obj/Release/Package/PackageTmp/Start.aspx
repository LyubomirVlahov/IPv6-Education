<%@ Page Title="" Language="C#" MasterPageFile="~/Default.Master" AutoEventWireup="true" CodeBehind="Start.aspx.cs" Inherits="WebApplication9.Start" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<link href="Styles/style.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <table width="560" align="center">                                       
                    <tr>
                        <td>
                        <asp:label id="info" runat="server" />
                        </td>
                    </tr>                                             
                    <tr>
                        <td align="right">
                            <asp:Button ID="startButton" runat="server" OnClick="startButton_Click" /></td>
                    </tr>
                </table>
</asp:Content>
