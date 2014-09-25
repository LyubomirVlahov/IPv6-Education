<%@ Page Title="" Language="C#" MasterPageFile="~/Default.Master" AutoEventWireup="true" CodeBehind="Results.aspx.cs" Inherits="WebApplication9.Results" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">   
        <table width="560" align="center">
          
            <tr>
                <td>&nbsp;<asp:Label ID="errorLabel" runat="server" CssClass="errormessage"></asp:Label></td>
            </tr>
            <tr>
                <td>
                    <asp:GridView ID="resultGrid" runat="server" DataKeyNames="QuestionID" SelectedIndex="0" 
                    AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" AutoGenerateSelectButton="True" 
                    OnSelectedIndexChanged="resultGrid_SelectedIndexChanged" Width="555px">
                        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" CssClass="generaltext" HorizontalAlign="Center" />
                        <Columns>
                            <asp:BoundField DataField="QuestionID" HeaderText="Въпрос" />
                            <asp:BoundField DataField="CorrectAnswer" HeaderText="Верен отговор" />
                            <asp:BoundField DataField="UserAnswer" HeaderText="Вашият отговор" />
                            <asp:BoundField DataField="Result" HeaderText="Резултат" />
                        </Columns>
                        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" CssClass="boldtext" />
                        <EditRowStyle BackColor="#999999" />
                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    </asp:GridView>

                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString2 %>"
                        SelectCommand="SELECT [Title], [Answer1], [Answer2], [Answer3], [QuestionID], [QuestionOrder], [Answer4], [CorrectAnswer], [QuizID] FROM [Question] WHERE ([QuizID] = @QuizID) ORDER BY [QuestionOrder]">
                        <SelectParameters>
                            <asp:SessionParameter Name="QuizID" SessionField="QuizID" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>                
                </td>
            </tr>
            <tr>
                <td>
                    <asp:DetailsView ID="answerDetails" runat="server" CellPadding="4" ForeColor="#333333"
                        GridLines="None" Height="45px" Width="552px" DataSourceID="SqlDataSource1" AutoGenerateRows="False" >
                        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                        <CommandRowStyle BackColor="#E2DED6" Font-Bold="True" />
                        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" CssClass="generaltext" />
                        <FieldHeaderStyle BackColor="#E9ECF1" Font-Bold="True" CssClass="boldtext" Width="100px" />
                        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                        <EditRowStyle BackColor="#999999" />
                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                        <Fields>
                            <asp:BoundField DataField="QuestionOrder" HeaderText="Въпрос No.:" />
                            <asp:BoundField DataField="Title" HeaderText="Въпрос:" />
                            <asp:BoundField DataField="Answer1" HeaderText="Отговор 1:" />
                            <asp:BoundField DataField="Answer2" HeaderText="Отговор 2:" />
                            <asp:BoundField DataField="Answer3" HeaderText="Отговор 3:" />
                            <asp:BoundField DataField="Answer4" HeaderText="Отговор 4:" />
                            <asp:TemplateField></asp:TemplateField>
                            <asp:BoundField DataField="CorrectAnswer" HeaderText="Верен отоговор:" />
                           
                        </Fields>
                    </asp:DetailsView>                
                </td>
            </tr>
            <tr>
                <td><a href="Profile.aspx">Напред</a></td>
            </tr>                                    
        </table>
</asp:Content>
