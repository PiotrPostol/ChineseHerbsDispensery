 <%@ Page Title="" Language="C#" MasterPageFile="~/SiteMaster.Master" AutoEventWireup="true" EnableEventValidation="false" MaintainScrollPositionOnPostback="true" CodeBehind="ViewInventory.aspx.cs" Inherits="Dispensery.ViewInventory" %>
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
                        <div class="col-xl-2  col-md-2">
                            <i class="fa fa-cubes fa-4x pt-md-2 pb-md-2" aria-hidden="true" style="color: #9fc299;"></i>
                            <%-- <img class="" src="Img/icon-specialty-granules.png" />--%>
                        </div>
                        <div class="col-xl-8 col-md-6 d-flex">
                            <h1 class="font-weight-bold   pt-md-2 mt-2 align-content-center"aria-hidden="true" style="color: #9fc299;">Herbs Stock</h1>
                        </div>
                        <div class="col-xl-2 col-md-4 align-self-center " >
                            <asp:Button ID="btnExportToExl" OnClick="btnExportToExl_Click" CssClass="btn btn-success btn-block" runat="server" Text="Export To Excel" />
                        </div>
                    </div>
                </div>
                <div class="card-body">
                   <%-- <div class="container ml-0 mr-0">--%>
                        <%--<div class="line rounded col-md-12 justify-content-md-center justify-content-lg-center ">--%>
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
<%------------------------filter dropdown list--------------------------------%>
                     <div class="col-lg-4 col-md-6 mb-4 align-content-center">
                           <%-- <i class="fa fa-user-check fa-4x" aria-hidden="true" style="color: #9fc299;"></i>--%>
                            <label class=" font-weight-bold" for="ddlHerb">Searched Selected Herb:</label>

                            <asp:DropDownList ID="ddlHerb"  AutoPostBack="true" AppendDataBoundItems="true" CssClass="form-control" runat="server" DataSourceID="SqlDataSource3" DataTextField="HerbName" DataValueField="HerbRefNum">
                                <asp:ListItem Text="-- All --" Value="all" Selected="true"></asp:ListItem>
                            </asp:DropDownList>

                         <asp:SqlDataSource runat="server" ID="SqlDataSource3" ConnectionString='<%$ ConnectionStrings:conStr %>' SelectCommand="SELECT DISTINCT HerbStock.HerbRefNum, AllHerbs.HerbName FROM HerbStock INNER JOIN AllHerbs ON HerbStock.HerbRefNum = AllHerbs.RefNum ORDER BY AllHerbs.HerbName"></asp:SqlDataSource>
                        </div>
                    
                    <hr />
                    <br />

                            

                                <div class="table-responsive-xl col-xl-12 pl-md-0">
                                    <asp:GridView ID="GridView1" OnRowEditing="GridView1_RowEditing" CssClass="table table-sm table-hover table-striped" GridLines="None" runat="server" AutoGenerateColumns="False" DataKeyNames="HerbStockID" DataSourceID="SqlDataSource1">
                                        <Columns>
                                            <asp:TemplateField ShowHeader="True" HeaderText="Edit">
                                                <EditItemTemplate>
                                                    <asp:LinkButton runat="server" Text="Update"  CssClass="btn btn-sm btn-outline-primary" CommandName="Update" CausesValidation="True" ID="LinkButton1"></asp:LinkButton>&nbsp;<asp:LinkButton runat="server" Text="Cancel" CssClass="btn btn-sm btn-outline-danger" CommandName="Cancel" CausesValidation="False" ID="LinkButton2"></asp:LinkButton>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:LinkButton runat="server" Text="" CssClass="btn btn-sm btn-outline-primary" CommandName="Edit" CausesValidation="False" ID="LinkButton1"><i class="fas fa-pencil-alt"></i></asp:LinkButton>&nbsp;<asp:LinkButton runat="server" Text="Delete" CssClass="btn btn-sm btn-outline-danger" Visible="false" CommandName="Delete" CausesValidation="False" ID="LinkButton2"><i class="far fa-trash-alt"></i></asp:LinkButton>
                                                </ItemTemplate>
                                            </asp:TemplateField>



                                            <asp:TemplateField HeaderText="ID" InsertVisible="false" SortExpression="HerbStockID" Visible="true">
                                                <EditItemTemplate>
                                                    <asp:Label runat="server" Text='<%# Eval("HerbStockID") %>' ID="Label1"></asp:Label>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Label runat="server" Text='<%# Bind("HerbStockID") %>' ID="Label1"></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Herb Ref." SortExpression="HerbRefNum">
                                                <EditItemTemplate>
                                                    <asp:TextBox runat="server" CssClass="form-control" Text='<%# Bind("HerbRefNum") %>' ID="TextBox1"></asp:TextBox>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Label runat="server" Text='<%# Bind("HerbRefNum") %>' ID="Label2"></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:BoundField DataField="HerbName" HeaderText="Herb Name" ReadOnly="True" SortExpression="HerbName"></asp:BoundField>
                                            <asp:TemplateField HeaderText="Quantity" SortExpression="Quantity">
                                                <EditItemTemplate>
                                                    <asp:TextBox runat="server" CssClass="form-control"  Text='<%# Bind("Quantity") %>' ID="TextBox2"></asp:TextBox>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Label runat="server" Text='<%# Bind("Quantity") %>' ID="Label3"></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Batch Num" SortExpression="BatchNum">
                                                <EditItemTemplate>
                                                    <asp:TextBox runat="server" CssClass="form-control"  Text='<%# Bind("BatchNum") %>' ID="TextBox3"></asp:TextBox>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Label runat="server" Text='<%# Bind("BatchNum") %>' ID="Label4"></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Supp. Price" SortExpression="BuyPrice">
                                                <EditItemTemplate>
                                                    <asp:TextBox runat="server" CssClass="form-control"  Text='<%# Bind("BuyPrice") %>' ID="TextBox4"></asp:TextBox>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Label runat="server" Text='<%# Bind("BuyPrice","{0:C4}") %>' ID="Label5"></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>

                                            <asp:BoundField DataField="SellPrice" HeaderText="Sell Price" ReadOnly="True" SortExpression="SellPrice" DataFormatString="{0:C4}"></asp:BoundField>
                                            <asp:TemplateField HeaderText="Supp. ID" SortExpression="SupplierID" Visible="false">
                                                <EditItemTemplate>
                                                    <asp:TextBox runat="server" CssClass="form-control"  Text='<%# Bind("SupplierID") %>' ID="TextBox5"></asp:TextBox>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Label runat="server" Text='<%# Bind("SupplierID") %>' ID="Label6"></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>

                                            <asp:BoundField DataField="SupplierName" HeaderText="Supp. Name" SortExpression="SupplierName" ReadOnly="True"></asp:BoundField>
                                            <asp:TemplateField HeaderText="Ratio" SortExpression="HerbRawToGranRatio">
                                                <EditItemTemplate>
                                                    <asp:TextBox runat="server" CssClass="form-control"  Text='<%# Bind("HerbRawToGranRatio") %>' ID="TextBox6"></asp:TextBox>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Label runat="server" Text='<%# Bind("HerbRawToGranRatio") %>' ID="Label7"></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Received" SortExpression="DateReceived">
                                                <EditItemTemplate>
                                                    <asp:TextBox runat="server" CssClass="form-control"  Text='<%# Bind("DateReceived") %>' ID="TextBox7"></asp:TextBox>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Label runat="server" Text='<%# Bind("DateReceived","{0:dd/MM/yy}") %>' ID="Label8"></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Expiry Date" SortExpression="ExpiryDate">
                                                <EditItemTemplate>
                                                    <asp:TextBox runat="server" CssClass="form-control"  Text='<%# Bind("ExpiryDate") %>' ID="TextBox8"></asp:TextBox>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Label runat="server" Text='<%# Bind("ExpiryDate","{0:dd/MM/yy}") %>' ID="Label9"></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="To Dispensery" SortExpression="DateToDispensery">
                                                <EditItemTemplate>
                                                    <asp:TextBox runat="server" CssClass="form-control"  Text='<%# Bind("DateToDispensery") %>' ID="TextBox9"></asp:TextBox>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Label runat="server" Text='<%# Bind("DateToDispensery","{0:dd/MM/yy}") %>' ID="Label10"></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Form" SortExpression="HerbForm">
                                                <EditItemTemplate>
                                                    <asp:TextBox runat="server" CssClass="form-control"  Text='<%# Bind("HerbForm") %>' ID="TextBox10"></asp:TextBox>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Label runat="server" Text='<%# Bind("HerbForm") %>' ID="Label11"></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>


                                        </Columns>
                                    </asp:GridView>

                                    <%--                                     <asp:GridView ID="GridView1" OnRowEditing="GridView1_RowEditing" CssClass="table table-sm table-hover table-striped" GridLines="None" runat="server" AutoGenerateColumns="False" DataKeyNames="HerbStockID" DataSourceID="SqlDataSource1">
                                        <Columns>
                                            <asp:TemplateField ShowHeader="True" HeaderText="Edit/Delete">
                                                <EditItemTemplate>
                                                    <asp:LinkButton runat="server" Text="Update"  CssClass="btn btn-sm btn-outline-primary" CommandName="Update" CausesValidation="True" ID="LinkButton1"></asp:LinkButton>&nbsp;<asp:LinkButton runat="server" Text="Cancel" CssClass="btn btn-sm btn-outline-danger" CommandName="Cancel" CausesValidation="False" ID="LinkButton2"></asp:LinkButton>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:LinkButton runat="server" Text="" CssClass="btn btn-sm btn-outline-primary" CommandName="Edit" CausesValidation="False" ID="LinkButton1"><i class="fas fa-pencil-alt"></i></asp:LinkButton>&nbsp;<asp:LinkButton runat="server" Text="Delete" CssClass="btn btn-sm btn-outline-danger" CommandName="Delete" CausesValidation="False" ID="LinkButton2"><i class="far fa-trash-alt"></i></asp:LinkButton>
                                                </ItemTemplate>
                                            </asp:TemplateField>



                                            <asp:TemplateField HeaderText="ID" InsertVisible="false" SortExpression="HerbStockID" Visible="true">
                                                <EditItemTemplate>
                                                    <asp:Label runat="server" Text='<%# Eval("HerbStockID") %>' ID="Label1"></asp:Label>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Label runat="server" Text='<%# Bind("HerbStockID") %>' ID="Label1"></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Herb Ref." SortExpression="HerbRefNum">
                                                <EditItemTemplate>
                                                    <asp:TextBox runat="server" CssClass="form-control" Text='<%# Bind("HerbRefNum") %>' ID="TextBox1"></asp:TextBox>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Label runat="server" Text='<%# Bind("HerbRefNum") %>' ID="Label2"></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:BoundField DataField="HerbName" HeaderText="Herb Name" ReadOnly="True" SortExpression="HerbName"></asp:BoundField>
                                            <asp:TemplateField HeaderText="Quantity" SortExpression="Quantity">
                                                <EditItemTemplate>
                                                    <asp:TextBox runat="server" CssClass="form-control"  Text='<%# Bind("Quantity") %>' ID="TextBox2"></asp:TextBox>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Label runat="server" Text='<%# Bind("Quantity") %>' ID="Label3"></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Batch Num" SortExpression="BatchNum">
                                                <EditItemTemplate>
                                                    <asp:TextBox runat="server" CssClass="form-control"  Text='<%# Bind("BatchNum") %>' ID="TextBox3"></asp:TextBox>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Label runat="server" Text='<%# Bind("BatchNum") %>' ID="Label4"></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Supp. Price" SortExpression="BuyPrice">
                                                <EditItemTemplate>
                                                    <asp:TextBox runat="server" CssClass="form-control"  Text='<%# Bind("BuyPrice") %>' ID="TextBox4"></asp:TextBox>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Label runat="server" Text='<%# Bind("BuyPrice","{0:C4}") %>' ID="Label5"></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>

                                            <asp:BoundField DataField="SellPrice" HeaderText="Sell Price" ReadOnly="True" SortExpression="SellPrice" DataFormatString="{0:C4}"></asp:BoundField>
                                            <asp:TemplateField HeaderText="Supp. ID" SortExpression="SupplierID" Visible="false">
                                                <EditItemTemplate>
                                                    <asp:TextBox runat="server" CssClass="form-control"  Text='<%# Bind("SupplierID") %>' ID="TextBox5"></asp:TextBox>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Label runat="server" Text='<%# Bind("SupplierID") %>' ID="Label6"></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>

                                            <asp:BoundField DataField="SupplierName" HeaderText="Supp. Name" SortExpression="SupplierName" ReadOnly="True"></asp:BoundField>
                                            <asp:TemplateField HeaderText="Ratio" SortExpression="HerbRawToGranRatio">
                                                <EditItemTemplate>
                                                    <asp:TextBox runat="server" CssClass="form-control"  Text='<%# Bind("HerbRawToGranRatio") %>' ID="TextBox6"></asp:TextBox>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Label runat="server" Text='<%# Bind("HerbRawToGranRatio") %>' ID="Label7"></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Received" SortExpression="DateReceived">
                                                <EditItemTemplate>
                                                    <asp:TextBox runat="server" CssClass="form-control"  Text='<%# Bind("DateReceived") %>' ID="TextBox7"></asp:TextBox>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Label runat="server" Text='<%# Bind("DateReceived","{0:dd/MM/yy}") %>' ID="Label8"></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Expiry Date" SortExpression="ExpiryDate">
                                                <EditItemTemplate>
                                                    <asp:TextBox runat="server" CssClass="form-control"  Text='<%# Bind("ExpiryDate") %>' ID="TextBox8"></asp:TextBox>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Label runat="server" Text='<%# Bind("ExpiryDate","{0:dd/MM/yy}") %>' ID="Label9"></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="To Dispensery" SortExpression="DateToDispensery">
                                                <EditItemTemplate>
                                                    <asp:TextBox runat="server" CssClass="form-control"  Text='<%# Bind("DateToDispensery") %>' ID="TextBox9"></asp:TextBox>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Label runat="server" Text='<%# Bind("DateToDispensery","{0:dd/MM/yy}") %>' ID="Label10"></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Form" SortExpression="HerbForm">
                                                <EditItemTemplate>
                                                    <asp:TextBox runat="server" CssClass="form-control"  Text='<%# Bind("HerbForm") %>' ID="TextBox10"></asp:TextBox>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Label runat="server" Text='<%# Bind("HerbForm") %>' ID="Label11"></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>


                                        </Columns>
                                    </asp:GridView>
                                   --%>

                                    <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConflictDetection="CompareAllValues" ConnectionString='<%$ ConnectionStrings:conStr %>' DeleteCommand="DELETE FROM [HerbStock] WHERE [HerbStockID] = @original_HerbStockID AND [HerbRefNum] = @original_HerbRefNum AND (([BatchNum] = @original_BatchNum) OR ([BatchNum] IS NULL AND @original_BatchNum IS NULL)) AND (([BuyPrice] = @original_BuyPrice) OR ([BuyPrice] IS NULL AND @original_BuyPrice IS NULL)) AND (([SellPrice] = @original_SellPrice) OR ([SellPrice] IS NULL AND @original_SellPrice IS NULL)) AND (([ExpiryDate] = @original_ExpiryDate) OR ([ExpiryDate] IS NULL AND @original_ExpiryDate IS NULL)) AND (([Quantity] = @original_Quantity) OR ([Quantity] IS NULL AND @original_Quantity IS NULL)) AND (([SupplierID] = @original_SupplierID) OR ([SupplierID] IS NULL AND @original_SupplierID IS NULL)) AND (([HerbRawToGranRatio] = @original_HerbRawToGranRatio) OR ([HerbRawToGranRatio] IS NULL AND @original_HerbRawToGranRatio IS NULL)) AND (([DateReceived] = @original_DateReceived) OR ([DateReceived] IS NULL AND @original_DateReceived IS NULL)) AND (([DateToDispensery] = @original_DateToDispensery) OR ([DateToDispensery] IS NULL AND @original_DateToDispensery IS NULL)) AND (([HerbForm] = @original_HerbForm) OR ([HerbForm] IS NULL AND @original_HerbForm IS NULL)) AND (([DateLastChanged] = @original_DateLastChanged) OR ([DateLastChanged] IS NULL AND @original_DateLastChanged IS NULL))" InsertCommand="INSERT INTO [HerbStock] ([HerbRefNum], [BatchNum], [BuyPrice], [SellPrice], [ExpiryDate], [Quantity], [SupplierID], [HerbRawToGranRatio], [DateReceived], [DateToDispensery], [HerbForm], [DateLastChanged]) VALUES (@HerbRefNum, @BatchNum, @BuyPrice, @SellPrice, @ExpiryDate, @Quantity, @SupplierID, @HerbRawToGranRatio, @DateReceived, @DateToDispensery, @HerbForm, @DateLastChanged)" OldValuesParameterFormatString="original_{0}" SelectCommand="spViewHerbStock" UpdateCommand="UPDATE HerbStock SET HerbRefNum = @HerbRefNum, BatchNum = @BatchNum, BuyPrice = @BuyPrice, ExpiryDate = @ExpiryDate, Quantity = @Quantity, SupplierID = @SupplierID, HerbRawToGranRatio = @HerbRawToGranRatio, DateReceived = @DateReceived, DateToDispensery = @DateToDispensery, HerbForm = @HerbForm, DateLastChanged = @DateLastChanged WHERE (HerbStockID = @original_HerbStockID) AND (HerbRefNum = @original_HerbRefNum) AND (BatchNum = @original_BatchNum OR BatchNum IS NULL AND @original_BatchNum IS NULL) AND (BuyPrice = @original_BuyPrice OR BuyPrice IS NULL AND @original_BuyPrice IS NULL) AND (SellPrice = @original_SellPrice OR SellPrice IS NULL AND @original_SellPrice IS NULL) AND (ExpiryDate = @original_ExpiryDate OR ExpiryDate IS NULL AND @original_ExpiryDate IS NULL) AND (Quantity = @original_Quantity OR Quantity IS NULL AND @original_Quantity IS NULL) AND (SupplierID = @original_SupplierID OR SupplierID IS NULL AND @original_SupplierID IS NULL) AND (HerbRawToGranRatio = @original_HerbRawToGranRatio OR HerbRawToGranRatio IS NULL AND @original_HerbRawToGranRatio IS NULL) AND (DateReceived = @original_DateReceived OR DateReceived IS NULL AND @original_DateReceived IS NULL) AND (DateToDispensery = @original_DateToDispensery OR DateToDispensery IS NULL AND @original_DateToDispensery IS NULL) AND (HerbForm = @original_HerbForm OR HerbForm IS NULL AND @original_HerbForm IS NULL) AND (DateLastChanged = @original_DateLastChanged OR DateLastChanged IS NULL AND @original_DateLastChanged IS NULL)" SelectCommandType="StoredProcedure">
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
                                            <asp:Parameter Name="original_HerbForm" Type="String"></asp:Parameter>
                                            <asp:Parameter DbType="Date" Name="original_DateLastChanged"></asp:Parameter>
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
                                            <asp:Parameter Name="HerbForm" Type="String"></asp:Parameter>
                                            <asp:Parameter DbType="Date" Name="DateLastChanged"></asp:Parameter>
                                        </InsertParameters>
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="ddlHerb" PropertyName="SelectedValue" DefaultValue="all" Name="filter" Type="String"></asp:ControlParameter>
                                        </SelectParameters>
                                        <UpdateParameters>
                                            <asp:Parameter Name="HerbRefNum" Type="String"></asp:Parameter>
                                            <asp:Parameter Name="BatchNum" Type="String"></asp:Parameter>
                                            <asp:Parameter Name="BuyPrice" Type="Decimal"></asp:Parameter>
                                            <asp:Parameter Name="ExpiryDate" DbType="Date"></asp:Parameter>
                                            <asp:Parameter Name="Quantity" Type="Decimal"></asp:Parameter>
                                            <asp:Parameter Name="SupplierID" Type="Int32"></asp:Parameter>
                                            <asp:Parameter Name="HerbRawToGranRatio" Type="Decimal"></asp:Parameter>
                                            <asp:Parameter Name="DateReceived" DbType="Date"></asp:Parameter>
                                            <asp:Parameter DbType="Date" Name="DateToDispensery"></asp:Parameter>
                                            <asp:Parameter Name="HerbForm" Type="String"></asp:Parameter>
                                            <asp:Parameter Name="DateLastChanged" DbType="Date"></asp:Parameter>
                                            <asp:Parameter Name="original_HerbStockID" Type="Int32"></asp:Parameter>
                                            <asp:Parameter Name="original_HerbRefNum" Type="String"></asp:Parameter>
                                            <asp:Parameter Name="original_BatchNum" Type="String"></asp:Parameter>
                                            <asp:Parameter Name="original_BuyPrice" Type="Decimal"></asp:Parameter>
                                            <asp:Parameter Name="original_SellPrice" Type="Decimal"></asp:Parameter>
                                            <asp:Parameter Name="original_ExpiryDate" DbType="Date"></asp:Parameter>
                                            <asp:Parameter Name="original_Quantity" Type="Decimal"></asp:Parameter>
                                            <asp:Parameter Name="original_SupplierID" Type="Int32"></asp:Parameter>
                                            <asp:Parameter Name="original_HerbRawToGranRatio" Type="Decimal"></asp:Parameter>
                                            <asp:Parameter Name="original_DateReceived" DbType="Date"></asp:Parameter>
                                            <asp:Parameter DbType="Date" Name="original_DateToDispensery"></asp:Parameter>
                                            <asp:Parameter Name="original_HerbForm" Type="String"></asp:Parameter>
                                            <asp:Parameter Name="original_DateLastChanged" DbType="Date"></asp:Parameter>
                                        </UpdateParameters>
                                    </asp:SqlDataSource>
                                </div>
                     

                       <%-- </div>--%>
                   <%-- </div>--%>
                </div>
           
        </div>
            </div>
    </main>

</asp:Content>
