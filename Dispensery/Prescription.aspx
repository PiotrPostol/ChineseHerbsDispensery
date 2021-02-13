<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Prescription.aspx.cs" Inherits="Dispensery.CreateFormula" MaintainScrollPositionOnPostback="true" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Prescription</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />

    <script src="Scripts/jquery-3.5.1.js" type="text/javascript"></script>
    <script src="Scripts/jquery-ui.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>
    <script src="Scripts/popper.min.js"></script>
    <link href="Content/jquery-ui.css" rel="stylesheet" />
    <link href="Content/bootstrap.min.css" rel="stylesheet" />


    <style>
        body {
            background: url('../Img/chinese herbs.jpg') no-repeat center center fixed ;
            -webkit-background-size: cover;
            -moz-background-size: cover;
            background-size: cover;
            -o-background-size: cover;
         
        }

        .line, .title {
            opacity: 0.95;
        }
        .myFont, th{
                      font-family:myFont;
            font-size:xx-large;
        }
        .title{
            font-size-adjust:0.9;
        }
        @font-face {
            font-family: myFont;
            src: url(../Font/Calypsoka.ttf);
        }
         .btn-circle.btn-sm { 
            width: 30px; 
            height: 30px; 
            padding: 6px 0px; 
            border-radius: 15px; 
            font-size: 10px; 
            font-weight: bolder;
            text-align: center; 
        } 
        .btn-circle.btn-md { 
            width: 50px; 
            height: 50px; 
            padding: 7px 10px; 
            border-radius: 25px; 
            font-size: 16px; 
            font-weight: bolder;
            text-align: center; 
        } 
        .btn-circle.btn-xl { 
            width: 70px; 
            height: 70px; 
            padding: 10px 16px; 
            border-radius: 35px; 
            font-size: 12px; 
            text-align: center; 
        }
    </style>

