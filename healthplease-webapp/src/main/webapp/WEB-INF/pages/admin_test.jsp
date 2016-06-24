<%@page import="com.rns.healthplease.web.util.Constants"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
          <title>Book online Pathology & Diagnostic Tests in Pune | HealthPlease.in</title>
    <meta name="keywords" content="Book Online Path Test, Book online diagnostic test, Blood Sugar test">
    <meta name="description" content="Book your online Pathology Lab test and test packages and have sample picked from home. Online Payment option and save reports for future reference.">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

   <link rel="icon" type="image/png" sizes="32x32" href="images/favicon/favicon-32x32.png">
<link rel="icon" type="image/png" sizes="96x96" href="images/favicon/favicon-96x96.png">
<link rel="icon" type="image/png" sizes="16x16" href="images/favicon/favicon-16x16.png">
    <!-- Custom Fonts -->
    <link href="bootstrap/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="css/dialog.css" rel="stylesheet">
   
   <!--Adde by vikas for validation error custom messages on form 31-may-2015 -->
    <link href="css/internal/form-validation.css" rel="stylesheet">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
	
      <script src="bootstrap/js/jquery-1.11.2.min.js"></script>
        <script src="bootstrap/js/bootstrap.min.js"></script>
        <script src="js/jquery-ui.js"></script>

        <!-- Steps Plugin CSS -->
       <link href="css/smart_wizard.css" rel="stylesheet" type="text/css">
       <script type="text/javascript" src="js/jquery.smartWizard.js"></script>
   
 <!-- Bootstrap Core CSS -->
    <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="css/jquery-ui.css" rel="stylesheet">

    <!-- Code Added by vikas on 23-May-2015 -->
    <!-- Used to display combobox values runtime -->
    <link href="css/external/select2/select2.min.css" rel="stylesheet" ></link>
    <script src="js/external/select2/select2.min.js"></script>

<!--Google Analytics Tracking Code Start-->
<script>
  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
  })(window,document,'script','//www.google-analytics.com/analytics.js','ga');

  ga('create', 'UA-66916464-1', 'auto');
  ga('send', 'pageview');

</script>
<!--Google Analytics Tracking Code End-->


