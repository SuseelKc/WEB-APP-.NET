<%@ Page Title="Student" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="LessonData.aspx.cs" Inherits="CourseWork.About" %>

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

          /**/
/* Style for edit and delete buttons */

/**/

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




   
<h2>Lesson Progress</h2>

<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM &quot;LESSON_DATA&quot; WHERE &quot;LESSON_DATA_ID&quot; = :LESSON_DATA_ID" InsertCommand="INSERT INTO &quot;LESSON_DATA&quot; (&quot;LESSON_DATA_ID&quot;, &quot;LESSON_STATUS&quot;, &quot;LESSON_ACESS_DATE&quot;, &quot;STUDENT_ID&quot;, &quot;LESSON_ID&quot;) VALUES (:LESSON_DATA_ID, :LESSON_STATUS, :LESSON_ACESS_DATE, :STUDENT_ID, :LESSON_ID)" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;LESSON_DATA_ID&quot;, &quot;LESSON_STATUS&quot;, &quot;LESSON_ACESS_DATE&quot;, &quot;STUDENT_ID&quot;, &quot;LESSON_ID&quot; FROM &quot;LESSON_DATA&quot;" UpdateCommand="UPDATE &quot;LESSON_DATA&quot; SET &quot;LESSON_STATUS&quot; = :LESSON_STATUS, &quot;LESSON_ACESS_DATE&quot; = :LESSON_ACESS_DATE, &quot;STUDENT_ID&quot; = :STUDENT_ID, &quot;LESSON_ID&quot; = :LESSON_ID WHERE &quot;LESSON_DATA_ID&quot; = :LESSON_DATA_ID">
    <DeleteParameters>
        <asp:Parameter Name="LESSON_DATA_ID" Type="String" />
    </DeleteParameters>
    <InsertParameters>
        <asp:Parameter Name="LESSON_DATA_ID" Type="String" />
        <asp:Parameter Name="LESSON_STATUS" Type="String" />
        <asp:Parameter Name="LESSON_ACESS_DATE" Type="DateTime" />
        <asp:Parameter Name="STUDENT_ID" Type="String" />
        <asp:Parameter Name="LESSON_ID" Type="String" />
    </InsertParameters>
    <UpdateParameters>
        <asp:Parameter Name="LESSON_STATUS" Type="String" />
        <asp:Parameter Name="LESSON_ACESS_DATE" Type="DateTime" />
        <asp:Parameter Name="STUDENT_ID" Type="String" />
        <asp:Parameter Name="LESSON_ID" Type="String" />
        <asp:Parameter Name="LESSON_DATA_ID" Type="String" />
    </UpdateParameters>
