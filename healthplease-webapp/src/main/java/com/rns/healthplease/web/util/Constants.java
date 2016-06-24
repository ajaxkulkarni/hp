package com.rns.healthplease.web.util;

public interface Constants {

	//String ROOT_URL = "http://localhost:8080/healthplease-webapp";
	String ROOT_URL = "http://52.38.220.19:8080/hp/";
	
	String PRODUCT_INFO = "HealthPlease";
	String MERCHANT_KEY = "AdtyF8"; // DEV
	String MERCHANT_SALT = "8bPpsm3Q"; // DEV
	String ASSETS_ROOT = "/resources"; //DEV
	String PAY_U_URL = "https://test.payu.in/_payment";
	String PAY_TM_URL =  "https://pguat.paytm.com/oltp-web/processTransaction";
	String RESULT_URL = ROOT_URL + "/paymentResult";
	String ROOT_DOCS_PATH = "F:/Resoneuronance/Health Chekup Labs Project/Uploads/";
	//String ROOT_DOCS_PATH = "/home/ec2-user/docs/";
	
	
	char YES = 'Y';
	String DATE_FORMAT = "yyyy-MM-dd";
	String DATE_FORMAT_2 = "dd-MM-yyyy";
	String GENDER_FEMALE = "Female";
	String GENDER_MALE = "Male";
	String RESPONSE_OK = "OK";
	char INACTIVE_DAY = 'N';
	char ACTIVE_DAY = 'Y';
	String PAYTM_TXN_SUCCESS = "TXN_SUCCESS";
	
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
	
	String EXCEL_VIEW = "excelView"; 
	String PDF_VIEW = "pdfView";
	String TOTAL_HEADER = "Total Appointments";
	String CANCELLED_HEADER = "Cancelled Appointments";
	String PENDING_HEADER = "Pending Appointments";
	String TODAY_HEADER = "Today's Appointments";
	
	String ERROR_INVALID_USER_CREDENTIALS = "Invalid user credentials!";
	String ERROR_INVALID_USER = "Invalid User Details!";
	String ERROR_REGISTRATION = "User already Exists!";
	String ERROR_INVALID_APPOINTMENT_DETAILS = "Invalid Appointment Details!";
	String ERROR_FORGOT_PWD_NO_USER = "No user found with given Email.";
	

	String BOOK_APPOINTMENT_POST_URL = "bookAppointment";
	String USER_HOME_GET_URL = "userhome.htm";
	String BOOK_APPOINTMENT_PAGE = "confirm_appointment";
	String BOOK_APPOINTMENT_GET_URL = "bookappointment.htm";
	String HOME_GET_URL = "home.htm";
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
	
}