</head>
<body>

    <form id="form1" runat="server">
        <div class="section m-5">
            <div class="container  mb-4 p-4">
                <div class="row justify-content-center">
                    <h2 class="title myFont col-md-8 text-center bg-white rounded p-4  ">Herbal Prescription</h2>
                </div>
            </div>
            <div class="container">
                <div class="repeatRow row justify-content-center">
                    <div class="line bg-white rounded p-4 col-md-8">


                        <div class="form-group">
                            <div class="form-row">
                                <div class="col-md-8 mb-4">
                                    <label class="myFont font-weight-bold" for="ddlPrescripion">Select Formula:</label>
                                    <asp:DropDownList ID="ddlPrescripion" AppendDataBoundItems="true" CssClass="form-control" runat="server" DataSourceID="SqlDataSource3" DataTextField="FormulaName" DataValueField="FormulaName">
                                        <asp:ListItem Text="-- Select Formula --" Value="0.1" Selected="true"></asp:ListItem>

                                    </asp:DropDownList>
                                    <asp:SqlDataSource runat="server" ID="SqlDataSource3" ConnectionString='<%$ ConnectionStrings:conStr %>' SelectCommand="SELECT DISTINCT FormulaName FROM TraditionalFormulas"></asp:SqlDataSource>
                                </div>
                                <div class="col-md-4 text-right mb-4  align-self-end ">
                                    <asp:Button ID="btnSelectPrescription" CssClass="btn col-md-12 btn-success" runat="server" Text="Select" OnClick="btnSelectPrescription_Click" />
                                </div>

                            </div>
                        </div>
                        <hr />
                        <div class="form-row">
                            <div class="form-group col-md-6">
                                <label class="myFont font-weight-bold" for="tbxHerb">Select Herb:</label>
                                <asp:TextBox ID="tbxHerb" class="Herb form-control" runat="server" Text=""></asp:TextBox>
                            </div>
                            <div class="form-group col-md-4">
                                <label class="myFont font-weight-bold" for="tbxQuantity">Quantity:</label>
                                <asp:TextBox ID="tbxQuantity" class="NumbersOnly form-control" runat="server" Text="" ToolTip="Enter Raw Herb Quantity In Grams"></asp:TextBox>
                            </div>
                            <div class="   col-2 text-center align-bottom">
                                <label class="myFont font-weight-bold pb-0 mb-0 pr-4" for="btnAddToTable">Add</label>
                                <asp:Button ID="btnAddToTable" class="btn btn-success btn-circle btn-md p-0" data-toggle="tooltip" title="Add New Herb" runat="server" Text="+" OnClick="btnAddToTable_Click"></asp:Button>
                            </div>
                        </div>
                    </div>
                </div>

                <br />
                <div class="row justify-content-center " id="tableContent">

                    <div class="bg-white rounded p-4 col-md-8">
                        <div class="row ">

                            <span class="myFont title p-4">Formula:</span>
                            <img class="img-thumbnail border-0 pl-4 mr-4" src="Img/herbs.jpg" />

                        </div>
                        <hr class="p-2" />

                        <%--        gridview Start--%>
                        <div class="row line pb-2"></div>
                        <asp:GridView ID="GridView1" runat="server" CssClass="table table-hover table-striped" ShowFooter="true" GridLines="None" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="SqlDataSource1" OnRowDeleted="GridView1_RowDeleted" OnRowEditing="GridView1_RowEditing">
                            <Columns>

                                <asp:BoundField DataField="Id" HeaderText="Id" ReadOnly="True" Visible="false" InsertVisible="False" SortExpression="Id"></asp:BoundField>
                                <asp:BoundField DataField="RefNum" HeaderText="Ref Num" ReadOnly="True" Visible="false" SortExpression="RefNum"></asp:BoundField>
                                <asp:BoundField DataField="HerbName" HeaderText="Herb Name" ReadOnly="True" SortExpression="HerbName"></asp:BoundField>
                                <asp:BoundField DataField="Quantity" HeaderText="Qty." SortExpression="Quantity"></asp:BoundField>
                                <asp:BoundField DataField="PhenixPrice" HeaderText="Phoenix" ReadOnly="True" SortExpression="PhenixPrice" DataFormatString="{0:C}" FooterStyle-Font-Bold="true"></asp:BoundField>

                                <asp:BoundField DataField="BalancePrice" HeaderText="Balance" ReadOnly="True" SortExpression="BalancePrice" DataFormatString="{0:C}" FooterStyle-Font-Bold="true"></asp:BoundField>

                                <asp:CommandField DeleteImageUrl="~/Img/stop.png" ShowEditButton="false" EditImageUrl="~/Img/edit.png" ShowDeleteButton="True" ButtonType="Image"></asp:CommandField>
                            </Columns>
                        </asp:GridView>
                        <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:conStr %>' SelectCommand="SELECT * FROM [PrescriptionTemp]" DeleteCommand="DELETE FROM [PrescriptionTemp] WHERE [Id] = @Id" InsertCommand="INSERT INTO [PrescriptionTemp] ([RefNum], [HerbName], [Quantity], [PhenixPrice], [BalancePrice]) VALUES (@RefNum, @HerbName, @Quantity, @PhenixPrice, @BalancePrice)" UpdateCommand="UPDATE [PrescriptionTemp] SET [RefNum] = @RefNum, [HerbName] = @HerbName, [Quantity] = @Quantity, [PhenixPrice] = @PhenixPrice, [BalancePrice] = @BalancePrice WHERE [Id] = @Id">
                            <DeleteParameters>
                                <asp:Parameter Name="Id" Type="Int32"></asp:Parameter>
                            </DeleteParameters>
                            <InsertParameters>
                                <asp:Parameter Name="RefNum" Type="String"></asp:Parameter>
                                <asp:Parameter Name="HerbName" Type="String"></asp:Parameter>
                                <asp:Parameter Name="Quantity" Type="Decimal"></asp:Parameter>
                                <asp:Parameter Name="PhenixPrice" Type="Decimal"></asp:Parameter>
                                <asp:Parameter Name="BalancePrice" Type="Decimal"></asp:Parameter>
                            </InsertParameters>
                            <UpdateParameters>
                                <asp:Parameter Name="RefNum" Type="String"></asp:Parameter>
                                <asp:Parameter Name="HerbName" Type="String"></asp:Parameter>
                                <asp:Parameter Name="Quantity" Type="Decimal"></asp:Parameter>
                                <asp:Parameter Name="PhenixPrice" Type="Decimal"></asp:Parameter>
                                <asp:Parameter Name="BalancePrice" Type="Decimal"></asp:Parameter>
                                <asp:Parameter Name="Id" Type="Int32"></asp:Parameter>
                            </UpdateParameters>
                        </asp:SqlDataSource>
                        <%--                    <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString= "conStr" SelectCommand="SELECT * FROM [PrescriptionTemp]" DeleteCommand="DELETE FROM [PrescriptionTemp] WHERE [Id] = @Id" InsertCommand="INSERT INTO [PrescriptionTemp] ([RefNum], [HerbName], [Quantity], [PhenixPrice], [BalancePrice]) VALUES (@RefNum, @HerbName, @Quantity, @PhenixPrice, @BalancePrice)" 
                        <%--UpdateCommand="UPDATE [PrescriptionTemp] SET [Quantity] = @Quantity, [PhenixPrice] = (SELECT Price FROM HerbPrice WHERE HerbRefNum = @RefNum AND Supplier = 'Phenix') * @Quantity, [BalancePrice] = (SELECT Price FROM HerbPrice WHERE HerbRefNum = @RefNum AND Supplier = 'Balance') * @Quantity WHERE [Id] = @Id"
                        
             <DeleteParameters>
                            <asp:Parameter Name="Id" Type="Int32"></asp:Parameter>
                        </DeleteParameters>
                        <InsertParameters>

                            <asp:Parameter Name="RefNum" Type="String"></asp:Parameter>

                            <asp:Parameter Name="HerbName" Type="String"></asp:Parameter>
                            <asp:Parameter Name="Quantity" Type="Decimal"></asp:Parameter>
                            <asp:Parameter Name="PhenixPrice" Type="Decimal"></asp:Parameter>
                            <asp:Parameter Name="BalancePrice" Type="Decimal"></asp:Parameter>
                        </InsertParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="RefNum" Type="String"></asp:Parameter>
                            <asp:Parameter Name="HerbName" Type="String"></asp:Parameter>
                            <asp:Parameter Name="Quantity" Type="Decimal"></asp:Parameter>
                            <asp:Parameter Name="PhenixPrice" Type="Decimal"></asp:Parameter>
                            <asp:Parameter Name="BalancePrice" Type="Decimal"></asp:Parameter>
                            <asp:Parameter Name="Id" Type="Int32"></asp:Parameter>
                        </UpdateParameters>
                    </asp:SqlDataSource>--%>
                        <hr class="pb-4" />
                        <div class="row">
                            <div class="col-md-8 mb-4">
                                <label class="myFont font-weight-bold" for="tbxHerb">Select Supplier:</label>
                                <asp:DropDownList ID="DropDownList1" runat="server" CssClass="form-control" DataSourceID="SqlDataSource2" DataTextField="Supplier" DataValueField="Supplier"></asp:DropDownList>
                                <asp:SqlDataSource runat="server" ID="SqlDataSource2" ConnectionString='<%$ ConnectionStrings:conStr %>' SelectCommand="SELECT DISTINCT Supplier FROM HerbPrice"></asp:SqlDataSource>

                            </div>
                            <div class="col-md-4 text-right mb-4  align-self-end ">
                                <asp:Button ID="addHerb" class="btn btn-primary col-md-12" runat="server" Text="Submit" OnClick="addHerb_Click" />

                            </div>
                        </div>
                    </div>


                </div>

            </div>
        </div>
    </form>

    <script>
        $(document).ready(function () {
            $('input[type=text]').each(function () {
                $(this).val('');
            });

            $('.Herb').autocomplete({
                source: 'GetHerbsNameAutocomplete.ashx'
            });

            $('.NumbersOnly').keypress(function (event) {
                return isNumber(event, this)
            });

            function isNumber(evt, element) {

                var charCode = (evt.which) ? evt.which : event.keyCode

                if (
                    (charCode != 45 || $(element).val().indexOf('-') != -1) &&      // “-” CHECK MINUS, AND ONLY ONE.
                    (charCode != 46 || $(element).val().indexOf('.') != -1) &&      // “.” CHECK DOT, AND ONLY ONE.
                    (charCode < 48 || charCode > 57))
                    return false;


            }
        });

    </script>
</body>
</html>
