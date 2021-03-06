<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMaster.Master" AutoEventWireup="true" CodeBehind="ViewPatentFormulaStock.aspx.cs" Inherits="Dispensery.ViewPatentFormulaStock" %>

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
                        <div class="col-md-1">
                            <i class="fas fa-box fa-4x p-md-2" aria-hidden="true" style="color: #9fc299;"></i>
                            <%-- <img class="" src="Img/icon-specialty-granules.png" />--%>
                        </div>
                        <div class="col-md-11 d-flex">
                            <h3 class=" font-weight-bold  col-md-10  pt-4 align-content-center" aria-hidden="true" style="color: #9fc299;">View Patent Formula In Stock</h3>
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
                                                <asp:Label ID="lblNoSelectionAlertHeader" CssClass="font-weight-bold" Text="Patent Formula Added Successfuly" runat="server"></asp:Label></h4>

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
                            <div class="row">
                                <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">
                                    <ItemTemplate>
                                     
                                        <div class="form-row border-bottom mb-4 mt-4" id="divFormInput" runat="server">
                                            <div class="col-lg-1">
                                                <i class="fas fa-prescription-bottle-alt fa-4x" aria-hidden="true" style="color: #9fc299;"></i>
                                            </div>
                                            <div class="form-group col-lg-3">
                                                <label class=" " for="tbxpfRefNum">Reference Number:</label>
                                                <asp:TextBox ID="tbxpfRefNum" CssClass="form-control font-weight-bold " ReadOnly="true" runat="server" Text=<%#Eval("FormulaRefNum") %>></asp:TextBox>
                                            </div>
                                            <div class="form-group col-lg-3">
                                                <label class=" " for="tbxpfName">Patent Formula Name:</label>
                                                 <asp:TextBox ID="tbxpfName" CssClass="form-control font-weight-bold " ReadOnly="true" runat="server" Text=<%#Eval("FormulaName") %>></asp:TextBox>
                                            </div>
                                            <div class="form-group col-lg-2">
                                                <label class=" " for="tbxpfQuantity">Available Bottles:</label>
                                                <asp:TextBox ID="tbxpfQuantity" CssClass="form-control font-weight-bold " ReadOnly="true" runat="server" Text=<%#Eval("BottleQuantity") %>></asp:TextBox>

                                            </div>
                                            <div class="form-group col-lg-3">
                                                <label class=" " for="tbxpfDateCreated">Date Created:</label>
                                                <asp:TextBox ID="tbxpfDateCreated" CssClass="form-control font-weight-bold " ReadOnly="true" runat="server" Text=<%#Eval("DateCreated", "{0:dd/MM/yyyy}") %>></asp:TextBox>
                                            </div>
                                            

                                        </div>
                                        <div class="form-row">

                                            <asp:Button CssClass="btn btn-outline-info" ID="Button1" runat="server" Text="See Details" />
                                        </div>


                                    </ItemTemplate>
                                </asp:Repeater>
                                <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:conStr %>' SelectCommand="SELECT DISTINCT FormulaRefNum, FormulaName, BottleQuantity, DateCreated FROM PatentFormulaMain WHERE (BottleQuantity > 0)"></asp:SqlDataSource>
                            </div>



                            <%--------------------------gridview Table-------------------------------------%>
                            <br />
                            <%--                            <div class="row justify-content-center" runat="server" id="createPF">
                                    <div class="form-group col-lg-4">
                                        <asp:Button ID="btnCreatePF"  CssClass="btn btn-success  btn-block" runat="server" Text="Create Patent Formula" />
                                    </div>
                                    
                                </div>--%>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </main>

</asp:Content>
