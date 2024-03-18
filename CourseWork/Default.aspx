<%@ Page Title="About" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="CourseWork.About" %>



<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <main>
        <asp:Chart ID="Chart1" runat="server" DataSourceID="student" Width="1278px" Height="520px">
            <Series>
                <asp:Series Name="Series1" XValueMember="ENROLL_MONTH" ChartType="Column" YValueMembers="STUDENT_COUNT"></asp:Series>
            </Series>
            <ChartAreas>
                <asp:ChartArea Name="ChartArea1">
                    <AxisX Title="Months">
                        <MajorGrid LineColor="LightGray" LineDashStyle="Dot" />
                    </AxisX>
                    <AxisY Title="Number of Students">
                        <MajorGrid LineColor="LightGray" LineDashStyle="Dot" />
                    </AxisY>
                </asp:ChartArea>
            </ChartAreas>
        </asp:Chart>

        <asp:SqlDataSource ID="student" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>"
            SelectCommand="
                SELECT TO_CHAR(ENROLLMENT_DATE, 'MM-YYYY') AS ENROLL_MONTH,
                       COUNT(DISTINCT STUDENT_ID) AS STUDENT_COUNT
                FROM student_enrollment
                GROUP BY TO_CHAR(ENROLLMENT_DATE, 'MM-YYYY')
                ORDER BY TO_DATE(ENROLL_MONTH, 'MM-YYYY')
            ">
        </asp:SqlDataSource>
   <asp:Label ID="Label1" runat="server" Text="No of Students Enrolled in Months" style="display: block; text-align: center; font-weight: bold;"></asp:Label>


    <br />
    
    <div class="row">
         <div class="col-6">
        <asp:Chart ID="Chart2" runat="server" DataSourceID="SqlDataSource1" Height="366px" Width="589px">
            <Series>
                <asp:Series ChartType="Doughnut" Name="Series1" XValueMember="COURSE_TITLE" YValueMembers="NUM_ENROLLED_STUDENTS">
                </asp:Series>
            </Series>
            <ChartAreas>
                <asp:ChartArea Name="ChartArea1">
                </asp:ChartArea>
            </ChartAreas>
        </asp:Chart>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT se.COURSE_ID,
       COUNT(DISTINCT se.STUDENT_ID) AS NUM_ENROLLED_STUDENTS,
       c.COURSE_TITLE
        FROM student_enrollment se
        JOIN course c ON se.COURSE_ID = c.COURSE_ID
        GROUP BY se.COURSE_ID, c.COURSE_TITLE
        ORDER BY NUM_ENROLLED_STUDENTS DESC
        "></asp:SqlDataSource>
            
         
             <asp:Label ID="Label3" runat="server" Text="Course Enrolled" style="display: block; text-align: center; font-weight: bold;"></asp:Label>
            </div> 
        <div class="col-5">
             <asp:Chart ID="Chart3" runat="server" DataSourceID="SqlDataSource2" Height="363px" Width="526px">
             <Series>
                 <asp:Series Name="Series1" ChartType="Bar" XValueMember="LESSON_STATUS" YValueMembers="STATUS_COUNT">
                 </asp:Series>
             </Series>
             <ChartAreas>
                 <asp:ChartArea Name="ChartArea1">
                    <AxisX Title="Status">
                        <MajorGrid LineColor="LightGray" LineDashStyle="Dot" />
                    </AxisX>
                    <AxisY Title="Number of Students">
                        <MajorGrid LineColor="LightGray" LineDashStyle="Dot" />
                    </AxisY>
                </asp:ChartArea>
             </ChartAreas>
         </asp:Chart>

             <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT LESSON_STATUS,
                   COUNT(*) AS STATUS_COUNT
            FROM lesson_data
            GROUP BY LESSON_STATUS
            ORDER BY STATUS_COUNT DESC
            "></asp:SqlDataSource>
         <%--   <asp:Label ID="Label3" runat="server" Text="Label"> Students Status Count</asp:Label>--%>
             <asp:Label ID="Label4" runat="server" Text=" Students Status Count" style="display: block; text-align: center; font-weight: bold;"></asp:Label>
            </div>
    </div>
        </main>
</asp:Content>

