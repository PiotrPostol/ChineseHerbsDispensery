<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMaster.Master" AutoEventWireup="true" MaintainScrollPositionOnPostback="true" CodeBehind="NewPatentFormula.aspx.cs" Inherits="Dispensery.NewPatentFormula" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
    $(document).ready(function () {
        var priceTotal = 0;
        //var subtotal;

        $.each($(".priceCSS"), function (index, value) {
            priceTotal += parseFloat($(value).text());
        });

        $(".priceSpan").text(new Intl.NumberFormat('en-IE', { style: 'currency', currency: 'EUR' }).format(priceTotal));

        //$.each($(".subtotalCSS"), function (index, value) {
        //    subtotal = parseFloat($(value).text())
        //    $(".subtotalCSS").text(new Intl.NumberFormat('de-DE', { style: 'currency', currency: 'EUR' }).format(subtotal))
        //});
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
                        <div class="col-md-1">
                            <i class="fas fa-prescription-bottle-alt fa-4x p-md-2" aria-hidden="true" style="color: #9fc299;"></i>
                            <%-- <img class="" src="Img/icon-specialty-granules.png" />--%>
                        </div>
                        <div class="col-md-11 d-flex">
                            <h3 class=" font-weight-bold  col-md-10  pt-4 align-content-center" aria-hidden="true" style="color: #9fc299;">Make New Patent Formula</h3>
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
                            <div class="form-row " id="divFormInput" runat="server">
                                <div class="form-group col-lg-6">
                                    <label class=" font-weight-bold" for="tbxHerb">Select Patent Formula:</label>
                                    <asp:DropDownList ID="ddlPatentFormula" CssClass="form-control" runat="server" DataSourceID="SqlDataSource2" DataTextField="FormulaName" DataValueField="FormulaName"></asp:DropDownList>
                                    <asp:SqlDataSource runat="server" ID="SqlDataSource2" ConnectionString='<%$ ConnectionStrings:conStr %>' SelectCommand="SELECT DISTINCT FormulaName FROM PatentFormulas"></asp:SqlDataSource>
                                </div>
                                <div class="form-group col-lg-4">
                                    <label class=" font-weight-bold" for="tbxQuantity">Quantity:</label>
                                    <asp:TextBox ID="tbxQuantity" required="true" class="NumbersOnly form-control" runat="server" Text="" data-toggle="tooltip" data-placement="top" Title="Enter Quantity of Patent Formula Bottles (75 capsuls - 37.5g per bottle)." AutoPostBack="false"></asp:TextBox>
                                </div>

                                <div class="form-group col-lg-2 align-self-end">
                                    <asp:Button runat="server" OnClick="btnCreatePatentFormula_Click" ID="btnCreatePatentFormula" type="submit" class="btn  btn-success btn-block" Text="Create"></asp:Button>
                                </div>

                            </div>

                            <%--                            ------------------------------------cancel button----------------------------%>
                            <div class="form-row " id="divCancel" runat="server">
                                <div class="col-lg-8">
                                    <div class="form-group row ">
                                        <label class="col-sm-3 font-weight-bold" for="tbxFormulaName">Formula Name:</label>
                                        <div class="col-sm-9">
                                            <asp:TextBox ID="tbxFormulaName" required="true" class="form-control ml-md-2" ReadOnly="true" runat="server" Text="" AutoPostBack="false"></asp:TextBox>

                                        </div>
                                    </div>

                                </div>

                                <div class="form-group col-lg-2">
                                </div>
                                <div class="form-group col-lg-2 align-self-end">
                                    <asp:Button runat="server" OnClick="btnCancel_Click" ID="btnCancel" type="submit" class="btn  btn-danger btn-block" Text="Cancel"></asp:Button>
                                </div>

                            </div>
                            <br />
                            <hr />


                            <%--              ------------------   lables hidden------------------------%>
                            <div id="lables" runat="server" visible="false">
                                <div class="form-row ">
                                    <div class="form-group col-lg-4">
                                        <label class=" font-weight-bold">Patent Formula Referance Number:</label>
                                    </div>
                                    <div class="form-group col-lg-2">
                                        <asp:Label ID="lblPFrefNum" runat="server" Text=""></asp:Label>
                                    </div>
                                </div>
                                <div class="form-row ">
                                    <div class="form-group col-lg-4">
                                        <label class=" font-weight-bold">Number Of Bottles:</label>
                                    </div>
                                    <div class="form-group col-lg-2">
                                        <asp:Label ID="lblBottleQty" runat="server" Text=""></asp:Label>
                                    </div>
                                </div>

                            </div>

                            <%--------------------------gridview Table-------------------------------------%>
                            <div class="table-responsive-xl">
                                <asp:GridView ID="GridView1" CssClass="table  table-hover table-striped" ShowFooter="true" GridLines="None" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1">
                                    <Columns>
                                        <asp:BoundField DataField="FormulaRefNum" Visible="false" HeaderText="FormulaRefNum" SortExpression="FormulaRefNum"></asp:BoundField>
                                        <asp:BoundField DataField="HerbBatchNum" HeaderText="Batch Num" SortExpression="HerbBatchNum"></asp:BoundField>
                                        <asp:BoundField DataField="HerbName" HeaderText="Herb Name" SortExpression="HerbName"></asp:BoundField>
                                        
                                        <asp:BoundField DataField="GramsPerBottle" HeaderText="Per Bottle (g)" ReadOnly="True" SortExpression="GramsPerBottle" DataFormatString="{0:F2}"></asp:BoundField>
                                        <asp:BoundField DataField="DosageGrams" HeaderText="Total Dosage (g)" SortExpression="DosageGrams"></asp:BoundField>
                                        <asp:BoundField DataField="HerbRefNum" Visible="false" HeaderText="HerbRefNum" SortExpression="HerbRefNum"></asp:BoundField>
                                        <asp:BoundField DataField="SellPrice" HeaderText="Unit Price" ReadOnly="True" SortExpression="SellPrice" DataFormatString="{0:C4}"></asp:BoundField>
                                        <asp:TemplateField HeaderText="Subtotal" SortExpression="Subtotal">
                                            <EditItemTemplate>
                                                <asp:Label runat="server" Text='<%# Eval("Subtotal","{0:F2}") %>' CssClass="subtotalCSS" ID="Label1"></asp:Label>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label runat="server" Text='<%# Bind("Subtotal","{0:F2}") %>' CssClass="priceCSS" ID="Label1"></asp:Label>
                                            </ItemTemplate>
                                            <FooterTemplate>
                                                <span class="priceSpan font-weight-bold"></span>
                                            </FooterTemplate>
                                        </asp:TemplateField>



                                    </Columns>
                                </asp:GridView>
                                <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:conStr %>' SelectCommand="SELECT PatentFormulaTemp.FormulaRefNum, PatentFormulaTemp.HerbBatchNum, AllHerbs.HerbName, PatentFormulaTemp.DosageGrams, PatentFormulaTemp.GramsPerBottle, PatentFormulaTemp.HerbRefNum, (SELECT SellPrice FROM HerbStock WHERE (BatchNum = PatentFormulaTemp.HerbBatchNum)) AS SellPrice, PatentFormulaTemp.DosageGrams * (SELECT SellPrice FROM HerbStock AS HerbStock_1 WHERE (BatchNum = PatentFormulaTemp.HerbBatchNum)) AS Subtotal FROM AllHerbs INNER JOIN PatentFormulaTemp ON AllHerbs.RefNum = PatentFormulaTemp.HerbRefNum WHERE (PatentFormulaTemp.FormulaName = @PFname)">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="ddlPatentFormula" PropertyName="SelectedValue" DefaultValue="0" Name="PFname"></asp:ControlParameter>
                                    </SelectParameters>
                                </asp:SqlDataSource>

                                

                            </div>
                            <br />
                            <div class="row justify-content-center" runat="server" id="createPF">
                                    <div class="form-group col-lg-4">
                                        <asp:Button ID="btnCreatePF" OnClick="btnCreatePF_Click" CssClass="btn btn-success  btn-block" runat="server" Text="Create Patent Formula" />
                                    </div>
                                    
                                </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </main>

</asp:Content>
