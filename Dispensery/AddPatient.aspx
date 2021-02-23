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
                                    <asp:DropDownList CssClass="form-control" ID="ddlPatientCounty" runat="server">
                                        <asp:ListItem Value="0">Choose...</asp:ListItem>
                                        <asp:ListItem Value="1">Cork</asp:ListItem>
                                        <asp:ListItem Value="2">Galway</asp:ListItem>
                                        <asp:ListItem Value="3">Mayo</asp:ListItem>
                                        <asp:ListItem Value="4">Donegal</asp:ListItem>
                                        <asp:ListItem Value="5">Kerry</asp:ListItem>
                                        <asp:ListItem Value="6">Tipperary</asp:ListItem>
                                        <asp:ListItem Value="7">Clare</asp:ListItem>
                                        <asp:ListItem Value="8">Tyrone</asp:ListItem>
                                        <asp:ListItem Value="9">Antrim</asp:ListItem>
                                        <asp:ListItem Value="10">Limerick</asp:ListItem>
                                        <asp:ListItem Value="11">Roscommon</asp:ListItem>
                                        <asp:ListItem Value="12">Down</asp:ListItem>
                                        <asp:ListItem Value="13">Wexford</asp:ListItem>
                                        <asp:ListItem Value="14">Meath</asp:ListItem>
                                        <asp:ListItem Value="15">Londonderry</asp:ListItem>
                                        <asp:ListItem Value="16">Kilkenny</asp:ListItem>
                                        <asp:ListItem Value="17">Wicklow</asp:ListItem>
                                        <asp:ListItem Value="18">Offaly</asp:ListItem>
                                        <asp:ListItem Value="19">Cavan</asp:ListItem>
                                        <asp:ListItem Value="20">Waterford</asp:ListItem>
                                        <asp:ListItem Value="21">Westmeath</asp:ListItem>
                                        <asp:ListItem Value="22">Sligo</asp:ListItem>
                                        <asp:ListItem Value="23">Laois</asp:ListItem>
                                        <asp:ListItem Value="24">Kildare</asp:ListItem>
                                        <asp:ListItem Value="25">Fermanagh</asp:ListItem>
                                        <asp:ListItem Value="26">Leitrim</asp:ListItem>
                                        <asp:ListItem Value="27">Armagh</asp:ListItem>
                                        <asp:ListItem Value="28">Monaghan</asp:ListItem>
                                        <asp:ListItem Value="29">Longford</asp:ListItem>
                                        <asp:ListItem Value="30">Dublin</asp:ListItem>
                                        <asp:ListItem Value="31">Carlow</asp:ListItem>
                                        <asp:ListItem Value="32">Louth</asp:ListItem>

                                    </asp:DropDownList>
                                </div>
                                <div class="form-group col-lg-2">
                                    <label for="tbxEirecode">Eirecode:</label>
                                    <asp:TextBox ID="tbxEirecode" CssClass="form-control" runat="server"></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-row">
                                <div class="form-group col-lg-4">
                                    <label for="tbxPatientCountry">Country:</label>
                                    <asp:DropDownList ID="ddlPatientCountry" CssClass="form-control" runat="server">
                                        <asp:ListItem Value="0">Choose...</asp:ListItem>
                                        <asp:ListItem Value="1">Afghanistan</asp:ListItem>
                                        <asp:ListItem Value="2">Aland Islands</asp:ListItem>
                                        <asp:ListItem Value="3">Albania</asp:ListItem>
                                        <asp:ListItem Value="4">Algeria</asp:ListItem>
                                        <asp:ListItem Value="5">Alderney</asp:ListItem>
                                        <asp:ListItem Value="6">American Samoa</asp:ListItem>
                                        <asp:ListItem Value="7">Andorra</asp:ListItem>
                                        <asp:ListItem Value="8">Angola</asp:ListItem>
                                        <asp:ListItem Value="9">Anguilla</asp:ListItem>
                                        <asp:ListItem Value="10">Antarctica</asp:ListItem>
                                        <asp:ListItem Value="11">Antigua and Barbuda</asp:ListItem>
                                        <asp:ListItem Value="12">Argentina</asp:ListItem>
                                        <asp:ListItem Value="13">Armenia</asp:ListItem>
                                        <asp:ListItem Value="14">Aruba</asp:ListItem>
                                        <asp:ListItem Value="15">Australia</asp:ListItem>
                                        <asp:ListItem Value="16">Austria</asp:ListItem>
                                        <asp:ListItem Value="17">Azerbaijan</asp:ListItem>
                                        <asp:ListItem Value="18">Bahamas</asp:ListItem>
                                        <asp:ListItem Value="19">Bahrain</asp:ListItem>
                                        <asp:ListItem Value="20">Bangladesh</asp:ListItem>
                                        <asp:ListItem Value="21">Barbados</asp:ListItem>
                                        <asp:ListItem Value="22">Belarus</asp:ListItem>
                                        <asp:ListItem Value="23">Belgium</asp:ListItem>
                                        <asp:ListItem Value="24">Belize</asp:ListItem>
                                        <asp:ListItem Value="25">Benin</asp:ListItem>
                                        <asp:ListItem Value="26">Bermuda</asp:ListItem>
                                        <asp:ListItem Value="27">Bhutan</asp:ListItem>
                                        <asp:ListItem Value="28">Bolivia</asp:ListItem>
                                        <asp:ListItem Value="29">Bonaire, Sint Eustatius and Saba</asp:ListItem>
                                        <asp:ListItem Value="30">Bosnia and Herzegovina</asp:ListItem>
                                        <asp:ListItem Value="31">Botswana</asp:ListItem>
                                        <asp:ListItem Value="32">Bouvet Island</asp:ListItem>
                                        <asp:ListItem Value="33">Brazil</asp:ListItem>
                                        <asp:ListItem Value="34">British Indian Ocean Territory</asp:ListItem>
                                        <asp:ListItem Value="35">Brunei Darussalam</asp:ListItem>
                                        <asp:ListItem Value="36">Bulgaria</asp:ListItem>
                                        <asp:ListItem Value="37">Burkina Faso</asp:ListItem>
                                        <asp:ListItem Value="38">Burundi</asp:ListItem>
                                        <asp:ListItem Value="39">Cambodia</asp:ListItem>
                                        <asp:ListItem Value="40">Cameroon</asp:ListItem>
                                        <asp:ListItem Value="41">Canada</asp:ListItem>
                                        <asp:ListItem Value="42">Cape Verde</asp:ListItem>
                                        <asp:ListItem Value="43">Cayman Islands</asp:ListItem>
                                        <asp:ListItem Value="44">Central African Republic</asp:ListItem>
                                        <asp:ListItem Value="45">Chad</asp:ListItem>
                                        <asp:ListItem Value="46">Chile</asp:ListItem>
                                        <asp:ListItem Value="47">China</asp:ListItem>
                                        <asp:ListItem Value="48">Christmas Island</asp:ListItem>
                                        <asp:ListItem Value="49">Cocos (Keeling) Islands</asp:ListItem>
                                        <asp:ListItem Value="50">Colombia</asp:ListItem>
                                        <asp:ListItem Value="51">Comoros</asp:ListItem>
                                        <asp:ListItem Value="52">Congo</asp:ListItem>
                                        <asp:ListItem Value="53">Congo, the Democratic Republic of the</asp:ListItem>
                                        <asp:ListItem Value="54">Cook Islands</asp:ListItem>
                                        <asp:ListItem Value="55">Costa Rica</asp:ListItem>
                                        <asp:ListItem Value="56">Croatia</asp:ListItem>
                                        <asp:ListItem Value="57">Cuba</asp:ListItem>
                                        <asp:ListItem Value="58">Curacao</asp:ListItem>
                                        <asp:ListItem Value="59">Cyprus</asp:ListItem>
                                        <asp:ListItem Value="60">Czech Republic</asp:ListItem>
                                        <asp:ListItem Value="61">Denmark</asp:ListItem>
                                        <asp:ListItem Value="62">Djibouti</asp:ListItem>
                                        <asp:ListItem Value="63">Dominica</asp:ListItem>
                                        <asp:ListItem Value="64">Dominican Republic</asp:ListItem>
                                        <asp:ListItem Value="65">East Timor</asp:ListItem>
                                        <asp:ListItem Value="66">Ecuador</asp:ListItem>
                                        <asp:ListItem Value="67">Egypt</asp:ListItem>
                                        <asp:ListItem Value="68">El Salvador</asp:ListItem>
                                        <asp:ListItem Value="69">England</asp:ListItem>
                                        <asp:ListItem Value="70">Equatorial Guinea</asp:ListItem>
                                        <asp:ListItem Value="71">Eritrea</asp:ListItem>
                                        <asp:ListItem Value="72">Estonia</asp:ListItem>
                                        <asp:ListItem Value="73">Eswatini</asp:ListItem>
                                        <asp:ListItem Value="74">Ethiopia</asp:ListItem>
                                        <asp:ListItem Value="75">Falkland Islands</asp:ListItem>
                                        <asp:ListItem Value="76">Faroe Islands</asp:ListItem>
                                        <asp:ListItem Value="77">Fiji</asp:ListItem>
                                        <asp:ListItem Value="78">Finland</asp:ListItem>
                                        <asp:ListItem Value="79">France</asp:ListItem>
                                        <asp:ListItem Value="80">French Guiana</asp:ListItem>
                                        <asp:ListItem Value="81">French Polynesia</asp:ListItem>
                                        <asp:ListItem Value="82">French Southern Territories</asp:ListItem>
                                        <asp:ListItem Value="83">Gabon</asp:ListItem>
                                        <asp:ListItem Value="84">Gambia</asp:ListItem>
                                        <asp:ListItem Value="85">Georgia</asp:ListItem>
                                        <asp:ListItem Value="86">Germany</asp:ListItem>
                                        <asp:ListItem Value="87">Ghana</asp:ListItem>
                                        <asp:ListItem Value="88">Gibraltar</asp:ListItem>
                                        <asp:ListItem Value="89">Greece</asp:ListItem>
                                        <asp:ListItem Value="90">Greenland</asp:ListItem>
                                        <asp:ListItem Value="91">Grenada</asp:ListItem>
                                        <asp:ListItem Value="92">Guadeloupe</asp:ListItem>
                                        <asp:ListItem Value="93">Guam</asp:ListItem>
                                        <asp:ListItem Value="94">Guatemala</asp:ListItem>
                                        <asp:ListItem Value="95">Guernsey</asp:ListItem>
                                        <asp:ListItem Value="96">Guinea</asp:ListItem>
                                        <asp:ListItem Value="97">Guinea-Bissau</asp:ListItem>
                                        <asp:ListItem Value="98">Guyana</asp:ListItem>
                                        <asp:ListItem Value="99">Haiti</asp:ListItem>
                                        <asp:ListItem Value="100">Heard Island and McDonald Islands</asp:ListItem>
                                        <asp:ListItem Value="101">Herm</asp:ListItem>
                                        <asp:ListItem Value="102">Honduras</asp:ListItem>
                                        <asp:ListItem Value="103">Hong Kong</asp:ListItem>
                                        <asp:ListItem Value="104">Hungary</asp:ListItem>
                                        <asp:ListItem Value="105">Iceland</asp:ListItem>
                                        <asp:ListItem Value="106">India</asp:ListItem>
                                        <asp:ListItem Value="107">Indonesia</asp:ListItem>
                                        <asp:ListItem Value="108">Iran</asp:ListItem>
                                        <asp:ListItem Value="109">Iraq</asp:ListItem>
                                        <asp:ListItem Value="110">Ireland</asp:ListItem>
                                        <asp:ListItem Value="111">Isle of Man</asp:ListItem>
                                        <asp:ListItem Value="112">Israel</asp:ListItem>
                                        <asp:ListItem Value="113">Italy</asp:ListItem>
                                        <asp:ListItem Value="114">Ivory Coast</asp:ListItem>
                                        <asp:ListItem Value="115">Jamaica</asp:ListItem>
                                        <asp:ListItem Value="116">Japan</asp:ListItem>
                                        <asp:ListItem Value="117">Jersey</asp:ListItem>
                                        <asp:ListItem Value="118">Jordan</asp:ListItem>
                                        <asp:ListItem Value="119">Kazakhstan</asp:ListItem>
                                        <asp:ListItem Value="120">Kenya</asp:ListItem>
                                        <asp:ListItem Value="121">Kiribati</asp:ListItem>
                                        <asp:ListItem Value="122">Kosovo</asp:ListItem>
                                        <asp:ListItem Value="123">Kuwait</asp:ListItem>
                                        <asp:ListItem Value="124">Kyrgyzstan</asp:ListItem>
                                        <asp:ListItem Value="125">Laos</asp:ListItem>
                                        <asp:ListItem Value="126">Latvia</asp:ListItem>
                                        <asp:ListItem Value="127">Lebanon</asp:ListItem>
                                        <asp:ListItem Value="128">Lesotho</asp:ListItem>
                                        <asp:ListItem Value="129">Liberia</asp:ListItem>
                                        <asp:ListItem Value="130">Libya</asp:ListItem>
                                        <asp:ListItem Value="131">Liechtenstein</asp:ListItem>
                                        <asp:ListItem Value="132">Lithuania</asp:ListItem>
                                        <asp:ListItem Value="133">Luxembourg</asp:ListItem>
                                        <asp:ListItem Value="134">Macao</asp:ListItem>
                                        <asp:ListItem Value="135">Macedonia</asp:ListItem>
                                        <asp:ListItem Value="136">Madagascar</asp:ListItem>
                                        <asp:ListItem Value="137">Malawi</asp:ListItem>
                                        <asp:ListItem Value="138">Malaysia</asp:ListItem>
                                        <asp:ListItem Value="139">Maldives</asp:ListItem>
                                        <asp:ListItem Value="140">Mali</asp:ListItem>
                                        <asp:ListItem Value="141">Malta</asp:ListItem>
                                        <asp:ListItem Value="142">Marshall Islands</asp:ListItem>
                                        <asp:ListItem Value="143">Martinique</asp:ListItem>
                                        <asp:ListItem Value="144">Mauritania</asp:ListItem>
                                        <asp:ListItem Value="145">Mauritius</asp:ListItem>
                                        <asp:ListItem Value="146">Mayotte</asp:ListItem>
                                        <asp:ListItem Value="147">Mexico</asp:ListItem>
                                        <asp:ListItem Value="148">Micronesia</asp:ListItem>
                                        <asp:ListItem Value="149">Moldova</asp:ListItem>
                                        <asp:ListItem Value="150">Monaco</asp:ListItem>
                                        <asp:ListItem Value="151">Mongolia</asp:ListItem>
                                        <asp:ListItem Value="152">Montenegro</asp:ListItem>
                                        <asp:ListItem Value="153">Montserrat</asp:ListItem>
                                        <asp:ListItem Value="154">Morocco</asp:ListItem>
                                        <asp:ListItem Value="155">Mozambique</asp:ListItem>
                                        <asp:ListItem Value="156">Myanmar</asp:ListItem>
                                        <asp:ListItem Value="157">Namibia</asp:ListItem>
                                        <asp:ListItem Value="158">Nauru</asp:ListItem>
                                        <asp:ListItem Value="159">Nepal</asp:ListItem>
                                        <asp:ListItem Value="160">Netherlands</asp:ListItem>
                                        <asp:ListItem Value="161">New Caledonia</asp:ListItem>
                                        <asp:ListItem Value="162">New Zealand</asp:ListItem>
                                        <asp:ListItem Value="163">Nicaragua</asp:ListItem>
                                        <asp:ListItem Value="164">Niger</asp:ListItem>
                                        <asp:ListItem Value="165">Nigeria</asp:ListItem>
                                        <asp:ListItem Value="166">Niue</asp:ListItem>
                                        <asp:ListItem Value="167">Norfolk Island</asp:ListItem>
                                        <asp:ListItem Value="168">North Korea</asp:ListItem>
                                        <asp:ListItem Value="169">Northern Ireland</asp:ListItem>
                                        <asp:ListItem Value="170">Northern Mariana Islands</asp:ListItem>
                                        <asp:ListItem Value="171">Norway</asp:ListItem>
                                        <asp:ListItem Value="172">Oman</asp:ListItem>
                                        <asp:ListItem Value="173">Pakistan</asp:ListItem>
                                        <asp:ListItem Value="174">Palau</asp:ListItem>
                                        <asp:ListItem Value="175">Palestine, State of</asp:ListItem>
                                        <asp:ListItem Value="176">Panama</asp:ListItem>
                                        <asp:ListItem Value="177">Papua New Guinea</asp:ListItem>
                                        <asp:ListItem Value="178">Paraguay</asp:ListItem>
                                        <asp:ListItem Value="179">Peru</asp:ListItem>
                                        <asp:ListItem Value="180">Philippines</asp:ListItem>
                                        <asp:ListItem Value="181">Pitcairn</asp:ListItem>
                                        <asp:ListItem Value="182">Poland</asp:ListItem>
                                        <asp:ListItem Value="183">Portugal</asp:ListItem>
                                        <asp:ListItem Value="184">Puerto Rico</asp:ListItem>
                                        <asp:ListItem Value="185">Qatar</asp:ListItem>
                                        <asp:ListItem Value="186">Reunion</asp:ListItem>
                                        <asp:ListItem Value="187">Romania</asp:ListItem>
                                        <asp:ListItem Value="188">Russia</asp:ListItem>
                                        <asp:ListItem Value="189">Rwanda</asp:ListItem>
                                        <asp:ListItem Value="190">Saint Barthelemy</asp:ListItem>
                                        <asp:ListItem Value="191">Saint Helena, Ascension and Tristan da Cunha</asp:ListItem>
                                        <asp:ListItem Value="192">Saint Kitts and Nevis</asp:ListItem>
                                        <asp:ListItem Value="193">Saint Lucia</asp:ListItem>
                                        <asp:ListItem Value="194">Saint Martin (French part)</asp:ListItem>
                                        <asp:ListItem Value="195">Saint Pierre and Miquelon</asp:ListItem>
                                        <asp:ListItem Value="196">Saint Vincent and the Grenadines</asp:ListItem>
                                        <asp:ListItem Value="197">Samoa</asp:ListItem>
                                        <asp:ListItem Value="198">San Marino</asp:ListItem>
                                        <asp:ListItem Value="199">Sao Tome and Principe</asp:ListItem>
                                        <asp:ListItem Value="200">Sark</asp:ListItem>
                                        <asp:ListItem Value="201">Saudi Arabia</asp:ListItem>
                                        <asp:ListItem Value="202">Scotland</asp:ListItem>
                                        <asp:ListItem Value="203">Senegal</asp:ListItem>
                                        <asp:ListItem Value="204">Serbia</asp:ListItem>
                                        <asp:ListItem Value="205">Seychelles</asp:ListItem>
                                        <asp:ListItem Value="206">Sierra Leone</asp:ListItem>
                                        <asp:ListItem Value="207">Singapore</asp:ListItem>
                                        <asp:ListItem Value="208">Sint Maarten (Dutch part)</asp:ListItem>
                                        <asp:ListItem Value="209">Slovakia</asp:ListItem>
                                        <asp:ListItem Value="210">Slovenia</asp:ListItem>
                                        <asp:ListItem Value="211">Solomon Islands</asp:ListItem>
                                        <asp:ListItem Value="212">Somalia</asp:ListItem>
                                        <asp:ListItem Value="213">South Africa</asp:ListItem>
                                        <asp:ListItem Value="214">South Georgia and the South Sandwich Islands</asp:ListItem>
                                        <asp:ListItem Value="215">South Korea</asp:ListItem>
                                        <asp:ListItem Value="216">South Sudan</asp:ListItem>
                                        <asp:ListItem Value="217">Spain</asp:ListItem>
                                        <asp:ListItem Value="218">Sri Lanka</asp:ListItem>
                                        <asp:ListItem Value="219">Sudan</asp:ListItem>
                                        <asp:ListItem Value="220">Suriname</asp:ListItem>
                                        <asp:ListItem Value="221">Svalbard and Jan Mayen</asp:ListItem>
                                        <asp:ListItem Value="222">Sweden</asp:ListItem>
                                        <asp:ListItem Value="223">Switzerland</asp:ListItem>
                                        <asp:ListItem Value="224">Syria</asp:ListItem>
                                        <asp:ListItem Value="225">Taiwan</asp:ListItem>
                                        <asp:ListItem Value="226">Tajikistan</asp:ListItem>
                                        <asp:ListItem Value="227">Tanzania</asp:ListItem>
                                        <asp:ListItem Value="228">Thailand</asp:ListItem>
                                        <asp:ListItem Value="229">Togo</asp:ListItem>
                                        <asp:ListItem Value="230">Tokelau</asp:ListItem>
                                        <asp:ListItem Value="231">Tonga</asp:ListItem>
                                        <asp:ListItem Value="232">Trinidad and Tobago</asp:ListItem>
                                        <asp:ListItem Value="233">Tunisia</asp:ListItem>
                                        <asp:ListItem Value="234">Turkey</asp:ListItem>
                                        <asp:ListItem Value="235">Turkmenistan</asp:ListItem>
                                        <asp:ListItem Value="236">Turks and Caicos Islands</asp:ListItem>
                                        <asp:ListItem Value="237">Tuvalu</asp:ListItem>
                                        <asp:ListItem Value="238">Uganda</asp:ListItem>
                                        <asp:ListItem Value="239">Ukraine</asp:ListItem>
                                        <asp:ListItem Value="240">United Arab Emirates</asp:ListItem>
                                        <asp:ListItem Value="241">United Kingdom</asp:ListItem>
                                        <asp:ListItem Value="242">United States</asp:ListItem>
                                        <asp:ListItem Value="243">United States Minor Outlying Islands</asp:ListItem>
                                        <asp:ListItem Value="244">Uruguay</asp:ListItem>
                                        <asp:ListItem Value="245">Uzbekistan</asp:ListItem>
                                        <asp:ListItem Value="246">Vanuatu</asp:ListItem>
                                        <asp:ListItem Value="247">Vatican City</asp:ListItem>
                                        <asp:ListItem Value="248">Venezuela</asp:ListItem>
                                        <asp:ListItem Value="249">Vietnam</asp:ListItem>
                                        <asp:ListItem Value="250">Virgin Islands, British</asp:ListItem>
                                        <asp:ListItem Value="251">Virgin Islands, U.S.</asp:ListItem>
                                        <asp:ListItem Value="252">Wales</asp:ListItem>
                                        <asp:ListItem Value="253">Wallis and Futuna</asp:ListItem>
                                        <asp:ListItem Value="254">Western Sahara</asp:ListItem>
                                        <asp:ListItem Value="255">Yemen</asp:ListItem>
                                        <asp:ListItem Value="256">Zambia</asp:ListItem>
                                        <asp:ListItem Value="257">Zimbabwe</asp:ListItem>

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

                            </div>


                        </div>
                    </div>
                </div>
            </div>
        </div>
    </main>


</asp:Content>
