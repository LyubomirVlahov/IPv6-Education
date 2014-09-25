<%@ Page Title="" Language="C#" MasterPageFile="~/Default.Master" AutoEventWireup="true"
    CodeBehind="Tests.aspx.cs" Inherits="WebApplication9.Tests" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <table width="560" align="center">            
       <tr>
           <td>
           <asp:Label runat="server">Изберете тест: </asp:Label>
           &nbsp;
            <asp:DropDownList ID="DropDownList1" DataSourceID="SqlDataSource2" AutoPostBack="True"
              DataTextField="Title" runat="server" DataValueField="QuizID" />
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString2 %>"
            SelectCommand="SELECT * FROM [Quiz]"
            DeleteCommand="DELETE FROM [Quiz] WHERE ([QuizID] = @QuizID)">
            <DeleteParameters>
             <asp:ControlParameter Name="QuizID" ControlId="DropDownList1" PropertyName="SelectedValue" />
                </DeleteParameters>
            </asp:SqlDataSource>
              
                
              <asp:GridView ID="GridView1" AllowSorting="True" AllowPaging="True" runat="server"
                DataSourceID="SqlDataSource1" DataKeyNames="QuestionID"
                AutoGenerateColumns="False" Width="900px" 
                OnRowDeleted="GridView1_RowDeleted">
                <Columns>
                    <asp:TemplateField HeaderText="№"><ItemTemplate><%# Container.DataItemIndex + 1 +"."%></ItemTemplate></asp:TemplateField>               
                    <asp:BoundField DataField="Title" HeaderText="Въпрос" SortExpression="Title" />
                    <asp:BoundField DataField="Answer1" HeaderText="Отговор 1" />
                    <asp:BoundField DataField="Answer2" HeaderText="Отговор 2" />
                    <asp:BoundField DataField="Answer3" HeaderText="Отговор 3" />
                    <asp:BoundField DataField="Answer4" HeaderText="Отговор 4" />
                    <asp:HyperLinkField HeaderText="Промяна" Text="Промяна" DataNavigateUrlFields="QuizID, QuestionID"
                    DataNavigateUrlFormatString="EditTest2.aspx?ID={0}&ID2={1}" />          
                <asp:CommandField ShowDeleteButton="True" HeaderText="Изтриване" 
                        DeleteText="Изтриване" />
                </Columns>
              </asp:GridView>                        
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString2 %>"
                SelectCommand="SELECT * FROM [Question] WHERE ([QuizID] = @QuizID)" 
                DeleteCommand="DELETE FROM [Question] WHERE [QuestionID] = @QuestionID">
                <SelectParameters>
                    <asp:ControlParameter ControlID="DropDownList1" DefaultValue="0" Name="QuizID" PropertyName="SelectedValue"
                        Type="Int32" />
                </SelectParameters>
                <DeleteParameters>
                    <asp:Parameter Name="QuestionID" Type="Int32" />
                </DeleteParameters>
            </asp:SqlDataSource>
            
            <asp:LinkButton OnClick="LinkButton_Click" Text="Добави нов въпрос към избрания тест" runat="server"> </asp:LinkButton>
            </td>
            </tr>
            <tr>
                <td><asp:LinkButton ID="HyperLink2" Text="Изтрии избрания тест." OnClick="OnDelete" runat="server" /> </td>
            </tr>

              <asp:Label ID="ErrorMessageLabel" EnableViewState="false" runat="server" />
                 
                    
    </table>
    &nbsp;
    <table width="560" align="center">    
        <tr>
            <td><asp:HyperLink ID="HyperLink3" Text="Добави нов тест" NavigateUrl="AddNewQuiz.aspx" runat="server" /></td>
        </tr>    
    </table>
    &nbsp;

    <table width="600" align="center">
        <tr>
            <td>
            <asp:Label runat="server"> Резултати на потребителите:</asp:Label>
            <asp:GridView ID="GridView2" AllowSorting="True" runat="server" DataSourceID="SqlDataSource3"
              AutoGenerateColumns="False">
              <Columns>
                <asp:BoundField HeaderText="Тест" DataField="Title" SortExpression="Title" />
                <asp:BoundField HeaderText="Потребител" DataField="UserName" SortExpression="UserName" />
                <asp:BoundField HeaderText="Резултат, [%]" DataField="Score" SortExpression="Score" />
                <asp:BoundField HeaderText="Дата на завършване" DataField="DateTimeComplete" SortExpression="DateTimeComplete" />
              </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
              SelectCommand="SELECT UserQuiz.DateTimeComplete, UserQuiz.Score, UserQuiz.UserName, Quiz.Title FROM UserQuiz INNER JOIN Quiz ON UserQuiz.QuizID = Quiz.QuizID ORDER BY UserQuiz.QuizID, UserQuiz.Score DESC"
              ConnectionString="<%$ ConnectionStrings:ConnectionString2 %>" />
            </td>
        </tr>
    </table>
</asp:Content>
