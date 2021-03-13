<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMaster.Master" AutoEventWireup="true" MaintainScrollPositionOnPostback="true" CodeBehind="ViewPatentFormulaStock.aspx.cs" Inherits="Dispensery.ViewPatentFormulaStock" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    <script>
        function openModal() {
            $('[id*=myModal]').modal('show');
        }

    </script>
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
                            <i class="fas fa-box fa-4x p-md-2" aria-hidden="true" style="color: #9fc299;"></i>
                            <%-- <img class="" src="Img/icon-specialty-granules.png" />--%>
                        </div>
                        <div class="col-lg-11 d-flex">
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
                            <div class="form-row">
                                <label class="col-md-3 font-weight-bold " for="tbxpfName">Select Patent Formula Name:</label>
                                <div class="col-md-5">
                                    <asp:DropDownList ID="ddlFormulaName" CssClass="form-control" AutoPostBack="true" AppendDataBoundItems="true" runat="server" DataSourceID="SqlDataSource4" DataTextField="FormulaName" DataValueField="FormulaName">
                                        <asp:ListItem Value="0">---Select Patent Formula---</asp:ListItem>
                                    </asp:DropDownList>

                                    <asp:SqlDataSource runat="server" ID="SqlDataSource4" ConnectionString='<%$ ConnectionStrings:conStr %>' SelectCommand="SELECT DISTINCT FormulaName FROM PatentFormulaStock WHERE (BottleQuantity > 0) ORDER BY FormulaName"></asp:SqlDataSource>
                                </div>

                            </div>
                            <br />
                            <hr />


                            <%--        -----------------------Form Start-----------------------------------%>
                            <div class="container">


                                <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">
                                    <ItemTemplate>

                                        <div class="form-row border-bottom mb-4 mt-4" id="divFormInput" runat="server">
                                            <div class="col-lg-1">
                                                <i class="fas fa-prescription-bottle-alt fa-4x" aria-hidden="true" style="color: #9fc299;"></i>
                                            </div>

                                            <div class="form-group col-lg-6">
                                                <label class=" " for="tbxpfName">Patent Formula Name:</label>
                                                <asp:TextBox ID="tbxpfName" CssClass="form-control font-weight-bold " ReadOnly="true" runat="server" Text='<%#Eval("FormulaName") %>'></asp:TextBox>
                                                <asp:HiddenField ID="hdFormulaName" runat="server" Value='<%#Eval("FormulaName") %>' />
                                            </div>
                                            <div class="form-group col-lg-3">
                                                <label class=" " for="tbxpfQuantity">Bottles:</label>
                                                <asp:TextBox ID="tbxpfQuantity" CssClass="form-control font-weight-bold " ReadOnly="true" runat="server" Text='<%#Eval("TotalBottleQty") %>'></asp:TextBox>

                                            </div>
                                            <%-- <div class="form-group col-lg-3">
                                                <label class=" " for="tbxpfDateCreated">Date Created:</label>
                                                <asp:TextBox ID="tbxpfDateCreated" CssClass="form-control font-weight-bold " ReadOnly="true" runat="server" Text='<%#Eval("DateCreated", "{0:dd/MM/yyyy}") %>'></asp:TextBox>
                                            </div>
                                            <div class="form-group col-lg-3">
                                                <label class=" " for="tbxpfStatus">Reference Number:</label>
                                                <asp:TextBox ID="tbxpfStatus" CssClass="form-control font-weight-bold " ReadOnly="true" runat="server" Text='<%#Eval("Status") %>'></asp:TextBox>

                                            </div>--%>
                                            <div class=" form-group col-lg-2 align-self-end">

                                                <asp:Button CssClass="btn btn-outline-info btn-block" OnClick="btnModalDetails_Click" ID="btnModalDetails" runat="server" Text="See Details" />
                                            </div>
                                        </div>





                                    </ItemTemplate>
                                </asp:Repeater>
                                <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:conStr %>' SelectCommand="SELECT FormulaName, SUM(BottleQuantity) AS TotalBottleQty, DateCreated, Status FROM PatentFormulaStock GROUP BY FormulaName, DateCreated, Status HAVING (FormulaName = @formulaName) ORDER BY FormulaName">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="ddlFormulaName" PropertyName="SelectedValue" DefaultValue="0" Name="formulaName"></asp:ControlParameter>
                                    </SelectParameters>
                                </asp:SqlDataSource>
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
    <%--                ---------------------------Modal with details---------------%>
    <!-- The Modal -->
    <div class="modal" id="myModal">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">

                <!-- Modal Header -->
                <div class="modal-header bg-light">

                    <div class="col-md-1">
                        <i class="fas fa-prescription-bottle fa-4x" style="color: #9fc299;"></i>
                    </div>
                    <div class="col-md-10 ml-lg-2">
                        <h3 style="color: #9fc299;">Patent Formula:
                            <asp:Label ID="lblFormulaName" CssClass="font-weight-bold align-self-end" runat="server"></asp:Label></h3>
                    </div>

                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>

                <!-- Modal body -->
                <div class="modal-body">
 <%-------------------------Alert Error----------------------------%>
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

                    <div class="form-group row">

                        <label class="col-lg-2 font-weight-bold" for="tbxpfRefNum">Select Reference Number:</label>

                        <div class="col-lg-8 ">
                            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                <ContentTemplate>
                                    <asp:ListBox ID="lbpfRefNum" OnSelectedIndexChanged="ListBox1_SelectedIndexChanged" CssClass="form-control list-group pl-3" runat="server" DataSourceID="SqlDataSource3" AutoPostBack="True" DataTextField="FormulaRefNum" DataValueField="FormulaRefNum"></asp:ListBox>


