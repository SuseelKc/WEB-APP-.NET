<%@ Page Title="Student" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Course.aspx.cs" Inherits="CourseWork.About" %>

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


    
<h2>Course</h2>

<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM &quot;COURSE&quot; WHERE &quot;COURSE_ID&quot; = :COURSE_ID" InsertCommand="INSERT INTO &quot;COURSE&quot; (&quot;COURSE_ID&quot;, &quot;COURSE_TITLE&quot;, &quot;INSTRUCTOR_ID&quot;) VALUES (:COURSE_ID, :COURSE_TITLE, :INSTRUCTOR_ID)" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;COURSE_ID&quot;, &quot;COURSE_TITLE&quot;, &quot;INSTRUCTOR_ID&quot; FROM &quot;COURSE&quot;" UpdateCommand="UPDATE &quot;COURSE&quot; SET &quot;COURSE_TITLE&quot; = :COURSE_TITLE, &quot;INSTRUCTOR_ID&quot; = :INSTRUCTOR_ID WHERE &quot;COURSE_ID&quot; = :COURSE_ID">
    <DeleteParameters>
        <asp:Parameter Name="COURSE_ID" Type="String" />
    </DeleteParameters>
    <InsertParameters>
        <asp:Parameter Name="COURSE_ID" Type="String" />
        <asp:Parameter Name="COURSE_TITLE" Type="String" />
        <asp:Parameter Name="INSTRUCTOR_ID" Type="String" />
    </InsertParameters>
    <UpdateParameters>
        <asp:Parameter Name="COURSE_TITLE" Type="String" />
        <asp:Parameter Name="INSTRUCTOR_ID" Type="String" />
        <asp:Parameter Name="COURSE_ID" Type="String" />
    </UpdateParameters>
</asp:SqlDataSource>
    <br />
<asp:FormView ID="FormView1" runat="server" DataKeyNames="COURSE_ID" DataSourceID="SqlDataSource1">
    <InsertItemTemplate>
        <div class="form-group">
            <label for="COURSE_IDTextBox">COURSE ID:</label>
            <asp:TextBox ID="COURSE_IDTextBox" runat="server" CssClass="form-control" Text='<%# Bind("COURSE_ID") %>' />
        </div>
        <div class="form-group">
            <label for="COURSE_TITLETextBox">COURSE TITLE:</label>
            <asp:TextBox ID="COURSE_TITLETextBox" runat="server" CssClass="form-control" Text='<%# Bind("COURSE_TITLE") %>' />
        </div>
        <div class="form-group">
            <label for="INSTRUCTOR_IDTextBox">INSTRUCTOR :</label>
            <asp:DropDownList ID="DropDownList1" runat="server" CssClass="form-control" DataSourceID="Instructor" DataTextField="INSTRUCTOR_NAME" DataValueField="INSTRUCTOR_ID" SelectedValue='<%# Bind("INSTRUCTOR_ID") %>'>
            </asp:DropDownList>
            <asp:SqlDataSource ID="Instructor" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;INSTRUCTOR_ID&quot;, &quot;INSTRUCTOR_NAME&quot; FROM &quot;INSTRUCTOR&quot;"></asp:SqlDataSource>
        </div>
        <asp:LinkButton ID="InsertButton" runat="server" CssClass="btn btn-primary" CausesValidation="True" CommandName="Insert" Text="Insert" />
        <asp:LinkButton ID="InsertCancelButton" runat="server" CssClass="btn btn-secondary" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
    </InsertItemTemplate>
    <ItemTemplate>
        <asp:LinkButton ID="NewButton" runat="server" CssClass="btn btn-success" CausesValidation="False" CommandName="New" Text="Add New" />
    </ItemTemplate>
</asp:FormView>



    <div class="grid-view-container">
            <asp:GridView ID="GridView1" runat="server" CssClass="table table-striped table-bordered" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="COURSE_ID" DataSourceID="SqlDataSource1">
                <Columns>
                     <%--  --%>
                     <%--  --%>
                    <asp:BoundField DataField="COURSE_ID" HeaderText="COURSE_ID" ReadOnly="True" SortExpression="COURSE_ID" />
                    <asp:BoundField DataField="COURSE_TITLE" HeaderText="COURSE_TITLE" SortExpression="COURSE_TITLE" />
                    <asp:BoundField DataField="INSTRUCTOR_ID" HeaderText="INSTRUCTOR_ID" SortExpression="INSTRUCTOR_ID" />
                     <asp:TemplateField HeaderText="INSTRUCTOR NAME">
                         <ItemTemplate>
                             <asp:DropDownList ID="DropDownList2" runat="server" CssClass="form-control" Enabled="false" DataSourceID="InstructorName" DataTextField="INSTRUCTOR_NAME" DataValueField="INSTRUCTOR_ID"  SelectedValue='<%# Bind("INSTRUCTOR_ID") %>'>
                        </asp:DropDownList>
                             <asp:SqlDataSource ID="InstructorName" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;INSTRUCTOR_ID&quot;, &quot;INSTRUCTOR_NAME&quot; FROM &quot;INSTRUCTOR&quot;"></asp:SqlDataSource>
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
