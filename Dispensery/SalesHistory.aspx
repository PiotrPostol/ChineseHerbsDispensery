<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMaster.Master" AutoEventWireup="true" CodeBehind="SalesHistory.aspx.cs" Inherits="Dispensery.SalesHistory" %>
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
                            <asp:GridView ID="GridView1" CssClass="table table-sm table-hover table-striped" GridLines="None" runat="server" AutoGenerateColumns="False" >
                             
                            </asp:GridView>


                        </div>

                    </div>
                </div>
            </div>
        </div>
    </main>

</asp:Content>
