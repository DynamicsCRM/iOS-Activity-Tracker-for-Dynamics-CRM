//
//  Model.h
//  Microsoft Xrm Mobile SDK
//  Copyright (c) 2015 Microsoft. All rights reserved.
//

#import <CRMMobileSDK/CRMMobileSDK.h>


typedef enum {
	activitypointer_activitytypecode_Fax = 4204,
	activitypointer_activitytypecode_Phone_Call = 4210,
	activitypointer_activitytypecode_Email = 4202,
	activitypointer_activitytypecode_Letter = 4207,
	activitypointer_activitytypecode_Appointment = 4201,
	activitypointer_activitytypecode_Service_Activity = 4214,
	activitypointer_activitytypecode_Opportunity_Close = 4208,
	activitypointer_activitytypecode_Order_Close = 4209,
	activitypointer_activitytypecode_Quote_Close = 4211,
	activitypointer_activitytypecode_Case_Resolution = 4206,
	activitypointer_activitytypecode_Task = 4212,
	activitypointer_activitytypecode_Campaign_Response = 4401,
	activitypointer_activitytypecode_Campaign_Activity = 4402,
	activitypointer_activitytypecode_Bulk_Operation = 4406,
	activitypointer_activitytypecode_Recurring_Appointment = 4251,
} activitypointer_activitytypecode;


typedef enum {
	activitypointer_deliveryprioritycode_Low = 0,
	activitypointer_deliveryprioritycode_Normal = 1,
	activitypointer_deliveryprioritycode_High = 2,
} activitypointer_deliveryprioritycode;


typedef enum {
	budgetstatus_No_Committed_Budget = 0,
	budgetstatus_May_Buy = 1,
	budgetstatus_Can_Buy = 2,
	budgetstatus_Will_Buy = 3,
} budgetstatus;


typedef enum {
	componentstate_Published = 0,
	componentstate_Unpublished = 1,
	componentstate_Deleted = 2,
	componentstate_Deleted_Unpublished = 3,
} componentstate;


typedef enum {
	componenttype_Entity = 1,
	componenttype_Attribute = 2,
	componenttype_Relationship = 3,
	componenttype_Attribute_Picklist_Value = 4,
	componenttype_Attribute_Lookup_Value = 5,
	componenttype_View_Attribute = 6,
	componenttype_Localized_Label = 7,
	componenttype_Relationship_Extra_Condition = 8,
	componenttype_Option_Set = 9,
	componenttype_Entity_Relationship = 10,
	componenttype_Entity_Relationship_Role = 11,
	componenttype_Entity_Relationship_Relationships = 12,
	componenttype_Managed_Property = 13,
	componenttype_Role = 20,
	componenttype_Role_Privilege = 21,
	componenttype_Display_String = 22,
	componenttype_Display_String_Map = 23,
	componenttype_Form = 24,
	componenttype_Organization = 25,
	componenttype_Saved_Query = 26,
	componenttype_Workflow = 29,
	componenttype_Report = 31,
	componenttype_Report_Entity = 32,
	componenttype_Report_Category = 33,
	componenttype_Report_Visibility = 34,
	componenttype_Attachment = 35,
	componenttype_Email_Template = 36,
	componenttype_Contract_Template = 37,
	componenttype_KB_Article_Template = 38,
	componenttype_Mail_Merge_Template = 39,
	componenttype_Duplicate_Rule = 44,
	componenttype_Duplicate_Rule_Condition = 45,
	componenttype_Entity_Map = 46,
	componenttype_Attribute_Map = 47,
	componenttype_Ribbon_Command = 48,
	componenttype_Ribbon_Context_Group = 49,
	componenttype_Ribbon_Customization = 50,
	componenttype_Ribbon_Rule = 52,
	componenttype_Ribbon_Tab_To_Command_Map = 53,
	componenttype_Ribbon_Diff = 55,
	componenttype_Saved_Query_Visualization = 59,
	componenttype_System_Form = 60,
	componenttype_Web_Resource = 61,
	componenttype_Site_Map = 62,
	componenttype_Connection_Role = 63,
	componenttype_Field_Security_Profile = 70,
	componenttype_Field_Permission = 71,
	componenttype_Plugin_Type = 90,
	componenttype_Plugin_Assembly = 91,
	componenttype_SDK_Message_Processing_Step = 92,
	componenttype_SDK_Message_Processing_Step_Image = 93,
	componenttype_Service_Endpoint = 95,
	componenttype_Routing_Rule = 150,
	componenttype_Routing_Rule_Item = 151,
	componenttype_SLA = 152,
	componenttype_SLA_Item = 153,
	componenttype_Convert_Rule = 154,
	componenttype_Convert_Rule_Item = 155,
	componenttype_Hierarchy_Rule = 65,
} componenttype;


typedef enum {
	connectionrole_category_Business = 1,
	connectionrole_category_Family = 2,
	connectionrole_category_Social = 3,
	connectionrole_category_Sales = 4,
	connectionrole_category_Other = 5,
	connectionrole_category_Stakeholder = 1000,
	connectionrole_category_Sales_Team = 1001,
	connectionrole_category_Service = 1002,
} connectionrole_category;


typedef enum {
	dependencytype_None = 0,
	dependencytype_Solution_Internal = 1,
	dependencytype_Published = 2,
	dependencytype_Unpublished = 4,
} dependencytype;


