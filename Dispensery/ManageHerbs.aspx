<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ManageHerbs.aspx.cs" Inherits="Dispensery.ManageHerbs" MaintainScrollPositionOnPostback="true" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Manage Herbs & Formulas</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />

    <script src="Scripts/jquery-3.5.1.js" type="text/javascript"></script>
    <script src="Scripts/jquery-ui.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>
    <script src="Scripts/popper.min.js"></script>
    <link href="Content/jquery-ui.css" rel="stylesheet" />
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <link href="Content/font-awesome.min.css" rel="stylesheet" />

    <style>
        body {
            background: url('../Img/Chinese Dispensery.jpg') no-repeat center center fixed;
            -webkit-background-size: cover;
            -moz-background-size: cover;
            background-size: cover;
            -o-background-size: cover;
        }

        .line, .title {
            opacity: 0.90;
        }

        .myFont, th {
            font-family: myFont;
            font-size: xx-large;
        }

        .title {
            font-size-adjust: 0.9;
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

        .rounded {
            border-radius: .45rem !important
        }

        .rounded-top {
            border-top-left-radius: .45rem !important;
            border-top-right-radius: .45rem !important;
        }

        .zoom {
            /*padding: 50px;
  background-color: green;*/
            transition: transform .5s; /* Animation */
            /*width: 200px;
  height: 200px;
  margin: 0 auto;*/
            box-shadow: inset;
            opacity: 0.90;
        }

            .zoom:hover {
                transform: scale(1.15); /* (150% zoom)*/
            }

        /*.col-4 {
            background-color: #1592a6;
            border-top-right-radius: 5rem;
            border-bottom-right-radius: 5rem;
        }*/

        .row-height {
            /*height: 90px;*/
            text-align: center;
            padding-top: 25px;
        }

        a.custom-card,
        a.custom-card:hover {
            color: inherit;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <%-- //Page Title--%>
        <div class="section m-5">
            <div class="container  mb-4 p-4">
                <div class="row justify-content-center">
                    <h2 class="title myFont col-md-8 text-center bg-white rounded p-4  ">Admin Panel</h2>
                </div>
            </div>
        </div>
        <%-- Card Deck --%>

        <div class="container-fluid mt-4">
            <div class="row justify-content-center">
                <div class="col-auto mb-3">
                    <a href="#ModalEditHerbs" class="custom-card">
                        <div class="card rounded shadow zoom mb-2" style="width: 18rem;">
                            <img class="card-img-top rounded-top" src="Img/Add%20Herbs.jpg" alt="Edit Herbs" />
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-3 justify-content-end align-self-center ">
                                        <i class="fa fa-pencil-square-o fa-3x"></i>
                                    </div>
                                    <div class="col-8">
                                        <p class="myFont mb-0" style="font-size:2.9rem;">Edit Herbs</p>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </a>
                </div>
                <div class="col-auto mb-3">
                    <a href="#Modal" class="custom-card">
                        <div class="card rounded shadow zoom" style="width: 18rem;">
                            <img class="card-img-top rounded-top" src="Img/Herbs%20Prices.jpg" alt="Edit Prices" />
                            <div class="card-body">
                                 <div class="row">
                                    <div class="col-3 justify-content-end align-self-center ">
                                        <i class="fa fa-pencil-square-o fa-3x"></i>
                                    </div>
                                    <div class="col-8">
                                        <p class="myFont mb-0" style="font-size:2.9rem;">Edit Prices</p>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </a>
                </div>
                <div class="col-auto mb-3">
                    <a href="#Modal" class="custom-card">
                        <div class="card rounded shadow zoom" style="width: 18rem;">
                            <img class="card-img-top rounded-top" src="Img/Edit%20Formulas.jpg" alt="Edit Formulas" />
                            <div class="card-body ">
                                <div class="row">
                                    <div class="col-3 justify-content-end align-self-center pr-0 ">
                                        <i class="fa fa-pencil-square-o fa-3x"></i>
                                    </div>
                                    <div class="col-9 pl-0 pr-0">
                                        <p class="myFont mb-0 " style="font-size:2.9rem;">Edit Formulas</p>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </a>
                </div>



            </div>
        </div>
        <div class="modal fade" id="ModalEditHerbs" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog  modal-dialog-centered modal-lg" role="document">
                <div class="modal-content">

                    <div class="modal-header">
                <%--        Navigation--%>
                         <nav>
                            <div class="nav nav-tabs" id="nav-tab" role="tablist">
                                <a class="nav-item nav-link active myFont" id="nav-home-tab" data-toggle="tab" href="#nav-home" role="tab" aria-controls="nav-home" aria-selected="true">Add Herb</a>
                                <a class="nav-item nav-link myFont" id="nav-profile-tab" data-toggle="tab" href="#nav-profile" role="tab" aria-controls="nav-profile" aria-selected="false">Edit Prices</a>

                            </div>
                        </nav>
         <%--               Close Button--%>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                       
                        <%-- Add New Herb--%>
                        <div class="container">
                            <div class="tab-content" id="nav-tabContent">
                                <div class="tab-pane fade show active p-4 " id="nav-home" role="tabpanel" aria-labelledby="nav-home-tab">
                                    <div class="form-row pt-2">
                                        <div class="form-group col-md-3">
                                            <label for="tbxRefNum" class="myFont">Refrence Number</label>
                                            <asp:TextBox ID="tbxRefNum" placeholder="" class="form-control" Style="text-transform: uppercase;" ToolTip="Enter Herb's Reference Number" runat="server"></asp:TextBox>
                                        </div>
                                        <div class="form-group col-md-7">
                                            <label for="tbxHerbName" class="myFont">Herb Name</label>
                                            <asp:TextBox ID="tbxHerbName" class="form-control text-uppercase" Style="text-transform: uppercase;" ToolTip="Enter Herb's Name" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="form-row pt-2">
                                         <div class="form-group col-md-3">
                                            <label for="tbxPheonixPrice" class="myFont">Pheonix Price</label>
                                            <asp:TextBox ID="tbxPheonixPrice" class="form-control" Style="text-transform: uppercase;"  placeholder="€" ToolTip="Enter Herb's Pheonix Price" runat="server"></asp:TextBox>
                                        </div>
                                        <div class="form-group col-md-3">
                                            <label for="tbxBalancePrice" class="myFont">Balance Price</label>
                                            <asp:TextBox ID="tbxBalancePrice" class="form-control text-uppercase"  placeholder="€" Style="text-transform: uppercase;" ToolTip="Enter Herb's Balance Price" runat="server"></asp:TextBox>
                                        </div>
                                        <div class="form-group col-md-4  align-self-end">
                                            <div class="col-auto p-0">
                                                <asp:Button ID="btnAddNewHerb" CssClass="btn btn-info btn-block" runat="server" ToolTip="Click To Add New Herb" Text="Add" OnClick ="btnAddNewHerb_Click" />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <%--Edit Prices Grid View--%>
                                <div class="tab-pane fade" id="nav-profile" role="tabpanel" aria-labelledby="nav-profile-tab">
                                    <asp:ScriptManager ID="ScriptManager1" runat="server">
                                        </asp:ScriptManager>
                                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                        <ContentTemplate>
                                            <asp:GridView ID="GridView1" runat="server" CssClass="table table-hover table-striped align-content-center" GridLines="None" DataSourceID="SqlDataSource1" AutoGenerateColumns="False" DataKeyNames="Id">
                                                <Columns>
                                                    <asp:BoundField DataField="HerbRefNum" ReadOnly="true" HeaderText="HerbRefNum" SortExpression="HerbRefNum"></asp:BoundField>
                                                    <asp:BoundField DataField="Supplier" ReadOnly="true" HeaderText="Supplier" SortExpression="Supplier"></asp:BoundField>
                                                    <asp:BoundField DataField="Price" HeaderText="Price" SortExpression="Price"></asp:BoundField>
                                                    <asp:BoundField DataField="Id" Visible="false" HeaderText="Id" ReadOnly="True" SortExpression="Id" InsertVisible="False"></asp:BoundField>
                                                <asp:CommandField ShowEditButton="True"></asp:CommandField>
                                                    </Columns>
                                            </asp:GridView>

                                            <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:conStr %>' SelectCommand="SELECT [HerbRefNum], [Supplier], [Price], [Id] FROM [HerbPrice] ORDER BY [HerbRefNum]" DeleteCommand="DELETE FROM [HerbPrice] WHERE [Id] = @Id" InsertCommand="INSERT INTO [HerbPrice] ([HerbRefNum], [Supplier], [Price]) VALUES (@HerbRefNum, @Supplier, @Price)" UpdateCommand="UPDATE [HerbPrice] SET [HerbRefNum] = @HerbRefNum, [Supplier] = @Supplier, [Price] = @Price WHERE [Id] = @Id">
                                                <DeleteParameters>
                                                    <asp:Parameter Name="Id" Type="Int32"></asp:Parameter>
                                                </DeleteParameters>
                                                <InsertParameters>
                                                    <asp:Parameter Name="HerbRefNum" Type="String"></asp:Parameter>
                                                    <asp:Parameter Name="Supplier" Type="String"></asp:Parameter>
                                                    <asp:Parameter Name="Price" Type="Decimal"></asp:Parameter>
                                                </InsertParameters>
                                                <UpdateParameters>
                                                    <asp:Parameter Name="HerbRefNum" Type="String"></asp:Parameter>
                                                    <asp:Parameter Name="Supplier" Type="String"></asp:Parameter>
                                                    <asp:Parameter Name="Price" Type="Decimal"></asp:Parameter>
                                                    <asp:Parameter Name="Id" Type="Int32"></asp:Parameter>
                                                </UpdateParameters>
                                            </asp:SqlDataSource>
                                            </div>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                             <%--   Extra Tab - Unused--%>
                                <div class="tab-pane fade" id="nav-contact" role="tabpanel" aria-labelledby="nav-contact-tab">...</div>
                            </div>
                        </div>


                    </div>
                    <%--<div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <button type="button" class="btn btn-primary">Save changes</button>
                    </div>--%>
                </div>
            </div>
        </div>
        <%--        <div class="section m-5">
            <div class="container line bg-white rounded mb-4 p-4">
                <h1 class=" title myFont col-md-8 pb-4 pt-4 ml-0  pl-0">New Herb</h1>
                <%--<img class="img-thumbnail border-0 pl-4 mr-4" src="Img/iconfinder_handrawn_Add_Plus_Doodle_436170.png"/>
                <hr />
                <div class="form-row">
                    <div class="form-group col-md-3">
                        <label for="tbxRefNum" class="myFont">Refrence Number</label>
                                <input type="email" class="form-control" id="inputEmail4" placeholder="Email">
                        <asp:TextBox ID="tbxRefNum" class="form-control" Style="text-transform: uppercase;" ToolTip="Enter Herb's Reference Number" runat="server"></asp:TextBox>
                    </div>
                    <div class="form-group col-md-7">
                        <label for="tbxHerbName" class="myFont">Herb Name</label>
                                  <input type="password" class="form-control" id="inputPassword4" placeholder="Password">
                        <asp:TextBox ID="tbxHerbName" class="form-control text-uppercase" Style="text-transform: uppercase;" ToolTip="Enter Herb's Name" runat="server"></asp:TextBox>
                    </div>
                    <div class="form-group col-md-2 text-center align-self-end">
                        <div class="">
                            <asp:Button ID="Button1" CssClass="btn btn-info " runat="server" ToolTip="Click To Add New Herb" Text="Add" />
                        </div>
                    </div>
                </div>
            </div>
        </div>--%>
    </form>
    <script>
    
        $('a[href$="#ModalEditHerbs"]').on("click", function () {
            $('#ModalEditHerbs').modal('show');
        });
    </script>
</body>
</html>
