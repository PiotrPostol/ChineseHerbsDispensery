<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMaster.Master" AutoEventWireup="true" MaintainScrollPositionOnPostback="true" CodeBehind="AddPatient.aspx.cs" Inherits="Dispensery.AddPatient" %>

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
                            <h2 id="headerAddPatient" runat="server" class="col-md-10 font-weight-bold   pt-md-2 mt-2 align-content-center" aria-hidden="true" style="color: #9fc299;">Add Patient</h2>
                            <h2 id="headerUpdatePatient" runat="server" class="col-md-10  pt-2 align-content-center" visible="false" aria-hidden="true" style="color: #9fc299;">Update Patient</h2>
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
                                    <asp:DropDownList CssClass="form-control" ID="ddlPatientCounty" runat="server">
                                        <asp:ListItem Value="0">Choose...</asp:ListItem>
                                        <asp:ListItem Value="Antrim">Antrim</asp:ListItem>
                                        <asp:ListItem Value="Armagh">Armagh</asp:ListItem>
                                        <asp:ListItem Value="Carlow">Carlow</asp:ListItem>
                                        <asp:ListItem Value="Cavan">Cavan</asp:ListItem>
                                        <asp:ListItem Value="Clare">Clare</asp:ListItem>
                                        <asp:ListItem Value="Cork">Cork</asp:ListItem>
                                        <asp:ListItem Value="Derry">Derry</asp:ListItem>
                                        <asp:ListItem Value="Donegal">Donegal</asp:ListItem>
                                        <asp:ListItem Value="Down">Down</asp:ListItem>
                                        <asp:ListItem Value="Dublin">Dublin</asp:ListItem>
                                        <asp:ListItem Value="Fermanagh">Fermanagh</asp:ListItem>
                                        <asp:ListItem Value="Galway">Galway</asp:ListItem>
                                        <asp:ListItem Value="Kerry">Kerry</asp:ListItem>
                                        <asp:ListItem Value="Kildare">Kildare</asp:ListItem>
                                        <asp:ListItem Value="Kilkenny">Kilkenny</asp:ListItem>
                                        <asp:ListItem Value="Laois">Laois</asp:ListItem>
                                        <asp:ListItem Value="Leitrim">Leitrim</asp:ListItem>
                                        <asp:ListItem Value="Limerick">Limerick</asp:ListItem>
                                        <asp:ListItem Value="Longford">Longford</asp:ListItem>
                                        <asp:ListItem Value="Louth">Louth</asp:ListItem>
                                        <asp:ListItem Value="Mayo">Mayo</asp:ListItem>
                                        <asp:ListItem Value="Meath">Meath</asp:ListItem>
                                        <asp:ListItem Value="Monaghan">Monaghan</asp:ListItem>
                                        <asp:ListItem Value="Offaly">Offaly</asp:ListItem>
                                        <asp:ListItem Value="Roscommon">Roscommon</asp:ListItem>
                                        <asp:ListItem Value="Sligo">Sligo</asp:ListItem>
                                        <asp:ListItem Value="Tipperary">Tipperary</asp:ListItem>
                                        <asp:ListItem Value="Tyrone">Tyrone</asp:ListItem>
                                        <asp:ListItem Value="Waterford">Waterford</asp:ListItem>
                                        <asp:ListItem Value="Westmeath">Westmeath</asp:ListItem>
                                        <asp:ListItem Value="Wexford">Wexford</asp:ListItem>
                                        <asp:ListItem Value="Wicklow">Wicklow</asp:ListItem>


                                    </asp:DropDownList>
                                </div>
                                <div class="form-group col-lg-2">
                                    <label for="tbxEirecode">Eirecode:</label>
                                    <asp:TextBox ID="tbxEirecode" CssClass="form-control" runat="server"></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-row">
                                <div class="form-group col-lg-4">
                                    <label for="ddlPatientCountry">Country:</label>
                                    <asp:DropDownList ID="ddlPatientCountry" CssClass="form-control" runat="server">
                                        <asp:ListItem Value="0">Choose...</asp:ListItem>
                                        <asp:ListItem Value="Afghanistan">Afghanistan</asp:ListItem>
                                        <asp:ListItem Value="Albania">Albania</asp:ListItem>
                                        <asp:ListItem Value="Algeria">Algeria</asp:ListItem>
                                        <asp:ListItem Value="Andorra">Andorra</asp:ListItem>
                                        <asp:ListItem Value="Angola">Angola</asp:ListItem>
                                        <asp:ListItem Value="Anguilla">Anguilla</asp:ListItem>
                                        <asp:ListItem Value="Antigua & Barbuda">Antigua & Barbuda</asp:ListItem>
                                        <asp:ListItem Value="Argentina">Argentina</asp:ListItem>
                                        <asp:ListItem Value="Armenia">Armenia</asp:ListItem>
                                        <asp:ListItem Value="Australia">Australia</asp:ListItem>
                                        <asp:ListItem Value="Austria">Austria</asp:ListItem>
                                        <asp:ListItem Value="Azerbaijan">Azerbaijan</asp:ListItem>
                                        <asp:ListItem Value="Bahamas">Bahamas</asp:ListItem>
                                        <asp:ListItem Value="Bahrain">Bahrain</asp:ListItem>
                                        <asp:ListItem Value="Bangladesh">Bangladesh</asp:ListItem>
                                        <asp:ListItem Value="Barbados">Barbados</asp:ListItem>
                                        <asp:ListItem Value="Belarus">Belarus</asp:ListItem>
                                        <asp:ListItem Value="Belgium">Belgium</asp:ListItem>
                                        <asp:ListItem Value="Belize">Belize</asp:ListItem>
                                        <asp:ListItem Value="Benin">Benin</asp:ListItem>
                                        <asp:ListItem Value="Bermuda">Bermuda</asp:ListItem>
                                        <asp:ListItem Value="Bhutan">Bhutan</asp:ListItem>
                                        <asp:ListItem Value="Bolivia">Bolivia</asp:ListItem>
                                        <asp:ListItem Value="Bosnia & Herzegovina">Bosnia & Herzegovina</asp:ListItem>
                                        <asp:ListItem Value="Botswana">Botswana</asp:ListItem>
                                        <asp:ListItem Value="Brazil">Brazil</asp:ListItem>
                                        <asp:ListItem Value="Brunei Darussalam">Brunei Darussalam</asp:ListItem>
                                        <asp:ListItem Value="Bulgaria">Bulgaria</asp:ListItem>
                                        <asp:ListItem Value="Burkina Faso">Burkina Faso</asp:ListItem>
                                        <asp:ListItem Value="Burundi">Burundi</asp:ListItem>
                                        <asp:ListItem Value="Cambodia">Cambodia</asp:ListItem>
                                        <asp:ListItem Value="Cameroon">Cameroon</asp:ListItem>
                                        <asp:ListItem Value="Canada">Canada</asp:ListItem>
                                        <asp:ListItem Value="Cape Verde">Cape Verde</asp:ListItem>
                                        <asp:ListItem Value="Cayman Islands">Cayman Islands</asp:ListItem>
                                        <asp:ListItem Value="Central African Republic">Central African Republic</asp:ListItem>
                                        <asp:ListItem Value="Chad">Chad</asp:ListItem>
                                        <asp:ListItem Value="Chile">Chile</asp:ListItem>
                                        <asp:ListItem Value="China">China</asp:ListItem>
                                        <asp:ListItem Value="China - Hong Kong / Macau">China - Hong Kong / Macau</asp:ListItem>
                                        <asp:ListItem Value="Colombia">Colombia</asp:ListItem>
                                        <asp:ListItem Value="Comoros">Comoros</asp:ListItem>
                                        <asp:ListItem Value="Congo">Congo</asp:ListItem>
                                        <asp:ListItem Value="Congo, Democratic Republic of (DRC)">Congo, Democratic Republic of (DRC)</asp:ListItem>
                                        <asp:ListItem Value="Costa Rica">Costa Rica</asp:ListItem>
                                        <asp:ListItem Value="Croatia">Croatia</asp:ListItem>
                                        <asp:ListItem Value="Cuba">Cuba</asp:ListItem>
                                        <asp:ListItem Value="Cyprus">Cyprus</asp:ListItem>
                                        <asp:ListItem Value="Czech Republic">Czech Republic</asp:ListItem>
                                        <asp:ListItem Value="Denmark">Denmark</asp:ListItem>
                                        <asp:ListItem Value="Djibouti">Djibouti</asp:ListItem>
                                        <asp:ListItem Value="Dominica">Dominica</asp:ListItem>
                                        <asp:ListItem Value="Dominican Republic">Dominican Republic</asp:ListItem>
                                        <asp:ListItem Value="Ecuador">Ecuador</asp:ListItem>
                                        <asp:ListItem Value="Egypt">Egypt</asp:ListItem>
                                        <asp:ListItem Value="El Salvador">El Salvador</asp:ListItem>
                                        <asp:ListItem Value="Equatorial Guinea">Equatorial Guinea</asp:ListItem>
                                        <asp:ListItem Value="Eritrea">Eritrea</asp:ListItem>
                                        <asp:ListItem Value="Estonia">Estonia</asp:ListItem>
                                        <asp:ListItem Value="Eswatini">Eswatini</asp:ListItem>
                                        <asp:ListItem Value="Ethiopia">Ethiopia</asp:ListItem>
                                        <asp:ListItem Value="Fiji">Fiji</asp:ListItem>
                                        <asp:ListItem Value="Finland">Finland</asp:ListItem>
                                        <asp:ListItem Value="France">France</asp:ListItem>
                                        <asp:ListItem Value="French Guiana">French Guiana</asp:ListItem>
                                        <asp:ListItem Value="Gabon">Gabon</asp:ListItem>
                                        <asp:ListItem Value="Gambia, Republic of The">Gambia, Republic of The</asp:ListItem>
                                        <asp:ListItem Value="Georgia">Georgia</asp:ListItem>
                                        <asp:ListItem Value="Germany">Germany</asp:ListItem>
                                        <asp:ListItem Value="Ghana">Ghana</asp:ListItem>
                                        <asp:ListItem Value="Great Britain">Great Britain</asp:ListItem>
                                        <asp:ListItem Value="Greece">Greece</asp:ListItem>
                                        <asp:ListItem Value="Grenada">Grenada</asp:ListItem>
                                        <asp:ListItem Value="Guadeloupe">Guadeloupe</asp:ListItem>
                                        <asp:ListItem Value="Guatemala">Guatemala</asp:ListItem>
                                        <asp:ListItem Value="Guinea">Guinea</asp:ListItem>
                                        <asp:ListItem Value="Guinea-Bissau">Guinea-Bissau</asp:ListItem>
                                        <asp:ListItem Value="Guyana">Guyana</asp:ListItem>
                                        <asp:ListItem Value="Haiti">Haiti</asp:ListItem>
                                        <asp:ListItem Value="Honduras">Honduras</asp:ListItem>
                                        <asp:ListItem Value="Hungary">Hungary</asp:ListItem>
                                        <asp:ListItem Value="Iceland">Iceland</asp:ListItem>
                                        <asp:ListItem Value="India">India</asp:ListItem>
                                        <asp:ListItem Value="Indonesia">Indonesia</asp:ListItem>
                                        <asp:ListItem Value="Iran">Iran</asp:ListItem>
                                        <asp:ListItem Value="Iraq">Iraq</asp:ListItem>
                                         <asp:ListItem Value="Ireland">Ireland</asp:ListItem>
                                        <asp:ListItem Value="Israel and the Occupied Territories">Israel and the Occupied Territories</asp:ListItem>
                                        <asp:ListItem Value="Italy">Italy</asp:ListItem>
                                        <asp:ListItem Value="Ivory Coast (Cote d'Ivoire)">Ivory Coast (Cote d'Ivoire)</asp:ListItem>
                                        <asp:ListItem Value="Jamaica">Jamaica</asp:ListItem>
                                        <asp:ListItem Value="Japan">Japan</asp:ListItem>
                                        <asp:ListItem Value="Jordan">Jordan</asp:ListItem>
                                        <asp:ListItem Value="Kazakhstan">Kazakhstan</asp:ListItem>
                                        <asp:ListItem Value="Kenya">Kenya</asp:ListItem>
                                        <asp:ListItem Value="Korea, Democratic Republic of (North Korea)">Korea, Democratic Republic of (North Korea)</asp:ListItem>
                                        <asp:ListItem Value="Korea, Republic of (South Korea)">Korea, Republic of (South Korea)</asp:ListItem>
                                        <asp:ListItem Value="Kosovo">Kosovo</asp:ListItem>
                                        <asp:ListItem Value="Kuwait">Kuwait</asp:ListItem>
                                        <asp:ListItem Value="Kyrgyz Republic (Kyrgyzstan)">Kyrgyz Republic (Kyrgyzstan)</asp:ListItem>
                                        <asp:ListItem Value="Laos">Laos</asp:ListItem>
                                        <asp:ListItem Value="Latvia">Latvia</asp:ListItem>
                                        <asp:ListItem Value="Lebanon">Lebanon</asp:ListItem>
                                        <asp:ListItem Value="Lesotho">Lesotho</asp:ListItem>
                                        <asp:ListItem Value="Liberia">Liberia</asp:ListItem>
                                        <asp:ListItem Value="Libya">Libya</asp:ListItem>
                                        <asp:ListItem Value="Liechtenstein">Liechtenstein</asp:ListItem>
                                        <asp:ListItem Value="Lithuania">Lithuania</asp:ListItem>
                                        <asp:ListItem Value="Luxembourg">Luxembourg</asp:ListItem>
                                        <asp:ListItem Value="Madagascar">Madagascar</asp:ListItem>
                                        <asp:ListItem Value="Malawi">Malawi</asp:ListItem>
                                        <asp:ListItem Value="Malaysia">Malaysia</asp:ListItem>
                                        <asp:ListItem Value="Maldives">Maldives</asp:ListItem>
                                        <asp:ListItem Value="Mali">Mali</asp:ListItem>
                                        <asp:ListItem Value="Malta">Malta</asp:ListItem>
                                        <asp:ListItem Value="Martinique">Martinique</asp:ListItem>
                                        <asp:ListItem Value="Mauritania">Mauritania</asp:ListItem>
                                        <asp:ListItem Value="Mauritius">Mauritius</asp:ListItem>
                                        <asp:ListItem Value="Mayotte">Mayotte</asp:ListItem>
                                        <asp:ListItem Value="Mexico">Mexico</asp:ListItem>
                                        <asp:ListItem Value="Moldova, Republic of">Moldova, Republic of</asp:ListItem>
                                        <asp:ListItem Value="Monaco">Monaco</asp:ListItem>
                                        <asp:ListItem Value="Mongolia">Mongolia</asp:ListItem>
                                        <asp:ListItem Value="Montenegro">Montenegro</asp:ListItem>
                                        <asp:ListItem Value="Montserrat">Montserrat</asp:ListItem>
                                        <asp:ListItem Value="Morocco">Morocco</asp:ListItem>
                                        <asp:ListItem Value="Mozambique">Mozambique</asp:ListItem>
                                        <asp:ListItem Value="Myanmar/Burma">Myanmar/Burma</asp:ListItem>
                                        <asp:ListItem Value="Namibia">Namibia</asp:ListItem>
                                        <asp:ListItem Value="Nepal">Nepal</asp:ListItem>
                                        <asp:ListItem Value="Netherlands">Netherlands</asp:ListItem>
                                        <asp:ListItem Value="New Zealand">New Zealand</asp:ListItem>
                                        <asp:ListItem Value="Nicaragua">Nicaragua</asp:ListItem>
                                        <asp:ListItem Value="Niger">Niger</asp:ListItem>
                                        <asp:ListItem Value="Nigeria">Nigeria</asp:ListItem>
                                        <asp:ListItem Value="North Macedonia, Republic of">North Macedonia, Republic of</asp:ListItem>
                                        <asp:ListItem Value="Norway">Norway</asp:ListItem>
                                        <asp:ListItem Value="Oman">Oman</asp:ListItem>
                                        <asp:ListItem Value="Pacific Islands">Pacific Islands</asp:ListItem>
                                        <asp:ListItem Value="Pakistan">Pakistan</asp:ListItem>
                                        <asp:ListItem Value="Panama">Panama</asp:ListItem>
                                        <asp:ListItem Value="Papua New Guinea">Papua New Guinea</asp:ListItem>
                                        <asp:ListItem Value="Paraguay">Paraguay</asp:ListItem>
                                        <asp:ListItem Value="Peru">Peru</asp:ListItem>
                                        <asp:ListItem Value="Philippines">Philippines</asp:ListItem>
                                        <asp:ListItem Value="Poland">Poland</asp:ListItem>
                                        <asp:ListItem Value="Portugal">Portugal</asp:ListItem>
                                        <asp:ListItem Value="Puerto Rico">Puerto Rico</asp:ListItem>
                                        <asp:ListItem Value="Qatar">Qatar</asp:ListItem>
                                        <asp:ListItem Value="Reunion">Reunion</asp:ListItem>
                                        <asp:ListItem Value="Romania">Romania</asp:ListItem>
                                        <asp:ListItem Value="Russian Federation">Russian Federation</asp:ListItem>
                                        <asp:ListItem Value="Rwanda">Rwanda</asp:ListItem>
                                        <asp:ListItem Value="Saint Kitts and Nevis">Saint Kitts and Nevis</asp:ListItem>
                                        <asp:ListItem Value="Saint Lucia">Saint Lucia</asp:ListItem>
                                        <asp:ListItem Value="Saint Vincent and the Grenadines">Saint Vincent and the Grenadines</asp:ListItem>
                                        <asp:ListItem Value="Samoa">Samoa</asp:ListItem>
                                        <asp:ListItem Value="Sao Tome and Principe">Sao Tome and Principe</asp:ListItem>
                                        <asp:ListItem Value="Saudi Arabia">Saudi Arabia</asp:ListItem>
                                        <asp:ListItem Value="Senegal">Senegal</asp:ListItem>
                                        <asp:ListItem Value="Serbia">Serbia</asp:ListItem>
                                        <asp:ListItem Value="Seychelles">Seychelles</asp:ListItem>
                                        <asp:ListItem Value="Sierra Leone">Sierra Leone</asp:ListItem>
                                        <asp:ListItem Value="Singapore">Singapore</asp:ListItem>
                                        <asp:ListItem Value="Slovak Republic (Slovakia)">Slovak Republic (Slovakia)</asp:ListItem>
                                        <asp:ListItem Value="Slovenia">Slovenia</asp:ListItem>
                                        <asp:ListItem Value="Solomon Islands">Solomon Islands</asp:ListItem>
                                        <asp:ListItem Value="Somalia">Somalia</asp:ListItem>
                                        <asp:ListItem Value="South Africa">South Africa</asp:ListItem>
                                        <asp:ListItem Value="South Sudan">South Sudan</asp:ListItem>
                                        <asp:ListItem Value="Spain">Spain</asp:ListItem>
                                        <asp:ListItem Value="Sri Lanka">Sri Lanka</asp:ListItem>
                                        <asp:ListItem Value="Sudan">Sudan</asp:ListItem>
                                        <asp:ListItem Value="Suriname">Suriname</asp:ListItem>
                                        <asp:ListItem Value="Sweden">Sweden</asp:ListItem>
                                        <asp:ListItem Value="Switzerland">Switzerland</asp:ListItem>
                                        <asp:ListItem Value="Syria">Syria</asp:ListItem>
                                        <asp:ListItem Value="Tajikistan">Tajikistan</asp:ListItem>
                                        <asp:ListItem Value="Tanzania">Tanzania</asp:ListItem>
                                        <asp:ListItem Value="Thailand">Thailand</asp:ListItem>
                                        <asp:ListItem Value="Timor Leste">Timor Leste</asp:ListItem>
                                        <asp:ListItem Value="Togo">Togo</asp:ListItem>
                                        <asp:ListItem Value="Trinidad & Tobago">Trinidad & Tobago</asp:ListItem>
                                        <asp:ListItem Value="Tunisia">Tunisia</asp:ListItem>
                                        <asp:ListItem Value="Turkey">Turkey</asp:ListItem>
                                        <asp:ListItem Value="Turkmenistan">Turkmenistan</asp:ListItem>
                                        <asp:ListItem Value="Turks & Caicos Islands">Turks & Caicos Islands</asp:ListItem>
                                        <asp:ListItem Value="Uganda">Uganda</asp:ListItem>
                                        <asp:ListItem Value="Ukraine">Ukraine</asp:ListItem>
                                        <asp:ListItem Value="United Arab Emirates">United Arab Emirates</asp:ListItem>
                                        <asp:ListItem Value="United States of America (USA)">United States of America (USA)</asp:ListItem>
                                        <asp:ListItem Value="Uruguay">Uruguay</asp:ListItem>
                                        <asp:ListItem Value="Uzbekistan">Uzbekistan</asp:ListItem>
                                        <asp:ListItem Value="Venezuela">Venezuela</asp:ListItem>
                                        <asp:ListItem Value="Vietnam">Vietnam</asp:ListItem>
                                        <asp:ListItem Value="Virgin Islands (UK)">Virgin Islands (UK)</asp:ListItem>
                                        <asp:ListItem Value="Virgin Islands (US)">Virgin Islands (US)</asp:ListItem>
                                        <asp:ListItem Value="Yemen">Yemen</asp:ListItem>
                                        <asp:ListItem Value="Zambia">Zambia</asp:ListItem>
                                        <asp:ListItem Value="Zimbabwe">Zimbabwe</asp:ListItem>


                                    </asp:DropDownList>

                                </div>
                                <div class="form-group col-lg-4">
                                    <label for="tbxPatientPhoneNumber">Phone Number:</label>
                                    <asp:TextBox ID="tbxPatientPhoneNumber" CssClass="form-control" runat="server" required="true"></asp:TextBox>
                                </div>
                                <div class="form-group col-lg-4">
                                    <label for="tbxPatientEmail">Email:</label>
                                    <asp:TextBox ID="tbxPatientEmail" CssClass="form-control" runat="server" TextMode="Email"></asp:TextBox>
                                </div>
                            </div>
                            <hr />
                            <div class="form-group">
                                <label for="tbxPatientMedicalConditions">Medical Conditions:</label>
                                <asp:TextBox ID="tbxPatientMedicalConditions" CssClass="form-control" runat="server" TextMode="multiline"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <label for="tbxPatientMedication">Current Medication:</label>
                                <asp:TextBox ID="tbxPatientMedication" CssClass="form-control" runat="server" TextMode="multiline"></asp:TextBox>
                            </div>
                            <%-- <div class="form-group">
                                <label for="tbxCurrentSupplements">Current Supplements:</label>
                                <asp:TextBox ID="tbxCurrentSupplements" CssClass="form-control" runat="server" TextMode="multiline"></asp:TextBox>
                            </div>--%>

                            <div class="form-group  justify-content-end align-content-end">
                                <asp:Button runat="server" ID="btnAddPatient" type="submit" class="btn  btn-success" Text="Add Patient" OnClick="btnAddPatient_Click"></asp:Button>
                                <asp:Button runat="server" ID="btnUpdatePatient" type="submit" class="btn  btn-success" Text="Update Patient" Visible="false" OnClick="btnUpdatePatient_Click"></asp:Button>
                            </div>


                        </div>
                    </div>
                </div>
            </div>
        </div>
    </main>


</asp:Content>
