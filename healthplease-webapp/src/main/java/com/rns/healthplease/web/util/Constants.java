package com.rns.healthplease.web.util;

public interface Constants {

	String ROOT_URL = "http://localhost:8080/healthplease-webapp";
	// String ROOT_URL = "http://52.38.220.19:8080/hp/";
	String MERCHANT_KEY = "AdtyF8"; // DEV
	String MERCHANT_SALT = "8bPpsm3Q"; // DEV
	String PAY_U_URL = "https://test.payu.in/_payment";
	String PAY_TM_URL = "https://pguat.paytm.com/oltp-web/processTransaction";
	String PAY_TM_WEBSITE = "Healthpweb";
	String PAY_TM_INDUSTRY_TYPE = "Retail";
	String PAY_TM_MID = "Health30574555479792";
	String PAY_TM_MERCHANT_KEY = "7a30TvYKmyQWIN4#";
	String ADMIN_MAILS = "ajinkyashiva@gmail.com";
	String ADMIN_PHONES = "9423040642";

	// IMPORTANT : Production Environment Credentials below! Handle with care!

	
	/*String ROOT_URL = "http://www.healthplease.in";
	String PAY_U_URL = "https://secure.payu.in/_payment";
	String MERCHANT_KEY = "FRQ4pz";
	String MERCHANT_SALT = "gH3FYsHU";
	String PAY_TM_URL = "https://secure.paytm.in/oltp-web/processTransaction";
	String PAY_TM_WEBSITE = "HealthPleaseweb";
	String PAY_TM_INDUSTRY_TYPE = "Retail120";
	String PAY_TM_MID = "Health49217529407325";
	String PAY_TM_MERCHANT_KEY = "oxsdUfWmMhpSwWGR";
	String ADMIN_MAILS = "yash.bharwani@healthplease.in,care@healthplease.in,ajinkyashiva@gmail.com";
	String ADMIN_PHONES = "9890733740,9423040642";*/
	 

	String PRODUCT_INFO = "HealthPlease";
	String ASSETS_ROOT = "/resources"; // DEV
	String RESULT_URL = ROOT_URL + "/paymentResult";
	String ROOT_DOCS_PATH = "F:/Resoneuronance/Health Chekup Labs Project/Uploads/";
	// String ROOT_DOCS_PATH = "/home/ec2-user/docs/";

	char YES = 'Y';
	String DATE_FORMAT = "yyyy-MM-dd";
	String DATE_FORMAT_2 = "dd-MM-yyyy";
	String GENDER_FEMALE = "Female";
	String GENDER_MALE = "Male";
	String RESPONSE_OK = "OK";
	char INACTIVE_DAY = 'N';
	char ACTIVE_DAY = 'Y';
	String PAYTM_TXN_SUCCESS = "TXN_SUCCESS";
	String PAY_U_TX_SUCCESS = "success";
	String HOME_APP = "Home";
	String LAB_APP = "Lab";
	String CORP_PACKAGE = "2";
	String CORP_PARTNER = "3";

	String MODEL_APPOINTMENT = "appointment";
	String MODEL_LOCATIONS = "locations";
	String MODEL_TESTS = "tests";
	String MODEL_RESULT = "result";
	String MODEL_USER = "user";
	String MODEL_APPOINTMENTS = "appointments";
	String MODEL_DATES = "dates";
	String MODEL_HEADER = "appointmentsTitle";
	String MODEL_CALENDAR = "cal";
	String MODEL_SLOTS = "slots";
	String MODEL_LABS = "labs";
	String MODEL_PAY_TM = "payTm";
	String MODEL_PAY_U = "payUDetails";
	String MODEL_ACTIVATION_CODE = "activationCode";
	String MODEL_TEST = "test";
	String MODEL_LAB = "lab";
	String MODEL_LAB_VIEW = "labView";
	String MODEL_CATEGORY = "category";
	String MODEL_CATEGORIES = "categories";
	String MODEL_USERS = "users";
	String MODEL_LOCATION = "location";
	String MODEL_ACTIVE_LIST = "activeList";
	String MODEL_PARAMETER = "parameter";
	String MODEL_REQUEST_FORMS = "requestForms";
	String MODEL_SLOT_TYPE = "slotType";
	
