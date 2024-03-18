<%@ Page Title="Student" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Student.aspx.cs" Inherits="CourseWork.About" %>

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

    
<h2>Student</h2>

<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM &quot;STUDENT&quot; WHERE &quot;STUDENT_ID&quot; = :STUDENT_ID" InsertCommand="INSERT INTO &quot;STUDENT&quot; (&quot;STUDENT_ID&quot;, &quot;STUDENT_NAME&quot;, &quot;DOB&quot;, &quot;CONTACT&quot;, &quot;EMAIL&quot;, &quot;COUNTRY&quot;) VALUES (:STUDENT_ID, :STUDENT_NAME, :DOB, :CONTACT, :EMAIL, :COUNTRY)" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;STUDENT_ID&quot;, &quot;STUDENT_NAME&quot;, &quot;DOB&quot;, &quot;CONTACT&quot;, &quot;EMAIL&quot;, &quot;COUNTRY&quot; FROM &quot;STUDENT&quot;" UpdateCommand="UPDATE &quot;STUDENT&quot; SET &quot;STUDENT_NAME&quot; = :STUDENT_NAME, &quot;DOB&quot; = :DOB, &quot;CONTACT&quot; = :CONTACT, &quot;EMAIL&quot; = :EMAIL, &quot;COUNTRY&quot; = :COUNTRY WHERE &quot;STUDENT_ID&quot; = :STUDENT_ID">
    <DeleteParameters>
        <asp:Parameter Name="STUDENT_ID" Type="String" />
    </DeleteParameters>
    <InsertParameters>
        <asp:Parameter Name="STUDENT_ID" Type="String" />
        <asp:Parameter Name="STUDENT_NAME" Type="String" />
        <asp:Parameter Name="DOB" Type="DateTime" />
        <asp:Parameter Name="CONTACT" Type="String" />
        <asp:Parameter Name="EMAIL" Type="String" />
        <asp:Parameter Name="COUNTRY" Type="String" />
    </InsertParameters>
    <UpdateParameters>
        <asp:Parameter Name="STUDENT_NAME" Type="String" />
        <asp:Parameter Name="DOB" Type="DateTime" />
        <asp:Parameter Name="CONTACT" Type="String" />
        <asp:Parameter Name="EMAIL" Type="String" />
        <asp:Parameter Name="COUNTRY" Type="String" />
        <asp:Parameter Name="STUDENT_ID" Type="String" />
    </UpdateParameters>
</asp:SqlDataSource>
    <br />
<asp:FormView ID="FormView1" runat="server" DataKeyNames="STUDENT_ID" DataSourceID="SqlDataSource1">
    <InsertItemTemplate>
        <div class="form-group">
            <label for="STUDENT_IDTextBox">STUDENT ID:</label>
            <asp:TextBox ID="STUDENT_IDTextBox" runat="server" CssClass="form-control" Text='<%# Bind("STUDENT_ID") %>' />
        </div>
        <div class="form-group">
            <label for="STUDENT_NAMETextBox">STUDENT NAME:</label>
            <asp:TextBox ID="STUDENT_NAMETextBox" runat="server" CssClass="form-control" Text='<%# Bind("STUDENT_NAME") %>' />
        </div>
        <div class="form-group">
            <label for="DOBTextBox">DOB:</label>
            <asp:TextBox ID="DOBTextBox" runat="server" CssClass="form-control" Text='<%# Bind("DOB") %>' />
        </div>
        <div class="form-group">
            <label for="CONTACTTextBox">CONTACT:</label>
            <asp:TextBox ID="CONTACTTextBox" runat="server" CssClass="form-control" Text='<%# Bind("CONTACT") %>' />
        </div>
        <div class="form-group">
            <label for="EMAILTextBox">EMAIL:</label>
            <asp:TextBox ID="EMAILTextBox" runat="server" CssClass="form-control" Text='<%# Bind("EMAIL") %>' />
        </div>
        <div class="form-group">
            <label for="COUNTRYTextBox">COUNTRY:</label>
            <asp:TextBox ID="COUNTRYTextBox" runat="server" CssClass="form-control" Text='<%# Bind("COUNTRY") %>' />
        </div>
        <asp:LinkButton ID="InsertButton" runat="server" CssClass="btn btn-primary" CausesValidation="True" CommandName="Insert" Text="Insert" />
        <asp:LinkButton ID="InsertCancelButton" runat="server" CssClass="btn btn-secondary" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
    </InsertItemTemplate>
    <ItemTemplate>
        <asp:LinkButton ID="NewButton" runat="server" CssClass="btn btn-success" CausesValidation="False" CommandName="New" Text="Add New" />
    </ItemTemplate>
</asp:FormView>
    <div class="grid-view-container">
            <asp:GridView ID="GridView1" runat="server" CssClass="table table-striped table-bordered" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="STUDENT_ID" DataSourceID="SqlDataSource1">
                <Columns>
                    <asp:BoundField DataField="STUDENT_ID" HeaderText="STUDENT_ID" ReadOnly="True" SortExpression="STUDENT_ID" />
                    <asp:BoundField DataField="STUDENT_NAME" HeaderText="STUDENT_NAME" SortExpression="STUDENT_NAME" />
                    <asp:BoundField DataField="DOB" HeaderText="DOB" SortExpression="DOB" />
                    <asp:BoundField DataField="CONTACT" HeaderText="CONTACT" SortExpression="CONTACT" />
                    <asp:BoundField DataField="EMAIL" HeaderText="EMAIL" SortExpression="EMAIL" />
                    <asp:BoundField DataField="COUNTRY" HeaderText="COUNTRY" SortExpression="COUNTRY" />
                    <%--  --%>
                  <asp:TemplateField HeaderText="Actions" >
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
