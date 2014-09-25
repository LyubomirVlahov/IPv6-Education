<%@ Page Title="" Language="C#" MasterPageFile="~/Default.Master" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="WebApplication9.Profile" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<asp:LoginView ID="LoginView1" runat="server">
            <AnonymousTemplate>
            </AnonymousTemplate>
            <LoggedInTemplate>
                <table width="900" align="center">
                   
                    <tr>
                       <td class="h1">Налични тестове:</td> 
                    </tr>        
                    <tr>
                        <td width="100%">
                        <asp:Image ID="imgLine3" SkinID="line" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td width="100%">
                            <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSource2">
                                <ItemTemplate>
                                    <asp:HyperLink
                                            ID="HyperLink1" runat="server" NavigateUrl='<%# "Start.aspx?testid=" + Eval("QuizID") %>'
                                            Text='<%# Eval("Title") %>'></asp:HyperLink><br />
                                    &nbsp;<asp:Label
                                        ID="DescriptionLabel" runat="server" CssClass="generaltext" Text='<%# Eval("Description") %>'></asp:Label>&nbsp;<br />
                                    <br />
                                </ItemTemplate>
                            </asp:DataList>
                            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString2 %>"
                                SelectCommand="SELECT [Title], [Description], [QuizID] FROM [Quiz]"></asp:SqlDataSource>
                        </td>
                    </tr>                                         
                    <tr>
                        <td width="100%">&nbsp;</td>
                    </tr>                      
                    <tr>
                        <td width="100%" class="h1">Резултати:</td>
                    </tr>
                    <tr>
                        <td width="100%">
                            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4"
                                DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" Width="555px">
                                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" CssClass="generaltext" />
                                <Columns>
                                    <asp:BoundField DataField="Title" HeaderText="Тест" SortExpression="Title" >
                                        <HeaderStyle HorizontalAlign="Left" />
                                        <ItemStyle HorizontalAlign="Left" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="DateTimeComplete" DataFormatString="{0:d}" HeaderText="Дата на завършване"
                                        SortExpression="DateTimeComplete" >
                                        <FooterStyle Width="150px" />
                                        <HeaderStyle Width="180px" />
                                        <ItemStyle HorizontalAlign="Center" Width="150px" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="Score" HeaderText="Резултат, [%]" SortExpression="Score" >
                                        <FooterStyle Width="50px" />
                                        <HeaderStyle Width="100px" />
                                        <ItemStyle HorizontalAlign="Center" Width="50px" />
                                    </asp:BoundField>
                                </Columns>
                                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                                <HeaderStyle Font-Bold="True" CssClass="complete" />
                                <EditRowStyle BackColor="#999999" />
                                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                            </asp:GridView>
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString2 %>"
                                SelectCommand="SELECT Quiz.Title, UserQuiz.DateTimeComplete, UserQuiz.Score FROM UserQuiz INNER JOIN Quiz ON UserQuiz.QuizID = Quiz.QuizID WHERE (UserQuiz.UserName = @UserName) ORDER BY UserQuiz.DateTimeComplete DESC">
                                <SelectParameters>
                                    <asp:SessionParameter Name="UserName" SessionField="UserName" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </td>
                    </tr>                                                                                            
                </table>
            </LoggedInTemplate>
        </asp:LoginView>
</asp:Content>