typedef enum {
	emailserverprofile_authenticationprotocol_Auto_Detect = 0,
	emailserverprofile_authenticationprotocol_Negotiate = 1,
	emailserverprofile_authenticationprotocol_NTLM = 2,
	emailserverprofile_authenticationprotocol_Basic = 3,
} emailserverprofile_authenticationprotocol;


typedef enum {
	field_security_permission_type_Not_Allowed = 0,
	field_security_permission_type_Allowed = 4,
} field_security_permission_type;


typedef enum {
	goal_fiscalperiod_Quarter_1 = 1,
	goal_fiscalperiod_Quarter_2 = 2,
	goal_fiscalperiod_Quarter_3 = 3,
	goal_fiscalperiod_Quarter_4 = 4,
	goal_fiscalperiod_January = 101,
	goal_fiscalperiod_February = 102,
	goal_fiscalperiod_March = 103,
	goal_fiscalperiod_April = 104,
	goal_fiscalperiod_May = 105,
	goal_fiscalperiod_June = 106,
	goal_fiscalperiod_July = 107,
	goal_fiscalperiod_August = 108,
	goal_fiscalperiod_September = 109,
	goal_fiscalperiod_October = 110,
	goal_fiscalperiod_November = 111,
	goal_fiscalperiod_December = 112,
	goal_fiscalperiod_Semester_1 = 201,
	goal_fiscalperiod_Semester_2 = 202,
	goal_fiscalperiod_Annual = 301,
	goal_fiscalperiod_P1 = 401,
	goal_fiscalperiod_P2 = 402,
	goal_fiscalperiod_P3 = 403,
	goal_fiscalperiod_P4 = 404,
	goal_fiscalperiod_P5 = 405,
	goal_fiscalperiod_P6 = 406,
	goal_fiscalperiod_P7 = 407,
	goal_fiscalperiod_P8 = 408,
	goal_fiscalperiod_P9 = 409,
	goal_fiscalperiod_P10 = 410,
	goal_fiscalperiod_P11 = 411,
	goal_fiscalperiod_P12 = 412,
	goal_fiscalperiod_P13 = 413,
} goal_fiscalperiod;


typedef enum {
	goal_fiscalyear_FY2038 = 2038,
	goal_fiscalyear_FY2037 = 2037,
	goal_fiscalyear_FY2036 = 2036,
	goal_fiscalyear_FY2035 = 2035,
	goal_fiscalyear_FY2034 = 2034,
	goal_fiscalyear_FY2033 = 2033,
	goal_fiscalyear_FY2032 = 2032,
	goal_fiscalyear_FY2031 = 2031,
	goal_fiscalyear_FY2030 = 2030,
	goal_fiscalyear_FY2029 = 2029,
	goal_fiscalyear_FY2028 = 2028,
	goal_fiscalyear_FY2027 = 2027,
	goal_fiscalyear_FY2026 = 2026,
	goal_fiscalyear_FY2025 = 2025,
	goal_fiscalyear_FY2024 = 2024,
	goal_fiscalyear_FY2023 = 2023,
	goal_fiscalyear_FY2022 = 2022,
	goal_fiscalyear_FY2021 = 2021,
	goal_fiscalyear_FY2020 = 2020,
	goal_fiscalyear_FY2019 = 2019,
	goal_fiscalyear_FY2018 = 2018,
	goal_fiscalyear_FY2017 = 2017,
	goal_fiscalyear_FY2016 = 2016,
	goal_fiscalyear_FY2015 = 2015,
	goal_fiscalyear_FY2014 = 2014,
	goal_fiscalyear_FY2013 = 2013,
	goal_fiscalyear_FY2012 = 2012,
	goal_fiscalyear_FY2011 = 2011,
	goal_fiscalyear_FY2010 = 2010,
	goal_fiscalyear_FY2009 = 2009,
	goal_fiscalyear_FY2008 = 2008,
	goal_fiscalyear_FY2007 = 2007,
	goal_fiscalyear_FY2006 = 2006,
	goal_fiscalyear_FY2005 = 2005,
	goal_fiscalyear_FY2004 = 2004,
	goal_fiscalyear_FY2003 = 2003,
	goal_fiscalyear_FY2002 = 2002,
	goal_fiscalyear_FY2001 = 2001,
	goal_fiscalyear_FY2000 = 2000,
	goal_fiscalyear_FY1999 = 1999,
	goal_fiscalyear_FY1998 = 1998,
	goal_fiscalyear_FY1997 = 1997,
	goal_fiscalyear_FY1996 = 1996,
	goal_fiscalyear_FY1995 = 1995,
	goal_fiscalyear_FY1994 = 1994,
	goal_fiscalyear_FY1993 = 1993,
	goal_fiscalyear_FY1992 = 1992,
	goal_fiscalyear_FY1991 = 1991,
	goal_fiscalyear_FY1990 = 1990,
	goal_fiscalyear_FY1989 = 1989,
	goal_fiscalyear_FY1988 = 1988,
	goal_fiscalyear_FY1987 = 1987,
	goal_fiscalyear_FY1986 = 1986,
	goal_fiscalyear_FY1985 = 1985,
	goal_fiscalyear_FY1984 = 1984,
	goal_fiscalyear_FY1983 = 1983,
	goal_fiscalyear_FY1982 = 1982,
	goal_fiscalyear_FY1981 = 1981,
	goal_fiscalyear_FY1980 = 1980,
	goal_fiscalyear_FY1979 = 1979,
	goal_fiscalyear_FY1978 = 1978,
	goal_fiscalyear_FY1977 = 1977,
	goal_fiscalyear_FY1976 = 1976,
	goal_fiscalyear_FY1975 = 1975,
	goal_fiscalyear_FY1974 = 1974,
	goal_fiscalyear_FY1973 = 1973,
	goal_fiscalyear_FY1972 = 1972,
	goal_fiscalyear_FY1971 = 1971,
	goal_fiscalyear_FY1970 = 1970,
} goal_fiscalyear;


