﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Default.Master" AutoEventWireup="true" CodeBehind="E-learning.aspx.cs" Inherits="WebApplication9.E_learning" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table width="560" align="center">                  
                    <tr>
                       <td class="h1">Налични видеа:</td> 
                    </tr>        
                    <tr>
                        <td width="100%">
                        <asp:Image ID="imgLine3" SkinID="line" runat="server" />
                        </td>
                    </tr>
                    <tr>
                                                
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString2 %>"
                            SelectCommand="SELECT * FROM [Video]" 
                            DeleteCommand="DELETE FROM [Video] WHERE [VideoID] = @VideoID">
                            <DeleteParameters>
                                <asp:Parameter Name="VideoID" Type="Int32" />
                            </DeleteParameters>
                        </asp:SqlDataSource>
                    </tr>  
                    
                    <tr>
                    <td>
                    <asp:LoginView ID="LoginView1" runat="server" EnableViewState="false">
                                <RoleGroups>
                                    <asp:RoleGroup Roles="admin">
                                        <ContentTemplate>
                                        <asp:GridView ID="GridView1" AllowSorting="True" AllowPaging="True" runat="server"
                                            DataSourceID="SqlDataSource1" DataKeyNames="VideoID"
                                            AutoGenerateColumns="False" Width="700px" AutoGenerateDeleteButton="False" >
                                            <Columns>
                                                <asp:HyperLinkField DataTextField="Title" HeaderText="Заглавие" DataNavigateUrlFields="VideoID" DataNavigateUrlFormatString="Play.aspx?videoid={0}" SortExpression="Title" />
                                                <asp:BoundField DataField="Url" HeaderText="Линк" SortExpression="Url" />
                                                <asp:CommandField ShowDeleteButton="True" DeleteText="Изтриване"/>
                                            </Columns>
                                          </asp:GridView> 
                                             <asp:LinkButton ID="LinkButton1" OnClick="LinkButton_Click" Text="Добави ново видео" runat="server"> </asp:LinkButton>
                                        </ContentTemplate>
                                    </asp:RoleGroup>
                                    <asp:RoleGroup Roles="member">
                                    <ContentTemplate>
                                     <asp:GridView ID="GridView2" AllowSorting="True" AllowPaging="True" runat="server"
                                            DataSourceID="SqlDataSource1" DataKeyNames="VideoID"
                                            AutoGenerateColumns="False" Width="700px">
                                            <Columns>
                                                <asp:HyperLinkField DataTextField="Title" HeaderText="Заглавие" DataNavigateUrlFields="VideoID" DataNavigateUrlFormatString="Play.aspx?videoid={0}" SortExpression="Title" />
                                            </Columns>
                                          </asp:GridView> 
                                          </ContentTemplate>
                                    </asp:RoleGroup>

                                </RoleGroups>
                            </asp:LoginView>
                    </td>
                    </tr>                                                                                          
                </table> 
</asp:Content>
