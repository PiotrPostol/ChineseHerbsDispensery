<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMaster.Master" AutoEventWireup="true" MaintainScrollPositionOnPostback="true" CodeBehind="AddHerbToStock.aspx.cs" Inherits="Dispensery.AddHerbToStock" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    <script>
        $(document).ready(function () {
                        $('[data-toggle="tooltip"]').tooltip();


            $('input[type=text]').each(function () {
                $(this).val('');
            });

            $('.Herb').autocomplete({
                source: 'GetHerbsNameAutocomplete.ashx'
            });

            $('.NumbersOnly').keypress(function (event) {
                return isNumber(event, this)
            });

            $(function () {
                $("[id*=tbxExpiaryDate]").datepicker({
                    showOn: 'focus',
                    dateFormat: 'dd/mm/yy'
                    //buttonImageOnly: true,
                    //buttonImage: 'IMG/ICEF_icon-calendar.png'
                });
            });
            $(function () {
                $("[id*=tbxDateReceived]").datepicker({
                    showOn: 'focus',
                    dateFormat: 'dd/mm/yy'
                    //buttonImageOnly: true,
                    //buttonImage: 'IMG/ICEF_icon-calendar.png'
                });
            });
            $(function () {
                $("[id*=tbxDateToDispensery]").datepicker({
                    showOn: 'focus',
                    dateFormat: 'dd/mm/yy'
                    //buttonImageOnly: true,
                    //buttonImage: 'IMG/ICEF_icon-calendar.png'
                });
            });

        });
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
                            <i class="fas fa-boxes fa-4x pt-md-2" aria-hidden="true" style="color: #9fc299;"></i>
                            <%-- <img class="" src="Img/icon-specialty-granules.png" />--%>
                        </div>
                        <div class="col-md-10 d-flex">
                            <p class="myFont title col-md-10  pt-4 align-content-center" aria-hidden="true">Add Harbs To Stock</p>
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
                                                <asp:Label ID="lblNoSelectionAlertHeader" CssClass="font-weight-bold" Text="Herb Added Successfuly" runat="server"></asp:Label></h4>

                                        </div>
                                        <button type="button" class="close" data-dismiss="alert">&times;</button>
                                    </div>
                                    
                                        </div>
                                    </div>
                                    <%--                -------------------alert warning-------------------%>

                                    <div id="divAlertWarning" class="form-row" runat="server" visible="false">
                                        <div class="alert alert-danger alert-dismissible col-md-12">
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

                                        </div>
                                    </div>
                                    <div class="form-row ">
                                        <div class="form-group col-lg-6">
                                            <label class=" font-weight-bold" for="tbxHerb">Select Herb:</label>
                                            <asp:TextBox ID="tbxHerb" class="Herb form-control" runat="server" Text="" AutoPostBack="false"></asp:TextBox>
                                        </div>
                                        <div class="form-group col-lg-2">
                                            <label class=" font-weight-bold" for="tbxQuantity">Quantity (g):</label>
                                            <asp:TextBox ID="tbxQuantity" class="NumbersOnly form-control" runat="server" Text="" data-toggle="tooltip" data-placement="bottom" Title="Enter Raw Herb Quantity In Grams" AutoPostBack="false"></asp:TextBox>
                                        </div>
                                        <div class="form-group col-lg-2">
                                            <label class=" font-weight-bold" for="tbxBatchNumber">Batch Number:</label>
                                            <asp:TextBox ID="tbxBatchNumber" class="form-control" runat="server" Text="" AutoPostBack="false"></asp:TextBox>
                                        </div>
                                        <div class="form-group col-lg-2">
                                            <label class=" font-weight-bold" for="tbxExpiaryDate">Expiry Date:</label>
                                            <asp:TextBox ID="tbxExpiaryDate" class="form-control" runat="server" Text="" placeholder="dd/mm/yyyy" AutoPostBack="false"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="form-row">
                                        <div class="form-group col-lg-6">
                                            <label class=" font-weight-bold" for="ddlSupplier">Supplier:</label>
                                            <asp:DropDownList ID="ddlSupplier" CssClass="form-control" runat="server" DataSourceID="SqlDataSource1" DataTextField="SupplierName" DataValueField="SupplierID"></asp:DropDownList>
                                            <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:conStr %>' SelectCommand="SELECT [SupplierID], [SupplierName] FROM [SupplierTable] ORDER BY [SupplierName]"></asp:SqlDataSource>
                                        </div>
                                        <div class="form-group col-lg-3">
                                            <label class=" font-weight-bold" for="tbxSupplierPrice">Supplier Price:</label>
                                            <asp:TextBox ID="tbxSupplierPrice" CssClass="NumbersOnly form-control" runat="server" placeholder="€0.00"></asp:TextBox>
                                        </div>
                                        <%--<div class="form-group col-lg-3">
                                            <label class=" font-weight-bold" for="tbxSellPrice">Sell Price:</label>
                                            <asp:TextBox ID="tbxSellPrice" CssClass="NumbersOnly form-control" runat="server" placeholder="€0.00"></asp:TextBox>
                                        </div>--%>
                                    </div>
                                    <div class="form-row">
                                        <div class="form-group col-lg-3">
                                            <label class=" font-weight-bold" for="ddlSupplier">Herb Form:</label>
                                            <asp:DropDownList ID="ddlHerbForm" CssClass="form-control" runat="server" AutoPostBack="false">
                                                <asp:ListItem>Granules</asp:ListItem>
                                                <asp:ListItem>Raw</asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                        <div class="form-group col-lg-3">
                                            <label class=" font-weight-bold" for="tbxDateReceived">Ratio:</label>
                                            <asp:TextBox ID="tbxRatio" CssClass=" form-control" runat="server" placeholder="0.0" data-toggle="tooltip" data-placement="top" Title="e.g. if 1 to 5 enter 5"></asp:TextBox>
                                        </div>
                                        <div class="form-group col-lg-3">
                                            <label class=" font-weight-bold" for="tbxDateReceived">Date Received:</label>
                                            <asp:TextBox ID="tbxDateReceived" CssClass=" form-control" runat="server" placeholder="dd/mm/yyyy"></asp:TextBox>
                                        </div>
                                        <div class="form-group col-lg-3">
                                            <label class=" font-weight-bold" for="tbxDateToDispensery">Date To Dispensery:</label>
                                            <asp:TextBox ID="tbxDateToDispensery" CssClass="NumbersOnly form-control" runat="server" placeholder="dd/mm/yyyy"></asp:TextBox>
                                        </div>
                                    </div>
                                    <hr />
                                    <div class="form-group  justify-content-end align-content-end">
                                        <asp:Button runat="server" OnClick="btnAddHerb_Click" ID="btnAddHerb" type="submit" class="btn  btn-success" Text="Add Herb"></asp:Button>

                                    </div>


                                </div>
                            </div>
                        </div>
                    </div>
                </div>
    </main>

</asp:Content>
