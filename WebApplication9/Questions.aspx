<%@ Page Title="" Language="C#" MasterPageFile="~/Default.Master" AutoEventWireup="true" CodeBehind="Questions.aspx.cs" Inherits="WebApplication9.Questions" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table width="560" align="center">  
            <tr>
                <td class="h1">Тест:&nbsp;
                    <asp:Label ID="currentTestLabel" runat="server"></asp:Label></td>
            </tr>                      
            <tr>
                <td>
                    <asp:DetailsView ID="questionDetails" runat="server" Height="50px" Width="550px" AutoGenerateRows="False" CellPadding="4" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None">
                        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                        <CommandRowStyle BackColor="#E2DED6" Font-Bold="True" />
                        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" CssClass="generaltext" />
                        <FieldHeaderStyle BackColor="#E9ECF1" Font-Bold="True" CssClass="boldtext" Width="80px" />
                        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                        <Fields>
                            <asp:BoundField DataField="Title" HeaderText="Въпрос:" SortExpression="Title" />
                            <asp:BoundField DataField="Answer1" HeaderText="А" SortExpression="Answer1" />
                            <asp:BoundField DataField="Answer2" HeaderText="B" SortExpression="Answer2" />
                            <asp:BoundField DataField="Answer3" HeaderText="C" SortExpression="Answer3" />
                            <asp:BoundField DataField="Answer4" HeaderText="D" SortExpression="Answer4" />
                        </Fields>
                        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                        <EditRowStyle BackColor="#999999" />
                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" CssClass="generaltext" />
                    </asp:DetailsView>
                    &nbsp;
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString2 %>" 
                    SelectCommand="SELECT [QuestionID], [Title], [Answer1], [Answer2], [Answer3], [Answer4], [CorrectAnswer], [QuestionOrder] FROM [Question] WHERE ([QuizID] = @QuizID) ORDER BY [QuestionOrder]">
                        <SelectParameters>
                            <asp:SessionParameter SessionField="QuizID" Type="Int32" Name="QuizID" DefaultValue="0" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <td>&nbsp;
                </td>
            </tr>
            <tr>
                <td class="boldtext">
                   Вашят отговор:&nbsp;
                <asp:DropDownList ID="answerDropDownList" runat="server">
                            <asp:ListItem Value="1">A</asp:ListItem>
                            <asp:ListItem Value="2">B</asp:ListItem>
                            <asp:ListItem Value="3">C</asp:ListItem>
                            <asp:ListItem Value="4">D</asp:ListItem>
                        </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td align="right">
                    <asp:Button ID="nextButton" runat="server" OnClick="nextButton_Click" Text="Следващ въпрос" />
                </td>
            </tr>                                    
        </table>
</asp:Content>
