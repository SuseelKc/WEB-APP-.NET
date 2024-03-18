<%@ Page Title="Student" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CourseInstructor.aspx.cs" Inherits="CourseWork.About" %>

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




   
 <h2>Course Instructor</h2>

    <br />
    <asp:TextBox ID="TextBox1" runat="server"  VALUE="Course" Enabled="false"></asp:TextBox>
<br />
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;COURSE_ID&quot;, &quot;COURSE_TITLE&quot; FROM &quot;COURSE&quot;"></asp:SqlDataSource>


<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT 
    c.course_id,
    c.course_title,
    i.instructor_id,
    i.instructor_name,
    i.contact
FROM 
    course c
JOIN 
    instructor i ON c.instructor_id = i.instructor_id
WHERE 
    i.instructor_id IN (
        SELECT 
            instructor_id
        FROM 
            course
        GROUP BY 
            instructor_id
        HAVING 
            COUNT(*) &gt;= 2
    )
AND
    c.course_id = :course_id">
    <SelectParameters>
        <asp:ControlParameter ControlID="DropDownList1" Name="course_id" PropertyName="SelectedValue" />
    </SelectParameters>
</asp:SqlDataSource>
    <br />
    <asp:DropDownList ID="DropDownList1" CssClass="form-control" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource2" DataTextField="COURSE_TITLE" DataValueField="COURSE_ID">
    </asp:DropDownList>






    <div class="grid-view-container">
            <asp:GridView ID="GridView1" runat="server" CssClass="table table-striped table-bordered" AllowSorting="True" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" DataKeyNames="COURSE_ID,INSTRUCTOR_ID">
                <Columns>
                    <asp:BoundField DataField="COURSE_ID" HeaderText="COURSE_ID" SortExpression="COURSE_ID" ReadOnly="True" />
                    <asp:BoundField DataField="COURSE_TITLE" HeaderText="COURSE_TITLE" SortExpression="COURSE_TITLE" />
                    <asp:BoundField DataField="INSTRUCTOR_ID" HeaderText="INSTRUCTOR_ID" SortExpression="INSTRUCTOR_ID" ReadOnly="True" />
                    <%--<asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />--%>
                    <%-- <asp:CommandField ShowEditButton="True" ControlStyle-CssClass="btn-edit" EditText="Edit" />
                     <asp:CommandField ShowDeleteButton="True" ControlStyle-CssClass="btn-delete" DeleteText="Delete" />--%>
                    <%--  --%>
                    <%--  --%>

                    <asp:BoundField DataField="INSTRUCTOR_NAME" HeaderText="INSTRUCTOR_NAME" SortExpression="INSTRUCTOR_NAME" />
                    <asp:BoundField DataField="CONTACT" HeaderText="CONTACT" SortExpression="CONTACT" />

                </Columns>
            </asp:GridView>
        </div>
    



 </main>

</asp:Content>
