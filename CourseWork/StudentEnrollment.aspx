<%@ Page Title="Student" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="StudentEnrollment.aspx.cs" Inherits="CourseWork.About" %>

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




   
 <h2>Best Selling Course</h2>

<br />
        <asp:TextBox ID="TextBox1" runat="server"  VALUE="Student" Enabled="false"></asp:TextBox>
<br />
<asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;STUDENT_ID&quot;, &quot;STUDENT_NAME&quot; FROM &quot;STUDENT&quot;"></asp:SqlDataSource>


<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM &quot;STUDENT_ENROLLMENT&quot; WHERE &quot;ENROLL_ID&quot; = :ENROLL_ID" InsertCommand="INSERT INTO &quot;STUDENT_ENROLLMENT&quot; (&quot;ENROLL_ID&quot;, &quot;STUDENT_ID&quot;, &quot;COURSE_ID&quot;, &quot;ENROLLMENT_DATE&quot;) VALUES (:ENROLL_ID, :STUDENT_ID, :COURSE_ID, :ENROLLMENT_DATE)" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT se.ENROLL_ID, se.STUDENT_ID, se.COURSE_ID, se.ENROLLMENT_DATE,
       s.STUDENT_NAME, s.CONTACT, s.DOB, s.EMAIL, s.COUNTRY
FROM STUDENT_ENROLLMENT se
JOIN STUDENT s ON se.STUDENT_ID = s.STUDENT_ID 
where s.student_id = :student
" UpdateCommand="UPDATE &quot;STUDENT_ENROLLMENT&quot; SET &quot;STUDENT_ID&quot; = :STUDENT_ID, &quot;COURSE_ID&quot; = :COURSE_ID, &quot;ENROLLMENT_DATE&quot; = :ENROLLMENT_DATE WHERE &quot;ENROLL_ID&quot; = :ENROLL_ID">
    <DeleteParameters>
        <asp:Parameter Name="ENROLL_ID" Type="String" />
    </DeleteParameters>
    <InsertParameters>
        <asp:Parameter Name="ENROLL_ID" Type="String" />
        <asp:Parameter Name="STUDENT_ID" Type="String" />
        <asp:Parameter Name="COURSE_ID" Type="String" />
        <asp:Parameter Name="ENROLLMENT_DATE" Type="DateTime" />
    </InsertParameters>
    <SelectParameters>
        <asp:ControlParameter ControlID="DropDownList1" Name="student" PropertyName="SelectedValue" />
    </SelectParameters>
    <UpdateParameters>
        <asp:Parameter Name="STUDENT_ID" Type="String" />
        <asp:Parameter Name="COURSE_ID" Type="String" />
        <asp:Parameter Name="ENROLLMENT_DATE" Type="DateTime" />
        <asp:Parameter Name="ENROLL_ID" Type="String" />
    </UpdateParameters>
</asp:SqlDataSource>
    <br />
    <asp:DropDownList ID="DropDownList1" CssClass="form-control" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource2" DataTextField="STUDENT_NAME" DataValueField="STUDENT_ID">
    </asp:DropDownList>






    <div class="grid-view-container">
            <asp:GridView ID="GridView1" runat="server" CssClass="table table-striped table-bordered" AllowSorting="True" AutoGenerateColumns="False" DataSourceID="SqlDataSource1">
                <Columns>
                    <asp:BoundField DataField="ENROLL_ID" HeaderText="ENROLL_ID" SortExpression="ENROLL_ID" />
                    <asp:BoundField DataField="STUDENT_ID" HeaderText="STUDENT_ID" SortExpression="STUDENT_ID" />
                    <asp:BoundField DataField="COURSE_ID" HeaderText="COURSE_ID" SortExpression="COURSE_ID" />
                    <asp:BoundField DataField="ENROLLMENT_DATE" HeaderText="ENROLLMENT_DATE" SortExpression="ENROLLMENT_DATE" />
                    <%--<asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />--%>
                    <%-- <asp:CommandField ShowEditButton="True" ControlStyle-CssClass="btn-edit" EditText="Edit" />
                     <asp:CommandField ShowDeleteButton="True" ControlStyle-CssClass="btn-delete" DeleteText="Delete" />--%>
                    <%--  --%>
                    <%--  --%>

                    <asp:BoundField DataField="STUDENT_NAME" HeaderText="STUDENT_NAME" SortExpression="STUDENT_NAME" />
                    <asp:BoundField DataField="CONTACT" HeaderText="CONTACT" SortExpression="CONTACT" />
                    <asp:BoundField DataField="DOB" HeaderText="DOB" SortExpression="DOB" />
                    <asp:BoundField DataField="EMAIL" HeaderText="EMAIL" SortExpression="EMAIL" />
                    <asp:BoundField DataField="COUNTRY" HeaderText="COUNTRY" SortExpression="COUNTRY" />

                </Columns>
            </asp:GridView>
        </div>
    




 </main>
</asp:Content>
