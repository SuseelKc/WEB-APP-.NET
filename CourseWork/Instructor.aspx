<%@ Page Title="Student" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Instructor.aspx.cs" Inherits="CourseWork.About" %>

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

   
<h2>Instructor</h2>

<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM &quot;INSTRUCTOR&quot; WHERE &quot;INSTRUCTOR_ID&quot; = :INSTRUCTOR_ID" InsertCommand="INSERT INTO &quot;INSTRUCTOR&quot; (&quot;INSTRUCTOR_ID&quot;, &quot;INSTRUCTOR_NAME&quot;, &quot;CONTACT&quot;) VALUES (:INSTRUCTOR_ID, :INSTRUCTOR_NAME, :CONTACT)" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;INSTRUCTOR_ID&quot;, &quot;INSTRUCTOR_NAME&quot;, &quot;CONTACT&quot; FROM &quot;INSTRUCTOR&quot;" UpdateCommand="UPDATE &quot;INSTRUCTOR&quot; SET &quot;INSTRUCTOR_NAME&quot; = :INSTRUCTOR_NAME, &quot;CONTACT&quot; = :CONTACT WHERE &quot;INSTRUCTOR_ID&quot; = :INSTRUCTOR_ID">
    <DeleteParameters>
        <asp:Parameter Name="INSTRUCTOR_ID" Type="String" />
    </DeleteParameters>
    <InsertParameters>
        <asp:Parameter Name="INSTRUCTOR_ID" Type="String" />
        <asp:Parameter Name="INSTRUCTOR_NAME" Type="String" />
        <asp:Parameter Name="CONTACT" Type="String" />
    </InsertParameters>
    <UpdateParameters>
        <asp:Parameter Name="INSTRUCTOR_NAME" Type="String" />
        <asp:Parameter Name="CONTACT" Type="String" />
        <asp:Parameter Name="INSTRUCTOR_ID" Type="String" />
    </UpdateParameters>
</asp:SqlDataSource>
    <br />
<asp:FormView ID="FormView1" runat="server" DataKeyNames="INSTRUCTOR_ID" DataSourceID="SqlDataSource1">
    <InsertItemTemplate>
        <div class="form-group">
            <label for="INSTRUCTOR_IDTextBox">INSTRUCTOR ID:</label>
            <asp:TextBox ID="INSTRUCTOR_IDTextBox" runat="server" CssClass="form-control" Text='<%# Bind("INSTRUCTOR_ID") %>' />
        </div>
        <div class="form-group">
            <label for="INSTRUCTOR_NAMETextBox">INSTRUCTOR NAME:</label>
            <asp:TextBox ID="INSTRUCTOR_NAMETextBox" runat="server" CssClass="form-control" Text='<%# Bind("INSTRUCTOR_NAME") %>' />
        </div>
        <div class="form-group">
            <label for="CONTACTTextBox">CONTACT:</label>
            <asp:TextBox ID="CONTACTTextBox" runat="server" CssClass="form-control" Text='<%# Bind("CONTACT") %>' />
        </div>
        <asp:LinkButton ID="InsertButton" runat="server" CssClass="btn btn-primary" CausesValidation="True" CommandName="Insert" Text="Insert" />
        <asp:LinkButton ID="InsertCancelButton" runat="server" CssClass="btn btn-secondary" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
    </InsertItemTemplate>
    <ItemTemplate>
        <asp:LinkButton ID="NewButton" runat="server" CssClass="btn btn-success" CausesValidation="False" CommandName="New" Text="Add New" />
    </ItemTemplate>
</asp:FormView>

    <div class="grid-view-container">
            <asp:GridView ID="GridView1" runat="server" CssClass="table table-striped table-bordered" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="INSTRUCTOR_ID" DataSourceID="SqlDataSource1">
                <Columns>
                    <asp:BoundField DataField="INSTRUCTOR_ID" HeaderText="INSTRUCTOR_ID" ReadOnly="True" SortExpression="INSTRUCTOR_ID" />
                    <asp:BoundField DataField="INSTRUCTOR_NAME" HeaderText="INSTRUCTOR_NAME" SortExpression="INSTRUCTOR_NAME" />
                    <asp:BoundField DataField="CONTACT" HeaderText="CONTACT" SortExpression="CONTACT" />
                     <%--  --%>
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
                     <%--  --%>
                </Columns>
            </asp:GridView>
        </div>

 </main>
</asp:Content>