typedef enum {
	incident_caseorigincode_Phone = 1,
	incident_caseorigincode_Email = 2,
	incident_caseorigincode_Web = 3,
	incident_caseorigincode_Facebook = 2483,
	incident_caseorigincode_Twitter = 3986,
} incident_caseorigincode;


typedef enum {
	initialcommunication_Contacted = 0,
	initialcommunication_Not_Contacted = 1,
} initialcommunication;


typedef enum {
	lead_salesstage_Qualify = 0,
} lead_salesstage;


typedef enum {
	metric_goaltype_Money = 0,
	metric_goaltype_Decimal = 1,
	metric_goaltype_Integer = 2,
} metric_goaltype;


typedef enum {
	need_Must_have = 0,
	need_Should_have = 1,
	need_Good_to_have = 2,
	need_No_need = 3,
} need;


typedef enum {
	opportunity_salesstage_Qualify = 0,
	opportunity_salesstage_Develop = 1,
	opportunity_salesstage_Propose = 2,
	opportunity_salesstage_Close = 3,
} opportunity_salesstage;


typedef enum {
	principalsyncattributemapping_syncdirection_None = 0,
	principalsyncattributemapping_syncdirection_ToExchange = 1,
	principalsyncattributemapping_syncdirection_ToCRM = 2,
	principalsyncattributemapping_syncdirection_Bidirectional = 3,
} principalsyncattributemapping_syncdirection;


typedef enum {
	processstage_category_Qualify = 0,
	processstage_category_Develop = 1,
	processstage_category_Propose = 2,
	processstage_category_Close = 3,
	processstage_category_Identify = 4,
	processstage_category_Research = 5,
	processstage_category_Resolve = 6,
} processstage_category;


typedef enum {
	purchaseprocess_Individual = 0,
	purchaseprocess_Committee = 1,
	purchaseprocess_Unknown = 2,
} purchaseprocess;


typedef enum {
	purchasetimeframe_Immediate = 0,
	purchasetimeframe_This_Quarter = 1,
	purchasetimeframe_Next_Quarter = 2,
	purchasetimeframe_This_Year = 3,
	purchasetimeframe_Unknown = 4,
} purchasetimeframe;


typedef enum {
	qooi_pricingerrorcode_None = 0,
	qooi_pricingerrorcode_Detail_Error = 1,
	qooi_pricingerrorcode_Missing_Price_Level = 2,
	qooi_pricingerrorcode_Inactive_Price_Level = 3,
	qooi_pricingerrorcode_Missing_Quantity = 4,
	qooi_pricingerrorcode_Missing_Unit_Price = 5,
	qooi_pricingerrorcode_Missing_Product = 6,
	qooi_pricingerrorcode_Invalid_Product = 7,
	qooi_pricingerrorcode_Missing_Pricing_Code = 8,
	qooi_pricingerrorcode_Invalid_Pricing_Code = 9,
	qooi_pricingerrorcode_Missing_UOM = 10,
	qooi_pricingerrorcode_Product_Not_In_Price_Level = 11,
	qooi_pricingerrorcode_Missing_Price_Level_Amount = 12,
	qooi_pricingerrorcode_Missing_Price_Level_Percentage = 13,
	qooi_pricingerrorcode_Missing_Price = 14,
	qooi_pricingerrorcode_Missing_Current_Cost = 15,
	qooi_pricingerrorcode_Missing_Standard_Cost = 16,
	qooi_pricingerrorcode_Invalid_Price_Level_Amount = 17,
	qooi_pricingerrorcode_Invalid_Price_Level_Percentage = 18,
	qooi_pricingerrorcode_Invalid_Price = 19,
	qooi_pricingerrorcode_Invalid_Current_Cost = 20,
	qooi_pricingerrorcode_Invalid_Standard_Cost = 21,
	qooi_pricingerrorcode_Invalid_Rounding_Policy = 22,
	qooi_pricingerrorcode_Invalid_Rounding_Option = 23,
	qooi_pricingerrorcode_Invalid_Rounding_Amount = 24,
	qooi_pricingerrorcode_Price_Calculation_Error = 25,
	qooi_pricingerrorcode_Invalid_Discount_Type = 26,
	qooi_pricingerrorcode_Discount_Type_Invalid_State = 27,
	qooi_pricingerrorcode_Invalid_Discount = 28,
	qooi_pricingerrorcode_Invalid_Quantity = 29,
	qooi_pricingerrorcode_Invalid_Pricing_Precision = 30,
	qooi_pricingerrorcode_Missing_Product_Default_UOM = 31,
	qooi_pricingerrorcode_Missing_Product_UOM_Schedule_ = 32,
	qooi_pricingerrorcode_Inactive_Discount_Type = 33,
	qooi_pricingerrorcode_Invalid_Price_Level_Currency = 34,
	qooi_pricingerrorcode_Price_Attribute_Out_Of_Range = 35,
	qooi_pricingerrorcode_Base_Currency_Attribute_Overflow = 36,
	qooi_pricingerrorcode_Base_Currency_Attribute_Underflow = 37,
} qooi_pricingerrorcode;


