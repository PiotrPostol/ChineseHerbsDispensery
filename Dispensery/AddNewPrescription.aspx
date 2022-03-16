<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMaster.Master" AutoEventWireup="true" MaintainScrollPositionOnPostback="true" CodeBehind="AddNewPrescription.aspx.cs" Inherits="Dispensery.AddNewPrescription" %>

<%--<%@ MasterType VirtualPath="~/SiteMaster.Master" %>  --%>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    <script>

        function EnterEvent(e) {
            if (e.keyCode == 13) {
                __doPostBack('<%=btnAddToTable.UniqueID%>', "");
            }
        }

        $(document).ready(function () {

            $('input[type=text]').each(function () {
                $(this).val('');
            });

            $('.Herb').autocomplete({
                source: 'GetHerbsNameInStockAutocomplete.ashx'
            });

            $('.NumbersOnly').keypress(function (event) {
                return isNumber(event, this)
            });

            function isNumber(evt, element) {

                var charCode = (evt.which) ? evt.which : event.keyCode

                if (
                    (charCode != 45 || $(element).val().indexOf('-') != -1) &&      // “-” CHECK MINUS, AND ONLY ONE.
                    (charCode != 46 || $(element).val().indexOf('.') != -1) &&      // “.” CHECK DOT, AND ONLY ONE.
                    (charCode < 48 || charCode > 57))
                    return false;


            }
            $('[data-toggle="tooltip"]').tooltip();

            $(window).scroll(function () {
                $(".slideanim").each(function () {
                    var pos = $(this).offset().top;

                    var winTop = $(window).scrollTop();
                    if (pos < winTop + 600) {
                        $(this).addClass("slide");
                    }
                });
            });
            function ShowPopup(title, body) {
                $("#MyPopup .modal-title").html(title);
                $("#MyPopup .modal-body").html(body);
                $("#MyPopup").modal("show");
            }

        });

    </script>
    <style>
        .slideanim {
            visibility: hidden;
        }

        .radiostyle {
            height: auto;
        }

            .radiostyle label {
                margin-left: 3px !important;
                margin-right: 10px !important;
            }

        input[type="radio"] {
            margin: 4px 4px 4px 4px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="UserInfo" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="contentBody" runat="server">
    <main class="page-content">
        <div class="container-fluid">
            <div class="card card-body bg-light p-1 shadow rounded mb-lg-4 mb-md-2 mb-sm-2 ">
                <div class="row container-fluid ">
                    <div class="col-lg-2 col-md-4">
                        <img class="" src="Img/icon-specialty-granules.png" />
                    </div>
                    <div class="col-md-10 d-flex">
                            <h1 class="col-md-10 font-weight-bold   pt-md-2 mt-2 align-content-center"aria-hidden="true" style="color: #9fc299;">Create New Prescription - Granules</h1>
                        </div>
                </div>
            </div>
            <%--            Main Card--%>

            <%--                        Header--%>
            <div class="card bg-light p-1 shadow rounded mb-lg-4 mb-md-2 mb-sm-2">
                <div class="card-header p-1 rounded">
                    <div class="row container justify-content-left">

                        <i class="fa fa-pencil-alt fa-3x pl-3 pr-2" style="color: #9fc299;"></i>
                    </div>
                </div>

                <%--                Body--%>
                <div class="card-body">
                    <div class="container ">
                        <div class="repeatRow row justify-content-center">

                            <div id="divAlertError" class="form-row" runat="server" visible="false">
                                <div class="alert alert-danger alert-dismissible col-md-12">
                                    <div class="form-row m-2">
                                        <div class="col-2">
                                            <i class="fa fa-exclamation-triangle fa-4x" style="color: red;"></i>
                                        </div>
                                        <div class="col-8 justify-content-start ">

                                            <h4 class="font-weight-bold text-center ">
                                                <asp:Label ID="lblError" CssClass="font-weight-bold" Text="" runat="server"></asp:Label></h4>

                                        </div>
                                        <button type="button" class="close" data-dismiss="alert">&times;</button>
                                    </div>
                                </div>
                            </div>
<%--                            ---------------------alert Success--------------------------------%>
                              <div id="divAlertSuccess" class="form-row" runat="server" visible="false">
                                <div class="alert alert-success alert-dismissible col-md-12">
                                    <div class="form-row m-2">
                                        <div class="col-2">
                                            <i class="fa fa-check-circle fa-4x" style="color: #9fc299;"></i>
                                        </div>
                                        <div class="col-8 justify-content-start ">

                                            <h4 class="font-weight-bold text-center ">
                                                <asp:Label ID="Label2" CssClass="font-weight-bold" Text="Stock Adjusted Successfuly" runat="server"></asp:Label></h4>

                                        </div>
                                        <button type="button" class="close" data-dismiss="alert">&times;</button>
                                    </div>
                                </div>
                            </div>

                            <div class="line rounded p-4 col-md-12 col-lg-9 ">
                                <div class="form-row ">
                                    <span class=" font-weight-bolder ">Formula Details:</span>
                                </div>
                                <br />
                                <div class="form-group">
                                    <div class="form-row">
                                        <div class="col-md-2 text-center">
                                            <i class="fa fa-user-circle fa-3x align-bottom" aria-hidden="true" style="color: #9fc299;"></i>
                                        </div>
                                        <div class="col-md-8 mb-4">
                                            <label class=" font-weight-bold " for="ddlPrescripion">Patient:</label>
                                            <asp:DropDownList ID="ddlPatient" OnSelectedIndexChanged="ddlPatient_SelectedIndexChanged" AppendDataBoundItems="true" CssClass="form-control" runat="server" DataSourceID="SqlDataSource4" DataTextField="PatientName" DataValueField="PatientID">
                                                <asp:ListItem Text="-- Select Patient --" Value="0.1" Selected="true"></asp:ListItem>
                                            </asp:DropDownList>

                                            <asp:SqlDataSource runat="server" ID="SqlDataSource4" ConnectionString='<%$ ConnectionStrings:conStr %>' SelectCommand="SELECT PatientID, PatientName + ' ' + PatientSurname AS PatientName FROM Patient ORDER BY PatientName"></asp:SqlDataSource>
                                            <div class="col-md-9 p-2 border border-success rounded  " id="divPatient" runat="server">
                                                <asp:Label ID="lblPatient" CssClass="  font-weight-bold" runat="server" Visible="false"></asp:Label>
                                            </div>
                                        </div>
                                        <div class="col-md-2 text-right mb-4  align-self-end ">
                                            <asp:Button ID="btnAddNewPatient" CssClass="btn col-md-12 btn-success" runat="server" Text="Add Patient" OnClick="btnAddNewPatient_Click" />
                                        </div>
                                    </div>
                                </div>
                                <br />
                                <hr />
                                <div class="form-group">
                                    <div class="row">
                                        <div class="col-md-2  text-center">
                                            <i class="fas fa-prescription fa-3x align-middle" aria-hidden="true" style="color: #9fc299;"></i>
                                        </div>
                                        <div class="form-group col-md-4 pl-3">
                                            <label class=" font-weight-bold " for="tbxHerb">Prescription Name:</label>
                                            <asp:TextBox ID="tbxFormulaName" OnTextChanged="tbxFormulaName_TextChanged" class="form-control" runat="server"></asp:TextBox>
                                            <div id="divFormulaName" class="col-md-9 border border-success rounded p-2 " runat="server">
                                                <asp:Label ID="lblFormulaName" CssClass=" font-weight-bold" runat="server" Visible="false"></asp:Label>
                                            </div>
                                        </div>
                                        <div class="col-md-2  text-center">
                                            <i class="fas fa-calendar-alt fa-3x align-middle" aria-hidden="true" style="color: #9fc299;"></i>
                                        </div>
                                        <div class="col-md-4 mb-4">
                                            <label class=" font-weight-bold " for="ddlPrescripion">Number Of Days:</label>
                                            <asp:TextBox ID="tbxNumDays" OnTextChanged="tbxNumDays_TextChanged" class="NumbersOnly form-control" runat="server" ToolTip="Enter Number of Days"></asp:TextBox>
                                            <div id="divNumDays" class="col-md-9 border border-success rounded p-2 " runat="server">
                                                <asp:Label ID="lblNumDays" CssClass=" font-weight-bold" runat="server" Visible="false"></asp:Label>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <br />
                                <hr />
                                 <asp:Panel runat="server" ID="addHerbPanel" DefaultButton="btnAddToTable">
                                <div class="form-row">
                                   
                                        <div class="col-md-2  text-center">
                                            <i class="fab fa-pagelines fa-3x align-middle" aria-hidden="true" style="color: #9fc299;"></i>
                                        </div>
                                        <div class="form-group col-md-5">
                                            <label class=" font-weight-bold " for="tbxHerb">Select Herb:</label>
                                            <asp:TextBox ID="tbxHerb" class="Herb form-control" runat="server" Text="" AutoPostBack="false"></asp:TextBox>
                                        </div>
                                        <div class="form-group col-md-3">
                                            <label class=" font-weight-bold " for="tbxQuantity">Quantity (g):</label>
                                            <asp:TextBox ID="tbxQuantity"  onkeypress="return EnterEvent(event)" class="NumbersOnly form-control" runat="server" Text="" data-toggle="tooltip" data-placement="bottom" Title="Enter Raw Herb Quantity In Grams"></asp:TextBox>
                                        </div>
                                        <div class="form-group col-md-2 text-right mb-3  align-self-end">
                                            <asp:Button ID="btnAddToTable" class="btn col-md-12 btn-success" runat="server" Text="Add" OnClick="btnAddToTable_Click"></asp:Button>
                                        </div>
                                 


                                </div>
                                        </asp:Panel>
                                <asp:HiddenField ID="hdFormulaRefNum" runat="server" Value="" />
                                <%--          ----------------------------Alert - Low Stock------------%>
                                <div id="stockAlert" class="form-row" runat="server" visible="false">
                                    <div class="alert alert-danger alert-dismissible col-md-12">
                                        <div class="form-row m-2">
                                            <div class="col-2">
                                                <i class="fa fa-exclamation-triangle fa-3x"></i>
                                            </div>
                                            <div class="col-8 justify-content-start ">
                                                <h4 class="font-weight-bold text-center ">Insufficient herb quantity in stock!</h4>

                                            </div>
                                            <button type="button" class="close" data-dismiss="alert">&times;</button>
                                        </div>

                                        <hr>
                                        <asp:Label ID="lblalertLowStock" CssClass="p-4 mb-1" runat="server" Text=""></asp:Label>
                                        <br />
                                        <asp:Label ID="lblHerbQuantityToOrder" CssClass="p-4" runat="server" Text=""></asp:Label>
                                    </div>
                                </div>
                                <br />
                                <%--------------------------------Traditional Formula dropdown list-------------------------%>
                                <%--                                <div class="form-row">
                                    <div class="col-md-2  text-center">
                                        <i class="fas fa-mortar-pestle fa-4x align-middle" aria-hidden="true" style="color: #9fc299;"></i>
                                    </div>
                                    <div class="col-md-8 mb-4">
                                        <label class=" font-weight-bold " for="ddlPrescripion">Use Traditional Formula:</label>
                                        <asp:DropDownList ID="ddlPrescripion" AppendDataBoundItems="true" CssClass="form-control" runat="server" DataSourceID="SqlDataSource3" DataTextField="FormulaName" DataValueField="FormulaName">
                                            <asp:ListItem Text="-- Select Formula --" Value="0.1" Selected="true"></asp:ListItem>

                                        </asp:DropDownList>
                                        <asp:SqlDataSource runat="server" ID="SqlDataSource3" ConnectionString='<%$ ConnectionStrings:conStr %>' SelectCommand="SELECT DISTINCT FormulaName FROM TraditionalFormulas"></asp:SqlDataSource>
                                    </div>
                                    <div class="col-md-2 text-right mb-4  align-self-end ">
                                        <asp:Button ID="btnSelectPrescription" CssClass="btn col-md-12 btn-success" runat="server" Text="Select" OnClick="btnSelectPrescription_Click" />
                                    </div>
                                </div>--%>

                                <hr />
                                <div class="row  ">
                                    <span class="slideanim font-weight-bolder ">Formula:</span>
                                </div>
                                <br />
                                <div class="form-row justify-content-center ">
                                 <%--   --%>
                                    <asp:GridView ID="grvShort" CssClass="table  table-hover table-striped" ShowFooter="true" GridLines="None" AutoGenerateColumns="False" runat="server" DataSourceID="SqlDataSource1" DataKeyNames="FormulaID" OnRowUpdated="grvShort_RowUpdated" OnRowDeleted="grvShort_RowDeleted">
                                        <Columns>

                                            <asp:BoundField DataField="HerbBatchNum" HeaderText="Batch" ReadOnly="True" SortExpression="HerbBatchNum"></asp:BoundField>
                                            <asp:BoundField DataField="HerbChineseName" HeaderText="Herb Name" ReadOnly="True" SortExpression="HerbChineseName"></asp:BoundField>
                                            <asp:TemplateField HeaderText="Quantity Raw Per Day" SortExpression="HerbQuantity">
                                                <EditItemTemplate>
                                                    <asp:TextBox runat="server" CssClass="form-control" Text='<%# Bind("HerbQuantity") %>' ID="TextBox1"></asp:TextBox>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Label runat="server" Text='<%# Bind("HerbQuantity") %>' ID="Label1"></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText=" Cost/g (granules)" SortExpression="SellPrice">
                                                <EditItemTemplate>
                                                    <asp:Label runat="server" Text='<%# Eval("SellPrice") %>' ID="Label1"></asp:Label>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Label runat="server" Text='<%# Bind("SellPrice", "{0:C4}") %>' ID="Label2"></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Daily Cost" SortExpression="DailyCost">
                                                <EditItemTemplate>
                                                    <asp:Label runat="server" Text='<%# Eval("DailyCost") %>' ID="Label2"></asp:Label>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Label runat="server" Text='<%# Bind("DailyCost", "{0:C2}") %>' ID="Label3"></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Subtotal" SortExpression="Subtotal">
                                                <EditItemTemplate>
                                                    <asp:Label runat="server" Text='<%# Eval("Subtotal") %>' ID="Label3"></asp:Label>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Label runat="server" Text='<%# Bind("Subtotal", "{0:C2}") %>' ID="Label4"></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>

                                            <asp:BoundField DataField="Procentage" HeaderText="Percentage" ReadOnly="True" SortExpression="Procentage"></asp:BoundField>
                                            <asp:CommandField ShowDeleteButton="True"></asp:CommandField>
                                        </Columns>
                                    </asp:GridView>
                                    <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:conStr %>' SelectCommand="SELECT HerbBatchNum, HerbChineseName, HerbTemperature, HerbQuantity, SellPrice, DailyCost, Subtotal, Procentage, FormulaID FROM PrescriptionMainTemp" ConflictDetection="CompareAllValues" DeleteCommand="DELETE FROM [PrescriptionMainTemp] WHERE [FormulaID] = @original_FormulaID " InsertCommand="INSERT INTO [PrescriptionMainTemp] ([HerbChineseName], [HerbTemperature], [HerbQuantity], [SellPrice], [Subtotal], [Procentage]) VALUES (@HerbChineseName, @HerbTemperature, @HerbQuantity, @SellPrice, @Subtotal, @Procentage)" OldValuesParameterFormatString="original_{0}" UpdateCommand="UPDATE [PrescriptionMainTemp] SET  [HerbQuantity] = @HerbQuantity  WHERE [FormulaID] = @original_FormulaID">
                                        <DeleteParameters>
                                            <asp:Parameter Name="original_FormulaID" Type="Int32"></asp:Parameter>
                                        </DeleteParameters>
                                        <InsertParameters>
                                            <asp:Parameter Name="HerbChineseName" Type="String"></asp:Parameter>
                                            <asp:Parameter Name="HerbTemperature" Type="String"></asp:Parameter>
                                            <asp:Parameter Name="HerbQuantity" Type="Decimal"></asp:Parameter>
                                            <asp:Parameter Name="SellPrice" Type="Decimal"></asp:Parameter>
                                            <asp:Parameter Name="Subtotal" Type="Decimal"></asp:Parameter>
                                            <asp:Parameter Name="Procentage" Type="Decimal"></asp:Parameter>
                                        </InsertParameters>
                                        <UpdateParameters>
                                            <asp:Parameter Name="HerbQuantity" Type="Decimal"></asp:Parameter>
                                            <asp:Parameter Name="original_FormulaID" Type="Int32"></asp:Parameter>
                                        </UpdateParameters>
                                    </asp:SqlDataSource>
                                </div>
                                <hr />
                                <br />

                                <div class="form-group">
                                    <div class="row">
                                        <div class="col-sm-2">
                                            <i class="fa fa-pills fa-3x " style="color: #9fc299;"></i>
                                        </div>
                                        <div class="col-form-label  col-sm-4 font-weight-bold pt-0 pl-0">
                                            Dispensing Method 
                                        </div>
                                        <div class="col-sm-6">
                                            <div class="form-check form-check-inline ">
                                                <asp:RadioButtonList CssClass="form-check-input" required="true" ID="rdbAdministration" AutoPostBack="true" Style="font-weight: bold" RepeatLayout="Flow" runat="server" DataSourceID="SqlDataSource7" DataTextField="AdmMethod" DataValueField="AdmId">
                                                </asp:RadioButtonList>
                                                <asp:SqlDataSource runat="server" ID="SqlDataSource7" ConnectionString='<%$ ConnectionStrings:conStr %>' SelectCommand="SELECT * FROM [AdministrationMethod]"></asp:SqlDataSource>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <br />
                                <br />
                                <hr />
                                <div class="form-group">
                                    <div class="row">
                                        <div class="col-sm-2">
                                            <i class="fa fa-balance-scale-left fa-3x" style="color: #9fc299;"></i>
                                        </div>
                                        <div class="col-form-label  col-sm-4 font-weight-bold pt-0 pl-0">
                                            Handling Fee
                                        </div>
                                        <div class="col-sm-6 pl-0">
                                            <asp:DropDownList CssClass="form-control " required="true" AutoPostBack="true" ID="ddlDispensingFee" runat="server" DataSourceID="SqlDataSource5" DataTextField="DispensingFeeName" DataValueField="DispFeePercentage">
                                            </asp:DropDownList>
                                            <%--<asp:RadioButtonList CssClass="form-check-input" ID="rdbdispensingFee" Style="font-weight: bold" RepeatLayout="Flow" RepeatDirection="Vertical" runat="server">
                                                <asp:ListItem Value="1" Text=" 30%" Selected="True"></asp:ListItem>
                                                <asp:ListItem Value="2" Text="None"></asp:ListItem>
                                            </asp:RadioButtonList>--%>
                                            <asp:SqlDataSource runat="server" ID="SqlDataSource5" ConnectionString='<%$ ConnectionStrings:conStr %>' SelectCommand="SELECT [DispFeePercentage], [DispensingFeeName], [DispFeeId] FROM [DispensingFee]"></asp:SqlDataSource>
                                        </div>
                                    </div>
                                </div>


                                <br />
                                <hr />
                                <%--  <div class="form-group">--%>
                                <div class="form-row mb-1">
                                    <div class="col-sm-2">
                                        <i class="fa fa-mail-bulk fa-3x" style="color: #9fc299;"></i>
                                    </div>
                                    <div class="col-form-label  col-sm-4 font-weight-bold pt-0 pl-0">
                                        Postage
                                    </div>
                                    <div class="col-sm-6">
                                        <div class="form-check form-check-inline ">


                                            <asp:RadioButtonList required="true" CssClass="form-check-input" ID="rdbPostage" AutoPostBack="true" Style="font-weight: bold" RepeatLayout="Flow" RepeatDirection="Vertical" runat="server" DataSourceID="SqlDataSource6" DataTextField="PostageMethod" DataValueField="PostageCost">
                                            </asp:RadioButtonList>
                                            <asp:SqlDataSource runat="server" ID="SqlDataSource6" ConnectionString='<%$ ConnectionStrings:conStr %>' SelectCommand="SELECT * FROM [PostageCost]"></asp:SqlDataSource>
                                        </div>
                                    </div>
                                </div>
                                <%--  </div>--%>

                                <br />
                                <hr />
                                <div class="form-group">
                                    <div class="form-row mt-1">
                                        <div class="col-sm-2">
                                            <i class="far fa-minus-square fa-3x" style="color: #9fc299;"></i>
                                        </div>
                                        <div class="col-form-label  col-sm-2 font-weight-bold pt-0 pl-0 align-self-center">
                                            Discount
                                        </div>
                                        <div class="col-sm-5 align-self-center">

                                            <asp:TextBox ID="tbxDiscountReason" TextMode="MultiLine" CssClass="form-control" runat="server" placeholder="Discount Reason" Text="" AutoPostBack="false"></asp:TextBox>
                                        </div>
                                        <div class="col-sm-3 align-self-center">

                                            <asp:TextBox ID="tbxDiscount" CssClass="form-control" runat="server" placeholder="€0.00" Text="" AutoPostBack="false"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                                <br />
                                <hr />
                                <br />

                                <%--<div class="form-row ">--%>
                                <div class="alert alert-success border border-success">
                                    <div class="form-row">
                                        <div class="col-form-label  col-sm-4  pt-0">
                                            <h2 class=" font-weight-bold">Total Cost: </h2>
                                        </div>
                                        <div class="col-sm-3"></div>
                                        <div class="col-sm-5 justify-content-end ">
                                            <h2>
                                                <asp:Label CssClass="font-weight-bold" ID="lblTotalCost" runat="server" Text="€"></asp:Label></h2>
                                        </div>
                                    </div>
                                </div>
                                <%--</div>--%>
                                <br />
                                <br />
                                <hr />
                                <!---------------------- alert -------------------------->
                                <div id="divAlert" class="form-row" runat="server" visible="false">
                                    <div class="alert alert-danger alert-dismissible col-md-12">
                                        <div class="form-row m-2">
                                            <div class="col-2">
                                                <i class="fa fa-exclamation-triangle fa-4x"></i>
                                            </div>
                                            <div class="col-8 justify-content-start ">

                                                <h4 class="font-weight-bold text-center ">
                                                    <asp:Label ID="lblNoSelectionAlertHeader" CssClass="font-weight-bold" Text="" runat="server"></asp:Label></h4>

                                            </div>
                                            <button type="button" class="close" data-dismiss="alert">&times;</button>
                                        </div>

                                        <hr>
                                        <asp:Label ID="lblSelect" CssClass="p-4 mb-1" runat="server" Text=""></asp:Label>


                                    </div>
                                </div>
                                <br />

                                <div class="row justify-content-between ">

                                    <div class="col-md-4  mb-4  align-self-center">
                                        <asp:Button ID="addPrescription" class="btn btn-lg btn-success col-md-12" runat="server" Text="Submit" OnClick="addPrescription_Click" />
                                    </div>
                                    <div class="col-md-4">
                                        <asp:Button ID="btnCancel" class="btn btn-lg btn-danger col-md-12" runat="server" Text="Cancel" OnClick="btnCancel_Click" />
                                    </div>

                                </div>
                                <br />
                                <hr />



                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </main>



</asp:Content>
