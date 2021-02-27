<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMaster.Master" AutoEventWireup="true" CodeBehind="ViewInventory.aspx.cs" Inherits="Dispensery.ViewInventory" %>
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
                            <i class="fa fa-cubes fa-4x pt-md-2 pb-md-2" aria-hidden="true" style="color: #9fc299;"></i>
                            <%-- <img class="" src="Img/icon-specialty-granules.png" />--%>
                        </div>
                        <div class="col-md-10 d-flex">
                            <h2 class="myFont title col-md-10   pt-md-4 mt-2 align-content-center" aria-hidden="true">Herbs Stock</h2>
                        </div>
                    </div>
                </div>
                <div class="card-body">
                   <%-- <div class="container ml-0 mr-0">--%>
                        <div class="line rounded col-md-12 justify-content-md-center justify-content-lg-center ">
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


                            <%--<div class="form-row justify-content-center">--%>
                                <div class="table-responsive-xl col-xl-12 pl-md-0">
                                    <asp:GridView ID="GridView1" CssClass="table  table-hover table-striped" GridLines="None" runat="server" AutoGenerateColumns="False" DataKeyNames="HerbStockID" DataSourceID="SqlDataSource1">
                                        <Columns>
                                            

                                            <asp:BoundField DataField="HerbStockID" Visible="false" HeaderText="HerbStockID" ReadOnly="True" InsertVisible="False" SortExpression="HerbStockID"></asp:BoundField>
                                            <asp:BoundField DataField="HerbRefNum"  Visible="false" ReadOnly="True" HeaderText="HerbRefNum" SortExpression="HerbRefNum"></asp:BoundField>
                                            <asp:TemplateField HeaderText="Herb Name" SortExpression="HerbName">
                                                <EditItemTemplate>
                                                    <asp:Label runat="server" CssClass="form-control" Text='<%# Eval("HerbName") %>' ID="Label1"></asp:Label>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Label runat="server" Text='<%# Bind("HerbName") %>' ID="Label1"></asp:Label> 
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Batch" SortExpression="BatchNum">
                                                <EditItemTemplate>
                                                    <asp:TextBox runat="server"  CssClass="form-control"  Text='<%# Bind("BatchNum") %>' ID="TextBox1"></asp:TextBox>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Label runat="server" Text='<%# Bind("BatchNum") %>' ID="Label2"></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Quantity" SortExpression="Quantity">
                                                <EditItemTemplate>
                                                    <asp:TextBox runat="server"  CssClass="form-control"  Text='<%# Bind("Quantity") %>' ID="TextBox2"></asp:TextBox>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Label runat="server" Text='<%# Bind("Quantity") %>' ID="Label3"></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Buy Price" SortExpression="BuyPrice">
                                                <EditItemTemplate>
                                                    <asp:TextBox runat="server"  CssClass="form-control"  Text='<%# Bind("BuyPrice") %>' ID="TextBox3"></asp:TextBox>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Label runat="server" Text='<%# Bind("BuyPrice", "{0:C4}") %>' ID="Label4"></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Sell Price" SortExpression="SellPrice">
                                                <EditItemTemplate>
                                                    <asp:TextBox runat="server"  CssClass="form-control"  Text='<%# Bind("SellPrice") %>' ID="TextBox4"></asp:TextBox>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Label runat="server" Text='<%# Bind("SellPrice", "{0:C4}") %>' ID="Label5"></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Ratio" SortExpression="HerbRawToGranRatio">
                                                <EditItemTemplate>
                                                    <asp:TextBox runat="server"  CssClass="form-control"  Text='<%# Bind("HerbRawToGranRatio") %>' ID="TextBox5"></asp:TextBox>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Label runat="server" Text='<%# Bind("HerbRawToGranRatio") %>' ID="Label6"></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Expiry Date" SortExpression="ExpiryDate">
                                                <EditItemTemplate>
                                                    <asp:TextBox runat="server"  CssClass="form-control"  Text='<%# Bind("ExpiryDate") %>' ID="TextBox6"></asp:TextBox>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Label runat="server" Text='<%# Bind("ExpiryDate","{0:dd/MM/yyyy}") %>' ID="Label7"></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Supplier" SortExpression="SupplierName">
                                                <EditItemTemplate>
                                                    <asp:Label runat="server"  CssClass="form-control"  Text='<%# Eval("SupplierName") %>' ID="Label2"></asp:Label>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Label runat="server" Text='<%# Bind("SupplierName") %>' ID="Label8"></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Received" SortExpression="DateReceived">
                                                <EditItemTemplate>
                                                    <asp:TextBox runat="server"  CssClass="form-control"  Text='<%# Bind("DateReceived") %>' ID="TextBox7"></asp:TextBox>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Label runat="server" Text='<%# Bind("DateReceived","{0:dd/MM/yyyy}") %>' ID="Label9"></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="To Dispensery" SortExpression="DateToDispensery">
                                                <EditItemTemplate>
                                                    <asp:TextBox runat="server"  CssClass="form-control"   Text='<%# Bind("DateToDispensery") %>' ID="TextBox8"></asp:TextBox>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Label runat="server" Text='<%# Bind("DateToDispensery","{0:dd/MM/yyyy}") %>' ID="Label10"></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Form" SortExpression="HerbForm">
                                                <EditItemTemplate>
                                                    <asp:TextBox runat="server"  CssClass="form-control"  Text='<%# Bind("HerbForm") %>' ID="TextBox9"></asp:TextBox>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Label runat="server" Text='<%# Bind("HerbForm") %>' ID="Label11"></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>

                                            <asp:BoundField DataField="DateLastChanged" HeaderText="DateLastChanged" SortExpression="DateLastChanged" Visible="False"></asp:BoundField>
                                            <asp:BoundField DataField="SupplierID"  Visible="false" HeaderText="SupplierID" SortExpression="SupplierID"></asp:BoundField>
                                        <asp:TemplateField ShowHeader="False">
                                                <EditItemTemplate>
                                                    <asp:LinkButton runat="server" Text="Update" CommandName="Update" CausesValidation="True" ID="LinkButton1"></asp:LinkButton>&nbsp;<asp:LinkButton runat="server" Text="Cancel" CommandName="Cancel" CausesValidation="False" ID="LinkButton2"></asp:LinkButton>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:LinkButton runat="server" Text="Edit" CommandName="Edit" CausesValidation="False" ID="LinkButton1"></asp:LinkButton>&nbsp;<asp:LinkButton runat="server" Text="Delete" CommandName="Delete" CausesValidation="False" ID="LinkButton2"></asp:LinkButton>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                    </asp:GridView>

                                    <%--                                    <asp:GridView ID="GridView1" CssClass="table  table-hover table-striped" GridLines="None" runat="server" AutoGenerateColumns="False" DataKeyNames="HerbStockID" DataSourceID="SqlDataSource1">
                                        <Columns>
                                            <asp:BoundField DataField="HerbStockID" HeaderText="HerbStockID" Visible="false" InsertVisible="False" SortExpression="HerbStockID"></asp:BoundField>
                                            <asp:TemplateField HeaderText="Herb Ref." SortExpression="HerbRefNum">
                                                <EditItemTemplate>
                                                    <asp:TextBox runat="server" CssClass="form-control" Text='<%# Bind("HerbRefNum") %>' ID="TextBox1"></asp:TextBox>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Label runat="server"  Text='<%# Bind("HerbRefNum") %>' ID="Label1"></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Batch No." SortExpression="BatchNum">
                                                <EditItemTemplate>
                                                    <asp:TextBox runat="server" CssClass="form-control" Text='<%# Bind("BatchNum") %>' ID="TextBox2"></asp:TextBox>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Label runat="server" Text='<%# Bind("BatchNum") %>' ID="Label2"></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Buy Price" SortExpression="BuyPrice">
                                                <EditItemTemplate>
                                                    <asp:TextBox runat="server" CssClass="form-control" Text='<%# Bind("BuyPrice", "{0:C4}") %>' ID="TextBox3"></asp:TextBox>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Label runat="server" Text='<%# Bind("BuyPrice", "{0:C4}") %>' ID="Label3"></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Sell Price" SortExpression="SellPrice">
                                                <EditItemTemplate>
                                                    <asp:TextBox runat="server" CssClass="form-control" Text='<%# Bind("SellPrice", "{0:C4}") %>' ID="TextBox4"></asp:TextBox>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Label runat="server" Text='<%# Bind("SellPrice", "{0:C4}") %>' ID="Label4"></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Expiry Date" SortExpression="ExpiryDate">
                                                <EditItemTemplate>
                                                    <asp:TextBox runat="server" CssClass="form-control" Text='<%# Bind("ExpiryDate", "{0:dd/MM/yyyy}") %>' ID="TextBox5"></asp:TextBox>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Label runat="server" Text='<%# Bind("ExpiryDate", "{0:dd/MM/yyyy}") %>' ID="Label5"></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Quantity (g)" SortExpression="Quantity">
                                                <EditItemTemplate>
                                                    <asp:TextBox runat="server" CssClass="form-control" Text='<%# Bind("Quantity") %>' ID="TextBox6"></asp:TextBox>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Label runat="server" Text='<%# Bind("Quantity") %>' ID="Label6"></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Supplier ID" SortExpression="SupplierID">
                                                <EditItemTemplate>
                                                    <asp:TextBox runat="server" CssClass="form-control" Text='<%# Bind("SupplierID") %>' ID="TextBox7"></asp:TextBox>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Label runat="server" Text='<%# Bind("SupplierID") %>' ID="Label7"></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Herb Ratio" SortExpression="HerbRawToGranRatio">
                                                <EditItemTemplate>
                                                    <asp:TextBox runat="server" CssClass="form-control" Text='<%# Bind("HerbRawToGranRatio") %>' ID="TextBox8"></asp:TextBox>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Label runat="server" Text='<%# Bind("HerbRawToGranRatio") %>' ID="Label8"></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Received" SortExpression="DateReceived">
                                                <EditItemTemplate>
                                                    <asp:TextBox runat="server" CssClass="form-control" Text='<%# Bind("DateReceived", "{0:dd/MM/yyyy}") %>' ID="TextBox9"></asp:TextBox>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Label runat="server" Text='<%# Bind("DateReceived", "{0:dd/MM/yyyy}") %>' ID="Label9"></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="To Dispensery" SortExpression="DateToDispensery">
                                                <EditItemTemplate>
                                                    <asp:TextBox runat="server" CssClass="form-control" Text='<%# Bind("DateToDispensery", "{0:dd/MM/yyyy}") %>' ID="TextBox10"></asp:TextBox>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Label runat="server" Text='<%# Bind("DateToDispensery", "{0:dd/MM/yyyy}") %>' ID="Label10"></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField  ShowHeader="False">
                                                <EditItemTemplate>
                                                    <asp:LinkButton runat="server" CssClass="btn btn-outline-info m-0 p-0" Text="Update" CommandName="Update" CausesValidation="True" ID="LinkButton1"></asp:LinkButton>&nbsp;<asp:LinkButton runat="server" CssClass="btn btn-outline-danger" Text="Cancel" CommandName="Cancel" CausesValidation="False" ID="LinkButton2"></asp:LinkButton>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:LinkButton runat="server" CssClass=" btn btn-primary" Text="" CommandName="Edit" CausesValidation="False" ID="LinkButton1"><i class="fa fa-pencil-alt"></i></asp:LinkButton>&nbsp;<asp:LinkButton runat="server" CssClass="btn  btn-danger" Text="" CommandName="Delete" CausesValidation="False" ID="LinkButton2"><i class="fa fa-trash-alt"></i></asp:LinkButton>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField ConvertEmptyStringToNull="False" HeaderText="HerbForm" SortExpression="HerbForm">
                                                <EditItemTemplate>
                                                    <asp:DynamicControl ID="DynamicControl1" DataField="HerbForm" Mode="Edit" runat="server" />
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:DynamicControl ID="DynamicControl1" DataField="HerbForm" Mode="ReadOnly" runat="server" />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                    </asp:GridView>
                                    <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConflictDetection="CompareAllValues" ConnectionString='<%$ ConnectionStrings:conStr %>' DeleteCommand="DELETE FROM HerbStock WHERE (HerbStockID = @original_HerbStockID) AND (HerbRefNum = @original_HerbRefNum) AND (BatchNum = @original_BatchNum OR BatchNum IS NULL AND @original_BatchNum IS NULL) AND (BuyPrice = @original_BuyPrice OR BuyPrice IS NULL AND @original_BuyPrice IS NULL) AND (SellPrice = @original_SellPrice OR SellPrice IS NULL AND @original_SellPrice IS NULL) AND (ExpiryDate = @original_ExpiryDate OR ExpiryDate IS NULL AND @original_ExpiryDate IS NULL) AND (Quantity = @original_Quantity OR Quantity IS NULL AND @original_Quantity IS NULL) AND (SupplierID = @original_SupplierID OR SupplierID IS NULL AND @original_SupplierID IS NULL) AND (HerbRawToGranRatio = @original_HerbRawToGranRatio OR HerbRawToGranRatio IS NULL AND @original_HerbRawToGranRatio IS NULL) AND (DateReceived = @original_DateReceived OR DateReceived IS NULL AND @original_DateReceived IS NULL) AND (DateToDispensery = @original_DateToDispensery OR DateToDispensery IS NULL AND @original_DateToDispensery IS NULL) AND (HerbForm = @original_HerbForm OR HerbForm IS NULL AND @original_HerbForm IS NULL)" InsertCommand="INSERT INTO [HerbStock] ([HerbRefNum], [BatchNum], [BuyPrice], [SellPrice], [ExpiryDate], [Quantity], [SupplierID], [HerbRawToGranRatio], [DateReceived], [DateToDispensery]) VALUES (@HerbRefNum, @BatchNum, @BuyPrice, @SellPrice, @ExpiryDate, @Quantity, @SupplierID, @HerbRawToGranRatio, @DateReceived, @DateToDispensery)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [HerbStock] ORDER BY [HerbRefNum], [ExpiryDate]" UpdateCommand="UPDATE HerbStock SET HerbRefNum = @HerbRefNum, BatchNum = @BatchNum, BuyPrice = @BuyPrice, SellPrice = @SellPrice, ExpiryDate = @ExpiryDate, Quantity = @Quantity, SupplierID = @SupplierID, HerbRawToGranRatio = @HerbRawToGranRatio, DateReceived = @DateReceived, DateToDispensery = @DateToDispensery, HerbForm = @HerbForm WHERE (HerbStockID = @original_HerbStockID) AND (HerbRefNum = @original_HerbRefNum) AND (BatchNum = @original_BatchNum OR BatchNum IS NULL AND @original_BatchNum IS NULL) AND (BuyPrice = @original_BuyPrice OR BuyPrice IS NULL AND @original_BuyPrice IS NULL) AND (SellPrice = @original_SellPrice OR SellPrice IS NULL AND @original_SellPrice IS NULL) AND (ExpiryDate = @original_ExpiryDate OR ExpiryDate IS NULL AND @original_ExpiryDate IS NULL) AND (Quantity = @original_Quantity OR Quantity IS NULL AND @original_Quantity IS NULL) AND (SupplierID = @original_SupplierID OR SupplierID IS NULL AND @original_SupplierID IS NULL) AND (HerbRawToGranRatio = @original_HerbRawToGranRatio OR HerbRawToGranRatio IS NULL AND @original_HerbRawToGranRatio IS NULL) AND (DateReceived = @original_DateReceived OR DateReceived IS NULL AND @original_DateReceived IS NULL) AND (DateToDispensery = @original_DateToDispensery OR DateToDispensery IS NULL AND @original_DateToDispensery IS NULL) AND (HerbForm = @original_HerbForm OR HerbForm IS NULL AND @original_HerbForm IS NULL)">
                                        <DeleteParameters>
                                            <asp:Parameter Name="original_HerbStockID" Type="Int32"></asp:Parameter>
                                            <asp:Parameter Name="original_HerbRefNum" Type="String"></asp:Parameter>
                                            <asp:Parameter Name="original_BatchNum" Type="String"></asp:Parameter>
                                            <asp:Parameter Name="original_BuyPrice" Type="Decimal"></asp:Parameter>
                                            <asp:Parameter Name="original_SellPrice" Type="Decimal"></asp:Parameter>
                                            <asp:Parameter DbType="Date" Name="original_ExpiryDate"></asp:Parameter>
                                            <asp:Parameter Name="original_Quantity" Type="Decimal"></asp:Parameter>
                                            <asp:Parameter Name="original_SupplierID" Type="Int32"></asp:Parameter>
                                            <asp:Parameter Name="original_HerbRawToGranRatio" Type="Decimal"></asp:Parameter>
                                            <asp:Parameter DbType="Date" Name="original_DateReceived"></asp:Parameter>
                                            <asp:Parameter DbType="Date" Name="original_DateToDispensery"></asp:Parameter>
                                            <asp:Parameter Name="original_HerbForm"></asp:Parameter>
                                        </DeleteParameters>
                                        <InsertParameters>
                                            <asp:Parameter Name="HerbRefNum" Type="String"></asp:Parameter>
                                            <asp:Parameter Name="BatchNum" Type="String"></asp:Parameter>
                                            <asp:Parameter Name="BuyPrice" Type="Decimal"></asp:Parameter>
                                            <asp:Parameter Name="SellPrice" Type="Decimal"></asp:Parameter>
                                            <asp:Parameter DbType="Date" Name="ExpiryDate"></asp:Parameter>
                                            <asp:Parameter Name="Quantity" Type="Decimal"></asp:Parameter>
                                            <asp:Parameter Name="SupplierID" Type="Int32"></asp:Parameter>
                                            <asp:Parameter Name="HerbRawToGranRatio" Type="Decimal"></asp:Parameter>
                                            <asp:Parameter DbType="Date" Name="DateReceived"></asp:Parameter>
                                            <asp:Parameter DbType="Date" Name="DateToDispensery"></asp:Parameter>
                                        </InsertParameters>
                                        <UpdateParameters>
                                            <asp:Parameter Name="HerbRefNum" Type="String"></asp:Parameter>
                                            <asp:Parameter Name="BatchNum" Type="String"></asp:Parameter>
                                            <asp:Parameter Name="BuyPrice" Type="Decimal"></asp:Parameter>
                                            <asp:Parameter Name="SellPrice" Type="Decimal"></asp:Parameter>
                                            <asp:Parameter DbType="Date" Name="ExpiryDate"></asp:Parameter>
                                            <asp:Parameter Name="Quantity" Type="Decimal"></asp:Parameter>
                                            <asp:Parameter Name="SupplierID" Type="Int32"></asp:Parameter>
                                            <asp:Parameter Name="HerbRawToGranRatio" Type="Decimal"></asp:Parameter>
                                            <asp:Parameter DbType="Date" Name="DateReceived"></asp:Parameter>
                                            <asp:Parameter DbType="Date" Name="DateToDispensery"></asp:Parameter>
                                            <asp:Parameter Name="HerbForm"></asp:Parameter>
                                            <asp:Parameter Name="original_HerbStockID" Type="Int32"></asp:Parameter>
                                            <asp:Parameter Name="original_HerbRefNum" Type="String"></asp:Parameter>
                                            <asp:Parameter Name="original_BatchNum" Type="String"></asp:Parameter>
                                            <asp:Parameter Name="original_BuyPrice" Type="Decimal"></asp:Parameter>
                                            <asp:Parameter Name="original_SellPrice" Type="Decimal"></asp:Parameter>
                                            <asp:Parameter Name="original_ExpiryDate" DbType="Date"></asp:Parameter>
                                            <asp:Parameter Name="original_Quantity" Type="Decimal"></asp:Parameter>
                                            <asp:Parameter Name="original_SupplierID" Type="Int32"></asp:Parameter>
                                            <asp:Parameter Name="original_HerbRawToGranRatio" Type="Decimal"></asp:Parameter>
                                            <asp:Parameter DbType="Date" Name="original_DateReceived"></asp:Parameter>
                                            <asp:Parameter DbType="Date" Name="original_DateToDispensery"></asp:Parameter>
                                            <asp:Parameter Name="original_HerbForm"></asp:Parameter>
                                        </UpdateParameters>
                                    </asp:SqlDataSource>--%>

                                    <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:conStr %>' DeleteCommand="DELETE FROM HerbStock WHERE (HerbStockID = @HerbStockID)" SelectCommand="SELECT HerbStock.HerbStockID, HerbStock.HerbRefNum, HerbStock.BatchNum, AllHerbs.HerbName, HerbStock.BuyPrice, HerbStock.SellPrice, HerbStock.ExpiryDate, HerbStock.Quantity, SupplierTable.SupplierName, HerbStock.HerbRawToGranRatio, HerbStock.DateReceived, HerbStock.DateToDispensery, HerbStock.HerbForm, HerbStock.DateLastChanged, HerbStock.SupplierID FROM HerbStock INNER JOIN AllHerbs ON HerbStock.HerbRefNum = AllHerbs.RefNum INNER JOIN SupplierTable ON HerbStock.SupplierID = SupplierTable.SupplierID" UpdateCommand="UPDATE HerbStock SET HerbRefNum = @HerbRefNum, BatchNum = @BatchNum, BuyPrice = @BuyPrice, SellPrice = @SellPrice, ExpiryDate = @ExpiryDate, Quantity = @Quantity, HerbRawToGranRatio = @HerbRawToGranRatio, DateReceived = @DateReceived, DateToDispensery = @DateToDispensery, HerbForm = @HerbForm, SupplierID = @SupplierID WHERE (HerbStockID = @original_HerbStockID) AND (HerbRefNum = @original_HerbRefNum) AND (BatchNum = @original_BatchNum OR BatchNum IS NULL AND @original_BatchNum IS NULL) AND (BuyPrice = @original_BuyPrice OR BuyPrice IS NULL AND @original_BuyPrice IS NULL) AND (SellPrice = @original_SellPrice OR SellPrice IS NULL AND @original_SellPrice IS NULL) AND (ExpiryDate = @original_ExpiryDate OR ExpiryDate IS NULL AND @original_ExpiryDate IS NULL) AND (Quantity = @original_Quantity OR Quantity IS NULL AND @original_Quantity IS NULL) AND (SupplierID = @original_SupplierID OR SupplierID IS NULL AND @original_SupplierID IS NULL) AND (HerbRawToGranRatio = @original_HerbRawToGranRatio OR HerbRawToGranRatio IS NULL AND @original_HerbRawToGranRatio IS NULL) AND (DateReceived = @original_DateReceived OR DateReceived IS NULL AND @original_DateReceived IS NULL) AND (DateToDispensery = @original_DateToDispensery OR DateToDispensery IS NULL AND @original_DateToDispensery IS NULL) AND (HerbForm = @original_HerbForm OR HerbForm IS NULL AND @original_HerbForm IS NULL)">
                                        <DeleteParameters>
                                            <asp:Parameter Name="HerbStockID"></asp:Parameter>
                                        </DeleteParameters>
                                        <UpdateParameters>
                                            <asp:Parameter Name="HerbRefNum" Type="String"></asp:Parameter>
                                            <asp:Parameter Name="BatchNum" Type="String"></asp:Parameter>
                                            <asp:Parameter Name="BuyPrice" Type="Decimal"></asp:Parameter>
                                            <asp:Parameter Name="SellPrice" Type="Decimal"></asp:Parameter>
                                            <asp:Parameter Name="ExpiryDate" DbType="Date"></asp:Parameter>
                                            <asp:Parameter Name="Quantity" Type="Decimal"></asp:Parameter>
                                            <asp:Parameter Name="HerbRawToGranRatio" Type="String"></asp:Parameter>
                                            <asp:Parameter Name="DateReceived" DbType="Date"></asp:Parameter>
                                            <asp:Parameter Name="DateToDispensery" DbType="Date"></asp:Parameter>
                                            <asp:Parameter Name="HerbForm" Type="String"></asp:Parameter>
                                            <asp:Parameter Name="SupplierID" Type="Int16"></asp:Parameter>
                                            <asp:Parameter Name="original_HerbStockID" Type="Int16"></asp:Parameter>

                                            <asp:Parameter Name="original_HerbRefNum" Type="String"></asp:Parameter>
                                            <asp:Parameter Name="original_BatchNum" Type="String"></asp:Parameter>
                                            <asp:Parameter Name="original_BuyPrice" Type="Decimal"></asp:Parameter>
                                            <asp:Parameter Name="original_SellPrice" Type="Decimal"></asp:Parameter>
                                            <asp:Parameter Name="original_ExpiryDate" DbType="Date"></asp:Parameter>
                                            <asp:Parameter Name="original_Quantity" Type="Decimal"></asp:Parameter>
                                            <asp:Parameter Name="original_SupplierID" Type="Int16"></asp:Parameter>
                                            <asp:Parameter Name="original_HerbRawToGranRatio" Type="String"></asp:Parameter>
                                            <asp:Parameter Name="original_DateReceived" DbType="Date"></asp:Parameter>
                                            <asp:Parameter Name="original_DateToDispensery" DbType="Date"></asp:Parameter>
                                            <asp:Parameter Name="original_HerbForm" Type="String"></asp:Parameter>



                                        </UpdateParameters>
                                    </asp:SqlDataSource>
                                </div>
                           <%-- </div>--%>

                        </div>
                   <%-- </div>--%>
                </div>
            </div>
        </div>
    </main>

</asp:Content>
