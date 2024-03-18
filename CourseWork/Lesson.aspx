<%@ Page Title="Student" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Lesson.aspx.cs" Inherits="CourseWork.About" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <main aria-labelledby="title">

        <style>
        /* Adjustments to maintain proper spacing */
        .container {
            padding-top: 20px;
        }
        .grid-view-container {
            margin-top: 20px;
        }
    </style>
                <style>
    /* Style for edit and delete buttons */
    .grid-view-container a.btn-edit,
    .grid-view-container a.btn-delete {
        background-color: #007bff; /* Blue color for edit button */
        border: none;
        color: white;
        padding: 5px 10px;
        text-align: center;
        text-decoration: none;
        display: inline-block;
        font-size: 14px;
        margin: 4px 2px;
        cursor: pointer;
        border-radius: 5px;
        transition: background-color 0.3s;
    }

    /* Style for delete button */
    .grid-view-container a.btn-delete {
        background-color:   #dc3545 !important; /* Red color for delete button */
    }

    /* Button hover effect */
    .grid-view-container a.btn-edit:hover,
    .grid-view-container a.btn-delete:hover {
        background-color: #0056b3; /* Darker button color on hover */
    }
</style>

  
<h2>Lesson</h2>

<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM &quot;LESSON&quot; WHERE &quot;LESSON_ID&quot; = :LESSON_ID" InsertCommand="INSERT INTO &quot;LESSON&quot; (&quot;LESSON_ID&quot;, &quot;LESSON_SNO&quot;, &quot;LESSON_TITLE&quot;, &quot;COURSE_ID&quot;) VALUES (:LESSON_ID, :LESSON_SNO, :LESSON_TITLE, :COURSE_ID)" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;LESSON_ID&quot;, &quot;LESSON_SNO&quot;, &quot;LESSON_TITLE&quot;, &quot;COURSE_ID&quot; FROM &quot;LESSON&quot;" UpdateCommand="UPDATE &quot;LESSON&quot; SET &quot;LESSON_SNO&quot; = :LESSON_SNO, &quot;LESSON_TITLE&quot; = :LESSON_TITLE, &quot;COURSE_ID&quot; = :COURSE_ID WHERE &quot;LESSON_ID&quot; = :LESSON_ID">
    <DeleteParameters>
        <asp:Parameter Name="LESSON_ID" Type="String" />
    </DeleteParameters>
    <InsertParameters>
        <asp:Parameter Name="LESSON_ID" Type="String" />
        <asp:Parameter Name="LESSON_SNO" Type="Decimal" />
        <asp:Parameter Name="LESSON_TITLE" Type="String" />
        <asp:Parameter Name="COURSE_ID" Type="String" />
    </InsertParameters>
    <UpdateParameters>
        <asp:Parameter Name="LESSON_SNO" Type="Decimal" />
        <asp:Parameter Name="LESSON_TITLE" Type="String" />
        <asp:Parameter Name="COURSE_ID" Type="String" />
        <asp:Parameter Name="LESSON_ID" Type="String" />
    </UpdateParameters>
</asp:SqlDataSource>
    <br />
<asp:FormView ID="FormView1" runat="server" DataKeyNames="LESSON_ID" DataSourceID="SqlDataSource1">
    <InsertItemTemplate>
        <div class="form-group">
            <label for="LESSON_IDTextBox">LESSON ID:</label>
            <asp:TextBox ID="LESSON_IDTextBox" runat="server" CssClass="form-control" Text='<%# Bind("LESSON_ID") %>' />
        </div>
        <div class="form-group">
            <label for="LESSON_SNOTextBox">LESSON SNO:</label>
            <asp:TextBox ID="LESSON_SNOTextBox" runat="server" CssClass="form-control" Text='<%# Bind("LESSON_SNO") %>' />
        </div>
        <div class="form-group">
            <label for="LESSON_TITLETextBox">LESSON TITLE:</label>
            <asp:TextBox ID="LESSON_TITLETextBox" runat="server" CssClass="form-control" Text='<%# Bind("LESSON_TITLE") %>' />
        </div>
        <div class="form-group">
            <label for="COURSE_IDDropDownList">COURSE:</label>
            <asp:DropDownList ID="DropDownList1" runat="server" CssClass="form-control" DataSourceID="Course" DataTextField="COURSE_TITLE" DataValueField="COURSE_ID" SelectedValue='<%# Bind("COURSE_ID") %>'>
            </asp:DropDownList>
            <asp:SqlDataSource ID="Course" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;COURSE_ID&quot;, &quot;COURSE_TITLE&quot; FROM &quot;COURSE&quot;"></asp:SqlDataSource>
        </div>
        <asp:LinkButton ID="InsertButton" runat="server" CssClass="btn btn-primary" CausesValidation="True" CommandName="Insert" Text="Insert" />
        <asp:LinkButton ID="InsertCancelButton" runat="server" CssClass="btn btn-secondary" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
    </InsertItemTemplate>
    <ItemTemplate>
        <asp:LinkButton ID="NewButton" runat="server" CssClass="btn btn-success" CausesValidation="False" CommandName="New" Text="Add New" />
    </ItemTemplate>
</asp:FormView>

    <div class="grid-view-container">
            <asp:GridView ID="GridView1" runat="server" CssClass="table table-striped table-bordered" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="LESSON_ID" DataSourceID="SqlDataSource1">
                <Columns>
                     <%--  --%>
                     <%--  --%>
                    <asp:BoundField DataField="LESSON_ID" HeaderText="LESSON_ID" ReadOnly="True" SortExpression="LESSON_ID" />
                    <asp:BoundField DataField="LESSON_SNO" HeaderText="LESSON_SNO" SortExpression="LESSON_SNO" />
                    <asp:BoundField DataField="LESSON_TITLE" HeaderText="LESSON_TITLE" SortExpression="LESSON_TITLE" />
                    <asp:BoundField DataField="COURSE_ID" HeaderText="COURSE_ID" SortExpression="COURSE_ID" />
                     <asp:TemplateField HeaderText="COURSE TITLE">
                         <ItemTemplate>
                             <asp:DropDownList ID="DropDownList2" enabled="false" CssClass="form-control" runat="server" DataSourceID="CourseTitle" DataTextField="COURSE_TITLE" DataValueField="COURSE_ID" SelectedValue='<%# Bind("COURSE_ID") %>'>
                             </asp:DropDownList>
                             <asp:SqlDataSource ID="CourseTitle" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;COURSE_TITLE&quot;, &quot;COURSE_ID&quot; FROM &quot;COURSE&quot;"></asp:SqlDataSource>
                         </ItemTemplate>
                    </asp:TemplateField>
                       <asp:TemplateField HeaderText="Actions">
                         <ItemTemplate>
                             <asp:LinkButton ID="EditButton" runat="server" CssClass="btn btn-edit" CommandName="Edit" Text="Edit" />
                             <asp:LinkButton ID="DeleteButton" runat="server" CssClass="btn btn-delete" CommandName="Delete" Text="Delete" OnClientClick="return confirm('Are you sure you want to delete this item?');" />
                         </ItemTemplate>
                         <EditItemTemplate>
                             <asp:LinkButton ID="UpdateButton" runat="server" CssClass="btn btn-primary" CommandName="Update" Text="Update" />
                             <asp:LinkButton ID="CancelButton" runat="server" CssClass="btn btn-secondary" CommandName="Cancel" Text="Cancel" />
                         </EditItemTemplate>
                         <ItemStyle HorizontalAlign="Center" />
                     </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>

  </main>
</asp:Content>