typedef enum {
	qooiproduct_producttype_Product = 1,
	qooiproduct_producttype_Bundle = 2,
	qooiproduct_producttype_Required_Bundle_Product = 3,
	qooiproduct_producttype_Optional_Bundle_Product = 4,
} qooiproduct_producttype;


typedef enum {
	qooiproduct_propertiesconfigurationstatus_Edit = 0,
	qooiproduct_propertiesconfigurationstatus_Rectify = 1,
	qooiproduct_propertiesconfigurationstatus_NotConfigured = 2,
} qooiproduct_propertiesconfigurationstatus;


typedef enum {
	recurrencerule_monthofyear_Invalid_Month_Of_Year = 0,
	recurrencerule_monthofyear_January = 1,
	recurrencerule_monthofyear_February = 2,
	recurrencerule_monthofyear_March = 3,
	recurrencerule_monthofyear_April = 4,
	recurrencerule_monthofyear_May = 5,
	recurrencerule_monthofyear_June = 6,
	recurrencerule_monthofyear_July = 7,
	recurrencerule_monthofyear_August = 8,
	recurrencerule_monthofyear_September = 9,
	recurrencerule_monthofyear_October = 10,
	recurrencerule_monthofyear_November = 11,
	recurrencerule_monthofyear_December = 12,
} recurrencerule_monthofyear;


typedef enum {
	servicestage_Identify = 0,
	servicestage_Research = 1,
	servicestage_Resolve = 2,
} servicestage;


typedef enum {
	sharepoint_validationstatus_Not_Validated = 1,
	sharepoint_validationstatus_In_Progress = 2,
	sharepoint_validationstatus_Invalid = 3,
	sharepoint_validationstatus_Valid = 4,
	sharepoint_validationstatus_Could_not_validate = 5,
} sharepoint_validationstatus;


typedef enum {
	sharepoint_validationstatusreason_This_record_s_URL_has_not_been_validated_ = 1,
	sharepoint_validationstatusreason_This_record_s_URL_is_valid_ = 2,
	sharepoint_validationstatusreason_This_record_s_URL_is_not_valid_ = 3,
	sharepoint_validationstatusreason_The_URL_schemes_of_Microsoft_Dynamics_CRM_and_SharePoint_are_different_ = 4,
	sharepoint_validationstatusreason_The_URL_could_not_be_accessed_because_of_Internet_Explorer_security_settings_ = 5,
	sharepoint_validationstatusreason_Authentication_failure_ = 6,
	sharepoint_validationstatusreason_Invalid_certificates_ = 7,
} sharepoint_validationstatusreason;


typedef enum {
	socialactivity_postmessagetype_Public_Message = 0,
	socialactivity_postmessagetype_Private_Message = 1,
} socialactivity_postmessagetype;


typedef enum {
	socialprofile_community_Facebook = 1,
	socialprofile_community_Twitter = 2,
	socialprofile_community_Other = 0,
} socialprofile_community;


typedef enum {
	syncattributemapping_syncdirection_None = 0,
	syncattributemapping_syncdirection_ToExchange = 1,
	syncattributemapping_syncdirection_ToCRM = 2,
	syncattributemapping_syncdirection_Bidirectional = 3,
} syncattributemapping_syncdirection;


typedef enum {
	workflow_runas_Owner = 0,
	workflow_runas_Calling_User = 1,
} workflow_runas;


typedef enum {
	workflow_stage_Pre_operation = 20,
	workflow_stage_Post_operation = 40,
} workflow_stage;


typedef enum {
	workflowlog_objecttypecode_System_Job = 4700,
	workflowlog_objecttypecode_Workflow_Session = 4710,
} workflowlog_objecttypecode;


@interface ActivityPointer : Entity

+ (NSString *)entityLogicalName;
+ (NSNumber *)entityTypeCode;

