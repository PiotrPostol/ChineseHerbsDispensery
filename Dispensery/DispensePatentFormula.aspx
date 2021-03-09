<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMaster.Master" AutoEventWireup="true" CodeBehind="DispensePatentFormula.aspx.cs" Inherits="Dispensery.DispensePatentFormula" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="UserInfo" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="contentBody" runat="server">
    <main class="page-content">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <div class="container-fluid">
            <div class="card bg-light p-1 shadow rounded mb-lg-4 mb-md-2 mb-sm-2 ">
                <div class="card-header p-1 rounded">
                    <div class="row container-fluid ">
                        <div class="col-lg-1">
                            <i class="fas fa-prescription-bottle fa-4x p-md-2" aria-hidden="true" style="color: #9fc299;"></i>
                            <%-- <img class="" src="Img/icon-specialty-granules.png" />--%>
                        </div>
                        <div class="col-lg-11 d-flex">
                            <h3 class=" font-weight-bold  col-md-10  pt-4 align-content-center" aria-hidden="true" style="color: #9fc299;">Dispense Patent Formula</h3>
                        </div>
                    </div>
                </div>
                <div class="card-body">
                    <div class="container ">
                        <div class="line rounded p-4 col-md-12  justify-content-center ">
                            <%--            ------------------Alert Success--%>

                            <div id="divAlertSuccess" class="form-row" runat="server" visible="false">
                                <div class="alert alert-success alert-dismissible col-md-12">
                                    <div class="form-row m-2">
                                        <div class="col-lg-2">
                                            <i class="fa fa-check-circle fa-4x" style="color: #9fc299;"></i>
                                        </div>
                                        <div class="col-lg-8 justify-content-start ">

                                            <h4 class="font-weight-bold text-center ">
                                                <asp:Label ID="lblNoSelectionAlertHeader" CssClass="font-weight-bold" Text="Patent Formula Dispensed Successfuly" runat="server"></asp:Label></h4>

                                        </div>
                                        <button type="button" class="close" data-dismiss="alert">&times;</button>
                                    </div>

                                </div>
                            </div>
                            <%--                -------------------alert warning-------------------%>

                            <div id="divAlertWarning" class="form-row" runat="server" visible="false">
                                <div class="alert alert-danger alert-dismissible col-md-12">
                                    <div class="container">
                                        <div class="form-row m-2">
                                            <div class="col-lg-2">
                                                <i class="fa fa-exclamation-triangle fa-4x" style="color: darkred;"></i>
                                            </div>
                                            <div class="col-lg-8 justify-content-start ">

                                                <h4 class="font-weight-bold text-center ">
                                                    <asp:Label ID="lblAlertWarning" CssClass="font-weight-bold" Text="" runat="server"></asp:Label></h4>

                                            </div>
                                            <button type="button" class="close" data-dismiss="alert">&times;</button>
                                        </div>
                                        <hr />
                                        <div class="form-row justify-content-center">
                                            <asp:Button ID="btnWarningCancel" OnClick="btnWarningCancel_Click" CssClass="btn btn-danger" runat="server" Text="Cancel" />
                                        </div>
                                    </div>

                                </div>
                            </div>
                            <%--          ----------------------------Alert - Low Stock------------%>
                            <div id="stockAlert" class="form-row" runat="server" visible="false">
                                <div class="alert alert-danger alert-dismissible col-md-12">
                                    <div class="form-row m-2">
                                        <div class="col-2">
                                            <i class="fa fa-exclamation-triangle fa-4x"></i>
                                        </div>
                                        <div class="col-8 justify-content-start ">
                                            <h4 class="font-weight-bold text-center ">Insufficient Herb Quantity In Stock!</h4>

                                        </div>
                                        <button type="button" class="close" data-dismiss="alert">&times;</button>
                                    </div>

                                    <hr>
                                    <div class="row">
                                        <asp:Label ID="lblalertLowStock" CssClass="p-4 mb-1" runat="server" Text=""></asp:Label>
                                        <br />
                                        <asp:Label ID="lblHerbQuantityToOrder" CssClass="p-4" runat="server" Text=""></asp:Label>

                                    </div>

                                </div>
                            </div>
                            <%--        -----------------------Form Start-----------------------------------%>
                            <div class="container">
                                <div class="form-row">
                                    <div class="col-lg-6 ">
                                        <label class=" font-weight-bold " for="ddlPrescripion">Practitioner:</label>
                                        <asp:DropDownList ID="ddlPractitioner" required="true" AppendDataBoundItems="true" CssClass="form-control" runat="server" DataSourceID="SqlDataSource5" DataTextField="PractitionerName" DataValueField="PractitionerID">
                                            <asp:ListItem Text="-- Select Patient --" Value="0.1" Selected="true"></asp:ListItem>
                                        </asp:DropDownList>
                                        <asp:SqlDataSource runat="server" ID="SqlDataSource5" ConnectionString='<%$ ConnectionStrings:conStr %>' SelectCommand="SELECT PractitionerID, PracName + ' ' + PracSurname AS PractitionerName FROM Practitioner"></asp:SqlDataSource>
                                    </div>


                                </div>
                                <br />
                                <div class="form-row">
                                    <div class="col-lg-6  ">
                                        <label class="font-weight-bold " for="tbxpfName">Select Patent Formula Name:</label>
                                        <asp:DropDownList ID="ddlFormulaName" required="true" CssClass="form-control" AutoPostBack="true" AppendDataBoundItems="true" runat="server" DataSourceID="SqlDataSource1" DataTextField="FormulaName" DataValueField="FormulaName">
                                            <asp:ListItem Value="0">---Select Patent Formula---</asp:ListItem>
                                        </asp:DropDownList>
                                        <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:conStr %>' SelectCommand="SELECT DISTINCT FormulaName FROM PatentFormulaStock WHERE (BottleQuantity > 0) ORDER BY FormulaName"></asp:SqlDataSource>
                                    </div>
                                    <div class="col-lg-6">
                                        <label class="font-weight-bold " for="lbAvailablePF">Select Batch:</label>
                                        <asp:ListBox ID="lbAvailablePF" required="true" CssClass="form-control list-group pl-3" AutoPostBack="true" runat="server" DataSourceID="SqlDataSource2" DataTextField="Available" DataValueField="PatentFormulaStockId"></asp:ListBox>

                                        <asp:SqlDataSource runat="server" ID="SqlDataSource2" ConnectionString='<%$ ConnectionStrings:conStr %>' SelectCommand="SELECT PatentFormulaStockId, FormulaRefNum + ', Available: ' + CAST(BottleQuantity AS NVARCHAR(50)) + ' Bottles' AS Available FROM PatentFormulaStock WHERE (FormulaName = @formulaName) AND (BottleQuantity > 0)">
                                            <SelectParameters>
                                                <asp:ControlParameter ControlID="ddlFormulaName" PropertyName="SelectedValue" DefaultValue="0" Name="formulaName"></asp:ControlParameter>

                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                    </div>
                                </div>
                                <br />
                                <div class="form-row">

                                    <div class="col-lg-6">
                                        <label class="font-weight-bold " for="tbxDispenseBottleQty">Required Quantity:</label>
                                        <asp:TextBox ID="tbxDispenseBottleQty" required="true" CssClass="form-control" runat="server"></asp:TextBox>
                                    </div>
                                    <div class="col-lg-6">
                                        <label class="font-weight-bold " for="tbxCurrentDate">Date:</label>
                                        <asp:TextBox ID="tbxCurrentDate" CssClass="form-control" runat="server" ></asp:TextBox>
                                    </div>
                                </div>
                                <br />
                                <hr />
                                <div class="row justify-content-between">
                                    <asp:Button ID="btnDispense" OnClick="btnDispense_Click" CssClass="btn btn-success" runat="server" Text="Dispense" />
                                    <asp:Button ID="btnCancel" OnClick="btnCancel_Click" CssClass="btn btn-danger" runat="server" Text="Cancel" CausesValidation="false" />
                                </div>
                            </div>
                            <br />
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </main>
</asp:Content>
