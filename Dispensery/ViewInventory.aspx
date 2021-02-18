﻿<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMaster.Master" AutoEventWireup="true" CodeBehind="ViewInventory.aspx.cs" Inherits="Dispensery.ViewInventory" %>
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
                        <div class="line rounded p-4 col-md-12 justify-content-md-center justify-content-lg-center ">
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
                                <div class="table-responsive-lg col-md-12 col-lg-12">


                                    
                                    <asp:GridView ID="GridView1" CssClass="table  table-hover table-striped" GridLines="None" runat="server" AutoGenerateColumns="False" DataKeyNames="HerbStockID" DataSourceID="SqlDataSource1">
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
                                                    <asp:LinkButton runat="server" CssClass="btn btn-outline-info" Text="Update" CommandName="Update" CausesValidation="True" ID="LinkButton1"></asp:LinkButton>&nbsp;<asp:LinkButton runat="server" CssClass="btn btn-outline-danger" Text="Cancel" CommandName="Cancel" CausesValidation="False" ID="LinkButton2"></asp:LinkButton>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:LinkButton runat="server" CssClass=" btn btn-primary" Text="Edit" CommandName="Edit" CausesValidation="False" ID="LinkButton1"></asp:LinkButton>&nbsp;<asp:LinkButton runat="server" CssClass="btn  btn-danger" Text="Delete" CommandName="Delete" CausesValidation="False" ID="LinkButton2"></asp:LinkButton>
                                                </ItemTemplate>
                                            </asp:TemplateField>




                                        </Columns>
                                    </asp:GridView>
                                    <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConflictDetection="CompareAllValues" ConnectionString='<%$ ConnectionStrings:conStr %>' DeleteCommand="DELETE FROM [HerbStock] WHERE [HerbStockID] = @original_HerbStockID AND [HerbRefNum] = @original_HerbRefNum AND (([BatchNum] = @original_BatchNum) OR ([BatchNum] IS NULL AND @original_BatchNum IS NULL)) AND (([BuyPrice] = @original_BuyPrice) OR ([BuyPrice] IS NULL AND @original_BuyPrice IS NULL)) AND (([SellPrice] = @original_SellPrice) OR ([SellPrice] IS NULL AND @original_SellPrice IS NULL)) AND (([ExpiryDate] = @original_ExpiryDate) OR ([ExpiryDate] IS NULL AND @original_ExpiryDate IS NULL)) AND (([Quantity] = @original_Quantity) OR ([Quantity] IS NULL AND @original_Quantity IS NULL)) AND (([SupplierID] = @original_SupplierID) OR ([SupplierID] IS NULL AND @original_SupplierID IS NULL)) AND (([HerbRawToGranRatio] = @original_HerbRawToGranRatio) OR ([HerbRawToGranRatio] IS NULL AND @original_HerbRawToGranRatio IS NULL)) AND (([DateReceived] = @original_DateReceived) OR ([DateReceived] IS NULL AND @original_DateReceived IS NULL)) AND (([DateToDispensery] = @original_DateToDispensery) OR ([DateToDispensery] IS NULL AND @original_DateToDispensery IS NULL))" InsertCommand="INSERT INTO [HerbStock] ([HerbRefNum], [BatchNum], [BuyPrice], [SellPrice], [ExpiryDate], [Quantity], [SupplierID], [HerbRawToGranRatio], [DateReceived], [DateToDispensery]) VALUES (@HerbRefNum, @BatchNum, @BuyPrice, @SellPrice, @ExpiryDate, @Quantity, @SupplierID, @HerbRawToGranRatio, @DateReceived, @DateToDispensery)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [HerbStock] ORDER BY [HerbRefNum], [ExpiryDate]" UpdateCommand="UPDATE [HerbStock] SET [HerbRefNum] = @HerbRefNum, [BatchNum] = @BatchNum, [BuyPrice] = @BuyPrice, [SellPrice] = @SellPrice, [ExpiryDate] = @ExpiryDate, [Quantity] = @Quantity, [SupplierID] = @SupplierID, [HerbRawToGranRatio] = @HerbRawToGranRatio, [DateReceived] = @DateReceived, [DateToDispensery] = @DateToDispensery WHERE [HerbStockID] = @original_HerbStockID AND [HerbRefNum] = @original_HerbRefNum AND (([BatchNum] = @original_BatchNum) OR ([BatchNum] IS NULL AND @original_BatchNum IS NULL)) AND (([BuyPrice] = @original_BuyPrice) OR ([BuyPrice] IS NULL AND @original_BuyPrice IS NULL)) AND (([SellPrice] = @original_SellPrice) OR ([SellPrice] IS NULL AND @original_SellPrice IS NULL)) AND (([ExpiryDate] = @original_ExpiryDate) OR ([ExpiryDate] IS NULL AND @original_ExpiryDate IS NULL)) AND (([Quantity] = @original_Quantity) OR ([Quantity] IS NULL AND @original_Quantity IS NULL)) AND (([SupplierID] = @original_SupplierID) OR ([SupplierID] IS NULL AND @original_SupplierID IS NULL)) AND (([HerbRawToGranRatio] = @original_HerbRawToGranRatio) OR ([HerbRawToGranRatio] IS NULL AND @original_HerbRawToGranRatio IS NULL)) AND (([DateReceived] = @original_DateReceived) OR ([DateReceived] IS NULL AND @original_DateReceived IS NULL)) AND (([DateToDispensery] = @original_DateToDispensery) OR ([DateToDispensery] IS NULL AND @original_DateToDispensery IS NULL))">
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