@property (nonatomic, strong) NSUUID *ActivityId;
@property (nonatomic, strong) NSString *ActivityTypeCode;
@property (nonatomic, strong) CRMInteger *ActualDurationMinutes;
@property (nonatomic, strong) NSDate *ActualEnd;
@property (nonatomic, strong) NSDate *ActualStart;
@property (nonatomic, strong) OptionSetValue *Community;
@property (nonatomic, strong) EntityReference *CreatedBy;
@property (nonatomic, strong) NSString *CreatedByName;
@property (nonatomic, strong) NSString *CreatedByYomiName;
@property (nonatomic, strong) NSDate *CreatedOn;
@property (nonatomic, strong) EntityReference *CreatedOnBehalfBy;
@property (nonatomic, strong) NSString *CreatedOnBehalfByName;
@property (nonatomic, strong) NSString *CreatedOnBehalfByYomiName;
@property (nonatomic, strong) NSDate *DeliveryLastAttemptedOn;
@property (nonatomic, strong) OptionSetValue *DeliveryPriorityCode;
@property (nonatomic, strong) NSString *Description;
@property (nonatomic, strong) NSDecimalNumber *ExchangeRate;
@property (nonatomic, strong) OptionSetValue *InstanceTypeCode;
@property (nonatomic, strong) CRMBoolean *IsBilled;
@property (nonatomic, strong) CRMBoolean *IsMapiPrivate;
@property (nonatomic, strong) CRMBoolean *IsRegularActivity;
@property (nonatomic, strong) CRMBoolean *IsWorkflowCreated;
@property (nonatomic, strong) CRMBoolean *LeftVoiceMail;
@property (nonatomic, strong) EntityReference *ModifiedBy;
@property (nonatomic, strong) NSString *ModifiedByName;
@property (nonatomic, strong) NSString *ModifiedByYomiName;
@property (nonatomic, strong) NSDate *ModifiedOn;
@property (nonatomic, strong) EntityReference *ModifiedOnBehalfBy;
@property (nonatomic, strong) NSString *ModifiedOnBehalfByName;
@property (nonatomic, strong) NSString *ModifiedOnBehalfByYomiName;
@property (nonatomic, strong) EntityReference *OwnerId;
@property (nonatomic, strong) NSString *OwnerIdName;
@property (nonatomic, strong) NSString *OwnerIdType;
@property (nonatomic, strong) NSString *OwnerIdYomiName;
@property (nonatomic, strong) EntityReference *OwningBusinessUnit;
@property (nonatomic, strong) EntityReference *OwningTeam;
@property (nonatomic, strong) EntityReference *OwningUser;
@property (nonatomic, strong) NSDate *PostponeActivityProcessingUntil;
@property (nonatomic, strong) OptionSetValue *PriorityCode;
@property (nonatomic, strong) NSUUID *ProcessId;
@property (nonatomic, strong) EntityReference *RegardingObjectId;
@property (nonatomic, strong) NSString *RegardingObjectIdName;
@property (nonatomic, strong) NSString *RegardingObjectIdYomiName;
@property (nonatomic, strong) NSString *RegardingObjectTypeCode;
@property (nonatomic, strong) CRMInteger *ScheduledDurationMinutes;
@property (nonatomic, strong) NSDate *ScheduledEnd;
@property (nonatomic, strong) NSDate *ScheduledStart;
@property (nonatomic, strong) EntityReference *SenderMailboxId;
@property (nonatomic, strong) NSString *SenderMailboxIdName;
@property (nonatomic, strong) NSDate *SentOn;
@property (nonatomic, strong) NSUUID *SeriesId;
@property (nonatomic, strong) EntityReference *ServiceId;
@property (nonatomic, strong) NSString *ServiceIdName;
@property (nonatomic, strong) NSUUID *StageId;
@property (nonatomic, strong) OptionSetValue *StateCode;
@property (nonatomic, strong) OptionSetValue *StatusCode;
@property (nonatomic, strong) NSString *Subject;
@property (nonatomic, strong) CRMInteger *TimeZoneRuleVersionNumber;
@property (nonatomic, strong) EntityReference *TransactionCurrencyId;
@property (nonatomic, strong) NSString *TransactionCurrencyIdName;
@property (nonatomic, strong) NSString *TraversedPath;
@property (nonatomic, strong) CRMInteger *UTCConversionTimeZoneCode;
@property (nonatomic, strong) CRMBigInt *VersionNumber;

@end


@interface Contact : Entity

+ (NSString *)entityLogicalName;
+ (NSNumber *)entityTypeCode;