	String EXCEL_VIEW = "excelView";
	String PDF_VIEW = "pdfView";
	String TOTAL_HEADER = "Total Appointments";
	String CANCELLED_HEADER = "Cancelled Appointments";
	String PENDING_HEADER = "Pending Appointments";
	String TODAY_HEADER = "Today's Appointments";
	int[] DOUBLE_TEST_CHARGE = { 42, 159 };

	String ERROR_INVALID_USER_CREDENTIALS = "Invalid user credentials!";
	String ERROR_INVALID_USER = "Invalid User Details!";
	String ERROR_REGISTRATION = "User already Exists!";
	String ERROR_INVALID_APPOINTMENT_DETAILS = "Invalid Appointment Details!";
	String ERROR_FORGOT_PWD_NO_USER = "No user found with given Email.";
	String ERROR_INVALID_TEST_DETAILS = "Test does not exist!";
	String ERROR_NOT_ACTIVE = "Your account is not activated yet!";
	String ERROR_TEST_EXISTS = "Test already exists!";
	

	String BOOK_APPOINTMENT_POST_URL = "bookAppointment";
	String USER_HOME_GET_URL = "userhome.htm";
	String BOOK_APPOINTMENT_PAGE = "confirm_appointment";
	String BOOK_APPOINTMENT_GET_URL = "bookappointment.htm";
	String HOME_GET_URL = ROOT_URL;
	String PRE_REGISTER_POST_URL = "register";
	String REGISTER_USER_GET_URL = "signup.htm";
	String CONFIRM_APPOINTMENT_DETAILS_GET_URL = "confirmappointment.htm";
	String CONFIRM_APPOINTMENT_DETAILS_PAGE = "confirm_appointment_details";
	String CONFIRM_APPOINTMENT_GET_URL = "finalizeappointment.htm";
	String REGISTER_USER_POST_URL = "registerUser";
	String REGISTER_USER_PAGE = "sign-up";
	String USER_PROFILE_PAGE = "userprofile";
	String CANCEL_APPOINTMENT_POST_URL = "cancelAppointment";
	String LOGOUT_GET_URL = "logout.htm";
	String UPDATE_USER_POST_URL = "updateUser";
	String LAB_DASHBOARD_PAGE = "lab_dashboard";
	String LAB_HOME_URL_GET = "labhome.htm";
	String LAB_HOME_CANCELLED_URL_GET = "labcancelled.htm";
	String LAB_HOME_PENDING_APPS_URL_GET = "labpending.htm";
	String LAB_HOME_TOTAL_URL_GET = "labtotal.htm";
	String UPLOAD_REPORT_POST_URL = "uploadreport";
	String BOOK_APPOINTMENT_LAB_POST_URL = "bookappointmentLab";
	String BOOK_APPOINTMENT_LAB_GET_URL = "bookappointmentLab.htm";
	String LAB_BOOK_APPOINTMENT_PAGE = "lab_bookappointment";
	String NEXT_MONTH_GET_URL = "nextmonth.htm";
	String PREVIOUS_MONTH_GET_URL = "previousmonth.htm";
	String BLOCK_DATE_GET_URL = "block.htm";
	String GET_LAB_SLOTS_GET_URL = "getlabslots.htm";
	String LAB_SLOTS_PAGE = "lab_slots";
	String SLOTS_GET_URL = "slots.htm";
	String BLOCK_SLOTS_POST_URL = "blockslots";
	String GET_REPORT_URL_GET = "getReport";
	String BOOK_APPOINTMENT_OTHER_POST = "bookAppointmentOther";
	String REQUEST_CALL_BACK_POST_URL = "requestCallBack";
	String PARTNER_LABS_PAGE = "partner_labs";
	String PARTNER_LABS_GET_URL = "partnerlabs.htm";
	String REQUEST_CHECK_UP_POST_URL = "requestCheckUp";
	String PAYMENT_RESULT_POST_URL = "paymentResult";
	String ACTIVATION_URL_GET = "activateUser";
	String GET_TEST_DETAILS_POST_URL = "getTestDetails";
	String GET_PRICING_POST_URL = "getPricing";
	String PRICING_PAGE = "pricing";
	String PRICING_GET_URL = "pricing.htm";
	String PRIVACY_PAGE = "privacy_policy";
	String PRIVACY_GET_URL = "privacy.htm";
	String SUPPORT_PAGE = "support";
	String SUPPORT_GET_URL = "support.htm";
	String DISCLAIMER_GET_URL = "disclaimer.htm";
	String DISCLAIMER_PAGE = "disclaimer";
	String FAQ_GET_URL = "faq.htm";
	String FAQ_PAGE = "faqs";
	String TERMS_GET_URL = "terms.htm";
	String TERMS_PAGE = "terms";
	String ABOUT_PAGE = "about";
	String ABOUT_US_GET_URL = "aboutus.htm";
	String CHANGE_PASSWORD_URL_POST = "changePassword";
	String CHANGE_PASSWORD_PAGE = "change_password";
	String CHANGE_PASSWORD_URL_GET = "changepassword.htm";
	String GET_APPOINTMENTS_FOR_DATES_POST_URL = "getAppointmentsForDates";
	String DOWNLOAD_EXCEL_GET_URL = "downloadexcel.htm";
	String CANEL_APPOINTMENT_LAB_POST_URL = "canelAppointmentLab";
	String LAB_SETTINGS_GET_URL = "labsettings.htm";
	String LAB_SETTINGS_PAGE = "lab_setting";
	String LAB_DAYS_PAGE = "lab_daysetting";
	String LAB_DAYS_GET_URL = "days.htm";
	String ADMIN_HOME_GET_URL = "adminhome.htm";
	String ADMIN_HOME_PENDING_APPS_URL_GET = "adminpending.htm";
	String ADMIN_DASHBOARD_PAGE = "admin_dash";
	String ADMIN_HOME_CANCELLED_URL_GET = "admincancelled.htm";
	String ADMIN_HOME_TOTAL_URL_GET = "adminTotal.htm";
	String GENERATE_REPORT_POST_URL = "generatereport";
	String LAB_APPOINTMENTS_FOR_DATES_GET_URL = "labbetweendatesappointments.htm";
	String LAB_PREPARE_REPORT_GET_URL = "preparereport.htm";
	String LAB_TEST_PARAMS_PAGE = "lab_test_params";
	String CHANGE_PASSWORD_SETTINGS_URL_POST = "changePasswordSettings";
	String LAB_INVOICE_GET_URL = "generateInvoice.htm";
	String ADMIN_APPOINTMENTS_BETWEEN_GET_URL = "adminAppointmentsBetween.htm";
	String ADMIN_GET_APPOINTMENTS_FOR_DATES_POST_URL = "adminGetAppointmentsForDates";
	String ADMIN_DOWNLOAD_EXCEL_GET_URL = "adminDownloadExcel";
	String ADMIN_UPLOAD_REPORT_POST_URL = "adminUploadReport";
	String ADMIN_CANCEL_APPOINTMENT_POST_URL = "adminCancelAppointment";
	String ADMIN_EDIT_CATEOGORY_POST_URL = "adminEditCateogory";
	String ADMIN_EDIT_CATEOGORY_GET_URL = "adminEditCateogory.htm";
	String ADMIN_CATEGORIES_GET_URL = "adminCategories.htm";
	String ADMIN_CATEGORIES_PAGE = "admin_categories";
	String ADMIN_EDIT_CATEGORY_PAGE = "admin_edit_category";
	String ADMIN_DELETE_CATEGORY_POST_URL = "adminDeleteCategory";
	String ADMIN_EDIT_TEST_POST_URL = "adminEditTest";
	String ADMIN_EDIT_TEST_PAGE = "admin_edit_test";
	String ADMIN_EDIT_TEST_GET_URL = "adminEditTest.htm";
	String ADMIN_TESTS_PAGE = "admin_tests";
	String ADMIN_TESTS_GET_URL = "adminTests.htm";
	String ADMIN_DELETE_TEST_POST_URL = "adminDeleteTest";
	String ADMIN_LABS_PAGE = "admin_lab";
	String ADMIN_LABS_GET_URL = "adminLabs.htm";
	String ADMIN_EDIT_LAB_POST_URL = "adminEditLab";
	String ADMIN_EDIT_LAB_USERS_POST_URL = "adminEditLabUsers";
	String ADMIN_DELETE_LOCATION_POST_URL = "adminDeleteLocation";
	String ADMIN_EDIT_LOCATION_POST_URL = "adminEditLocation";
	String ADMIN_EDIT_LOCATION_PAGE = "admin_edit_location";
	String ADMIN_EDIT_LOCATION_GET_URL = "adminEditLocation.htm";
	String ADMIN_LOCATIONS_PAGE = "admin_location";
	String ADMIN_LOCATIONS_GET_URL = "adminLocations.htm";
	String ADMIN_LAB_DASHBOARD_PAGE = "admin_load_lab";
	String ADMIN_LAB_DASHBOARD_GET_URL = "adminLabDashboards.htm";
	String ADMIN_VIEW_LAB_DASHBOARD_POST_URL = "adminViewLabDashboard";
	String ADMIN_PARAMETERS_PAGE = "admin_parameters";
	String MODEL_PARAMETERS = "parameters";
	String ADMIN_PARAMETERS_GET_URL = "adminParameters.htm";
	String ADMIN_UPLOAD_PARAMETERS_POST_URL = "adminUploadParameters";
	String ADMIN_UPLOAD_TEST_LABS_POST_URL = "adminUploadTestLabs";
	String ADMIN_TEST_PARAMETERS_MAP_GET_URL = "adminTestParametersMapping.htm";
	String ADMIN_MAP_TEST_PARAMS_PAGE = "admin_map_test_params";
	String ADMIN_UPLOAD_TEST_PARAMETER_MAP_POST_URL = "adminUploadTestParameterMappings";
	String ADMIN_MAP_LAB_LOCATIONS_GET_URL = "adminLabLocations.htm";
	String ADMIN_MAP_LAB_LOCATIONS_PAGE = "admin_map_location";
	String ADMIN_EDIT_LAB_LOCATION_MAP_PAGE = "admin_edit_map_location";
	String MODEL_LAB_LOCATION = "labLocation";
	String ADMIN_EDIT_LAB_LOCATION_GET_URL = "adminEditLabLocation.htm";
	String ADMIN_EDIT_LAB_LOCATION_POST_URL = "adminEditLabLocation";
	String ADMIN_DELETE_LAB_LOCATION_POST_URL = "adminDeleteLabLocation";
	String ADMIN_DELETE_LAB_TEST_POST_URL = "adminDeleteLabTest";
	String ADMIN_EDIT_LAB_TEST_POST_URL = "adminEditLabTest";
	String ADMIN_EDIT_LAB_TEST_PAGE = "admin_edit_map_test";
	String ADMIN_LAB_TESTS_PAGE = "admin_map_test";
	String ADMIN_LAB_TESTS_GET_URL = "adminLabTests.htm";
	String ADMIN_EDIT_LAB_TEST_GET_URL = "adminEditLabTest.htm";
	String CORPORATE_REQUEST_POST_URL = "corporateRequest";
	String CORPORATE_PACKAGES_GET_URL = "Corporate";
	String CORPORATE_PACKAGES_PAGE = "corp_pack";
	String GET_TEST_REPORT_GET_URL = "getTestReport";
	String ADMIN_EDIT_PARAMETER_PAGE = "admin_edit_parameter";
	String ADMIN_EDIT_TEST_PARAMETER_GET_URL = "adminEditTestParameter";
	String ADMIN_DELETE_PARAMETER_POST_URL = "adminDeleteParameter";
	String ADMIN_EDIT_PARAMETER_POST_URL = "adminEditParameter";
	String ADMIN_CORPORATE_GET_URL = "adminCorporate.htm";
	String ADMIN_CORPORATE_PAGE = "corp_list";
	String ADMIN_CORPORATE_BOOK_APPOINTMENT_POST_URL = "adminBookAppointment";
	String EDIT_APPOINTMENT_PAGE = "edit_appointment";
	String EDIT_APPOINTMENT_GET_URL = "editAppointment.htm";
	String EDIT_APPOINTMENT_POST_URL = "editAppointment";
	String UPDATE_LAB_REPORT_SETTINGS_POST_URL = "updateLabReportSettings";
	String GET_LAB_SIGNATURE_GET_URL = "getLabSignature.htm";
	String CORP_PARTNER_PAGE = "corp_book";
	String CORPORATE_PARTNER_GET_URL = "corporatePartner.htm";
	String REQUEST_CORPORATE_PARTNER_POST_URL = "requestCorporatePartner";
	String UPLOAD_LOGO_POST_URL = "uploadLogo";
	

