<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMaster.Master" AutoEventWireup="true" CodeBehind="AllHerbs.aspx.cs" Inherits="Dispensery.AllHerbs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
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
                        <div class="col-md-8 d-flex">
                            <h3 id="addHerbToStock" runat="server" class=" col-md-8 font-weight-bold   pt-md-2 mt-2 align-content-center" aria-hidden="true" style="color: #9fc299;">All Herbs</h3>
                            <h3 id="updateHerbStock" runat="server" visible="false" class=" col-md-8 font-weight-bold   pt-md-2 mt-2 align-content-center" aria-hidden="true" style="color: #9fc299;">Update Harb Stock</h3>
                        </div>
                    </div>
                </div>
                <div class="card-body">
                    <div class="container ">
                        <div class="line rounded p-4 col-md-12  justify-content-center ">


                            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModalCenter">Add Herb</button>

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



                        </div>

                        <%-- ------------------------GridView with AllHerbs table-------------------------                       --%>
                        <br />
                        <hr />
                        <div class="row container-fluid ">
                            <div class="col-md-1">
                                <i class="far fa-list-alt fa-4x pt-md-2" aria-hidden="true" style="color: #9fc299;"></i>
                                <%-- <img class="" src="Img/icon-specialty-granules.png" />--%>
                            </div>
                            <div class="col-md-8 d-flex">
                                <h3 id="H1" runat="server" class=" col-md-8 font-weight-bold   pt-md-2 mt-2 align-content-center" aria-hidden="true" style="color: #9fc299;">All Herbs Table</h3>
                            </div>
                        </div>

                        <div class="table-responsive-xl p-4 justify-content-center col-xl-12">
                            <asp:GridView ID="GridView1" CssClass="table table-sm table-hover table-striped" GridLines="None" runat="server" AutoGenerateColumns="False" DataKeyNames="RefNum" DataSourceID="SqlDataSource2">
                                <Columns>
                                    <asp:BoundField DataField="RefNum" HeaderText="Ref. Num." ReadOnly="True" SortExpression="RefNum"></asp:BoundField>
                                    <asp:BoundField DataField="HerbNameChinese" HeaderText="Chinese Name" SortExpression="HerbNameChinese"></asp:BoundField>
                                    <asp:BoundField DataField="HerbName" HeaderText="Herb Name" SortExpression="HerbName"></asp:BoundField>
                                    <asp:BoundField DataField="PharmaName" HeaderText="Pharma Name" SortExpression="PharmaName"></asp:BoundField>
                                    <asp:BoundField DataField="EnglishName" HeaderText="English Name" SortExpression="EnglishName"></asp:BoundField>
                                    <asp:BoundField DataField="Temperature" HeaderText="Temperature" SortExpression="Temperature"></asp:BoundField>
                                    <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description"></asp:BoundField>
                                    <asp:BoundField DataField="Active" HeaderText="Active" SortExpression="Active"></asp:BoundField>
                                </Columns>
                            </asp:GridView>


                            <asp:SqlDataSource runat="server" ID="SqlDataSource2" ConnectionString='<%$ ConnectionStrings:conStr %>' SelectCommand="SELECT * FROM [AllHerbs] ORDER BY [HerbNameChinese]"></asp:SqlDataSource>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </main>

<%--    --------------modal add herb--------------------------------%>
    <div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered modal-lg " role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLongTitle">Modal title</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                                               <%--                            ------------------------form start---------------------------%>
                            <div class="form-row ">
                                <div class="form-group col-lg-6">
                                    <label class=" font-weight-bold" for="tbxHerb">Select Herb:</label>
                                    <asp:TextBox ID="tbxHerb" class="Herb form-control" runat="server" Text=""></asp:TextBox>
                                </div>
                                <div class="form-group col-lg-2">
                                    <label class=" font-weight-bold" for="tbxQuantity">Quantity (g):</label>
                                    <asp:TextBox ID="tbxQuantity" class="NumbersOnly form-control" runat="server" Text="" data-toggle="tooltip" data-placement="bottom" Title="Enter Raw Herb Quantity In Grams" AutoPostBack="false"></asp:TextBox>
                                </div>
                                <div class="form-group col-lg-2">
                                    <label class=" font-weight-bold" for="tbxBatchNumber">Batch Number:</label>
                                    <asp:TextBox ID="tbxBatchNumber" class="form-control" runat="server" Text=""></asp:TextBox>
                                </div>
                                <div class="form-group col-lg-2">
                                    <label class=" font-weight-bold" for="tbxExpiaryDate">Expiry Date:</label>
                                    <asp:TextBox ID="tbxExpiaryDate" autocomplete="off" class="form-control" runat="server" Text="" placeholder="dd/mm/yyyy" AutoPostBack="false"></asp:TextBox>
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
                                    <asp:TextBox ID="tbxDateReceived" autocomplete="off" CssClass=" form-control" runat="server" placeholder="dd/mm/yyyy"></asp:TextBox>
                                </div>
                                <div class="form-group col-lg-3">
                                    <label class=" font-weight-bold" for="tbxDateToDispensery">Date To Dispensery:</label>
                                    <asp:TextBox ID="tbxDateToDispensery" autocomplete="off" CssClass="NumbersOnly form-control" runat="server" placeholder="dd/mm/yyyy"></asp:TextBox>
                                </div>
                            </div>
                            <hr />
                            <div class="form-group  justify-content-end align-content-end">
                                <asp:Button runat="server" ID="btnAddHerb" type="submit" class="btn  btn-success" Text="Add Herb"></asp:Button>
                                <asp:Button runat="server" ID="btnUpdateHerbStock" type="submit" class="btn  btn-info" Text="Update Herb" Visible="false"></asp:Button>
                            </div>

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    <button type="button" class="btn btn-primary">Save changes</button>
                </div>
            </div>
        </div>
    </div>

</asp:Content>