@property (nonatomic, strong) EntityReference *AccountId;
@property (nonatomic, strong) NSString *AccountIdName;
@property (nonatomic, strong) NSString *AccountIdYomiName;
@property (nonatomic, strong) OptionSetValue *AccountRoleCode;
@property (nonatomic, strong) NSUUID *Address1_AddressId;
@property (nonatomic, strong) OptionSetValue *Address1_AddressTypeCode;
@property (nonatomic, strong) NSString *Address1_City;
@property (nonatomic, strong) NSString *Address1_Composite;
@property (nonatomic, strong) NSString *Address1_Country;
@property (nonatomic, strong) NSString *Address1_County;
@property (nonatomic, strong) NSString *Address1_Fax;
@property (nonatomic, strong) OptionSetValue *Address1_FreightTermsCode;
@property (nonatomic, strong) CRMDouble *Address1_Latitude;
@property (nonatomic, strong) NSString *Address1_Line1;
@property (nonatomic, strong) NSString *Address1_Line2;
@property (nonatomic, strong) NSString *Address1_Line3;
@property (nonatomic, strong) CRMDouble *Address1_Longitude;
@property (nonatomic, strong) NSString *Address1_Name;
@property (nonatomic, strong) NSString *Address1_PostalCode;
@property (nonatomic, strong) NSString *Address1_PostOfficeBox;
@property (nonatomic, strong) NSString *Address1_PrimaryContactName;
@property (nonatomic, strong) OptionSetValue *Address1_ShippingMethodCode;
@property (nonatomic, strong) NSString *Address1_StateOrProvince;
@property (nonatomic, strong) NSString *Address1_Telephone1;
@property (nonatomic, strong) NSString *Address1_Telephone2;
@property (nonatomic, strong) NSString *Address1_Telephone3;
@property (nonatomic, strong) NSString *Address1_UPSZone;
@property (nonatomic, strong) CRMInteger *Address1_UTCOffset;
@property (nonatomic, strong) NSUUID *Address2_AddressId;
@property (nonatomic, strong) OptionSetValue *Address2_AddressTypeCode;
@property (nonatomic, strong) NSString *Address2_City;
@property (nonatomic, strong) NSString *Address2_Composite;
@property (nonatomic, strong) NSString *Address2_Country;
@property (nonatomic, strong) NSString *Address2_County;
@property (nonatomic, strong) NSString *Address2_Fax;
@property (nonatomic, strong) OptionSetValue *Address2_FreightTermsCode;
@property (nonatomic, strong) CRMDouble *Address2_Latitude;
@property (nonatomic, strong) NSString *Address2_Line1;
@property (nonatomic, strong) NSString *Address2_Line2;
@property (nonatomic, strong) NSString *Address2_Line3;
@property (nonatomic, strong) CRMDouble *Address2_Longitude;
@property (nonatomic, strong) NSString *Address2_Name;
@property (nonatomic, strong) NSString *Address2_PostalCode;
@property (nonatomic, strong) NSString *Address2_PostOfficeBox;
@property (nonatomic, strong) NSString *Address2_PrimaryContactName;
@property (nonatomic, strong) OptionSetValue *Address2_ShippingMethodCode;
@property (nonatomic, strong) NSString *Address2_StateOrProvince;
@property (nonatomic, strong) NSString *Address2_Telephone1;
@property (nonatomic, strong) NSString *Address2_Telephone2;
@property (nonatomic, strong) NSString *Address2_Telephone3;
@property (nonatomic, strong) NSString *Address2_UPSZone;
@property (nonatomic, strong) CRMInteger *Address2_UTCOffset;
@property (nonatomic, strong) NSUUID *Address3_AddressId;
@property (nonatomic, strong) OptionSetValue *Address3_AddressTypeCode;
@property (nonatomic, strong) NSString *Address3_City;
@property (nonatomic, strong) NSString *Address3_Composite;
@property (nonatomic, strong) NSString *Address3_Country;
@property (nonatomic, strong) NSString *Address3_County;
@property (nonatomic, strong) NSString *Address3_Fax;
@property (nonatomic, strong) OptionSetValue *Address3_FreightTermsCode;
@property (nonatomic, strong) CRMDouble *Address3_Latitude;
@property (nonatomic, strong) NSString *Address3_Line1;
@property (nonatomic, strong) NSString *Address3_Line2;
@property (nonatomic, strong) NSString *Address3_Line3;
@property (nonatomic, strong) CRMDouble *Address3_Longitude;
@property (nonatomic, strong) NSString *Address3_Name;
@property (nonatomic, strong) NSString *Address3_PostalCode;
@property (nonatomic, strong) NSString *Address3_PostOfficeBox;
@property (nonatomic, strong) NSString *Address3_PrimaryContactName;
@property (nonatomic, strong) OptionSetValue *Address3_ShippingMethodCode;
@property (nonatomic, strong) NSString *Address3_StateOrProvince;
@property (nonatomic, strong) NSString *Address3_Telephone1;
@property (nonatomic, strong) NSString *Address3_Telephone2;
@property (nonatomic, strong) NSString *Address3_Telephone3;
@property (nonatomic, strong) NSString *Address3_UPSZone;
@property (nonatomic, strong) CRMInteger *Address3_UTCOffset;
@property (nonatomic, strong) Money *Aging30;
@property (nonatomic, strong) Money *Aging30_Base;
@property (nonatomic, strong) Money *Aging60;
@property (nonatomic, strong) Money *Aging60_Base;
@property (nonatomic, strong) Money *Aging90;
@property (nonatomic, strong) Money *Aging90_Base;
@property (nonatomic, strong) NSDate *Anniversary;
@property (nonatomic, strong) Money *AnnualIncome;
@property (nonatomic, strong) Money *AnnualIncome_Base;
@property (nonatomic, strong) NSString *AssistantName;
@property (nonatomic, strong) NSString *AssistantPhone;
@property (nonatomic, strong) NSDate *BirthDate;
@property (nonatomic, strong) NSString *Business2;
@property (nonatomic, strong) NSString *Callback;
@property (nonatomic, strong) NSString *ChildrensNames;
@property (nonatomic, strong) NSString *Company;
@property (nonatomic, strong) NSUUID *ContactId;
@property (nonatomic, strong) EntityReference *CreatedBy;
@property (nonatomic, strong) NSString *CreatedByName;
@property (nonatomic, strong) NSString *CreatedByYomiName;
@property (nonatomic, strong) NSDate *CreatedOn;
@property (nonatomic, strong) EntityReference *CreatedOnBehalfBy;
@property (nonatomic, strong) NSString *CreatedOnBehalfByName;
@property (nonatomic, strong) NSString *CreatedOnBehalfByYomiName;
@property (nonatomic, strong) Money *CreditLimit;
@property (nonatomic, strong) Money *CreditLimit_Base;
@property (nonatomic, strong) CRMBoolean *CreditOnHold;
@property (nonatomic, strong) OptionSetValue *CustomerSizeCode;
@property (nonatomic, strong) OptionSetValue *CustomerTypeCode;
@property (nonatomic, strong) EntityReference *DefaultPriceLevelId;
@property (nonatomic, strong) NSString *DefaultPriceLevelIdName;
@property (nonatomic, strong) NSString *Department;
@property (nonatomic, strong) NSString *Description;
@property (nonatomic, strong) CRMBoolean *DoNotBulkEMail;
@property (nonatomic, strong) CRMBoolean *DoNotBulkPostalMail;
@property (nonatomic, strong) CRMBoolean *DoNotEMail;
@property (nonatomic, strong) CRMBoolean *DoNotFax;
@property (nonatomic, strong) CRMBoolean *DoNotPhone;
@property (nonatomic, strong) CRMBoolean *DoNotPostalMail;
@property (nonatomic, strong) CRMBoolean *DoNotSendMM;
@property (nonatomic, strong) OptionSetValue *EducationCode;
@property (nonatomic, strong) NSString *EMailAddress1;
@property (nonatomic, strong) NSString *EMailAddress2;
@property (nonatomic, strong) NSString *EMailAddress3;
@property (nonatomic, strong) NSString *EmployeeId;
@property (nonatomic, strong) CRMBigInt *EntityImage_Timestamp;
@property (nonatomic, strong) NSString *EntityImage_URL;
@property (nonatomic, strong) NSUUID *EntityImageId;
@property (nonatomic, strong) NSDecimalNumber *ExchangeRate;
@property (nonatomic, strong) NSString *ExternalUserIdentifier;
@property (nonatomic, strong) OptionSetValue *FamilyStatusCode;
@property (nonatomic, strong) NSString *Fax;
@property (nonatomic, strong) NSString *FirstName;
@property (nonatomic, strong) NSString *FtpSiteUrl;
@property (nonatomic, strong) NSString *FullName;
@property (nonatomic, strong) OptionSetValue *GenderCode;
@property (nonatomic, strong) NSString *GovernmentId;
@property (nonatomic, strong) OptionSetValue *HasChildrenCode;
@property (nonatomic, strong) NSString *Home2;
@property (nonatomic, strong) CRMInteger *ImportSequenceNumber;
@property (nonatomic, strong) CRMBoolean *IsAutoCreate;
@property (nonatomic, strong) CRMBoolean *IsBackofficeCustomer;
@property (nonatomic, strong) CRMBoolean *IsPrivate;
@property (nonatomic, strong) NSString *JobTitle;
@property (nonatomic, strong) NSString *LastName;
@property (nonatomic, strong) NSDate *LastUsedInCampaign;
@property (nonatomic, strong) OptionSetValue *LeadSourceCode;
@property (nonatomic, strong) NSString *ManagerName;
@property (nonatomic, strong) NSString *ManagerPhone;
@property (nonatomic, strong) NSString *MasterContactIdName;
@property (nonatomic, strong) NSString *MasterContactIdYomiName;
@property (nonatomic, strong) EntityReference *MasterId;
@property (nonatomic, strong) CRMBoolean *Merged;
@property (nonatomic, strong) NSString *MiddleName;
@property (nonatomic, strong) NSString *MobilePhone;
@property (nonatomic, strong) EntityReference *ModifiedBy;
@property (nonatomic, strong) NSString *ModifiedByName;
@property (nonatomic, strong) NSString *ModifiedByYomiName;
@property (nonatomic, strong) NSDate *ModifiedOn;
@property (nonatomic, strong) EntityReference *ModifiedOnBehalfBy;
@property (nonatomic, strong) NSString *ModifiedOnBehalfByName;
@property (nonatomic, strong) NSString *ModifiedOnBehalfByYomiName;
@property (nonatomic, strong) NSString *NickName;
@property (nonatomic, strong) CRMInteger *NumberOfChildren;
@property (nonatomic, strong) EntityReference *OriginatingLeadId;
@property (nonatomic, strong) NSString *OriginatingLeadIdName;
@property (nonatomic, strong) NSString *OriginatingLeadIdYomiName;
@property (nonatomic, strong) NSDate *OverriddenCreatedOn;
@property (nonatomic, strong) EntityReference *OwnerId;
@property (nonatomic, strong) NSString *OwnerIdName;
@property (nonatomic, strong) NSString *OwnerIdType;
@property (nonatomic, strong) NSString *OwnerIdYomiName;
@property (nonatomic, strong) EntityReference *OwningBusinessUnit;
@property (nonatomic, strong) EntityReference *OwningTeam;
@property (nonatomic, strong) EntityReference *OwningUser;
@property (nonatomic, strong) NSString *Pager;
@property (nonatomic, strong) EntityReference *ParentContactId;
@property (nonatomic, strong) NSString *ParentContactIdName;
@property (nonatomic, strong) NSString *ParentContactIdYomiName;
@property (nonatomic, strong) EntityReference *ParentCustomerId;
@property (nonatomic, strong) NSString *ParentCustomerIdName;
@property (nonatomic, strong) NSString *ParentCustomerIdType;
@property (nonatomic, strong) NSString *ParentCustomerIdYomiName;
@property (nonatomic, strong) CRMBoolean *ParticipatesInWorkflow;
@property (nonatomic, strong) OptionSetValue *PaymentTermsCode;
@property (nonatomic, strong) OptionSetValue *PreferredAppointmentDayCode;
@property (nonatomic, strong) OptionSetValue *PreferredAppointmentTimeCode;
@property (nonatomic, strong) OptionSetValue *PreferredContactMethodCode;
@property (nonatomic, strong) EntityReference *PreferredEquipmentId;
@property (nonatomic, strong) NSString *PreferredEquipmentIdName;
@property (nonatomic, strong) EntityReference *PreferredServiceId;
@property (nonatomic, strong) NSString *PreferredServiceIdName;
@property (nonatomic, strong) EntityReference *PreferredSystemUserId;
@property (nonatomic, strong) NSString *PreferredSystemUserIdName;
@property (nonatomic, strong) NSString *PreferredSystemUserIdYomiName;
@property (nonatomic, strong) NSUUID *ProcessId;
@property (nonatomic, strong) NSString *Salutation;
@property (nonatomic, strong) OptionSetValue *ShippingMethodCode;
@property (nonatomic, strong) NSString *SpousesName;
@property (nonatomic, strong) NSUUID *StageId;
@property (nonatomic, strong) OptionSetValue *StateCode;
@property (nonatomic, strong) OptionSetValue *StatusCode;
@property (nonatomic, strong) NSUUID *SubscriptionId;
@property (nonatomic, strong) NSString *Suffix;
@property (nonatomic, strong) NSString *Telephone1;
@property (nonatomic, strong) NSString *Telephone2;
@property (nonatomic, strong) NSString *Telephone3;
@property (nonatomic, strong) OptionSetValue *TerritoryCode;
@property (nonatomic, strong) CRMInteger *TimeZoneRuleVersionNumber;
@property (nonatomic, strong) EntityReference *TransactionCurrencyId;
@property (nonatomic, strong) NSString *TransactionCurrencyIdName;
@property (nonatomic, strong) NSString *TraversedPath;
@property (nonatomic, strong) CRMInteger *UTCConversionTimeZoneCode;
@property (nonatomic, strong) CRMBigInt *VersionNumber;
@property (nonatomic, strong) NSString *WebSiteUrl;
@property (nonatomic, strong) NSString *YomiFirstName;
@property (nonatomic, strong) NSString *YomiFullName;
@property (nonatomic, strong) NSString *YomiLastName;
@property (nonatomic, strong) NSString *YomiMiddleName;