</asp:SqlDataSource>
    <br />
    <asp:FormView ID="FormView1" runat="server" DataKeyNames="LESSON_DATA_ID" DataSourceID="SqlDataSource1">
        <InsertItemTemplate>
            <div class="form-group">
                <label for="LESSON_DATA_IDTextBox">LESSON DATA ID:</label>
                <asp:TextBox ID="LESSON_DATA_IDTextBox" runat="server" CssClass="form-control" Text='<%# Bind("LESSON_DATA_ID") %>' />
            </div>
            <div class="form-group">
                <label for="LESSON_STATUSTextBox">LESSON STATUS:</label>
                <asp:TextBox ID="LESSON_STATUSTextBox" runat="server" CssClass="form-control" Text='<%# Bind("LESSON_STATUS") %>' />
            </div>
            <div class="form-group">
                <label for="LESSON_ACESS_DATETextBox">LESSON ACCESS DATE:</label>
                <asp:TextBox ID="LESSON_ACESS_DATETextBox" runat="server" CssClass="form-control" Text='<%# Bind("LESSON_ACESS_DATE") %>' />
            </div>
            <div class="form-group">
                <label for="DropDownList1">STUDENT:</label>
                <asp:DropDownList ID="DropDownList1" runat="server" CssClass="form-control" DataSourceID="SqlDataSource2" DataTextField="STUDENT_NAME" DataValueField="STUDENT_ID" SelectedValue='<%# Bind("STUDENT_ID") %>'>
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;STUDENT_ID&quot;, &quot;STUDENT_NAME&quot; FROM &quot;STUDENT&quot;"></asp:SqlDataSource>
            </div>
            <div class="form-group">
                <label for="DropDownList2">LESSON:</label>
                <asp:DropDownList ID="DropDownList2" runat="server" CssClass="form-control" DataSourceID="SqlDataSource3" DataTextField="LESSON_TITLE" DataValueField="LESSON_ID" SelectedValue='<%# Bind("LESSON_ID") %>'>
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;LESSON_ID&quot;, &quot;LESSON_TITLE&quot; FROM &quot;LESSON&quot;"></asp:SqlDataSource>
            </div>
            <asp:LinkButton ID="InsertButton" runat="server" CssClass="btn btn-primary" CausesValidation="True" CommandName="Insert" Text="Insert" />
            <asp:LinkButton ID="InsertCancelButton" runat="server" CssClass="btn btn-secondary" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </InsertItemTemplate>
        <ItemTemplate>
            <asp:LinkButton ID="NewButton" runat="server" CssClass="btn btn-success" CausesValidation="False" CommandName="New" Text="Add New" />
        </ItemTemplate>
    </asp:FormView>





    <div class="grid-view-container">
            <asp:GridView ID="GridView1" runat="server" CssClass="table table-striped table-bordered" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="LESSON_DATA_ID" DataSourceID="SqlDataSource1">
                <Columns>
                    <%--<asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />--%>
                    <%-- <asp:CommandField ShowEditButton="True" ControlStyle-CssClass="btn-edit" EditText="Edit" />
                     <asp:CommandField ShowDeleteButton="True" ControlStyle-CssClass="btn-delete" DeleteText="Delete" />--%>
                    <%--  --%>
                    <%--  --%>

                    <asp:BoundField DataField="LESSON_DATA_ID" HeaderText="LESSON_DATA_ID" ReadOnly="True" SortExpression="LESSON_DATA_ID" />
                    <asp:BoundField DataField="LESSON_STATUS" HeaderText="LESSON_STATUS" SortExpression="LESSON_STATUS" />
                    <asp:BoundField DataField="LESSON_ACESS_DATE" HeaderText="LESSON_ACESS_DATE" SortExpression="LESSON_ACESS_DATE" />
                    <asp:BoundField DataField="STUDENT_ID" HeaderText="STUDENT_ID" SortExpression="STUDENT_ID" />
                    <asp:TemplateField HeaderText="STUDENT NAME">
                        <ItemTemplate>
                            <asp:DropDownList ID="DropDownList3" Enabled="false" CssClass="form-control" runat="server" DataSourceID="StudentName" DataTextField="STUDENT_NAME" DataValueField="STUDENT_ID" SelectedValue='<%# Bind("STUDENT_ID") %>'>
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="StudentName" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;STUDENT_ID&quot;, &quot;STUDENT_NAME&quot; FROM &quot;STUDENT&quot;"></asp:SqlDataSource>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="LESSON_ID" HeaderText="LESSON_ID" SortExpression="LESSON_ID" />
                    <asp:TemplateField HeaderText="LESSON TITLE">
                        <ItemTemplate>
                            <asp:DropDownList ID="DropDownList4" Enabled="false" CssClass="form-control" runat="server" DataSourceID="LessonTitle" DataTextField="LESSON_TITLE" DataValueField="LESSON_ID" SelectedValue='<%# Bind("LESSON_ID") %>'>
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="LessonTitle" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;LESSON_ID&quot;, &quot;LESSON_TITLE&quot; FROM &quot;LESSON&quot;"></asp:SqlDataSource>
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