<script type="text/javascript">

 
$(function(){
    $('.classSmoothScroll').click(function() {
    if (location.pathname.replace(/^\//,'') == this.pathname.replace(/^\//,'')
        && location.hostname == this.hostname) {
            var $target = $(this.hash);        
            $target = $target.length && $target || $('[name=' + this.hash.slice(1) +']');
            if ($target.length) {
              var targetOffset = $target.offset().top - $(".classFixedHeader").outerHeight(true);
                // var targetOffset = $target.offset().top;
                $('html,body').animate({scrollTop: targetOffset}, 1000);
                return false;
            }
        }
    });
});

function doScroll(){
    if (window.name) window.scrollTo(0, window.name);
}

</script>

    <!-- Code Additon ends here by vikas on 23-May-2015 -->
     <link href="css/style.css?ver=5" rel="stylesheet"></link>
     <!-- Timeline CSS -->
    
</head>

<body>

<!--Start of Tawk.to Script-->
<script type="text/javascript">
var $_Tawk_API={},$_Tawk_LoadStart=new Date();
(function(){
var s1=document.createElement("script"),s0=document.getElementsByTagName("script")[0];
s1.async=true;
s1.src='https://embed.tawk.to/567db03243462c597a64a31f/default';
s1.charset='UTF-8';
s1.setAttribute('crossorigin','*');
s0.parentNode.insertBefore(s1,s0);
})();
</script>
<!--End of Tawk.to Script-->
    <div id="wrapper">
        <div style="background:#A4DBF4;">
            <div class="container">
                <div class="row">
                    <div class="col-xs-12 col-xs-12 col-md-12 col-lg-12 col-xl-12">
                        <!-- Navigation -->
                        <nav class="navbar navbar-default navbar-static-top classCustomNavBar" role="navigation" style="margin-bottom: 0">
                            <div class="navbar-header">
                                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                                    <span class="sr-only">Toggle navigation</span>
                                    <span class="icon-bar"></span>
                                    <span class="icon-bar"></span>
                                    <span class="icon-bar"></span>
                                </button>
                                <a class="navbar-brand" href="http://www.healthplease.in/"><img src="images/LOGO-2.png" class="classLogoImg"/></a>
                            </div>
                                                        <!-- /.navbar-header -->
                            <div class="collapse navbar-collapse" id="example-navbar-collapse">
                                <ul class="nav navbar-top-links navbar-right">
                                    <li class="dropdown">
                                        <a class="dropdown-toggle"  href="http://www.healthplease.in/">
                                            <i class="fa fa-home fa-fw"></i> Home
                                        </a>                    <!-- /.dropdown-messages -->
                                    </li>
                                    <li class="dropdown">
                                        <a class="dropdown-toggle"  href="about.php">
                                            <i class="fa fa-life-ring fa-fw"></i> About Us
                                        </a>                    <!-- /.dropdown-messages -->
                                    </li>
                                    <li class="dropdown">
                                        <a class="dropdown-toggle"  href="support.php">
                                            <i class="fa fa-cogs fa-fw"></i> Support
                                        </a>                    <!-- /.dropdown-messages -->
                                    </li>
                                    <li class="dropdown">
                                        <a class="dropdown-toggle"  href="pricing.php">
                                           <i class="fa fa-inr fa-fw"></i> Pricing
                                        </a>                    <!-- /.dropdown-messages -->
                                    </li>
                                    <li class="dropdown">
                                        <a class="dropdown-toggle"  href="faqs.php">
                                           <i class="fa fa-question fa-fw"></i> FAQs
                                        </a>                    <!-- /.dropdown-messages -->
                                    </li>
                                                                        <!-- /.dropdown -->
                                    
                                    <!-- /.dropdown -->
                                    
                                        <li class="dropdown">
                                                            <a class="dropdown-toggle"  href="dash.php">
                                                                <i class="fa fa-tachometer fa-fw"></i>
                                                                Dashboard
                                                            </a>
                                                            </li>
                                                            <li>
                                                            <a class="dropdown-toggle"  href="user-profile.php">
                                                            <i class="fa fa-user fa-fw"></i>Ajinkya
                                                            
                                                            </a>
                                                            </li>                                        
                                     <li class="dropdown">
                                          
                                        <a  href="logout.php" ><i class="fa fa-sign-out fa-fw"></i> Logout </a>
                                         
                                                                                
                                        
                                        <!-- /.dropdown-user -->
                                    </li>
                                     
                                    <!-- /.dropdown -->
                                </ul>
                            </div>
                            <!-- /.navbar-top-links -->

                            
                            <!-- /.navbar-static-side -->
                        </nav>
                    </div>
                </div>
            </div>
        </div>
    
        <div class="classGoldenDivider"></div>    <div class="classTopHeading">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Welcome <span class="nameHolder">Admin</span></h1>
                </div>
            </div>
            <!-- /.col-lg-12 -->
        </div>
    </div>
    <div id="msg" class="container"></div>


<!--Add user start from here-->
<div class="container">  
  <div class="row">
     <div class="col-lg-3 col-md-3">
        <div class="row">
          <div class="col-md-12 column margintop20">
            <ul class="nav nav-pills nav-stacked classCustomAMenu">
              <li class="active"><a href="dash.php"><span class="glyphicon glyphicon-chevron-right"></span> Controller</a></li>
                              <li><a href="categories.php"><span class="glyphicon glyphicon-chevron-right"></span> Test Category</a></li>
              <li><a href="test.php" class="active2"><span class="glyphicon glyphicon-chevron-right"></span> Test</a></li>
              <li><a href="location.php"><span class="glyphicon glyphicon-chevron-right"></span> Location</a></li>
              <li><a href="labs.php"><span class="glyphicon glyphicon-chevron-right"></span> Lab</a></li>
              <li><a href="load-labs.php"><span class="glyphicon glyphicon-chevron-right"></span> Lab Dashboard</a></li>
              <li><a href="slots.php"><span class="glyphicon glyphicon-chevron-right"></span> Slots</a></li>
              <li><a href="coming-soon-page.php"><span class="glyphicon glyphicon-chevron-right"></span> Fix Appointment</a></li>
              <li><a href="coming-soon-page.php"><span class="glyphicon glyphicon-chevron-right"></span> Users</a></li>
              <li><a href="coming-soon-page.php"><span class="glyphicon glyphicon-chevron-right"></span> Reports</a></li>
              <li><a href="set_tests.php"><span class="glyphicon glyphicon-chevron-right"></span>Settings</a></li>
                            </ul>
        </div>
</div>         <!-- /.panel-heading -->
    </div>
<div class="col-lg-9 col-md-9">

<div class="clearfix"></div>
      

<!--Add user start from here-->
<div id="addUser" name="addUser">

<form method='post' id="form_add_user" action="testController.php">
 
    <table class='table table-bordered'>
 
        <tr>
            <td>Test Name</td>
            <input type='hidden' name='id' id="id" class='form-control' value="">
            <td><input type='text' name='test_name' id='test_name' class='form-control' value=""required ></td>
        </tr>
             <tr>
            <td>Lab Name</td>
            <td> <select class="form-control" id="lab_id" name="lab_id[]" multiple>
                                <option value="1"> 
                Dhanwantari Path Lab                </option>
                                <option value="3"> 
                N M Medical                </option>
                                <option value="4"> 
                Agarwal's Pathology                </option>
                                <option value="5"> 
                Ankur Pathology Lab                </option>
                                <option value="6"> 
                PrimeX Health                </option>
                                <option value="7"> 
                Care First                </option>
                                <option value="8"> 
                DTH Labs                </option>
                                </select></td>
        </tr>
        <tr>
            <td>Test Category</td>
            <td> <select class="form-control" id="test_cat_id" name="test_cat_id">
                                <option value="1"> 
                HEAMATOLOGY                </option>
                                <option value="2"> 
                SEROLOGY                </option>
                                <option value="3"> 
                HORMONAL TEST	                </option>
                                <option value="4"> 
                BIOCHEMISTRY	                </option>
                                <option value="5"> 
                BACTERIOLOGY	                </option>
                                <option value="6"> 
                CLINICAL PATHOLOGY                </option>
                                <option value="7"> 
                OTHER TEST                </option>
                                <option value="8"> 
                MICROBIOLOGY                </option>
                                </select></td>
        </tr>
 
        <tr>
            <td>Test Charge</td>
            <td><input type='number' name='test_charge' id='test_charge' class='form-control' value="" required></td>
        </tr>
        <tr>
            <td>Included Test/Packages</td>
            <td>
                <select id="test_pkg" name="test[]" class="form-control selectpicker" multiple="multiple">
                                          <!--<option value="select" selected="">Select Your Test</option>-->
                                                                                      <optgroup label="Test Packages" style="margin-left: 10px">
                                           <option value=93>&nbsp;&nbsp;Lipid Profile Test (LPT) &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 450</option><option value=94>&nbsp;&nbsp;Liver Functionality Test (LFT) &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 450</option><option value=95>&nbsp;&nbsp;Kidney Profile Test (KPT)  &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 500</option><option value=96>&nbsp;&nbsp;Complete Hemogram Test (CHT) &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 300</option><option value=97>&nbsp;&nbsp;Thyroid Profile Test (TPT) &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 650</option><option value=98>&nbsp;&nbsp;Free Thyroid Profile Test (FTPT) &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 700</option><option value=102>&nbsp;&nbsp;Cardiac Risk Markers (CRM)  &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 2500</option><option value=104>&nbsp;&nbsp;Hepatitis B Profile (HBP) &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 3500</option><option value=109>&nbsp;&nbsp;Diabetes Screen Test (DST) &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 500</option><option value=121>&nbsp;&nbsp;Common Blood Profile Test (CBPT) &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 1000</option><option value=125>&nbsp;&nbsp;Iron Deficiency Test (IDT) &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 700</option><option value=135>&nbsp;&nbsp;Anemia Profile Test (APT) &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 2700</option><option value=313>&nbsp;&nbsp;Full Kidney Profile Test (KPT) &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 1000</option><option value=314>&nbsp;&nbsp;Mini Lipid Profile Test &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 400</option><option value=315>&nbsp;&nbsp;Vitamin Profile Test (VPT) &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 1700</option><option value=317>&nbsp;&nbsp;Preventive Health Screen 35 Years Old &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 3200</option><option value=318>&nbsp;&nbsp;Preventive Health Screen 45 Years Old &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 4700</option><option value=319>&nbsp;&nbsp;Pre Natal Pregnancy Profile &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 1100</option><option value=320>&nbsp;&nbsp;Preventive Health Screening 25 Years Old &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 1850</option><option value=365>&nbsp;&nbsp;Health Card 1 Year &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 1499</option><option value=366>&nbsp;&nbsp;Health Card 6 Months &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 999</option><option value=367>&nbsp;&nbsp;Health Card 3 Months &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 599</option>                                          <optgroup>
                                          <optgroup label="Regular Test" style="margin-left: 10px">
                                           <option value=1>&nbsp;&nbsp;Hemogram CBC &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 180</option><option value=2>&nbsp;&nbsp;CBC + ESR &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 250</option><option value=3>&nbsp;&nbsp;R.B.C & W.B.C &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 80</option><option value=4>&nbsp;&nbsp;ESR &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 100</option><option value=5>&nbsp;&nbsp;P.C.V &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 150</option><option value=6>&nbsp;&nbsp;BT & CT &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 180</option><option value=7>&nbsp;&nbsp;Prothrombin Time &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 250</option><option value=9>&nbsp;&nbsp;Platelet Count &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 120</option><option value=12>&nbsp;&nbsp;Glycosylated Haemoglobin HbA1c &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 450</option><option value=13>&nbsp;&nbsp;RH Antibody Titre &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 300</option><option value=14>&nbsp;&nbsp;Blood Group &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 100</option><option value=15>&nbsp;&nbsp;PBS M.P. &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 150</option><option value=16>&nbsp;&nbsp;M.P. &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 250</option><option value=17>&nbsp;&nbsp;Widal &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 300</option><option value=18>&nbsp;&nbsp;VDRL &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 200</option><option value=20>&nbsp;&nbsp;HIV I & II Tridot &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 350</option><option value=21>&nbsp;&nbsp;HIV Western Blot &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 2200</option><option value=22>&nbsp;&nbsp;Rheumatoid Arthritis RA Factor &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 200</option><option value=24>&nbsp;&nbsp;C-Reactive Protein (HsCRP)* &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 200</option><option value=25>&nbsp;&nbsp;A.S.O (Screen) &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 200</option><option value=26>&nbsp;&nbsp;Australia Antigen (HBsAg) &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 250</option><option value=27>&nbsp;&nbsp;Tuberculin Test &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 200</option><option value=28>&nbsp;&nbsp;Direct Cooms Test &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 450</option><option value=29>&nbsp;&nbsp;Dengue (NS1, IgM, IgM (Spot), IgG, IgG (Spot)) &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 1200</option><option value=30>&nbsp;&nbsp;Total Triiodothyronine (T3)* &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 200</option><option value=31>&nbsp;&nbsp;Total Thyroxine (T4)* &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 200</option><option value=32>&nbsp;&nbsp;Thyroid Stimilating Hormone (TSH)* &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 400</option><option value=33>&nbsp;&nbsp;Leutinizing Hormone (LH)* &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 300</option><option value=34>&nbsp;&nbsp;Follicle Stimlating Hormone (FSH)* &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 300</option><option value=35>&nbsp;&nbsp;LDH* &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 500</option><option value=36>&nbsp;&nbsp;TFT* &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 750</option><option value=37>&nbsp;&nbsp;Prolactin* &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 400</option><option value=39>&nbsp;&nbsp;Free Total Triiodothyronine (FT3)* &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 200</option><option value=40>&nbsp;&nbsp;CD4* &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 1200</option><option value=41>&nbsp;&nbsp;CD4/CD8 &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 1500</option><option value=42>&nbsp;&nbsp;Blood & Urine Sugar F & PP &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 150</option><option value=43>&nbsp;&nbsp;Blood Sugar Random &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 80</option><option value=44>&nbsp;&nbsp;Cholesterol Total &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 130</option><option value=45>&nbsp;&nbsp;Blood Urea Nitrogen (BUN)  &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 130</option><option value=46>&nbsp;&nbsp;Triglycerides &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 130</option><option value=48>&nbsp;&nbsp;Electrolytes &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 400</option><option value=49>&nbsp;&nbsp;Bilirubin (Indirect) &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 130</option><option value=50>&nbsp;&nbsp;SGPT &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 130</option><option value=51>&nbsp;&nbsp;SGOT &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 130</option><option value=53>&nbsp;&nbsp;Alkaline Phosphatase &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 130</option><option value=54>&nbsp;&nbsp;Uric Acid &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 130</option><option value=55>&nbsp;&nbsp;Creatinine &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 130</option><option value=56>&nbsp;&nbsp;Protein - Total &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 400</option><option value=57>&nbsp;&nbsp;Calcium &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 150</option><option value=58>&nbsp;&nbsp;Acid Phosphatase &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 400</option><option value=59>&nbsp;&nbsp;Amylase &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 400</option><option value=60>&nbsp;&nbsp;HDL Cholesterol &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 130</option><option value=61>&nbsp;&nbsp;Prostate Specific Antigen PSA &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 800</option><option value=62>&nbsp;&nbsp;CA 125* &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 1000</option><option value=63>&nbsp;&nbsp;ACCP* &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 1200</option><option value=64>&nbsp;&nbsp;Vitamin D3 &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 1500</option><option value=65>&nbsp;&nbsp;Vitamin B12 &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 700</option><option value=66>&nbsp;&nbsp;HLA-B27* &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 1800</option><option value=67>&nbsp;&nbsp;Fibrinogen &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 500</option><option value=68>&nbsp;&nbsp;CPK &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 400</option><option value=70>&nbsp;&nbsp;Magnesium &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 350</option><option value=71>&nbsp;&nbsp;Phosphorous &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 350</option><option value=72>&nbsp;&nbsp;Culture & Sensitivity &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 500</option><option value=73>&nbsp;&nbsp;Gram Staining &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 150</option><option value=74>&nbsp;&nbsp;AFB Staining &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 150</option><option value=75>&nbsp;&nbsp;Diphtheria Staining* &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 350</option><option value=77>&nbsp;&nbsp;Urine Routine &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 100</option><option value=78>&nbsp;&nbsp;Stool Routine & Occult Blood &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 200</option><option value=79>&nbsp;&nbsp;Semen Analysis &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 200</option><option value=80>&nbsp;&nbsp;Pregnancy Test &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 120</option><option value=81>&nbsp;&nbsp;Pregnancy Test Elisa &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 200</option><option value=82>&nbsp;&nbsp;Fluid Analysis &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 500</option><option value=83>&nbsp;&nbsp;Triple Test* &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 2500</option><option value=84>&nbsp;&nbsp;CPK MB &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 450</option><option value=85>&nbsp;&nbsp;D.N.A* &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 600</option><option value=86>&nbsp;&nbsp;ANA* &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 1200</option><option value=87>&nbsp;&nbsp;Apolipoprotein - A1 (APO-A1)* &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 600</option><option value=88>&nbsp;&nbsp;Renal Calculus Analysis &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 300</option><option value=89>&nbsp;&nbsp;ANCA* &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 1200</option><option value=90>&nbsp;&nbsp;Torchi - 5 PARA* &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 1800</option><option value=91>&nbsp;&nbsp;Torchi - 8 PARA* &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 2000</option><option value=110>&nbsp;&nbsp;LDL HDL Ratio &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 250</option><option value=111>&nbsp;&nbsp;LDL Cholesterol - Direct &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 130</option><option value=113>&nbsp;&nbsp;VLDL Cholesterol &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 130</option><option value=114>&nbsp;&nbsp;TC HDL Cholesterol Ratio &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 450</option><option value=115>&nbsp;&nbsp;Bilirubin - Total &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 200</option><option value=116>&nbsp;&nbsp;Bilirubin - Direct &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 200</option><option value=117>&nbsp;&nbsp;Globulin &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 200</option><option value=118>&nbsp;&nbsp;Albumin &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 200</option><option value=119>&nbsp;&nbsp;BUN / SR.Creatinine Ratio &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 260</option><option value=120>&nbsp;&nbsp;Free Total Thyroxine (FT4)* &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 200</option><option value=122>&nbsp;&nbsp;Iron &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 400</option><option value=123>&nbsp;&nbsp;Total Iron Binding Capacity (TIBC)  &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 600</option><option value=124>&nbsp;&nbsp;% Transferrin Saturation &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 600</option><option value=126>&nbsp;&nbsp;Homocysteine &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 1200</option><option value=127>&nbsp;&nbsp;Lipoprotein (Lpa)* &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 600</option><option value=128>&nbsp;&nbsp;Apolopoprotein - B (APO-B)* &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 600</option><option value=129>&nbsp;&nbsp;APO B / APO A1 Ratio (Apo B/A1)* &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 600</option><option value=130>&nbsp;&nbsp;Anti Hepatitis B Envelope Antigen (AHBe) -Total* &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 500</option><option value=131>&nbsp;&nbsp;Hepatitis B Envelope Antigen (HBeAg) * &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 500</option><option value=132>&nbsp;&nbsp;Anti Hepatitis B Core Antigen (AHBc) - IgM * &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 600</option><option value=133>&nbsp;&nbsp;Anti Hepatitis B Core Antigen (AHBc) - TOTAL* &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 600</option><option value=134>&nbsp;&nbsp;Anti Hepatitis B Surface Antigen (AHBs) - TOTAL* &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 600</option><option value=137>&nbsp;&nbsp; Red Cell Distribution Width (RDW-CV)  &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 200</option><option value=139>&nbsp;&nbsp;Red Cell Distribution Width -SD(RDW-SD)  &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 200</option><option value=140>&nbsp;&nbsp; Platelet To Large Cell % (PLC)  &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 200</option><option value=141>&nbsp;&nbsp;Mean Corp.Hemo.Conc (MCHC)  &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 200</option><option value=142>&nbsp;&nbsp;Mean Corpuscular Hemoglobin (MCH) &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 200</option><option value=143>&nbsp;&nbsp;Mean Platelet Volume (MPV) &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 200</option><option value=144>&nbsp;&nbsp;Monocytes &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 200</option><option value=145>&nbsp;&nbsp;Nucleated Red Blood Cells &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 200</option><option value=146>&nbsp;&nbsp;Nuetrophils &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 200</option><option value=147>&nbsp;&nbsp;Plateletcrit (PCT) &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 200</option><option value=148>&nbsp;&nbsp;Hematocrit (PCV)  &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 200</option><option value=149>&nbsp;&nbsp;Platelet Distribution Width (PDW)  &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 200</option><option value=150>&nbsp;&nbsp;Hemoglobin (HB) &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 100</option><option value=151>&nbsp;&nbsp;Eosinophils &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 100</option><option value=152>&nbsp;&nbsp;Basophils &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 200</option><option value=153>&nbsp;&nbsp;Lymphocyte % &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 200</option><option value=154>&nbsp;&nbsp;Total Leucocytes Count &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 200</option><option value=155>&nbsp;&nbsp;Pheripheral Blood Symere (PBS) &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 200</option><option value=156>&nbsp;&nbsp;Absolute Eosinophil Count &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 100</option><option value=157>&nbsp;&nbsp;Mean Corpuscular Volume (MCV)  &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 200</option><option value=158>&nbsp;&nbsp;Neutrophils &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 200</option><option value=159>&nbsp;&nbsp;Blood Sugar F+PP (BSL) &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 150</option><option value=161>&nbsp;&nbsp;Blood Culture & Sensitivity &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 1000</option><option value=162>&nbsp;&nbsp;Fluid Culture & Sensitivity &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 1000</option><option value=163>&nbsp;&nbsp;Urine Culture & Sensitivity &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 500</option><option value=164>&nbsp;&nbsp;Chikungunya IgM &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 600</option><option value=165>&nbsp;&nbsp;Albumin/Creatinine Ratio (Urine) &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 0</option><option value=166>&nbsp;&nbsp;APO Lipoproteins A1 & B &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 0</option><option value=168>&nbsp;&nbsp;Blood Sugar Fasting &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 0</option><option value=169>&nbsp;&nbsp;Blood Sugar Post Prandial (PP) &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 0</option><option value=170>&nbsp;&nbsp;Chloride &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 0</option><option value=171>&nbsp;&nbsp;Creatinine Clearance Test &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 0</option><option value=172>&nbsp;&nbsp;GFR- Glomelular Filtration Rate &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 0</option><option value=173>&nbsp;&nbsp;GGTP &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 0</option><option value=174>&nbsp;&nbsp;Glucose Tolerance Test (GTT) &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 0</option><option value=175>&nbsp;&nbsp;Insulin Resistance Test &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 0</option><option value=176>&nbsp;&nbsp;Insulin-Glucose Ratio &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 0</option><option value=177>&nbsp;&nbsp;Iron Studies &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 0</option><option value=178>&nbsp;&nbsp;Lipase &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 0</option><option value=179>&nbsp;&nbsp;Microalbumin / Creatinine Ratio &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 0</option><option value=180>&nbsp;&nbsp;Microalbumin &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 0</option><option value=181>&nbsp;&nbsp;Potassium &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 0</option><option value=182>&nbsp;&nbsp;Sodium &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 0</option><option value=183>&nbsp;&nbsp;Sodium and Potassium &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 0</option><option value=184>&nbsp;&nbsp;UIBC &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 0</option><option value=185>&nbsp;&nbsp;Urea &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 0</option><option value=186>&nbsp;&nbsp;Urine Sugar (Fasting) &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 0</option><option value=187>&nbsp;&nbsp;Urine Sugar (PP) &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 0</option><option value=188>&nbsp;&nbsp;USF & USPP &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 0</option><option value=189>&nbsp;&nbsp;AFP (Alpha Feto Protein) &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 0</option><option value=190>&nbsp;&nbsp;Anti Thyroglobulin Antibody (Tg) &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 0</option><option value=191>&nbsp;&nbsp;Anti Thyroid Antibodies (ATAB) &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 0</option><option value=192>&nbsp;&nbsp;Beta HCG &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 0</option><option value=193>&nbsp;&nbsp;C-Peptide (15 mins) &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 0</option><option value=194>&nbsp;&nbsp;C-Peptide (5 mins) &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 0</option><option value=195>&nbsp;&nbsp;C-Peptide (FASTING) &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 0</option><option value=196>&nbsp;&nbsp;C-Peptide (PP) &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 0</option><option value=197>&nbsp;&nbsp;CA 15.3 &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 0</option><option value=198>&nbsp;&nbsp;CA 19.9 &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 0</option><option value=199>&nbsp;&nbsp;CCP-Ab To Cyclic Citrulinated Peptide &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 0</option><option value=200>&nbsp;&nbsp;CEA &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 0</option><option value=201>&nbsp;&nbsp;Cortisol Once &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 0</option><option value=202>&nbsp;&nbsp;Cortisol Twice &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 0</option><option value=203>&nbsp;&nbsp;D H E A S &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 0</option><option value=204>&nbsp;&nbsp;E2(Oestradiol) &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 0</option><option value=205>&nbsp;&nbsp;E3(Oestroil) &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 0</option><option value=206>&nbsp;&nbsp;Ferritin &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 0</option><option value=207>&nbsp;&nbsp;Folic Acid &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 0</option><option value=208>&nbsp;&nbsp;Free Beta HCG &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 0</option><option value=209>&nbsp;&nbsp;Free Prostate Specific Antigen &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 0</option><option value=210>&nbsp;&nbsp;Free T3 + Free T4 &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 0</option><option value=211>&nbsp;&nbsp;FSH-LH-Prolactin-Testosterone &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 0</option><option value=212>&nbsp;&nbsp;FSH/LH/Prolactin &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 0</option><option value=213>&nbsp;&nbsp;HCV Antibodies &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 0</option><option value=214>&nbsp;&nbsp;HIV I/II Antibodies &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 0</option><option value=215>&nbsp;&nbsp;Homocystiene (Urine) &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 0</option><option value=216>&nbsp;&nbsp;Insulin (90 mins) &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 0</option><option value=217>&nbsp;&nbsp;Insulin 3 Hr &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 0</option><option value=218>&nbsp;&nbsp;Insulin 30 Mins &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 0</option><option value=219>&nbsp;&nbsp;Insulin Post Glucose &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 0</option><option value=220>&nbsp;&nbsp;Insulin Test (1 hr) &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 0</option><option value=221>&nbsp;&nbsp;Insulin Test (Fasting) &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 0</option><option value=222>&nbsp;&nbsp;Insulin Test(PP) &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 0</option><option value=223>&nbsp;&nbsp;Microsomal Antibody (Anti TPO) &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 0</option><option value=224>&nbsp;&nbsp;Parathyroid Hormone &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 0</option><option value=225>&nbsp;&nbsp;PROGESTERONE &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 0</option><option value=226>&nbsp;&nbsp;Prostate Specific Antigen &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 0</option><option value=227>&nbsp;&nbsp;Serum Cortisol &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 0</option><option value=228>&nbsp;&nbsp;Serum Insulin &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 0</option><option value=229>&nbsp;&nbsp;Serum Total IgE &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 0</option><option value=230>&nbsp;&nbsp;T3+T4 &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 0</option><option value=231>&nbsp;&nbsp;Testosterone &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 0</option><option value=232>&nbsp;&nbsp;TPO Antibody (Thyroid Peroxidase) &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 0</option><option value=233>&nbsp;&nbsp;Protein Electrophoresis &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 0</option><option value=234>&nbsp;&nbsp;Rubella IgG Antibody &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 0</option><option value=235>&nbsp;&nbsp;Rubella IgM Antibody &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 0</option><option value=236>&nbsp;&nbsp;ANA Blot Test &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 0</option><option value=237>&nbsp;&nbsp;Anti HCV &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 0</option><option value=238>&nbsp;&nbsp;Anti HCV by spot &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 0</option><option value=239>&nbsp;&nbsp;Anti Mullerial Inhibiting Substance(AMH) &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 0</option><option value=241>&nbsp;&nbsp;Di HydroTestosterone &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 0</option><option value=244>&nbsp;&nbsp;Herpes Simplex (1 & 2) IgG &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 0</option><option value=245>&nbsp;&nbsp;Herpes Simplex (1 & 2) IgM &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 0</option><option value=246>&nbsp;&nbsp;HIV I & II (Spot Test) &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 0</option><option value=247>&nbsp;&nbsp;HIV I/II Antibodies by spot &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 0</option><option value=248>&nbsp;&nbsp;TB-Gold-Interferon Gamma &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 0</option><option value=249>&nbsp;&nbsp;Bleeding Time &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 0</option><option value=250>&nbsp;&nbsp;Bleeding Time & Clotting Time &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 0</option><option value=251>&nbsp;&nbsp;G6PD &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 0</option><option value=252>&nbsp;&nbsp;Malarial Parasite (Spot Method) &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 0</option><option value=253>&nbsp;&nbsp;Malarial Parasites (Slide Method) &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 0</option><option value=254>&nbsp;&nbsp;Peripheral Smear Examination &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 0</option><option value=255>&nbsp;&nbsp;Retic Count &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 0</option><option value=256>&nbsp;&nbsp;Routine Smear Examination &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 0</option><option value=257>&nbsp;&nbsp;Urine Culture and Antibiotic &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 0</option><option value=258>&nbsp;&nbsp;Activated Thromboplastine Time (APTT) &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 0</option><option value=260>&nbsp;&nbsp;Allergen Cheese Cheddar &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 0</option><option value=263>&nbsp;&nbsp;Allergen Egg White &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 0</option><option value=264>&nbsp;&nbsp;Allergen Fish &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 0</option><option value=265>&nbsp;&nbsp;Allergen Housedust &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 0</option><option value=266>&nbsp;&nbsp;Allergen Milk &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 0</option><option value=267>&nbsp;&nbsp;Allergen Soyabean &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 0</option><option value=268>&nbsp;&nbsp;Allergen Tomato &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 0</option><option value=269>&nbsp;&nbsp;Allergen Wheat &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 0</option><option value=270>&nbsp;&nbsp;Allergen Yeast &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 0</option><option value=271>&nbsp;&nbsp;Allergy Comprehensive Panel(Maxi) &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 0</option><option value=272>&nbsp;&nbsp;Allergy Comprehensive Panel(Mini) &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 0</option><option value=273>&nbsp;&nbsp;Allergy Drug Panel &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 0</option><option value=274>&nbsp;&nbsp;Allergy Eczema Panel(Maxi) &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 0</option><option value=275>&nbsp;&nbsp;Allergy Eczema Panel(Mini) &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 0</option><option value=276>&nbsp;&nbsp;Allergy Non-Veg Panel(Maxi) &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 0</option><option value=277>&nbsp;&nbsp;Allergy Non-Veg Panel(Mini) &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 0</option><option value=278>&nbsp;&nbsp;Allergy Paediatric Panel &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 0</option><option value=279>&nbsp;&nbsp;Allergy Rhinitis Panel(Maxi) &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 0</option><option value=280>&nbsp;&nbsp;Allergy Rhinitis Panel(Mini) &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 0</option><option value=281>&nbsp;&nbsp;Allergy Screening Test(Phadiatop) &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 0</option><option value=282>&nbsp;&nbsp;Allergy Veg. Panel(Maxi) &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 0</option><option value=283>&nbsp;&nbsp;Allergy Veg. Panel(Mini) &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 0</option><option value=284>&nbsp;&nbsp;Dengue IgG &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 0</option><option value=285>&nbsp;&nbsp;Dengue IgG(Spot) &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 0</option><option value=286>&nbsp;&nbsp;Dengue IgM &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 0</option><option value=287>&nbsp;&nbsp;Dengue IgM(Spot) &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 0</option><option value=288>&nbsp;&nbsp;DENGUE NS1 ANTIGEN (SPOT) &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 0</option><option value=289>&nbsp;&nbsp;Food Allergy Test &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 0</option><option value=290>&nbsp;&nbsp;Food and Inhalants Allergy Test &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 0</option><option value=291>&nbsp;&nbsp;Food Intolerance Test &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 0</option><option value=292>&nbsp;&nbsp;ANA By IF &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 0</option><option value=293>&nbsp;&nbsp;Anaerobic Culutre &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 0</option><option value=294>&nbsp;&nbsp;HBV - DNA Quantification &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 0</option><option value=296>&nbsp;&nbsp;TP HA &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 0</option><option value=297>&nbsp;&nbsp;Blood Alcohol Level &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 0</option><option value=299>&nbsp;&nbsp;Gamma Gt &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 0</option><option value=300>&nbsp;&nbsp;HB Electrophoresis &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 0</option><option value=301>&nbsp;&nbsp;Indirect Coombs Test &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 0</option><option value=302>&nbsp;&nbsp;Reticulocyte Count &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 0</option><option value=303>&nbsp;&nbsp;Cells - Sickle Test &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 0</option><option value=304>&nbsp;&nbsp;Thalassemia Study &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 0</option><option value=305>&nbsp;&nbsp;Urine Micral &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 0</option><option value=306>&nbsp;&nbsp;Sputum Routine &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 0</option><option value=307>&nbsp;&nbsp;Sputum For Afb &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 0</option><option value=309>&nbsp;&nbsp;Hepatitis A Virus IgG/IgM &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 0</option><option value=310>&nbsp;&nbsp;HCV (Hepatitis C Virus) &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 0</option><option value=311>&nbsp;&nbsp;H.Pylori Antibodies &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 0</option><option value=312>&nbsp;&nbsp;TPHA (Syphillis) &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 0</option><option value=321>&nbsp;&nbsp;ANC Prolifae* &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 900</option><option value=322>&nbsp;&nbsp;Urinary Sodium &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 0</option><option value=323>&nbsp;&nbsp;Urinary Uric Acid &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 0</option><option value=324>&nbsp;&nbsp;Urinary Calcium &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 0</option><option value=325>&nbsp;&nbsp;Urinary Calcium/Creatinine Ratio &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 0</option><option value=326>&nbsp;&nbsp;Urinary Chloride &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 0</option><option value=327>&nbsp;&nbsp;Urinary Creatinine &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 0</option><option value=328>&nbsp;&nbsp;Urinary Creatinine Clearance Test (CCT) &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 0</option><option value=329>&nbsp;&nbsp;Urinary Phosphrous &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 0</option><option value=330>&nbsp;&nbsp;Urinary Potassium &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 0</option><option value=331>&nbsp;&nbsp;Urinary Protein/Creatinine Ratio &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 0</option><option value=332>&nbsp;&nbsp;Urinary Protein(Albumin) &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 0</option><option value=333>&nbsp;&nbsp;Sickling Test &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 0</option><option value=334>&nbsp;&nbsp;Bleeding Time, PT, PTT &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 0</option><option value=335>&nbsp;&nbsp;Bleeding Time, PTT &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 0</option><option value=336>&nbsp;&nbsp;NT-Pro BNP &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 0</option><option value=337>&nbsp;&nbsp;Phencyclidine/PCP (Qualitative) &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 0</option><option value=338>&nbsp;&nbsp;Phenobarbitone &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 0</option><option value=339>&nbsp;&nbsp;Phenytoin (Eptoin,Dilantin) &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 0</option><option value=340>&nbsp;&nbsp;Phospholipid IgG &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 0</option><option value=341>&nbsp;&nbsp;Phospholipid IgM &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 0</option><option value=342>&nbsp;&nbsp;Procalcitonin &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 0</option><option value=343>&nbsp;&nbsp;Propoxyphene/PPX (Qualitative) &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 0</option><option value=344>&nbsp;&nbsp;Reducing Substances &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 0</option><option value=345>&nbsp;&nbsp;Reticulocyte Panel Automated &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 0</option><option value=346>&nbsp;&nbsp;Rota Virus &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 0</option><option value=347>&nbsp;&nbsp;Serotonin &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 0</option><option value=348>&nbsp;&nbsp;Sex Hormone Binding Globulin (SHBG) &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 0</option><option value=349>&nbsp;&nbsp;Tacrolimus &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 0</option><option value=350>&nbsp;&nbsp;Torch 4 IgG &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 0</option><option value=351>&nbsp;&nbsp;Torch 4 IgM &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 0</option><option value=352>&nbsp;&nbsp;Torch 10 &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 0</option><option value=353>&nbsp;&nbsp;Toxoplasma IgG &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 0</option><option value=354>&nbsp;&nbsp;Toxoplasma IgM &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 0</option><option value=355>&nbsp;&nbsp;Triple Marker (2nd Trimester Screening) AFP,HCG,uE3 &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 0</option><option value=356>&nbsp;&nbsp;Troponin &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 0</option><option value=357>&nbsp;&nbsp;Valproic Acid (Sodium Valproate) &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 0</option><option value=358>&nbsp;&nbsp;Varicella Zoster IgG &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 0</option><option value=359>&nbsp;&nbsp;Varicella Zoster IgM &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 0</option><option value=360>&nbsp;&nbsp;Y Chromosome Micro Deletion FISH &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 0</option><option value=361>&nbsp;&nbsp;B2 Glycoprotein 1 IgG &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 0</option><option value=362>&nbsp;&nbsp;B2 Glycoprotein 1 IgM &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 0</option><option value=363>&nbsp;&nbsp;Reticulocyte count &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 0</option><option value=364>&nbsp;&nbsp;Pregnancy Associated Plasma Protein (PAPPa) &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 0</option><option value=368>&nbsp;&nbsp;Oral Glucose Challenge Test (OGCT) &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 150</option><option value=369>&nbsp;&nbsp;Electrocardiogram ECG &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 300</option><option value=370>&nbsp;&nbsp;MRI - Shoulder &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 7000</option><option value=371>&nbsp;&nbsp;Stress Test &nbsp;&nbsp;|&nbsp;&nbsp;Fees Rs. 1500</option>                                          <optgroup>    
                                        </select>
            </td>
        </tr>
        <tr>
            <td>Abbreviation</td>
            <td><input type='text' name='test_abvr' id='test_abvr' class='form-control' value=""></td>
        </tr>
        
        <tr>
            <td>Report Delivery Days</td>
            <td><input type='number' name='test_days' id='test_days' class='form-control' value="" required></td>
        </tr>
        <tr>
            <td>Is Package</td>
            <td><input type='checkbox' name='test_is_pkg' id='test_is_pkg' class='form-control' value="Y"></td>
        </tr>
        <tr>
            <td>Is Listed as single test</td>
            <td><input type='checkbox' name='test_single_show' id='test_single_show' class='form-control' value="Y"></td>
        </tr>
        <tr>
            <td>Is Fasting Required</td>
            <td><input type='checkbox' name='test_fast' id='test_fast' class='form-control' value="Y"></td>
        </tr>
        <tr>
            <td>Short Description</td>
            <td><textarea  name='test_short_desc' id='test_short_desc' class='form-control'></textarea></td>
        </tr>
        <tr>
            <td>Long Description</td>
            <td><textarea name='test_long_desc' id='test_long_desc' class='form-control' ></textarea></td>
        </tr>
        <tr>
        <td colspan="2">
            <div id="submituser">
               <button type="button" class="btn btn-primary" name="btn-save" id="submit">
                   <span class="glyphicon glyphicon-plus"></span> Create New Record
               </button>  
               <a href="test.php" class="btn btn-large btn-success"><i class="glyphicon glyphicon-backward"></i> &nbsp; Back to index</a>
            </div>
            <div id="edituser">
                <button type="button" class="btn btn-primary" name="btn-update" id="btn-update">
    			<span class="glyphicon glyphicon-edit"></span>  Update this Record
                </button>
                <a href="test.php" class="btn btn-large btn-success"><i class="glyphicon glyphicon-backward"></i> &nbsp; CANCEL</a>
            </div> 
        
        </td>
            
         
         
        </tr>
 
    </table>
</form>
</div>
<div id="msg" class=""></div>

<div class="" id="div_add">
<a href="javascript:void(0);" class="btn btn-large btn-info" id="add"><i class="glyphicon glyphicon-plus"></i> &nbsp; Add Records</a>
</div>

<div class="clearfix"></div><br />
<!--Main div where content get loaded-->
<div class="" id="loadUser" name="loadUser">

</div>   
</div>
</div> 
<!--Paging div will get content soon-->
<div class="" id="pagination">
    <table class='table table-bordered table-responsive'>
    <tr>
        <td colspan="7" align="center">
            <div class="pagination-wrap">
                <ul class="pagination"><li><a href='javascript:void(0);' data-url='testController.php' data-param='action=pg&page_no=1' style='color:red;' class='js-pageDisplay'>1</a></li><li><a href='javascript:void(0);' data-url='testController.php' data-param='action=pg&page_no=2' class='js-pageDisplay'>2</a></li><li><a href='javascript:void(0);' data-url='testController.php' data-param='action=pg&page_no=3' class='js-pageDisplay'>3</a></li><li><a href='javascript:void(0);' data-url='testController.php' data-param='action=pg&page_no=4' class='js-pageDisplay'>4</a></li><li><a href='javascript:void(0);' data-url='testController.php' data-param='action=pg&page_no=5' class='js-pageDisplay'>5</a></li><li><a href='javascript:void(0);' data-url='testController.php' data-param='action=pg&page_no=6' class='js-pageDisplay'>6</a></li><li><a href='javascript:void(0);' data-url='testController.php' data-param='action=pg&page_no=7' class='js-pageDisplay'>7</a></li><li><a href='javascript:void(0);' data-url='testController.php' data-param='action=pg&page_no=8' class='js-pageDisplay'>8</a></li><li><a href='javascript:void(0);' data-url='testController.php' data-param='action=pg&page_no=9' class='js-pageDisplay'>9</a></li><li><a href='javascript:void(0);' data-url='testController.php' data-param='action=pg&page_no=2' class='js-pageDisplay'>Next</a></li><li><a href='javascript:void(0);' data-url='testController.php' data-param='action=pg&page_no=9' class='js-pageDisplay'>Last</a></li></ul>            </div>
        </td>
    </tr>
    </table>    
</div>

   
 
<!--Add user ends here-->
<div class="container">
	<div class="alert alert-info">
	</div>
</div>


<script src="bootstrap/js/jquery-1.11.2.min.js"></script>
<script src="bootstrap/js/bootstrap.min.js"></script>

</body>
</html>
<link href="css/external/select2/select2.min.css" rel="stylesheet" >
    <script src="js/external/select2/select2.min.js"></script>
<script>
    $(document).ready(function(){
        $( "#test_pkg" ).select2( {
                placeholder: "Please select your test/s"
          });
       var page_no = 1; 
     $("#addUser").hide();
     $("#div_add").show();
     
       $.ajax({
                type:"POST",
                url:'testController.php',
                data:"action=pg",//only input
                success: function(response){
                    $("#loadUser").html(response); 
                }
            });
     
     
    /*************************
     * To add new user
     */
    $("#add").click( function() {
        $("#loadUser").hide(); $("#pagination").hide();
        $("#addUser").show();
        $("#div_add").hide();
        $("#edituser").hide();
        $('#form_add_user').trigger("reset");
        $("#edituser").hide();
    }); 
    /***************************
     * Submit new user data
     */      
    $("#submit").on( "click", function(){
        var form=$("#form_add_user");
        $.ajax({
                type:"POST",
                url:form.attr("action"),
                data:form.serialize()+"&action=add",//only input
                success: function(response){
                    if( response == 1 ){
                        $('#msg').html('<div class="alert alert-info"><strong>WOW!</strong> Record was inserted successfully <a href="test.php">HOME</a>!</div>');
                    } else {
                        $('#msg').html('<div class="alert alert-danger">'+response+'</div>');
                    }
                }
            });
        });
    
    
    /********
    * For updation of user to load current user content into form
     */
     $(document).on("click", ".js-edituser", function(){
         var $this = $(this);
         page_no = $this.data('page_no');
        
       $.ajax({
                type:"POST",
                url:'testController.php',
                data:$this.data('value'),//only input
                success: function(response){
                    var obj = $.parseJSON( response );
                    $("#id").val(obj.id);
                    $("#test_name").val(obj.test_name);
                    $("#test_cat_id").val(obj.test_cat_id);
                    $("#test_charge").val(obj.test_charge);
                    $("#test_days").val(obj.delivery_days);
                    $("#test_short_desc").val(obj.short_desc);
                    $("#test_long_desc").val(obj.long_desc);
                    $("#test_abvr").val(obj.test_abvr);
                    if( 'Y' == obj.is_package )
                    $("#test_is_pkg").prop("checked", true);
                    if( 'Y' == obj.is_fast_required )
                    $("#test_fast").prop("checked", true);
                    if( 'Y' == obj.test_single_show )
                    $("#test_single_show").prop("checked", true);
                    $("#addUser").show();
                    $("#submituser").hide();
                    $("#edituser").show();
                    $("#loadUser").hide(); $("#pagination").hide();
                    $("#add").hide();
                    $("#test_pkg").select2("val", 2); //set the value
                    /***************************
                    * Set preselected tests by user 
                    */      
                        var selectedValues = new Array();
                       $.ajax({
                               type:"POST",
                               url:"testController.php?action=loadTest&id="+obj.id,
                               success: function(response){
                                    var obj = $.parseJSON( response );
                                    var i = 0;
                                    $.each( obj, function( key, value ) {
                                            selectedValues[i] = value.child_test_id;
                                            i++;
                                    });
                                    $("#test_pkg").select2("val", selectedValues);
                               }
                           });
                }
                });
        
    });
    
    /******
    * Actual updation of content starts here
     */
    $("#btn-update").on("click", function(){
            var form=$("#form_add_user");
            $.ajax({
                    type:"POST",
                    url:form.attr("action"),
                    data:form.serialize()+"&action=upd",//only input
                    success: function(response){
                        if( response == 1 ){
                            $('#msg').html('<div class="alert alert-info"><strong>WOW!</strong> Record was updated successfully <a href="test.php?page_no='+ page_no +'">HOME</a>!</div>');
                            $('#msg').show();
                        } else {
                            $('#msg').html("<div class='alert alert-warning'><strong>SORRY!</strong> ERROR while updating record !</div>");
                            $('#msg').show();

                        }
                    }
            });
        });
    /******
    * updateis done here
     */
     
     /******
    * deletion is start from here 
     */ 
     $(document).on("click",".js-deleteuser", function(){
            $("#add").hide();
            $("#pagination").hide();
            $('#msg').html('<div class="alert alert-danger"><strong>Sure !</strong> to remove the following record ? </div>');
            var $this = $(this);
            page_no = $this.data('page_no');
                $.ajax({
                         type:"POST",
                         url:'testController.php',
                         data:$this.data('value'),//only input
                         success: function(response){
                             $("#loadUser").html(response);                  
                            }
                });

    });
    
    $(".js-pageDisplay").on("click",function(){
        $('.js-pageDisplay').removeClass("redColor");
        $(this).addClass("redColor");
        var $this = $(this);
         $.ajax({
                type:"POST",
                url:$this.data('url'),
                data:$this.data('param'),//only input
                success: function(response){
                   $("#loadUser").html(response);                  
                }
            });
    });
    
    
 });
</script>
    

</div>
    <!-- /#wrapper -->
<div class="classFooterWrapper">
<div class="container">
 <footer>





	  <!-- Modal Strts-->
	<div id="call_back_modal" class="modal fade" data-backdrop="static">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
<h4 class="modal-title classMIHeaderWrapper classMBg classWColor" >Please provide us with the below details to reach our convenience team</h4>
				</div>

	          <div class="modal-body" id="file_upload_form">
	                <div id="upload_error"></div>
	                <form id="upload_form" class="classMIBodyWrapper" action="adminController.php">
	                        <div class="form-group">
							<label for="call_back_name" class="classGColor">Name</label>
							<div  class="input-group"> <div class="input-group-addon"><i class="fa fa-user"></i></div><input type="text" class="form-control" id="call_back_name" name="name" placeholder="Name"></div>
							</div>
							<div class="form-group">
							<label for="call_back_number" class="classGColor">Contact No.</label>
							<div  class="input-group"> <div class="input-group-addon">+91</div><input type="text" name="number" class="form-control numeric" id="call_back_number" placeholder="Contact No"></div>
							</div>
                                                        <div class="form-group">
							<label for="call_back_email" class="classGColor">Email.</label>
							<div  class="input-group"> <div class="input-group-addon"><i class="fa fa-envelope"></i></div><input type="text" name="email" id="call_back_email" class="form-control" placeholder="Email" required></div>
							</div>    
						<button type="button" id="request_form" class="btn btn-primary">Submit</button>
	                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
	                </form>

	            </div>
	        </div>
	    </div>
	</div>	
                        <!--Modal ends here-->
    <div class="row">
    	<div class="col-sm-12 col-lg-5 col-md-5">
			<div class="fb-page" data-href="https://www.facebook.com/pages/Health-Please/1614865218755696" data-width="400" data-height="100" data-small-header="false" data-adapt-container-width="true" data-hide-cover="false" data-show-facepile="true" data-show-posts="true"><div class="fb-xfbml-parse-ignore"><blockquote cite="https://www.facebook.com/pages/Health-Please/1614865218755696"><a href="https://www.facebook.com/pages/Health-Please/1614865218755696">Health Please</a></blockquote></div></div>	
	    </div>
		
        <div class="col-sm-12 col-lg-7 col-md-7 classFooterContactWrapper">
            <h3>Contact:</h3>
                  <p>
            	We wish you a happy time here at Health Please! <br/>
				You can <a id="callback" name="callback" href="javascript:void(0);" style="color:#46b8da;"><strong>Request a call back</strong></a> or call us on <a href="tel:7620012092" style="color:#46b8da;">+91 7620012092</a> if you wish to talk to us.<br/>
				You can also write to us at <a style="color:#46b8da;" href="Mailto:help@healthplease.in">help@healthplease.in</a> <br/>
				We will be glad to help you.<br/>
<!-- We wish you a happy time here at Health Please! <br/>In case you need help feel free to write to us at <a href="mailto:help@healthplease.in" target="_blank" style="color:#46b8da;text-decoration:none;"><strong>help@healthplease.in</strong></a> or
<a id="callback" name="callback" href="javascript:void(0);" style="color:#46b8da;"><strong>Request a call back.</strong></a> <br/>We will be glad to help you. -->
</p>
		</div>
		<div class="col-sm-12 col-lg-12 col-md-12 text-right classFooterSMIcon" style="margin-top: -35px;">
        	<span>Follow Us</span>&nbsp;:&nbsp;&nbsp;
			<a href="https://twitter.com/HealthPleaseOff" id="gh" target="_blank" title="Twitter">
				<span class="fa-stack fa-lg">
				  <i class="fa fa-twitter fa-stack-1x classMColor"></i>
				</span>
			</a>&nbsp;&nbsp;
			<a href="https://www.facebook.com/pages/Health-Please/1614865218755696" id="gh" target="_blank" title="Facebook">
				<span class="fa-stack fa-lg">
				  <i class="fa fa-facebook fa-stack-1x  classMColor"></i>
				</span>
			</a>
			
		</div>
	</div>

<div class="row">
		<div class="col-md-12 col-lg-12 col-sm-12">
			<ul class="nav navbar-left">
                <li class="dropdown">
                    <a class="dropdown-toggle"  href="http://www.healthplease.in">
                        <i class="fa fa-home fa-fw"></i> Home
                    </a>                    <!-- /.dropdown-messages -->
                </li>
                <li class="dropdown">
                    <a class="dropdown-toggle"  href="about.php">
                        <i class="fa fa-life-ring fa-fw"></i> About Us
                    </a>                    <!-- /.dropdown-messages -->
                </li>
                <li class="dropdown">
                    <a class="dropdown-toggle"  href="support.php">
                        <i class="fa fa-cogs fa-fw"></i> Support
                    </a>                    <!-- /.dropdown-messages -->
                </li>
                <li class="dropdown">
                    <a class="dropdown-toggle"  href="pricing.php">
                       <i class="fa fa-road fa-inr"></i> Pricing
                    </a>                    <!-- /.dropdown-messages -->
                </li> 
                <li class="dropdown">
                    <a class="dropdown-toggle"  href="faqs.php">
                       <i class="fa fa-question fa-fw"></i> FAQs
                    </a>                    <!-- /.dropdown-messages -->
                </li> 
            </ul>

		</div>
	</div>

  </footer>    
</div>
</div> 

<div class="classPowerBy">
	<div class="container">
		<div class="row">
	    	<div class="col-sm-12 col-lg-6 col-md-6">
			<a href="privacy-policy.php">Privacy Policy</a>&nbsp;|&nbsp;
			<a href="terms-and-conditions.php">Terms and Conditions</a>&nbsp;|&nbsp;
			<a href="disclaimer.php">Disclaimer</a>&nbsp;
	    	</div>
	    	<div class="col-sm-12 col-lg-6 col-md-6 text-right">
	    		Proudly Powered by <a href="http://www.healthplease.in" target="_blank">HealthPlease.in</a>
	    	</div>
	    </div>
	</div>
</div>



<div id="fb-root"></div>
<script>(function(d, s, id) {
  var js, fjs = d.getElementsByTagName(s)[0];
  if (d.getElementById(id)) return;
  js = d.createElement(s); js.id = id;
  js.src = "//connect.facebook.net/en_US/sdk.js#xfbml=1&version=v2.4&appId=1570780249867940";
  fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));

$('#callback').on("click", function(){
$('#upload_error').hide();
	$("#call_back_modal").modal('show');
});
$('.numeric').keyup( function () {
                                        if (this.value != this.value.replace(/[^0-9\.]/g, '')) {
                                           this.value = this.value.replace(/[^0-9\.]/g, '');
                                        }
                                    });

$('#request_form').on("click", function(){
	
	if( false == $('#upload_form').valid() ) return;
        $("#request_form").html("<img src='images/loader.gif'  width='15px'/>&nbspSending...");
	$.ajax({
			type: "POST",
			url : "adminController.php?action=contact",
			data: $('#upload_form').serializeArray(),//only input
			success: function(response){
				var obj = $.parseJSON( response );
                    if ( 1 == obj.status ){
					    $('#upload_form').trigger("reset");
                                            $("#request_form").html("Submit");
					    $('#upload_error').show();
                        $('#upload_error').html('<div class="alert alert-success"><a href="#" class="close" data-dismiss="alert">&times;</a>' + obj.msg + '</div>');
						setTimeout(function(){
						  $("#call_back_modal").modal('hide')
						}, 5000);
                    } else {
						$('#upload_error').show();
                                                $("#request_form").html("Submit");
                        $('#upload_error').html('<div class="alert alert-danger"><a href="#" class="close" data-dismiss="alert">&times;</a>' + obj.msg + '</div>');
                    }

			}
		});
  });
</script>




    <!--  updated by vikas 31-may-2015-->
    <script src="js/external/jquery.cookie.js"></script>
    <script src="js/external/jquery_validation/jquery.validate.min.js"></script>
    <script src="js/internal/js-form-validation.js"></script>
    <script src="js/internal/js_combine.js?ver=125"62></script>
    <script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
    <script src="js/internal/jquery.inputlimiter.1.3.1.js"></script>
       

<!-- Login form modal code start --> 
<div class="modal fade " id="idLoginModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="false" backdrop='true' data-keyboard="false">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title text-center" id="exampleModalLabel">Login</h4>
        <div id="" class="msg"></div>
      </div>
      <div class="modal-body">
           <div id="msg_login" class="msg"></div>
        <form method='post' id="form_login" action="userController.php">
     
        <table class='table table-bordered'>
     
            <tr>
                <td>Email</td>
                <td><input type='text' name='username' id='username' class='form-control' value=""required ></td>
            </tr>
            <tr><td colspan="2" id="idUsernameErr"></td></tr>
     
            <tr>
                <td>Password</td>
                <td><input type='password' name='password' id='password' class='form-control' value="" required></td>
            </tr>
            <tr><td colspan="2" id="idPasswordErr"></td></tr>
     
         
            <tr>
            <input type='hidden' name='token'  class='form-control' value="d75a1cd7ca61b7f50e3666287aa38d46" ></td>
            <td colspan="2">
                <div id="submituser">
                   <button type="submit" class="btn btn-primary" name="btn-save" id="idLoginSubmit">
                       <span class="glyphicon glyphicon-plus"></span> Login
                   </button>  
                   <a href="sign-up.php" id="" class="signupid btn btn-large btn-success">Register Me &nbsp;<i class="glyphicon glyphicon-forword"></i> </a>
                </div>
                      
            </td>
                
             
             
            </tr>
     
        </table>
    </form>
      </div>
      <div class="modal-footer">
        <div class="form-group">
          <div class="col-md-12 control"> 
                  Forgot password?
                  <a class="btn btn-info btn-xs forgetPasswordid" id="" href="#idForgetPasswordModal">
                  Click Here
              </a>
             
          </div>
      </div>    
      </div>
    </div>
  </div>
</div>
<!-- Login modal form code end-->

<!-- Forget form modal code start -->
<div class="modal fade " id="idForgetPasswordModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="false">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title text-center" id="exampleModalLabel">Forgot Password</h4>
        <div id="" class="msg"></div>
      </div>
      <div class="modal-body">
        <form method='post' id="form_fgt_user_pwd" action="userController.php">
      <div id="msg_pwd"></div> 
        <table class='table table-bordered'>
     
            <tr>
                <td>Email</td>
                <td><input type='text' name='email' id='recover_email' class='form-control' value=""required ></td>
            </tr>
     
            <tr>
            <input type='hidden' name='token'  class='form-control' value="d3daafe5b1f901ea3b13dee58c0b8549" ></td>
              <td colspan="2">
                  <div id="submituser">
                     <button type="button" class="btn btn-primary" name="btn-save" id="btn_fgt_pwd">
                         <span class="glyphicon glyphicon-plus"></span> Send
                     </button>  
                     <a href="#" id="id" class="btn btn-large btn-danger" data-dismiss="modal">Cancel</i> </a>
                  </div>
                        
              </td>
            </tr>
     
        </table>
    </form>
      </div>
      <div class="modal-footer">
        <div class="form-group">
          <div class="col-md-12 control"> 
                  New User Registration 
              <a class="btn btn-info btn-xs signupid" id="" href="sign-up.php">
              <!-- <a class="btn btn-info btn-xs" id="loginid" href="#idLoginModal" data-toggle="modal" data-keyboard="false" data-target="#idLoginModal"> -->
                  Click Here
              </a>
             
          </div>
      </div>    
      </div>
    </div>
  </div>
</div>
<!-- Forget modal form code end-->
<!-- Share This Button Code Start -->
<!--<script>var sharebutton_is_horizontal = true; document.write('<script src="//cdn.script.to/share.js"></scr' + 'ipt>'); document.write("<div style='display: none'>");</script><a href="http://sharebutton.org/">social sharing buttons</a><script>document.write("</div>");</script>-->
<!-- Share This Button Code End -->
</body>

</html>