	String MAIL_TYPE_ACTIVATION = "activationMail";
	String MAIL_TYPE_REPORT_UPLOAD = "reportUpload";
	String MAIL_TYPE_BOOK_APP_USER = "bookAppointmentUser";
	String MAIL_TYPE_BOOK_APP_LAB = "bookAppointmentLab";
	String MAIL_TYPE_REGISTRATION = "registrationMail";
	String MAIL_TYPE_CANCEL_APP = "cancelAppointment";
	String MAIL_TYPE_CANCEL_APP_LAB = "cancelAppointmentLab";
	String MAIL_TYPE_REQUEST_CHECKUP = "requestCheckup";
	String MAIL_TYPE_REQUEST_CHECKUP_LAB = "requestCheckupLab";
	String MAIL_TYPE_REQUEST_CALLBACK = "requestCallBack";
	String MAIL_TYPE_REQUEST_CALLBACK_LAB = "requestCallBackLab";
	String MAIL_TYPE_FORGOT_PASSWORD = "forgotPassword";
	String MAIL_TYPE_CORPORATE_REQUEST = "coprporateRequest";
	String MAIL_TYPE_CORPORATE_REQUEST_ADMIN = "corporateRequestAdmin";
	String MAIL_TYPE_CORPORATE_PARTNER = "coporatePartner";
	String MAIL_TYPE_CORPORATE_PARTNER_ADMIN = "corporatePartnerAdmin";

