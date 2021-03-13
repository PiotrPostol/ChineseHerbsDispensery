<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMaster.Master" AutoEventWireup="true" MaintainScrollPositionOnPostback="true" CodeBehind="CompletedPrescriptions.aspx.cs" Inherits="Dispensery.CompletedPrescriptions" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    <script>
        function patientModal() {
            $('#patientModal').modal('show');
        }

    </script>
    <style>
        .modalTable {
            line-height: 1;
            font-size: 1rem;
            border: 0;
        }
    </style>

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
                            <i class="fa fa-archive fa-4x m-2 pt-md-2" aria-hidden="true" style="color: #9fc299;"></i>
                            <%--<img class="" src="Img/icon-specialty-granules.png" />--%>
                        </div>
                        <div class="col-md-10 d-flex">
                            <h3 class="title col-md-10  pt-4 " aria-hidden="true">Prescriptions - Completed</h3>

                        </div>
                    </div>

                </div>
                <div class="card-body">
                    <div class="container ">

                        <div class="col-md-8 mb-4 align-content-center">
                            <i class="fa fa-user-check fa-4x" aria-hidden="true" style="color: #9fc299;"></i>
                            <label class=" font-weight-bold" for="ddlPrescripion">Select Patient:</label>

                            <asp:DropDownList ID="ddlPatient" OnSelectedIndexChanged="ddlPatient_SelectedIndexChanged" AutoPostBack="true" AppendDataBoundItems="true" CssClass="form-control" runat="server" DataSourceID="SqlDataSource3" DataTextField="PatientName" DataValueField="PatientID">
                                <asp:ListItem Text="-- Select Patient --" Value="0" Selected="true"></asp:ListItem>
                            </asp:DropDownList>

                            <asp:SqlDataSource runat="server" ID="SqlDataSource3" ConnectionString='<%$ ConnectionStrings:conStr %>' SelectCommand="SELECT PatientID, PatientName + ' ' + PatientSurname AS PatientName FROM Patient ORDER BY PatientName"></asp:SqlDataSource>
                        </div>
                        <br />
                        <hr />
                        <%--                        -----------------Alert Success----------------%>
                        <div id="divAlertSuccess" class="form-row" runat="server" visible="false">
                            <div class="alert alert-success alert-dismissible col-md-12">
                                <div class="form-row m-2">
                                    <div class="col-2">
                                        <i class="fa fa-check-circle fa-4x" style="color: #9fc299;"></i>
                                    </div>
                                    <div class="col-8 justify-content-start ">

                                        <h4 class="font-weight-bold text-center ">
                                            <asp:Label ID="lblNoSelectionAlertHeader" CssClass="font-weight-bold" Text="Stock Adjusted Successfuly" runat="server"></asp:Label></h4>

                                    </div>
                                    <button type="button" class="close" data-dismiss="alert">&times;</button>
                                </div>
                            </div>
                        </div>
                        <div class="repeatRow row justify-content-center">
                            <div class="form-row justify-content-center ">
                                <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">
                                    <ItemTemplate>
                                        <div class="container  mb-4 ">
                                            <div class="table-responsive-xl">
                                                <table class="table">
                                                    <thead class="table-success">
                                                        <tr>
                                                            <th scope="col">Date</th>
                                                            <th scope="col">Patient Name</th>
                                                            <th scope="col">Invoice Number</th>
                                                            <th scope="col">Dispensing Method</th>
                                                            <th scope="col">Postage</th>
                                                            <th scope="col">Total Cost</th>
                                                            <th scope="col">Status</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <tr>

                                                            <td><%#Eval("DateCreated","{0:d/M/yy}") %></td>
                                                            <td><%#Eval("PatientName") %></td>
                                                            <td><%#Eval("FormulaRefNum") %></td>
                                                            <td><%#Eval("MethodOfAdminist") %></td>
                                                            <td><%#Eval("Postage") %></td>
                                                            <td><%#Eval("FormulaTotalCost", "{0:C}") %></td>
                                                            <td><%#Eval("PrescriptionStatus") %></td>
                                                            <asp:HiddenField ID="hdFormulaDate" runat="server" Value='<%#Eval("DateCreated","{0:D}")%>' />
                                                            <asp:HiddenField ID="hdFormulaRefNum" runat="server" Value='<%#Eval("FormulaRefNum")%>' />

                                                            <asp:HiddenField ID="hdFormulaTotalCost" runat="server" Value='<%#Eval("FormulaTotalCost")%>' />
                                                            <asp:HiddenField ID="hdMethodOdAdministrationCost" runat="server" Value='<%#Eval("MethodOfAdministCOST")%>' />
                                                            <asp:HiddenField ID="hdPostageFee" runat="server" Value='<%#Eval("PostageFee")%>' />

                                                            <asp:HiddenField ID="hdDispensingFee" runat="server" Value='<%#Eval("DispensingFee")%>' />
                                                            <asp:HiddenField ID="hdMethodOfAdministration" runat="server" Value='<%#Eval("MethodOfAdminist")%>' />
                                                            <asp:HiddenField ID="hdPostageMethod" runat="server" Value='<%#Eval("Postage")%>' />
                                                        </tr>
                                                    </tbody>

                                                </table>
                                            </div>
                                            <div class="row align-self-end  ">
                                                <div class="col-md-4  ">
                                                    <asp:Button ID="btnPatientView" CssClass="btn btn-outline-success btn-block" runat="server" Text="Patient Invoice" OnClick="btnPatientView_Click" />
                                                </div>
                                                <div class="col-md-4 ">
                                                    <asp:Button ID="btnPractitionerView" CssClass="btn btn-outline-info btn-block" runat="server" Text="Practitioner Invoice" OnClick="btnPractitionerView_Click" />
                                                </div>
                                                <%--<div class="col-md-4">
                                                    <asp:Button ID="btnChangeStatus" CssClass="btn btn-outline-danger " runat="server" Text="Change Status To Paid" OnClick="btnChangeStatus_Click" />
                                                </div>--%>
                                            </div>


                                        </div>

                                    </ItemTemplate>
                                </asp:Repeater>
                                <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:conStr %>' SelectCommand="SELECT DISTINCT PrescriptionCost.PrescriptionID, PrescriptionCost.FormulaRefNum, PrescriptionCost.FormulaTotalCost - PrescriptionCost.Discount AS FormulaTotalCost, PrescriptionCost.MethodOfAdminist, PrescriptionCost.MethodOfAdministCOST, PrescriptionCost.DispensingFee, PrescriptionCost.Postage, PrescriptionCost.PostageFee, PrescriptionCost.PrescriptionStatus, PrescriptionCost.DateCreated, Patient.PatientName + ' ' + Patient.PatientSurname AS PatientName, Patient.PatientID FROM Patient INNER JOIN PrescriptionMain ON Patient.PatientID = PrescriptionMain.PatientID INNER JOIN PrescriptionCost ON PrescriptionMain.FormulaRefNum = PrescriptionCost.FormulaRefNum WHERE (PrescriptionCost.PrescriptionStatus = N'Completed') AND (Patient.PatientID = @patientID) ORDER BY PrescriptionCost.PrescriptionID DESC">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="ddlPatient" PropertyName="SelectedValue" DefaultValue="0" Name="patientID"></asp:ControlParameter>
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </main>

    <!-- The Modal -->
    <div class="modal" id="patientModal">
        <div class="modal-dialog modal-lg">

            <div class="modal-content">

                <!-- Modal Header -->
                <div class="modal-header pb-md-0" style="background-image: url(Img/cropped-anthony-delanoix-222456.jpg); background-repeat: no-repeat; background-size: 100% 100%;">
                    <div class="container">
                        <div class="row align-items-start">
                            <div class="col-2">
                                <img src="Img/InvoiceLogo.png" />
                            </div>
                            <div class="col-10 text-right">
                                <h4 class="modal-title">Sligo Acupuncture Clinic</h4>
                                <p class="m-0">
                                    1, Wine Street, Sligo, Co. Sligo, F91RFK1</>
                                                            <p class="m-0">Fionuala O'Hare 0866037283</p>
                            </div>
                        </div>
                        <div class="row mt-3">
                            <div class="col-md-3 pr-md-0 align-self-end">
                                <h5>
                                    <label class=" mb-md-0">INVOICE NO.:</label></h5>
                            </div>
                            <div class="col-md-9 pr-ml-0 ml-md-0 pl-md-0 align-self-end">
                                <asp:Label ID="modallblFormulaRefNum" CssClass="font-weight-bold" runat="server" Text=""></asp:Label>
                            </div>

                        </div>
                        <div class="row">
                            <div class="col-md-3 pr-md-0 align-self-end">
                                <h5>
                                    <label class=" mb-md-0">DATE:</label></h5>
                            </div>
                            <div class="col-md-9 pr-ml-0 ml-md-0 pl-md-0 align-self-end">
                                <asp:Label ID="mdlblCurrentDate" CssClass="font-weight-bold" runat="server" Text=""></asp:Label>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Modal body -->
                <div class="modal-body">
                    <div class="container">
                        <div class="row">
                            <br />
                            <hr />
                            <div class="col-md-6">
                                <h5>BILL TO:</h5>
                                <table class="table table-sm modalTable table-borderless">
                                    <tbody>
                                        <tr>

                                            <td>Patient ID:<asp:Label ID="lblPatientID" runat="server" Text=""></asp:Label></td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:Label ID="lblPatientName" runat="server" Text=""></asp:Label></td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:Label ID="lblPatientAddress" runat="server" Text=""></asp:Label></td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:Label ID="lblPatientTown" runat="server" Text=""></asp:Label></td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:Label ID="lblPatientEirecode" runat="server" Text=""></asp:Label></td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:Label ID="lblPatientEmail" runat="server" Text=""></asp:Label></td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:Label ID="lblPatientPhone" runat="server" Text=""></asp:Label></td>
                                        </tr>
                                    </tbody>
                                </table>


                            </div>
                            <div class="col-md-6">
                                <h5>FOR:<asp:Label ID="lblDosageDays" CssClass="" runat="server"></asp:Label></h5>
                                <p style="font-size: 0.9rem;">Herbal Prescription: Granules</p>
                                <p></p>
                            </div>

                        </div>

                        <div id="Invoice" class="flex-row">
                            <%-- Patient Invoice --%>
                            <div id="patientInvoice" runat="server">
                                <div class="table-responsive-lg">
                                    <table class="table">
                                        <asp:GridView ID="GridView1" CssClass="table  table-hover table-striped table-bordered border-info rounded" runat="server" DataSourceID="SqlDataSource2" AutoGenerateColumns="False" Visible="false" ShowFooter="false">
                                            <%--GridLines="None" --%>
                                            <Columns>
                                                <asp:BoundField ControlStyle-CssClass="col-md-8" ControlStyle-Font-Size="X-Large" DataField="FormulaName" HeaderText="Item Description" SortExpression="FormulaName"></asp:BoundField>
                                                <asp:BoundField ControlStyle-CssClass="col-md-2" DataField="DosageDays" HeaderText="Quantity" SortExpression="DosageDays"></asp:BoundField>
                                                <asp:BoundField ControlStyle-CssClass="col-md-2" DataField="CostPerDay" HeaderText="Cost Per Day" ReadOnly="True" SortExpression="CostPerDay" DataFormatString="{0:C}"></asp:BoundField>
                                            </Columns>
                                            <HeaderStyle CssClass="" Font-Size="Larger" />
                                            <FooterStyle CssClass="font-weight-bold" Font-Size="Larger" />
                                        </asp:GridView>
                                        <asp:SqlDataSource runat="server" ID="SqlDataSource2" ConnectionString='<%$ ConnectionStrings:conStr %>' SelectCommand="SELECT DISTINCT PrescriptionMain.FormulaName, PrescriptionMain.DosageDays, CASE WHEN PrescriptionCost.FormulaTotalCost - PrescriptionCost.MethodOfAdministCOST - PrescriptionCost.PostageFee <= 0 THEN 0 WHEN PrescriptionCost.FormulaTotalCost - PrescriptionCost.MethodOfAdministCOST - PrescriptionCost.PostageFee >= 0 THEN (PrescriptionCost.FormulaTotalCost - PrescriptionCost.MethodOfAdministCOST - PrescriptionCost.PostageFee) / PrescriptionMain.DosageDays END AS CostPerDay FROM PrescriptionMain INNER JOIN PrescriptionCost ON PrescriptionMain.FormulaRefNum = PrescriptionCost.FormulaRefNum INNER JOIN AllHerbs ON PrescriptionMain.HerbRefNum = AllHerbs.RefNum WHERE (PrescriptionMain.FormulaRefNum = @formulaRefNum)">
                                            <SelectParameters>
                                                <asp:ControlParameter ControlID="modallblFormulaRefNum" PropertyName="Text" Name="formulaRefNum" DefaultValue="0"></asp:ControlParameter>
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                    </table>
                                </div>

                                <div class="form-row p-md-0 align-items-center">
                                    <div class="col-md-5">
                                    </div>
                                    <div class="col-md-3 ">
                                        <h5 class="font-weight-bold">Subtotal</h5>
                                    </div>
                                    <div class="col-md-4 pl-0 ">
                                        <div class="border border-bottom-0" style="border-color: #dee2e6; padding: 0.75rem;">
                                            <asp:Label ID="lblSubtotal" CssClass="pt-md-5 pb-md-5 mt-md-2 mb-md-2" runat="server" Text=""></asp:Label>
                                        </div>
                                    </div>

                                </div>
                                <div class="form-row p-md-0 align-items-center">
                                    <div class="col-md-5">
                                    </div>
                                    <div class="col-md-3 ">
                                        <h5 class="font-weight-bold ">Administration Fee</h5>
                                    </div>
                                    <div class="col-md-4 pl-0 ">
                                        <div class="border border-bottom-0" style="border-color: #dee2e6; padding: 0.75rem;">
                                            <asp:Label ID="lblDispensingFee" CssClass="pt-md-5 pb-md-5  mt-md-2 mb-md-2" runat="server" Text=""></asp:Label>
                                        </div>
                                    </div>

                                </div>
                                <div class="form-row p-md-0  align-items-center">
                                    <div class="col-md-5">
                                    </div>
                                    <div class="col-md-3">
                                        <h5 class="font-weight-bold  ">P&P</h5>
                                    </div>
                                    <div class="col-md-4 pl-0 ">
                                        <div class="border border-bottom-0" style="border-color: #dee2e6; padding: 0.75rem;">
                                            <asp:Label ID="lblPostageFee" CssClass="pt-md-5 pb-md-5 mt-md-2 mb-md-2" runat="server" Text=""></asp:Label>
                                        </div>
                                    </div>

                                </div>
                                  <div id="divDiscount" runat="server" visible="false" class="form-row p-md-0 align-items-center">
                                    <div class="col-md-5">
                                    </div>
                                    <div class="col-md-3 ">
                                        <h5 class="font-weight-bold">Discount</h5>
                                    </div>
                                    <div class="col-md-4 pl-0 ">
                                        <div class="border border-bottom-0" style="border-color: #dee2e6; padding: 0.75rem;">
                                            <asp:Label ID="lblDiscount"  CssClass="pt-md-5 pb-md-5 mt-md-2 mb-md-2" runat="server" Text=""></asp:Label>
                                        </div>
                                    </div>

                                </div>
                                <div class="form-row p-md-0  align-items-center">
                                    <div class="col-md-5">
                                    </div>
                                    <div class="col-md-3">
                                        <h4 class="font-weight-bold ">Total Cost</h4>
                                    </div>
                                    <div class="col-md-4 pl-0 ">
                                        <div class="border " style="border-color: #dee2e6; padding: 0.75rem; background-color: #f2f2f2;">
                                            <h4>
                                                <asp:Label ID="lblTotalCost" CssClass=" font-weight-bold pb-md-5 mt-md-2 mb-md-2" runat="server" Text=""></asp:Label></h4>
                                        </div>
                                    </div>
                                </div>
                                <br />
                                <hr />
                                <div class="row">
                                    <div class="col-md-9">
                                        <p class=" font-italic" style="font-size: 0.75rem; color: red;">Please note that prescriptions are formulated specifically to address your clinical presentation and cannot be refunded or exchanged once produced. </p>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-9 font-italic" style="font-size: 0.75rem;">
                                        <p class="pb-0 mb-0 ">If you have any questions concerning this invoice, use the following contact:</p>
                                        <asp:Label CssClass="font-weight-bold " ID="lblPractitionerDetails" runat="server"></asp:Label>
                                    </div>
                                </div>

                           </div>
                            <div id="practitionerInvoice" runat="server">
                                <%-- Practitoner Invoice --%>
                                <asp:GridView ID="GridView2" ShowFooter="true" OnRowDataBound="GridView2_RowDataBound1" CssClass="table  table-hover table-striped table-bordered border-info rounded" runat="server" DataSourceID="SqlDataSource4" AutoGenerateColumns="False" Visible="false">
                                    <%--GridLines="None" --%>
                                    <Columns>
                                        <asp:BoundField ControlStyle-CssClass="col-md-8" ControlStyle-Font-Size="X-Large" DataField="HerbBatchNum" HeaderText="Batch" SortExpression="HerbBatchNum"></asp:BoundField>
                                        <asp:BoundField ControlStyle-CssClass="col-md-2" DataField="HerbName" HeaderText="Name" SortExpression="HerbName"></asp:BoundField>
                                        <asp:BoundField ControlStyle-CssClass="col-md-2" DataField="DailyDosage" HeaderText="Daily Dosage (g)" ReadOnly="True" SortExpression="DailyDosage" DataFormatString="{0:f}"></asp:BoundField>
                                        <asp:BoundField DataField="GranulesQuantity" HeaderText="Total Dosage (g)" SortExpression="GranulesQuantity"></asp:BoundField>
                                        <asp:BoundField DataField="SellPrice" HeaderText="Unit Cost" SortExpression="SellPrice" DataFormatString="{0:C4}"></asp:BoundField>
                                        <asp:BoundField DataField="Subtotal" HeaderText="Total Cost" SortExpression="Subtotal" DataFormatString="{0:C}"></asp:BoundField>
                                    </Columns>
                                    <HeaderStyle CssClass="" Font-Size="Larger" />
                                    <FooterStyle CssClass=" alert-info font-weight-bold" BackColor="#dee2e6" Font-Italic="true" />
                                </asp:GridView>
                                <asp:SqlDataSource runat="server" ID="SqlDataSource4" ConnectionString='<%$ ConnectionStrings:conStr %>' SelectCommand="SELECT PrescriptionMain.HerbBatchNum, AllHerbs.HerbName, PrescriptionMain.GranulesQuantity / PrescriptionMain.DosageDays AS DailyDosage, PrescriptionMain.GranulesQuantity, PrescriptionMain.SellPrice, PrescriptionMain.Subtotal FROM PrescriptionMain INNER JOIN AllHerbs ON PrescriptionMain.HerbRefNum = AllHerbs.RefNum WHERE (PrescriptionMain.FormulaRefNum = @formulaRefNum)">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="modallblFormulaRefNum" PropertyName="Text" Name="formulaRefNum" DefaultValue="0"></asp:ControlParameter>
                                    </SelectParameters>
                                </asp:SqlDataSource>
                                <%--                                Dispensing Fee--%>

                                <hr />
                                <div class="form-row p-md-0 align-items-center">
                                    <div class="col-md-3 ">
                                        <h5 class="font-weight-bold ">Dispensing Fee:</h5>
                                    </div>
                                    <div class="col-md-5">
                                    </div>

                                    <div class="col-md-4 pl-0 ">
                                        <div class="border border-bottom-0" style="border-color: #dee2e6; padding: 0.75rem;">
                                            <asp:Label ID="lblPracDispensingFee" CssClass="pt-md-5 pb-md-5  mt-md-2 mb-md-2" runat="server" Text="0"></asp:Label>
                                        </div>
                                    </div>

                                </div>
                                <%--                                Administration Method--%>

                                <div class="form-row p-md-0 align-items-center">
                                    <div class="col-md-4 ">
                                        <h5 class="font-weight-bold ">Administ. Method:</h5>
                                    </div>
                                    <div class="col-md-4">
                                        <h5>
                                            <asp:Label ID="lblPracAdminiMethod" CssClass="font-weight-bold font-italic " runat="server" Text="Label"></asp:Label></h5>
                                    </div>

                                    <div class="col-md-4 pl-0 ">
                                        <div class="border border-bottom-0" style="border-color: #dee2e6; padding: 0.75rem;">
                                            <asp:Label ID="lblPracAdminiCost" CssClass="pt-md-5 pb-md-5  mt-md-2 mb-md-2" runat="server" Text="0"></asp:Label>
                                        </div>
                                    </div>

                                </div>
                                <%--                                P&P--%>
                                <div class="form-row p-md-0  align-items-center">

                                    <div class="col-md-4">
                                        <h5 class="font-weight-bold  ">Postage & Package:</h5>
                                    </div>
                                    <div class="col-md-4">
                                        <h5>
                                            <asp:Label ID="lblPracPostageMethod" CssClass="font-weight-bold font-italic " runat="server" Text="Postage"></asp:Label></h5>
                                    </div>
                                    <div class="col-md-4 pl-0 ">
                                        <div class="border border-bottom-0" style="border-color: #dee2e6; padding: 0.75rem;">
                                            <asp:Label ID="lblPracPostageCost" CssClass="pt-md-5 pb-md-5 mt-md-2 mb-md-2" runat="server" Text="0"></asp:Label>
                                        </div>
                                    </div>

                                </div>
