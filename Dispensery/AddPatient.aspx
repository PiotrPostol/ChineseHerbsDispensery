<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMaster.Master" AutoEventWireup="true" CodeBehind="AddPatient.aspx.cs" Inherits="Dispensery.AddPatient" %>

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
                            <i class="fa fa-user-edit fa-4x pt-md-2" aria-hidden="true" style="color: #9fc299;"></i>
                            <%-- <img class="" src="Img/icon-specialty-granules.png" />--%>
                        </div>
                        <div class="col-md-10 d-flex">
                            <p class="myFont title col-md-10  pt-4 align-content-center" aria-hidden="true">Add Patient</p>
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
                            <div class="form-row ">
                                <div class="form-group col-lg-6">
                                    <label for="tbxPatientName">Name:</label>
                                    <asp:TextBox ID="tbxPatientName" CssClass="form-control" runat="server" required="true"></asp:TextBox>
                                </div>
                                <div class="form-group col-lg-6">
                                    <label for="tbxPatientSurname">Surname:</label>
                                    <asp:TextBox ID="tbxPatientSurname" CssClass="form-control" runat="server" required="true"></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="tbxPatientAddress">Address:</label>
                                <asp:TextBox ID="tbxPatientAddress" CssClass="form-control" runat="server" required="true"></asp:TextBox>
                            </div>
                            <div class="form-row">
                                <div class="form-group col-lg-6">
                                    <label for="tbxPatientCityTown">City/Town:</label>
                                    <asp:TextBox ID="tbxPatientCityTown" CssClass="form-control" runat="server" required="true"></asp:TextBox>
                                </div>
                                <div class="form-group col-lg-4">
                                    <label for="inputState">County:</label>
                                    <select id="inputState" class="form-control">
                                        <option selected>Choose...</option>
                                        <option>Antrim  </option>
                                        <option>Armagh </option>
                                        <option>Carlow </option>
                                        <option>Cavan </option>
                                        <option>Clare </option>
                                        <option>Cork </option>
                                        <option>Derry </option>
                                        <option>Donegal </option>
                                        <option>Down </option>
                                        <option>Dublin </option>
                                        <option>Fermanagh </option>
                                        <option>Galway </option>
                                        <option>Kerry </option>
                                        <option>Kildare </option>
                                        <option>Kilkenny </option>
                                        <option>Laois </option>
                                        <option>Leitrim </option>
                                        <option>Limerick </option>
                                        <option>Longford </option>
                                        <option>Louth </option>
                                        <option>Mayo </option>
                                        <option>Meath </option>
                                        <option>Monaghan </option>
                                        <option>Offaly </option>
                                        <option>Roscommon </option>
                                        <option>Sligo </option>
                                        <option>Tipperary </option>
                                        <option>Tyrone </option>
                                        <option>Waterford </option>
                                        <option>Westmeath </option>
                                        <option>Wexford </option>
                                        <option>Wicklow </option>

                                    </select>
                                </div>
                                <div class="form-group col-lg-2">
                                    <label for="tbxEirecode">Eirecode:</label>
                                    <asp:TextBox ID="tbxEirecode" CssClass="form-control" runat="server"></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-row">
                                <div class="form-group col-lg-6">
                                    <label for="tbxPatientPhoneNumber">Phone Number:</label>
                                    <asp:TextBox ID="tbxPatientPhoneNumber" CssClass="form-control" runat="server" required="true"></asp:TextBox>
                                </div>
                                <div class="form-group col-lg-6">
                                    <label for="tbxPatientEmail">Email:</label>
                                    <asp:TextBox ID="tbxPatientEmail" CssClass="form-control" runat="server" TextMode="Email"></asp:TextBox>
                                </div>
                            </div>
                            <hr />
                            <div class="form-group">
                                <label for="tbxPatientMedication">Current Medication:</label>
                                <asp:TextBox ID="tbxPatientMedication" CssClass="form-control" runat="server" TextMode="multiline"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <label for="tbxCurrentSupplements">Current Supplements:</label>
                                <asp:TextBox ID="tbxCurrentSupplements" CssClass="form-control" runat="server" TextMode="multiline"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <label for="tbxPatientMedicalConditions">Medical Conditions:</label>
                                <asp:TextBox ID="tbxPatientMedicalConditions" CssClass="form-control" runat="server" TextMode="multiline"></asp:TextBox>
                            </div>
                            <div class="form-group  justify-content-end align-content-end">
                                <asp:Button runat="server" ID="btnAddPatient" type="submit" class="btn  btn-success" Text="Add Patient" OnClick="btnAddPatient_Click"></asp:Button>

                            </div>


                        </div>
                    </div>
                </div>
            </div>
        </div>
    </main>


</asp:Content>