	String[] ADMIN_MAIL_TYPES = { MAIL_TYPE_REQUEST_CHECKUP_LAB, MAIL_TYPE_REQUEST_CALLBACK_LAB, MAIL_TYPE_CORPORATE_REQUEST_ADMIN, MAIL_TYPE_CORPORATE_PARTNER_ADMIN };
	String[] LAB_NAME_MAIL_TYPES = { MAIL_TYPE_BOOK_APP_LAB, MAIL_TYPE_CANCEL_APP_LAB };
	String[] OPEN_URLS = {SUPPORT_GET_URL, PRICING_GET_URL, GET_PRICING_POST_URL, PRIVACY_GET_URL, TERMS_GET_URL, 
			ABOUT_US_GET_URL, FAQ_GET_URL, ACTIVATION_URL_GET, PARTNER_LABS_GET_URL, REGISTER_USER_GET_URL, REGISTER_USER_POST_URL, 
			"loginAjax", CORPORATE_PACKAGES_GET_URL, CORPORATE_REQUEST_POST_URL, LOGOUT_GET_URL, "getLabs", "getDates", "getSlots", "forgotPassword",
			REQUEST_CALL_BACK_POST_URL, REQUEST_CHECK_UP_POST_URL, GET_TEST_DETAILS_POST_URL, CORPORATE_PARTNER_GET_URL, REQUEST_CORPORATE_PARTNER_POST_URL};

}
