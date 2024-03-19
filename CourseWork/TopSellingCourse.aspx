<%@ Page Title="Student" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="TopSellingCourse.aspx.cs" Inherits="CourseWork.About" %>

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
    <asp:TextBox ID="TextBox1" runat="server"  VALUE="Year" Enabled="false"></asp:TextBox>
    <br />

    <asp:DropDownList ID="DropDownList1" runat="server" CssClass="form-control" AutoPostBack="True" DataSourceID="year" DataTextField="YEAR" DataValueField="YEAR">
</asp:DropDownList>
<asp:SqlDataSource ID="year" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT DISTINCT TO_CHAR(enrollment_date, 'YYYY') AS YEAR FROM student_enrollment"></asp:SqlDataSource>
        <br />
    <asp:TextBox ID="TextBox2" runat="server" VALUE="Month" Enabled="false"></asp:TextBox>
        <br>
<asp:DropDownList ID="DropDownList2" runat="server" CssClass="form-control" AutoPostBack="True" DataSourceID="month" DataTextField="YEAR" DataValueField="YEAR">
</asp:DropDownList>
        <br><br>
    <asp:SqlDataSource ID="month" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT DISTINCT TO_CHAR(enrollment_date, 'MM') AS YEAR FROM student_enrollment"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT *
            FROM (
                SELECT c.COURSE_TITLE, COUNT(*) AS enroll_count
                FROM STUDENT_ENROLLMENT e
                JOIN COURSE c ON e.COURSE_ID = c.COURSE_ID
                WHERE TO_CHAR(e.ENROLLMENT_DATE, 'YYYY') = :year
                AND TO_CHAR(e.ENROLLMENT_DATE, 'MM') = :month
                GROUP BY c.COURSE_TITLE
                ORDER BY enroll_count DESC
            )
            WHERE ROWNUM &lt;= 3">
        <SelectParameters>
            <asp:ControlParameter ControlID="DropDownList1" Name="year" PropertyName="SelectedValue" />
            <asp:ControlParameter ControlID="DropDownList2" Name="month" PropertyName="SelectedValue" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:GridView ID="GridView1" runat="server" DataSourceID="SqlDataSource1" CssClass="table table-striped table-bordered" AllowSorting="True">
            <HeaderStyle CssClass="thead-dark" />
            <RowStyle CssClass="table-light" />
            <Columns>
                <asp:BoundField DataField="COURSE_TITLE" HeaderText="Course Title" />
                <asp:BoundField DataField="enroll_count" HeaderText="Enrollment Count" />
            </Columns>
     </asp:GridView>

    




</main>
</asp:Content>