<%--                                ----------Discount-----------------%>
                                 <div id="divPracDiscount" runat="server" visible="false" class="form-row p-md-0  align-items-center">

                                    <div class="col-md-4">
                                        <h5 class="font-weight-bold  ">Discount:</h5>
                                    </div>
                                    <div class="col-md-4">
                                        <h6><asp:Label CssClass="font-italic" ID="lbldiscountReason" runat="server"></asp:Label></h6>
                                    </div>
                                    <div class="col-md-4 pl-0 ">
                                        <div class="border border-bottom-0" style="border-color: #dee2e6; padding: 0.75rem;">
                                            <asp:Label ID="lblPracDiscount" CssClass="pt-md-5 pb-md-5 mt-md-2 mb-md-2" runat="server" Text="0"></asp:Label>
                                        </div>
                                    </div>

                                </div>
                                <%--                                Total Cost--%>
                                <div class="form-row p-md-0  align-items-center">

                                    <div class="col-md-4">
                                        <h4 class="font-weight-bold ">Total Cost</h4>
                                    </div>
                                    <div class="col-md-4">
                                    </div>
                                    <div class="col-md-4 pl-0 ">
                                        <div class="border " style="border-color: #dee2e6; padding: 0.75rem; background-color: #f2f2f2;">
                                            <h4>
                                                <asp:Label ID="lblPracTotalCost" CssClass=" font-weight-bold pb-md-5 mt-md-2 mb-md-2" runat="server" Text=""></asp:Label></h4>
                                        </div>
                                    </div>
                                </div>
                                <br />
                                <hr />
                                <div class="row">
                                    <div class="col-md-9">
                                        <p class=" font-italic" style="font-size: 0.75rem; color: red;">Note that prescriptions are formulated specifically to address the patient's clinical presentation and cannot be refunded or exchanged once produced. </p>
                                    </div>
                                </div>
                                <%--                                Practitioner Details--%>
                                <div class="row">
                                    <div class="col-md-9 font-italic" style="font-size: 0.75rem;">
                                        <p class="pb-0 mb-0 ">If you have any questions concerning this invoice, use the following contact:</p>
                                        <p class="" style="color: red;">
                                            <asp:Label CssClass="font-weight-bold " ID="lblPractitionerDetails2" runat="server"></asp:Label></p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
        <%--        </div>--%>

                <!-- Modal footer -->
                <div class="modal-footer">
                    <div class="modalFooter">
                        <a href="javascript:window.print()" class="btn btn-primary pull-right">Print</a>

                        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                    </div>

                </div>

            </div>


        </div>
    </div>
</div>



</asp:Content>
