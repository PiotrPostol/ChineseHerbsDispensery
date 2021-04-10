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
                            <h2 class="col-md-10 font-weight-bold   pt-md-2 mt-2 align-content-center" aria-hidden="true" style="color: #9fc299;">All Patients</h2>
                        </div>
                    </div>
                </div>
                <div class="card-body">
                    <div class="container">
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
                                    <asp:GridView ID="grvShort" OnRowEditing="grvShort_RowEditing" CssClass="table  table-hover table-striped" runat="server" GridLines="None" AutoGenerateColumns="False" DataKeyNames="PatientID" DataSourceID="SqlDataSource1">
                                        <Columns>
                                            <asp:TemplateField ShowHeader="True" HeaderText="Edit/Delete">
                                                <EditItemTemplate>
                                                    <asp:LinkButton runat="server" Text="Update" CommandName="Update" CausesValidation="True" ID="LinkButton1"></asp:LinkButton>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:LinkButton runat="server" Text="" CssClass="btn btn-outline-success" CommandName="Edit" CausesValidation="False" ID="LinkButton1"><i class="fas fa-pencil-alt"></i></asp:LinkButton>&nbsp;<asp:LinkButton runat="server" Text="Delete" CssClass="btn btn-outline-danger" CommandName="Delete" CausesValidation="False" ID="LinkButton2"><i class="fas fa-trash-alt"></i></asp:LinkButton>
                                                </ItemTemplate>
                                            </asp:TemplateField>

                                            <asp:BoundField DataField="PatientID" HeaderText="ID" ReadOnly="True" InsertVisible="False" SortExpression="PatientID"></asp:BoundField>
                                            <asp:TemplateField HeaderText="Name" SortExpression="PatientName">
                                                <EditItemTemplate>
                                                    <asp:TextBox runat="server" Text='<%# Bind("PatientName") %>' ID="TextBox1"></asp:TextBox>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Label runat="server" Text='<%# Bind("PatientName") %>' ID="lblPatientName"></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Surname" SortExpression="PatientSurname">
                                                <EditItemTemplate>
                                                    <asp:TextBox runat="server" Text='<%# Bind("PatientSurname") %>' ID="TextBox2"></asp:TextBox>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Label runat="server" Text='<%# Bind("PatientSurname") %>' ID="lblPatientSurname"></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Phone Number" SortExpression="PatientPhoneNum">
                                                <EditItemTemplate>
                                                    <asp:TextBox runat="server" Text='<%# Bind("PatientPhoneNum") %>' ID="TextBox3"></asp:TextBox>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Label runat="server" Text='<%# Bind("PatientPhoneNum") %>' ID="Label3"></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Email" SortExpression="PatientEmail">
                                                <EditItemTemplate>
                                                    <asp:TextBox runat="server" Text='<%# Bind("PatientEmail") %>' ID="TextBox4"></asp:TextBox>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Label runat="server" Text='<%# Bind("PatientEmail") %>' ID="Label4"></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>

                                            <asp:TemplateField>
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="btnShowDetails" runat="server" Text="Show Details" CssClass="btn btn-info"
                                                        OnClick="btnShowDetails_Click"></asp:LinkButton>


                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                    </asp:GridView>
                                    <%--           <asp:GridView ID="grvShort" OnRowEditing="grvShort_RowEditing" CssClass="table  table-hover table-striped" ShowFooter="true" GridLines="None" AutoGenerateColumns="False" runat="server" DataKeyNames="PatientID" DataSourceID="SqlDataSource1">

                                        <Columns>
                                          
                                            <asp:BoundField DataField="PatientID" HeaderText="PatientID" InsertVisible="False" ReadOnly="True" SortExpression="PatientID"></asp:BoundField>
                                            <asp:BoundField DataField="PatientName" HeaderText="PatientName" SortExpression="PatientName"></asp:BoundField>
                                            <asp:BoundField DataField="PatientSurname" HeaderText="PatientSurname" SortExpression="PatientSurname"></asp:BoundField>

                                            <asp:DynamicField HeaderText="PatientEmail" DataField="PatientEmail"></asp:DynamicField>
                                            <asp:DynamicField HeaderText="PatientPhoneNum" DataField="PatientPhoneNum"></asp:DynamicField>
                                            <asp:TemplateField>
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="btnShowDetails" runat="server" Text="Show Details" CssClass="btn btn-info"
                                                        OnClick="btnShowDetails_Click"></asp:LinkButton>


                                                </ItemTemplate>
                                            </asp:TemplateField>
                                         
                                            <asp:TemplateField HeaderText="" ShowHeader="False">
                                                <EditItemTemplate>
                                                    <asp:LinkButton runat="server" Text="Update" CommandName="Update" CausesValidation="True" ID="LinkButton1"></asp:LinkButton>

                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="grvShortBtnEdit" runat="server" Text="Edit" CausesValidation="False" CommandName="Edit"></asp:LinkButton>
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
                                    </asp:SqlDataSource>--%>
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
