<%@ Page Title="" Language="C#" MasterPageFile="~/Default.Master" AutoEventWireup="true" CodeBehind="EditTest2.aspx.cs" Inherits="WebApplication9.EditTest2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<asp:DetailsView DefaultMode="Edit" AutoGenerateRows="False" DataKeyNames="QuestionID"
      DataSourceID="SqlDataSource3" HeaderText="Промяна на въпрос" ID="DetailsView1" runat="server"
      Width="800px" OnItemUpdated="DetailsView1_ItemUpdated" 
        OnModeChanging="DetailsView1_ModeChanging">
      <Fields>
        <asp:BoundField DataField="QuestionID" HeaderText="Номер на въпроса" ReadOnly="True" SortExpression="QuestionID" InsertVisible="False" />
        <asp:BoundField DataField="Title" HeaderText="Въпрос" SortExpression="Title" />
        <asp:BoundField DataField="Answer1" HeaderText="Отговор 1" SortExpression="Answer1" />
        <asp:BoundField DataField="Answer2" HeaderText="Отговор 2" SortExpression="Answer2" />
        <asp:BoundField DataField="Answer3" HeaderText="Отговор 3" SortExpression="Answer3" />
        <asp:BoundField DataField="Answer4" HeaderText="Отговор 4" SortExpression="Answer4" />
        <asp:BoundField DataField="CorrectAnswer" HeaderText="Верен отговор" SortExpression="CorrectAnswer" />
        <asp:BoundField DataField="QuestionOrder" HeaderText="Номер поред" SortExpression="QuestionOrder" />
        <asp:BoundField DataField="QuizID" HeaderText="Номер на тест" SortExpression="QuizID" />
        <asp:CommandField ShowEditButton="True" CancelText="Отказ" UpdateText="Обнови" />
      </Fields>
    </asp:DetailsView>
    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString2 %>"
      SelectCommand="SELECT * FROM [Question] WHERE (([QuizID] = @QuizID) AND ([QuestionID] = @QuestionID))"   
      UpdateCommand="UPDATE [Question] SET [Title] = @Title, [Answer1] = @Answer1, [Answer2] = @Answer2, [Answer3] = @Answer3, [Answer4] = @Answer4, [CorrectAnswer] = @CorrectAnswer, [QuestionOrder] = @QuestionOrder, [QuizID] = @QuizID WHERE [QuestionID] = @QuestionID" >
        <DeleteParameters>
            <asp:Parameter Name="QuestionID" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Title" Type="String" />
            <asp:Parameter Name="Answer1" Type="String" />
            <asp:Parameter Name="Answer2" Type="String" />
            <asp:Parameter Name="Answer3" Type="String" />
            <asp:Parameter Name="Answer4" Type="String" />
            <asp:Parameter Name="CorrectAnswer" Type="Byte" />
            <asp:Parameter Name="QuestionOrder" Type="Byte" />
            <asp:Parameter Name="QuizID" Type="Int32" />
        </InsertParameters>
      <SelectParameters>
        <asp:QueryStringParameter Name="QuizID" QueryStringField="ID" Type="Int32" />
        <asp:QueryStringParameter Name="QuestionID" QueryStringField="ID2" Type="Int32" />
      </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="Title" Type="String" />
            <asp:Parameter Name="Answer1" Type="String" />
            <asp:Parameter Name="Answer2" Type="String" />
            <asp:Parameter Name="Answer3" Type="String" />
            <asp:Parameter Name="Answer4" Type="String" />
            <asp:Parameter Name="CorrectAnswer" Type="Byte" />
            <asp:Parameter Name="QuestionOrder" Type="Byte" />
            <asp:Parameter Name="QuizID" Type="Int32" />
            <asp:Parameter Name="QuestionID" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>