@end


@interface Task : Entity

+ (NSString *)entityLogicalName;
+ (NSNumber *)entityTypeCode;

@property (nonatomic, strong) NSUUID *ActivityId;
@property (nonatomic, strong) NSString *ActivityTypeCode;
@property (nonatomic, strong) CRMInteger *ActualDurationMinutes;
@property (nonatomic, strong) NSDate *ActualEnd;
@property (nonatomic, strong) NSDate *ActualStart;
@property (nonatomic, strong) NSString *Category;
@property (nonatomic, strong) EntityReference *CreatedBy;
@property (nonatomic, strong) NSString *CreatedByName;
@property (nonatomic, strong) NSString *CreatedByYomiName;
@property (nonatomic, strong) NSDate *CreatedOn;
@property (nonatomic, strong) EntityReference *CreatedOnBehalfBy;
@property (nonatomic, strong) NSString *CreatedOnBehalfByName;
@property (nonatomic, strong) NSString *CreatedOnBehalfByYomiName;
@property (nonatomic, strong) NSUUID *CrmTaskAssignedUniqueId;
@property (nonatomic, strong) NSString *Description;
@property (nonatomic, strong) NSDecimalNumber *ExchangeRate;
@property (nonatomic, strong) CRMInteger *ImportSequenceNumber;
@property (nonatomic, strong) CRMBoolean *IsBilled;
@property (nonatomic, strong) CRMBoolean *IsRegularActivity;
@property (nonatomic, strong) CRMBoolean *IsWorkflowCreated;
@property (nonatomic, strong) EntityReference *ModifiedBy;
@property (nonatomic, strong) NSString *ModifiedByName;
@property (nonatomic, strong) NSString *ModifiedByYomiName;
@property (nonatomic, strong) NSDate *ModifiedOn;
@property (nonatomic, strong) EntityReference *ModifiedOnBehalfBy;
@property (nonatomic, strong) NSString *ModifiedOnBehalfByName;
@property (nonatomic, strong) NSString *ModifiedOnBehalfByYomiName;
@property (nonatomic, strong) NSDate *OverriddenCreatedOn;
@property (nonatomic, strong) EntityReference *OwnerId;
@property (nonatomic, strong) NSString *OwnerIdName;
@property (nonatomic, strong) NSString *OwnerIdType;
@property (nonatomic, strong) NSString *OwnerIdYomiName;
@property (nonatomic, strong) EntityReference *OwningBusinessUnit;
@property (nonatomic, strong) EntityReference *OwningTeam;
@property (nonatomic, strong) EntityReference *OwningUser;
@property (nonatomic, strong) CRMInteger *PercentComplete;
@property (nonatomic, strong) OptionSetValue *PriorityCode;
@property (nonatomic, strong) NSUUID *ProcessId;
@property (nonatomic, strong) EntityReference *RegardingObjectId;
@property (nonatomic, strong) NSString *RegardingObjectIdName;
@property (nonatomic, strong) NSString *RegardingObjectIdYomiName;
@property (nonatomic, strong) NSString *RegardingObjectTypeCode;
@property (nonatomic, strong) CRMInteger *ScheduledDurationMinutes;
@property (nonatomic, strong) NSDate *ScheduledEnd;
@property (nonatomic, strong) NSDate *ScheduledStart;
@property (nonatomic, strong) EntityReference *ServiceId;
@property (nonatomic, strong) NSUUID *StageId;
@property (nonatomic, strong) OptionSetValue *StateCode;
@property (nonatomic, strong) OptionSetValue *StatusCode;
@property (nonatomic, strong) NSString *Subcategory;
@property (nonatomic, strong) NSString *Subject;
@property (nonatomic, strong) NSUUID *SubscriptionId;
@property (nonatomic, strong) CRMInteger *TimeZoneRuleVersionNumber;
@property (nonatomic, strong) EntityReference *TransactionCurrencyId;
@property (nonatomic, strong) NSString *TransactionCurrencyIdName;
@property (nonatomic, strong) NSString *TraversedPath;
@property (nonatomic, strong) CRMInteger *UTCConversionTimeZoneCode;
@property (nonatomic, strong) CRMBigInt *VersionNumber;

@end