<%--                                    <asp:SqlDataSource runat="server" ID="SqlDataSource3" ConnectionString='<%$ ConnectionStrings:conStr %>' SelectCommand="SELECT DISTINCT FormulaRefNum FROM PatentFormulaMain WHERE (FormulaName = @formulaName) AND (BottleQuantity > 0)">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="ddlFormulaName" PropertyName="SelectedValue" DefaultValue="0" Name="formulaName"></asp:ControlParameter>
                                        </SelectParameters>
                                    </asp:SqlDataSource>--%>
                                    <asp:HiddenField ID="hdModalFormulaName" runat="server" Value="" />
<%--                                    <asp:DropDownList ID="ddlpfRefNum" CssClass="form-control" runat="server" OnSelectedIndexChanged="ddlpfRefNum_SelectedIndexChanged" DataSourceID="SqlDataSource3" AutoPostBack="true" DataTextField="FormulaRefNum" DataValueField="FormulaRefNum">
                                        <asp:ListItem Value="0.1">---Select Referance Number---</asp:ListItem>
                                    </asp:DropDownList>--%>

                                    <asp:SqlDataSource runat="server"  ID="SqlDataSource3" ConnectionString='<%$ ConnectionStrings:conStr %>' SelectCommand="SELECT DISTINCT FormulaRefNum FROM PatentFormulaMain WHERE (FormulaName = @formulaName) AND (BottleQuantity > 0)">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="ddlFormulaName" PropertyName="SelectedValue" DefaultValue="0" Name="formulaName"></asp:ControlParameter>
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </ContentTemplate>

                            </asp:UpdatePanel>

                        </div>

                    </div>
                    <br />
                         <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                            <ContentTemplate>
                    <div class="row">
                        <div class="col-lg-2">
                            <label class="font-weight-bold">Bottles in Stock: </label>
                        </div>
                        <div class="col-lg-3">
                            
                            <asp:TextBox ID="tbxBottlesQty" CssClass="form-control font-weight-bold" ReadOnly="true" runat="server"></asp:TextBox>
                        </div>
                    </div>
                                 </ContentTemplate>

                        </asp:UpdatePanel>
                    <br />
                    <hr />
                    <h4 class="font-weight-bold">Content Details:</h4>
                    <div class="table-responsive-lg">

                        <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                            <ContentTemplate>
                                <asp:GridView ID="GridView1" CssClass="table  table-hover table-striped table-bordered border-info rounded" runat="server" DataSourceID="SqlDataSource2" AutoGenerateColumns="False">
                                    <Columns>
                                        <asp:BoundField DataField="HerbBatchNum" HeaderText="Batch Num" SortExpression="HerbBatchNum"></asp:BoundField>
                                        <asp:BoundField DataField="HerbName" HeaderText="Herb Name" SortExpression="HerbName"></asp:BoundField>
                                        <asp:BoundField DataField="DosageGrams" HeaderText="Dosage (g)" SortExpression="DosageGrams"></asp:BoundField>
                                        <asp:BoundField DataField="SellPrice" HeaderText="Unit Price" SortExpression="SellPrice" ReadOnly="True" DataFormatString="{0:C4}"></asp:BoundField>
                                        <asp:BoundField DataField="DateCreated" HeaderText="DateCreated" SortExpression="DateCreated" DataFormatString="{0:dd/MM/yyyy}"></asp:BoundField>
                                    </Columns>
                                </asp:GridView>
                                <asp:SqlDataSource runat="server" ID="SqlDataSource2" ConnectionString='<%$ ConnectionStrings:conStr %>' SelectCommand="SELECT PatentFormulaMain.HerbBatchNum, AllHerbs.HerbName, PatentFormulaMain.DosageGrams, HerbStock.SellPrice, PatentFormulaMain.DateCreated FROM PatentFormulaMain INNER JOIN HerbStock ON PatentFormulaMain.HerbBatchNum = HerbStock.BatchNum INNER JOIN AllHerbs ON HerbStock.HerbRefNum = AllHerbs.RefNum WHERE (PatentFormulaMain.FormulaRefNum = @FormulaRefNum)">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="lbpfRefNum" PropertyName="SelectedValue" Name="FormulaRefNum" Type="String" DefaultValue="0"></asp:ControlParameter>
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </ContentTemplate>

                        </asp:UpdatePanel>
                    </div>



                </div>

                <!-- Modal footer -->
                <div class="modal-footer">
                    <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                </div>

            </div>
        </div>
    </div>
</asp:Content>
