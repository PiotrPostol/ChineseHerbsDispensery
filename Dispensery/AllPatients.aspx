<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMaster.Master" AutoEventWireup="true" MaintainScrollPositionOnPostback="true" CodeBehind="AllPatients.aspx.cs" Inherits="Dispensery.AllPatients" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    <script type='text/javascript'>
        function openModal() {
            $('[id*=myModal]').modal('show');
        }
    </script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="UserInfo" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="contentBody" runat="server">
    <main class="page-content">
        <div class="container-fluid">
            <div class="card bg-light p-1 shadow rounded mb-lg-4 mb-md-2 mb-sm-2 ">
                <div class="card-header p-1 rounded">
                    <div class="row container-fluid ">
                        <div class="col-md-2">
                            <i class="fa  fa-address-book fa-4x pt-md-2 pb-md-2" aria-hidden="true" style="color: #9fc299;"></i>
                            <%-- <img class="" src="Img/icon-specialty-granules.png" />--%>
                        </div>
                        <div class="col-md-10 d-flex">
                            <h2 class="myFont title col-md-10   pt-md-4 mt-2 align-content-center" aria-hidden="true">All Patients</h2>
                        </div>
                    </div>
                </div>
                <div class="card-body">
                    <div class="container ">
                        <div class="line rounded p-4 col-md-12 justify-content-md-center justify-content-lg-center ">
                            <%--            ------------------Alert Success--%>
                            <div id="divAlertSuccess" class="form-row" runat="server" visible="false">
                                <div class="alert alert-success alert-dismissible col-md-12">
                                    <div class="form-row m-2">
                                        <div class="col-2">
                                            <i class="fa fa-check-circle fa-4x" style="color: #9fc299;"></i>
                                        </div>
                                        <div class="col-8 justify-content-start ">

                                            <h4 class="font-weight-bold text-center ">
                                                <asp:Label ID="lblNoSelectionAlertHeader" CssClass="font-weight-bold" Text="Patient Added Successfuly" runat="server"></asp:Label></h4>

                                        </div>
                                        <button type="button" class="close" data-dismiss="alert">&times;</button>
                                    </div>




                                </div>
                            </div>


                            <div class="form-row justify-content-center">
                                <div class="table-responsive-lg col-md-12 col-lg-12">
                                    <asp:GridView ID="grvShort" CssClass="table  table-hover table-striped" ShowFooter="true" GridLines="None" AutoGenerateColumns="False" runat="server" DataKeyNames="PatientID" DataSourceID="SqlDataSource1">

                                        <Columns>
                                            <asp:TemplateField HeaderText="ID">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblPatientID" runat="server" Text='<%# Eval("PatientID") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Name">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblPatientName" runat="server" Text='<%# Eval("PatientName") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Surname">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblPatientSurname" runat="server" Text='<%# Eval("PatientSurname") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Phone Number">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblPhoneNumber" runat="server" Text='<%# Eval("PatientPhoneNum") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Email">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblPatientEmail" runat="server" Text='<%# Eval("PatientEmail") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <%--                                            <asp:BoundField DataField="PatientID" HeaderText="ID" ReadOnly="True" InsertVisible="False" SortExpression="PatientID"></asp:BoundField>
                                            <asp:BoundField DataField="PatientName" HeaderText="Name" SortExpression="PatientName"></asp:BoundField>
                                            <asp:BoundField DataField="PatientSurname" HeaderText="Surname" SortExpression="PatientSurname"></asp:BoundField>
                                            <asp:BoundField DataField="PatientPhoneNum" HeaderText="Phone Number" SortExpression="PatientPhoneNum"></asp:BoundField>
                                            <asp:BoundField DataField="PatientEmail" HeaderText="Email Address" SortExpression="PatientEmail"></asp:BoundField>--%>
                                            <%-- <asp:CommandField ShowDeleteButton="True"></asp:CommandField>--%>
                                            <asp:TemplateField HeaderText="">
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="btnShowDetails" runat="server" Text="Show Details" CssClass="btn btn-info"
                                                        OnClick="btnShowDetails_Click"></asp:LinkButton>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                    </asp:GridView>

                                    <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConflictDetection="CompareAllValues" ConnectionString='<%$ ConnectionStrings:conStr %>' DeleteCommand="DELETE FROM [Patient] WHERE [PatientID] = @original_PatientID AND (([PatientName] = @original_PatientName) OR ([PatientName] IS NULL AND @original_PatientName IS NULL)) AND (([PatientSurname] = @original_PatientSurname) OR ([PatientSurname] IS NULL AND @original_PatientSurname IS NULL)) AND (([PatientPhoneNum] = @original_PatientPhoneNum) OR ([PatientPhoneNum] IS NULL AND @original_PatientPhoneNum IS NULL)) AND (([PatientEmail] = @original_PatientEmail) OR ([PatientEmail] IS NULL AND @original_PatientEmail IS NULL))" InsertCommand="INSERT INTO [Patient] ([PatientName], [PatientSurname], [PatientPhoneNum], [PatientEmail]) VALUES (@PatientName, @PatientSurname, @PatientPhoneNum, @PatientEmail)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT [PatientID], [PatientName], [PatientSurname], [PatientPhoneNum], [PatientEmail] FROM [Patient] ORDER BY [PatientSurname], [PatientName]" UpdateCommand="UPDATE [Patient] SET [PatientName] = @PatientName, [PatientSurname] = @PatientSurname, [PatientPhoneNum] = @PatientPhoneNum, [PatientEmail] = @PatientEmail WHERE [PatientID] = @original_PatientID AND (([PatientName] = @original_PatientName) OR ([PatientName] IS NULL AND @original_PatientName IS NULL)) AND (([PatientSurname] = @original_PatientSurname) OR ([PatientSurname] IS NULL AND @original_PatientSurname IS NULL)) AND (([PatientPhoneNum] = @original_PatientPhoneNum) OR ([PatientPhoneNum] IS NULL AND @original_PatientPhoneNum IS NULL)) AND (([PatientEmail] = @original_PatientEmail) OR ([PatientEmail] IS NULL AND @original_PatientEmail IS NULL))">
                                        <DeleteParameters>
                                            <asp:Parameter Name="original_PatientID" Type="Int32"></asp:Parameter>
                                            <asp:Parameter Name="original_PatientName" Type="String"></asp:Parameter>
                                            <asp:Parameter Name="original_PatientSurname" Type="String"></asp:Parameter>
                                            <asp:Parameter Name="original_PatientPhoneNum" Type="String"></asp:Parameter>
                                            <asp:Parameter Name="original_PatientEmail" Type="String"></asp:Parameter>
                                        </DeleteParameters>
                                        <InsertParameters>
                                            <asp:Parameter Name="PatientName" Type="String"></asp:Parameter>
                                            <asp:Parameter Name="PatientSurname" Type="String"></asp:Parameter>
                                            <asp:Parameter Name="PatientPhoneNum" Type="String"></asp:Parameter>
                                            <asp:Parameter Name="PatientEmail" Type="String"></asp:Parameter>
                                        </InsertParameters>
                                        <UpdateParameters>
                                            <asp:Parameter Name="PatientName" Type="String"></asp:Parameter>
                                            <asp:Parameter Name="PatientSurname" Type="String"></asp:Parameter>
                                            <asp:Parameter Name="PatientPhoneNum" Type="String"></asp:Parameter>
                                            <asp:Parameter Name="PatientEmail" Type="String"></asp:Parameter>
                                            <asp:Parameter Name="original_PatientID" Type="Int32"></asp:Parameter>
                                            <asp:Parameter Name="original_PatientName" Type="String"></asp:Parameter>
                                            <asp:Parameter Name="original_PatientSurname" Type="String"></asp:Parameter>
                                            <asp:Parameter Name="original_PatientPhoneNum" Type="String"></asp:Parameter>
                                            <asp:Parameter Name="original_PatientEmail" Type="String"></asp:Parameter>
                                        </UpdateParameters>
                                    </asp:SqlDataSource>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </main>
    <div class="modal fade" id="myModal" role="dialog">
        <div class="modal-dialog modal-lg">
            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header" style="background-color: #f0f1f2;">
                    <div class="row align-items-center">
                        <i class="fa fa-id-card-alt fa-4x p-md-3 " aria-hidden="true" style="color: #9fc299;"></i>
                        <h2 class=" p-3 " style="color: #2c3034;">
                            <asp:Label ID="lblPatientName" CssClass="font-weight-bold" runat="server" Text=""></asp:Label></h2>
                        <asp:HiddenField ID="hdPatientID" runat="server" Value='' />
                    </div>
                </div>
                <div class="modal-body">
                    <ul class="nav nav-tabs nav-justified">
                        <li class="nav-item">
                            <a class="nav-link  active font-weight-bold" data-toggle="tab" href="#details">Patient Details</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link font-weight-bold" data-toggle="tab" onloadeddata="ShowData" runat="server" href="#prescriptionHistory">Prescription History</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link font-weight-bold" data-toggle="tab" href="#medicalCondition">Medical Conditions</a>
                        </li>
                        <li class="nav-item ">
                            <a class="nav-link font-weight-bold " data-toggle="tab" href="#medication">Medication</a>
                        </li>
                    </ul>
                    <div class="tab-content">

                        <%--            --------------Patient Details-------------%>
                        <div class="tab-pane container active" id="details">
                            <div class="form-row mt-4">
                                <div class="form-group col-md-6">
                                    <label for="tbxPatientName">Name:</label>
                                    <asp:TextBox ID="tbxPatientName" Enabled="false" CssClass="form-control" runat="server" required="true"></asp:TextBox>
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="tbxPatientSurname">Surname:</label>
                                    <asp:TextBox ID="tbxPatientSurname" Enabled="false" CssClass="form-control" runat="server" required="true"></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="tbxPatientAddress">Address:</label>
                                <asp:TextBox ID="tbxPatientAddress" Enabled="false" CssClass="form-control" runat="server" required="true"></asp:TextBox>
                            </div>
                            <div class="form-row">
                                <div class="form-group col-md-6">
                                    <label for="tbxPatientCityTown">City/Town:</label>
                                    <asp:TextBox ID="tbxPatientCityTown" Enabled="false" CssClass="form-control" runat="server" required="true"></asp:TextBox>
                                </div>
                                <div class="form-group col-md-4">
                                    <label for="inputState">County:</label>
                                    <asp:TextBox ID="TextBox1" Enabled="false" CssClass="form-control" runat="server" required="true"></asp:TextBox>

                                </div>
                                <div class="form-group col-md-2">
                                    <label for="tbxEirecode">Eirecode:</label>
                                    <asp:TextBox ID="tbxEirecode" Enabled="false" CssClass="form-control" runat="server"></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-row">
                                <div class="form-group col-md-6">
                                    <label for="tbxPatientPhoneNumber">Phone Number:</label>
                                    <asp:TextBox ID="tbxPatientPhoneNumber" Enabled="false" CssClass="form-control" runat="server" required="true"></asp:TextBox>
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="tbxPatientEmail">Email:</label>
                                    <asp:TextBox ID="tbxPatientEmail" Enabled="false" CssClass="form-control" runat="server" TextMode="Email"></asp:TextBox>
                                </div>
                            </div>

                        </div>
                        <%--                        -------------Prescriptions History------------%>
                        <div class="tab-pane container fade" id="prescriptionHistory">
                            <div class="table-responsive-lg col-md-12 col-lg-12">
                                <asp:GridView ID="GridView2" CssClass="table  table-hover table-striped" ShowFooter="False" GridLines="None" AutoGenerateColumns="False" runat="server">
                                    <Columns>
                                        <asp:BoundField DataField="DateCreated" HeaderText="Date" SortExpression="DateCreated" DataFormatString="{0:dd/MM/yy}"></asp:BoundField>
                                        <asp:BoundField DataField="FormulaRefNum" HeaderText="Formula Ref. No." SortExpression="FormulaRefNum"></asp:BoundField>
                                        <asp:BoundField DataField="FormulaName" HeaderText="Formula Name" SortExpression="FormulaName"></asp:BoundField>
                                        <asp:BoundField DataField="FormulaTotalCost" HeaderText="Formula Total Cost" SortExpression="FormulaTotalCost" DataFormatString="{0:C}"></asp:BoundField>
                                        <asp:BoundField DataField="PrescriptionStatus" HeaderText="Status" SortExpression="PrescriptionStatus"></asp:BoundField>
                                        <asp:TemplateField HeaderText="">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="btnModalShowDatails" runat="server" Text="Show Details" CssClass="btn btn-info"
                                                    OnClick="btnModalShowDatails_Click"></asp:LinkButton>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>
                            </div>
                        </div>
                        <div class="tab-pane container fade" id="medicalCondition">...</div>
                        <div class="tab-pane container fade" id="medication">...</div>
                    </div>
                </div>
                <div class="modal-footer">

                    <button type="button" class="btn btn-danger" data-dismiss="modal">
                        Close</button>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
