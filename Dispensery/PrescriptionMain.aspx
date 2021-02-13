<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMaster.Master" AutoEventWireup="true" CodeBehind="PrescriptionMain.aspx.cs" Inherits="Dispensery.PrescriptionMain" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
    Dashboard
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<%--User Info--%>
<asp:Content ID="UserInfo" ContentPlaceHolderID="UserInfo" runat="server">
    <%--    <div class="sidebar-header">
        <div class="user-pic">
            <img class="img-responsive img-rounded" src="Img/Lara.jpg"
                alt="User picture">
        </div>
        <div class="user-info">
            <span class="user-name">Lara
           
                                <strong>Serviolle</strong>
            </span>
            <span class="user-role">Practitioner</span>
            <span class="user-status">
                <i class="fa fa-circle"></i>
                <span>Online</span>
            </span>
        </div>
    </div>--%>
</asp:Content>
<%--Main Content--%>
<asp:Content ID="Content3" ContentPlaceHolderID="contentBody" runat="server">
    <main class="page-content">
        <div class="container-fluid">
            <div class="card card-body bg-light p-1 shadow rounded">
                <div class="row">
                    <div class="col-lg-5 pb-md-2">
                        <nav class="navbar navbar-expand-sm bg-light navbar-dark" id="headerBar">
                            <!-- Brand/logo -->

                            <i class="fa fa-user-circle fa-4x align-middle pr-2" aria-hidden="true"></i>
                            <!-- Links -->
                            <ul class="navbar-nav">
                                <li class="nav-item pt-2">
                                    <h5 class="pr-2">You are loged in as: </h5>
                                </li>
                                <li class="nav-item pt-2">
                                    <span class="align-middle">
                                        <asp:LoginName ID="LoginName2" class="h5 d-inline-block" runat="server" Font-Bold="true" />
                                    </span>
                                </li>
                                <li class="nav-item">
                                    <asp:LoginStatus ID="LoginStatus2" runat="server" class="btn btn-primary ml-2" />
                                </li>


                            </ul>

                        </nav>
                    </div>
                    <%--                            <div class="col-lg-4 offset-md-3 p-2 float-lg-right justify-content-end">
                                <img class="img-fluid float-right" src="img/OPHARDT-hygiene_200x67.gif" />
                            </div>--%>
                </div>


            </div>

        </div>

    </main>

</asp:Content>
