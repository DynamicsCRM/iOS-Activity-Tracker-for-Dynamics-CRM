//
//  Model.m
//  Microsoft Xrm Mobile SDK
//  Copyright (c) 2015 Microsoft. All rights reserved.
//

#import "Model.h"


@implementation ActivityPointer

+ (NSString *)entityLogicalName
{
	return @"activitypointer";
}

+ (NSNumber *)entityTypeCode
{
	return [NSNumber numberWithInt:4200];
}

- (NSUUID *)id
{
	return (NSUUID *)self.attributes[@"activityid"];
}

- (void)setId:(NSUUID *)id
{
	self.attributes[@"activityid"] = id;
}

- (NSUUID *)ActivityId {
	return (NSUUID *)self.attributes[@"activityid"];
}

- (void)setActivityId:(NSUUID *)ActivityId {
	self.attributes[@"activityid"] = ActivityId;
}

- (NSString *)ActivityTypeCode {
	return (NSString *)self.attributes[@"activitytypecode"];
}

- (void)setActivityTypeCode:(NSString *)ActivityTypeCode {
	self.attributes[@"activitytypecode"] = ActivityTypeCode;
}

- (CRMInteger *)ActualDurationMinutes {
	return (CRMInteger *)self.attributes[@"actualdurationminutes"];
}

- (void)setActualDurationMinutes:(CRMInteger *)ActualDurationMinutes {
	self.attributes[@"actualdurationminutes"] = ActualDurationMinutes;
}

- (NSDate *)ActualEnd {
	return (NSDate *)self.attributes[@"actualend"];
}

- (void)setActualEnd:(NSDate *)ActualEnd {
	self.attributes[@"actualend"] = ActualEnd;
}

- (NSDate *)ActualStart {
	return (NSDate *)self.attributes[@"actualstart"];
}

- (void)setActualStart:(NSDate *)ActualStart {
	self.attributes[@"actualstart"] = ActualStart;
}

- (OptionSetValue *)Community {
	return (OptionSetValue *)self.attributes[@"community"];
}

- (void)setCommunity:(OptionSetValue *)Community {
	self.attributes[@"community"] = Community;
}

- (EntityReference *)CreatedBy {
	return (EntityReference *)self.attributes[@"createdby"];
}

- (void)setCreatedBy:(EntityReference *)CreatedBy {
	self.attributes[@"createdby"] = CreatedBy;
}

- (NSString *)CreatedByName {
	return (NSString *)self.attributes[@"createdbyname"];
}

- (void)setCreatedByName:(NSString *)CreatedByName {
	self.attributes[@"createdbyname"] = CreatedByName;
}

- (NSString *)CreatedByYomiName {
	return (NSString *)self.attributes[@"createdbyyominame"];
}

- (void)setCreatedByYomiName:(NSString *)CreatedByYomiName {
	self.attributes[@"createdbyyominame"] = CreatedByYomiName;
}

- (NSDate *)CreatedOn {
	return (NSDate *)self.attributes[@"createdon"];
}

- (void)setCreatedOn:(NSDate *)CreatedOn {
	self.attributes[@"createdon"] = CreatedOn;
}

- (EntityReference *)CreatedOnBehalfBy {
	return (EntityReference *)self.attributes[@"createdonbehalfby"];
}

- (void)setCreatedOnBehalfBy:(EntityReference *)CreatedOnBehalfBy {
	self.attributes[@"createdonbehalfby"] = CreatedOnBehalfBy;
}

- (NSString *)CreatedOnBehalfByName {
	return (NSString *)self.attributes[@"createdonbehalfbyname"];
}

- (void)setCreatedOnBehalfByName:(NSString *)CreatedOnBehalfByName {
	self.attributes[@"createdonbehalfbyname"] = CreatedOnBehalfByName;
}

- (NSString *)CreatedOnBehalfByYomiName {
	return (NSString *)self.attributes[@"createdonbehalfbyyominame"];
}

- (void)setCreatedOnBehalfByYomiName:(NSString *)CreatedOnBehalfByYomiName {
	self.attributes[@"createdonbehalfbyyominame"] = CreatedOnBehalfByYomiName;
}

- (NSDate *)DeliveryLastAttemptedOn {
	return (NSDate *)self.attributes[@"deliverylastattemptedon"];
}

- (void)setDeliveryLastAttemptedOn:(NSDate *)DeliveryLastAttemptedOn {
	self.attributes[@"deliverylastattemptedon"] = DeliveryLastAttemptedOn;
}

- (OptionSetValue *)DeliveryPriorityCode {
	return (OptionSetValue *)self.attributes[@"deliveryprioritycode"];
}

- (void)setDeliveryPriorityCode:(OptionSetValue *)DeliveryPriorityCode {
	self.attributes[@"deliveryprioritycode"] = DeliveryPriorityCode;
}

- (NSString *)Description {
	return (NSString *)self.attributes[@"description"];
}

- (void)setDescription:(NSString *)Description {
	self.attributes[@"description"] = Description;
}

- (NSDecimalNumber *)ExchangeRate {
	return (NSDecimalNumber *)self.attributes[@"exchangerate"];
}

- (void)setExchangeRate:(NSDecimalNumber *)ExchangeRate {
	self.attributes[@"exchangerate"] = ExchangeRate;
}

- (OptionSetValue *)InstanceTypeCode {
	return (OptionSetValue *)self.attributes[@"instancetypecode"];
}

- (void)setInstanceTypeCode:(OptionSetValue *)InstanceTypeCode {
	self.attributes[@"instancetypecode"] = InstanceTypeCode;
}

- (CRMBoolean *)IsBilled {
	return (CRMBoolean *)self.attributes[@"isbilled"];
}

- (void)setIsBilled:(CRMBoolean *)IsBilled {
	self.attributes[@"isbilled"] = IsBilled;
}

- (CRMBoolean *)IsMapiPrivate {
	return (CRMBoolean *)self.attributes[@"ismapiprivate"];
}

- (void)setIsMapiPrivate:(CRMBoolean *)IsMapiPrivate {
	self.attributes[@"ismapiprivate"] = IsMapiPrivate;
}

- (CRMBoolean *)IsRegularActivity {
	return (CRMBoolean *)self.attributes[@"isregularactivity"];
}

- (void)setIsRegularActivity:(CRMBoolean *)IsRegularActivity {
	self.attributes[@"isregularactivity"] = IsRegularActivity;
}

- (CRMBoolean *)IsWorkflowCreated {
	return (CRMBoolean *)self.attributes[@"isworkflowcreated"];
}

- (void)setIsWorkflowCreated:(CRMBoolean *)IsWorkflowCreated {
	self.attributes[@"isworkflowcreated"] = IsWorkflowCreated;
}

- (CRMBoolean *)LeftVoiceMail {
	return (CRMBoolean *)self.attributes[@"leftvoicemail"];
}

- (void)setLeftVoiceMail:(CRMBoolean *)LeftVoiceMail {
	self.attributes[@"leftvoicemail"] = LeftVoiceMail;
}

- (EntityReference *)ModifiedBy {
	return (EntityReference *)self.attributes[@"modifiedby"];
}

- (void)setModifiedBy:(EntityReference *)ModifiedBy {
	self.attributes[@"modifiedby"] = ModifiedBy;
}

- (NSString *)ModifiedByName {
	return (NSString *)self.attributes[@"modifiedbyname"];
}

- (void)setModifiedByName:(NSString *)ModifiedByName {
	self.attributes[@"modifiedbyname"] = ModifiedByName;
}

- (NSString *)ModifiedByYomiName {
	return (NSString *)self.attributes[@"modifiedbyyominame"];
}

- (void)setModifiedByYomiName:(NSString *)ModifiedByYomiName {
	self.attributes[@"modifiedbyyominame"] = ModifiedByYomiName;
}

- (NSDate *)ModifiedOn {
	return (NSDate *)self.attributes[@"modifiedon"];
}

- (void)setModifiedOn:(NSDate *)ModifiedOn {
	self.attributes[@"modifiedon"] = ModifiedOn;
}

- (EntityReference *)ModifiedOnBehalfBy {
	return (EntityReference *)self.attributes[@"modifiedonbehalfby"];
}

- (void)setModifiedOnBehalfBy:(EntityReference *)ModifiedOnBehalfBy {
	self.attributes[@"modifiedonbehalfby"] = ModifiedOnBehalfBy;
}

- (NSString *)ModifiedOnBehalfByName {
	return (NSString *)self.attributes[@"modifiedonbehalfbyname"];
}

- (void)setModifiedOnBehalfByName:(NSString *)ModifiedOnBehalfByName {
	self.attributes[@"modifiedonbehalfbyname"] = ModifiedOnBehalfByName;
}

- (NSString *)ModifiedOnBehalfByYomiName {
	return (NSString *)self.attributes[@"modifiedonbehalfbyyominame"];
}

- (void)setModifiedOnBehalfByYomiName:(NSString *)ModifiedOnBehalfByYomiName {
	self.attributes[@"modifiedonbehalfbyyominame"] = ModifiedOnBehalfByYomiName;
}

- (EntityReference *)OwnerId {
	return (EntityReference *)self.attributes[@"ownerid"];
}

- (void)setOwnerId:(EntityReference *)OwnerId {
	self.attributes[@"ownerid"] = OwnerId;
}

- (NSString *)OwnerIdName {
	return (NSString *)self.attributes[@"owneridname"];
}

- (void)setOwnerIdName:(NSString *)OwnerIdName {
	self.attributes[@"owneridname"] = OwnerIdName;
}

- (NSString *)OwnerIdType {
	return (NSString *)self.attributes[@"owneridtype"];
}

- (void)setOwnerIdType:(NSString *)OwnerIdType {
	self.attributes[@"owneridtype"] = OwnerIdType;
}

- (NSString *)OwnerIdYomiName {
	return (NSString *)self.attributes[@"owneridyominame"];
}

- (void)setOwnerIdYomiName:(NSString *)OwnerIdYomiName {
	self.attributes[@"owneridyominame"] = OwnerIdYomiName;
}

- (EntityReference *)OwningBusinessUnit {
	return (EntityReference *)self.attributes[@"owningbusinessunit"];
}

- (void)setOwningBusinessUnit:(EntityReference *)OwningBusinessUnit {
	self.attributes[@"owningbusinessunit"] = OwningBusinessUnit;
}

- (EntityReference *)OwningTeam {
	return (EntityReference *)self.attributes[@"owningteam"];
}

- (void)setOwningTeam:(EntityReference *)OwningTeam {
	self.attributes[@"owningteam"] = OwningTeam;
}

- (EntityReference *)OwningUser {
	return (EntityReference *)self.attributes[@"owninguser"];
}

- (void)setOwningUser:(EntityReference *)OwningUser {
	self.attributes[@"owninguser"] = OwningUser;
}

- (NSDate *)PostponeActivityProcessingUntil {
	return (NSDate *)self.attributes[@"postponeactivityprocessinguntil"];
}

- (void)setPostponeActivityProcessingUntil:(NSDate *)PostponeActivityProcessingUntil {
	self.attributes[@"postponeactivityprocessinguntil"] = PostponeActivityProcessingUntil;
}

- (OptionSetValue *)PriorityCode {
	return (OptionSetValue *)self.attributes[@"prioritycode"];
}

- (void)setPriorityCode:(OptionSetValue *)PriorityCode {
	self.attributes[@"prioritycode"] = PriorityCode;
}

- (NSUUID *)ProcessId {
	return (NSUUID *)self.attributes[@"processid"];
}

- (void)setProcessId:(NSUUID *)ProcessId {
	self.attributes[@"processid"] = ProcessId;
}

- (EntityReference *)RegardingObjectId {
	return (EntityReference *)self.attributes[@"regardingobjectid"];
}

- (void)setRegardingObjectId:(EntityReference *)RegardingObjectId {
	self.attributes[@"regardingobjectid"] = RegardingObjectId;
}

- (NSString *)RegardingObjectIdName {
	return (NSString *)self.attributes[@"regardingobjectidname"];
}

- (void)setRegardingObjectIdName:(NSString *)RegardingObjectIdName {
	self.attributes[@"regardingobjectidname"] = RegardingObjectIdName;
}

- (NSString *)RegardingObjectIdYomiName {
	return (NSString *)self.attributes[@"regardingobjectidyominame"];
}

- (void)setRegardingObjectIdYomiName:(NSString *)RegardingObjectIdYomiName {
	self.attributes[@"regardingobjectidyominame"] = RegardingObjectIdYomiName;
}

- (NSString *)RegardingObjectTypeCode {
	return (NSString *)self.attributes[@"regardingobjecttypecode"];
}

- (void)setRegardingObjectTypeCode:(NSString *)RegardingObjectTypeCode {
	self.attributes[@"regardingobjecttypecode"] = RegardingObjectTypeCode;
}

- (CRMInteger *)ScheduledDurationMinutes {
	return (CRMInteger *)self.attributes[@"scheduleddurationminutes"];
}

- (void)setScheduledDurationMinutes:(CRMInteger *)ScheduledDurationMinutes {
	self.attributes[@"scheduleddurationminutes"] = ScheduledDurationMinutes;
}

- (NSDate *)ScheduledEnd {
	return (NSDate *)self.attributes[@"scheduledend"];
}

- (void)setScheduledEnd:(NSDate *)ScheduledEnd {
	self.attributes[@"scheduledend"] = ScheduledEnd;
}

- (NSDate *)ScheduledStart {
	return (NSDate *)self.attributes[@"scheduledstart"];
}

- (void)setScheduledStart:(NSDate *)ScheduledStart {
	self.attributes[@"scheduledstart"] = ScheduledStart;
}

- (EntityReference *)SenderMailboxId {
	return (EntityReference *)self.attributes[@"sendermailboxid"];
}

- (void)setSenderMailboxId:(EntityReference *)SenderMailboxId {
	self.attributes[@"sendermailboxid"] = SenderMailboxId;
}

- (NSString *)SenderMailboxIdName {
	return (NSString *)self.attributes[@"sendermailboxidname"];
}

- (void)setSenderMailboxIdName:(NSString *)SenderMailboxIdName {
	self.attributes[@"sendermailboxidname"] = SenderMailboxIdName;
}

- (NSDate *)SentOn {
	return (NSDate *)self.attributes[@"senton"];
}

- (void)setSentOn:(NSDate *)SentOn {
	self.attributes[@"senton"] = SentOn;
}

- (NSUUID *)SeriesId {
	return (NSUUID *)self.attributes[@"seriesid"];
}

- (void)setSeriesId:(NSUUID *)SeriesId {
	self.attributes[@"seriesid"] = SeriesId;
}

- (EntityReference *)ServiceId {
	return (EntityReference *)self.attributes[@"serviceid"];
}

- (void)setServiceId:(EntityReference *)ServiceId {
	self.attributes[@"serviceid"] = ServiceId;
}

- (NSString *)ServiceIdName {
	return (NSString *)self.attributes[@"serviceidname"];
}

- (void)setServiceIdName:(NSString *)ServiceIdName {
	self.attributes[@"serviceidname"] = ServiceIdName;
}

- (NSUUID *)StageId {
	return (NSUUID *)self.attributes[@"stageid"];
}

- (void)setStageId:(NSUUID *)StageId {
	self.attributes[@"stageid"] = StageId;
}

- (OptionSetValue *)StateCode {
	return (OptionSetValue *)self.attributes[@"statecode"];
}

- (void)setStateCode:(OptionSetValue *)StateCode {
	self.attributes[@"statecode"] = StateCode;
}

- (OptionSetValue *)StatusCode {
	return (OptionSetValue *)self.attributes[@"statuscode"];
}

- (void)setStatusCode:(OptionSetValue *)StatusCode {
	self.attributes[@"statuscode"] = StatusCode;
}

- (NSString *)Subject {
	return (NSString *)self.attributes[@"subject"];
}

- (void)setSubject:(NSString *)Subject {
	self.attributes[@"subject"] = Subject;
}

- (CRMInteger *)TimeZoneRuleVersionNumber {
	return (CRMInteger *)self.attributes[@"timezoneruleversionnumber"];
}

- (void)setTimeZoneRuleVersionNumber:(CRMInteger *)TimeZoneRuleVersionNumber {
	self.attributes[@"timezoneruleversionnumber"] = TimeZoneRuleVersionNumber;
}

- (EntityReference *)TransactionCurrencyId {
	return (EntityReference *)self.attributes[@"transactioncurrencyid"];
}

- (void)setTransactionCurrencyId:(EntityReference *)TransactionCurrencyId {
	self.attributes[@"transactioncurrencyid"] = TransactionCurrencyId;
}

- (NSString *)TransactionCurrencyIdName {
	return (NSString *)self.attributes[@"transactioncurrencyidname"];
}

- (void)setTransactionCurrencyIdName:(NSString *)TransactionCurrencyIdName {
	self.attributes[@"transactioncurrencyidname"] = TransactionCurrencyIdName;
}

- (NSString *)TraversedPath {
	return (NSString *)self.attributes[@"traversedpath"];
}

- (void)setTraversedPath:(NSString *)TraversedPath {
	self.attributes[@"traversedpath"] = TraversedPath;
}

- (CRMInteger *)UTCConversionTimeZoneCode {
	return (CRMInteger *)self.attributes[@"utcconversiontimezonecode"];
}

- (void)setUTCConversionTimeZoneCode:(CRMInteger *)UTCConversionTimeZoneCode {
	self.attributes[@"utcconversiontimezonecode"] = UTCConversionTimeZoneCode;
}

- (CRMBigInt *)VersionNumber {
	return (CRMBigInt *)self.attributes[@"versionnumber"];
}

- (void)setVersionNumber:(CRMBigInt *)VersionNumber {
	self.attributes[@"versionnumber"] = VersionNumber;
}

- (id)init
{
	return [super initWithLogicalName:@"activitypointer"];
}

@end


@implementation Contact

+ (NSString *)entityLogicalName
{
	return @"contact";
}

+ (NSNumber *)entityTypeCode
{
	return [NSNumber numberWithInt:2];
}

- (NSUUID *)id
{
	return (NSUUID *)self.attributes[@"contactid"];
}

- (void)setId:(NSUUID *)id
{
	self.attributes[@"contactid"] = id;
}

- (EntityReference *)AccountId {
	return (EntityReference *)self.attributes[@"accountid"];
}

- (void)setAccountId:(EntityReference *)AccountId {
	self.attributes[@"accountid"] = AccountId;
}

- (NSString *)AccountIdName {
	return (NSString *)self.attributes[@"accountidname"];
}

- (void)setAccountIdName:(NSString *)AccountIdName {
	self.attributes[@"accountidname"] = AccountIdName;
}

- (NSString *)AccountIdYomiName {
	return (NSString *)self.attributes[@"accountidyominame"];
}

- (void)setAccountIdYomiName:(NSString *)AccountIdYomiName {
	self.attributes[@"accountidyominame"] = AccountIdYomiName;
}

- (OptionSetValue *)AccountRoleCode {
	return (OptionSetValue *)self.attributes[@"accountrolecode"];
}

- (void)setAccountRoleCode:(OptionSetValue *)AccountRoleCode {
	self.attributes[@"accountrolecode"] = AccountRoleCode;
}

- (NSUUID *)Address1_AddressId {
	return (NSUUID *)self.attributes[@"address1_addressid"];
}

- (void)setAddress1_AddressId:(NSUUID *)Address1_AddressId {
	self.attributes[@"address1_addressid"] = Address1_AddressId;
}

- (OptionSetValue *)Address1_AddressTypeCode {
	return (OptionSetValue *)self.attributes[@"address1_addresstypecode"];
}

- (void)setAddress1_AddressTypeCode:(OptionSetValue *)Address1_AddressTypeCode {
	self.attributes[@"address1_addresstypecode"] = Address1_AddressTypeCode;
}

- (NSString *)Address1_City {
	return (NSString *)self.attributes[@"address1_city"];
}

- (void)setAddress1_City:(NSString *)Address1_City {
	self.attributes[@"address1_city"] = Address1_City;
}

- (NSString *)Address1_Composite {
	return (NSString *)self.attributes[@"address1_composite"];
}

- (void)setAddress1_Composite:(NSString *)Address1_Composite {
	self.attributes[@"address1_composite"] = Address1_Composite;
}

- (NSString *)Address1_Country {
	return (NSString *)self.attributes[@"address1_country"];
}

- (void)setAddress1_Country:(NSString *)Address1_Country {
	self.attributes[@"address1_country"] = Address1_Country;
}

- (NSString *)Address1_County {
	return (NSString *)self.attributes[@"address1_county"];
}

- (void)setAddress1_County:(NSString *)Address1_County {
	self.attributes[@"address1_county"] = Address1_County;
}

- (NSString *)Address1_Fax {
	return (NSString *)self.attributes[@"address1_fax"];
}

- (void)setAddress1_Fax:(NSString *)Address1_Fax {
	self.attributes[@"address1_fax"] = Address1_Fax;
}

- (OptionSetValue *)Address1_FreightTermsCode {
	return (OptionSetValue *)self.attributes[@"address1_freighttermscode"];
}

- (void)setAddress1_FreightTermsCode:(OptionSetValue *)Address1_FreightTermsCode {
	self.attributes[@"address1_freighttermscode"] = Address1_FreightTermsCode;
}

- (CRMDouble *)Address1_Latitude {
	return (CRMDouble *)self.attributes[@"address1_latitude"];
}

- (void)setAddress1_Latitude:(CRMDouble *)Address1_Latitude {
	self.attributes[@"address1_latitude"] = Address1_Latitude;
}

- (NSString *)Address1_Line1 {
	return (NSString *)self.attributes[@"address1_line1"];
}

- (void)setAddress1_Line1:(NSString *)Address1_Line1 {
	self.attributes[@"address1_line1"] = Address1_Line1;
}

- (NSString *)Address1_Line2 {
	return (NSString *)self.attributes[@"address1_line2"];
}

- (void)setAddress1_Line2:(NSString *)Address1_Line2 {
	self.attributes[@"address1_line2"] = Address1_Line2;
}

- (NSString *)Address1_Line3 {
	return (NSString *)self.attributes[@"address1_line3"];
}

- (void)setAddress1_Line3:(NSString *)Address1_Line3 {
	self.attributes[@"address1_line3"] = Address1_Line3;
}

- (CRMDouble *)Address1_Longitude {
	return (CRMDouble *)self.attributes[@"address1_longitude"];
}

- (void)setAddress1_Longitude:(CRMDouble *)Address1_Longitude {
	self.attributes[@"address1_longitude"] = Address1_Longitude;
}

- (NSString *)Address1_Name {
	return (NSString *)self.attributes[@"address1_name"];
}

- (void)setAddress1_Name:(NSString *)Address1_Name {
	self.attributes[@"address1_name"] = Address1_Name;
}

- (NSString *)Address1_PostalCode {
	return (NSString *)self.attributes[@"address1_postalcode"];
}

- (void)setAddress1_PostalCode:(NSString *)Address1_PostalCode {
	self.attributes[@"address1_postalcode"] = Address1_PostalCode;
}

- (NSString *)Address1_PostOfficeBox {
	return (NSString *)self.attributes[@"address1_postofficebox"];
}

- (void)setAddress1_PostOfficeBox:(NSString *)Address1_PostOfficeBox {
	self.attributes[@"address1_postofficebox"] = Address1_PostOfficeBox;
}

- (NSString *)Address1_PrimaryContactName {
	return (NSString *)self.attributes[@"address1_primarycontactname"];
}

- (void)setAddress1_PrimaryContactName:(NSString *)Address1_PrimaryContactName {
	self.attributes[@"address1_primarycontactname"] = Address1_PrimaryContactName;
}

- (OptionSetValue *)Address1_ShippingMethodCode {
	return (OptionSetValue *)self.attributes[@"address1_shippingmethodcode"];
}

- (void)setAddress1_ShippingMethodCode:(OptionSetValue *)Address1_ShippingMethodCode {
	self.attributes[@"address1_shippingmethodcode"] = Address1_ShippingMethodCode;
}

- (NSString *)Address1_StateOrProvince {
	return (NSString *)self.attributes[@"address1_stateorprovince"];
}

- (void)setAddress1_StateOrProvince:(NSString *)Address1_StateOrProvince {
	self.attributes[@"address1_stateorprovince"] = Address1_StateOrProvince;
}

- (NSString *)Address1_Telephone1 {
	return (NSString *)self.attributes[@"address1_telephone1"];
}

- (void)setAddress1_Telephone1:(NSString *)Address1_Telephone1 {
	self.attributes[@"address1_telephone1"] = Address1_Telephone1;
}

- (NSString *)Address1_Telephone2 {
	return (NSString *)self.attributes[@"address1_telephone2"];
}

- (void)setAddress1_Telephone2:(NSString *)Address1_Telephone2 {
	self.attributes[@"address1_telephone2"] = Address1_Telephone2;
}

- (NSString *)Address1_Telephone3 {
	return (NSString *)self.attributes[@"address1_telephone3"];
}

- (void)setAddress1_Telephone3:(NSString *)Address1_Telephone3 {
	self.attributes[@"address1_telephone3"] = Address1_Telephone3;
}

- (NSString *)Address1_UPSZone {
	return (NSString *)self.attributes[@"address1_upszone"];
}

- (void)setAddress1_UPSZone:(NSString *)Address1_UPSZone {
	self.attributes[@"address1_upszone"] = Address1_UPSZone;
}

- (CRMInteger *)Address1_UTCOffset {
	return (CRMInteger *)self.attributes[@"address1_utcoffset"];
}

- (void)setAddress1_UTCOffset:(CRMInteger *)Address1_UTCOffset {
	self.attributes[@"address1_utcoffset"] = Address1_UTCOffset;
}

- (NSUUID *)Address2_AddressId {
	return (NSUUID *)self.attributes[@"address2_addressid"];
}

- (void)setAddress2_AddressId:(NSUUID *)Address2_AddressId {
	self.attributes[@"address2_addressid"] = Address2_AddressId;
}

- (OptionSetValue *)Address2_AddressTypeCode {
	return (OptionSetValue *)self.attributes[@"address2_addresstypecode"];
}

- (void)setAddress2_AddressTypeCode:(OptionSetValue *)Address2_AddressTypeCode {
	self.attributes[@"address2_addresstypecode"] = Address2_AddressTypeCode;
}

- (NSString *)Address2_City {
	return (NSString *)self.attributes[@"address2_city"];
}

- (void)setAddress2_City:(NSString *)Address2_City {
	self.attributes[@"address2_city"] = Address2_City;
}

- (NSString *)Address2_Composite {
	return (NSString *)self.attributes[@"address2_composite"];
}

- (void)setAddress2_Composite:(NSString *)Address2_Composite {
	self.attributes[@"address2_composite"] = Address2_Composite;
}

- (NSString *)Address2_Country {
	return (NSString *)self.attributes[@"address2_country"];
}

- (void)setAddress2_Country:(NSString *)Address2_Country {
	self.attributes[@"address2_country"] = Address2_Country;
}

- (NSString *)Address2_County {
	return (NSString *)self.attributes[@"address2_county"];
}

- (void)setAddress2_County:(NSString *)Address2_County {
	self.attributes[@"address2_county"] = Address2_County;
}

- (NSString *)Address2_Fax {
	return (NSString *)self.attributes[@"address2_fax"];
}

- (void)setAddress2_Fax:(NSString *)Address2_Fax {
	self.attributes[@"address2_fax"] = Address2_Fax;
}

- (OptionSetValue *)Address2_FreightTermsCode {
	return (OptionSetValue *)self.attributes[@"address2_freighttermscode"];
}

- (void)setAddress2_FreightTermsCode:(OptionSetValue *)Address2_FreightTermsCode {
	self.attributes[@"address2_freighttermscode"] = Address2_FreightTermsCode;
}

- (CRMDouble *)Address2_Latitude {
	return (CRMDouble *)self.attributes[@"address2_latitude"];
}

- (void)setAddress2_Latitude:(CRMDouble *)Address2_Latitude {
	self.attributes[@"address2_latitude"] = Address2_Latitude;
}

- (NSString *)Address2_Line1 {
	return (NSString *)self.attributes[@"address2_line1"];
}

- (void)setAddress2_Line1:(NSString *)Address2_Line1 {
	self.attributes[@"address2_line1"] = Address2_Line1;
}

- (NSString *)Address2_Line2 {
	return (NSString *)self.attributes[@"address2_line2"];
}

- (void)setAddress2_Line2:(NSString *)Address2_Line2 {
	self.attributes[@"address2_line2"] = Address2_Line2;
}

- (NSString *)Address2_Line3 {
	return (NSString *)self.attributes[@"address2_line3"];
}

- (void)setAddress2_Line3:(NSString *)Address2_Line3 {
	self.attributes[@"address2_line3"] = Address2_Line3;
}

- (CRMDouble *)Address2_Longitude {
	return (CRMDouble *)self.attributes[@"address2_longitude"];
}

- (void)setAddress2_Longitude:(CRMDouble *)Address2_Longitude {
	self.attributes[@"address2_longitude"] = Address2_Longitude;
}

- (NSString *)Address2_Name {
	return (NSString *)self.attributes[@"address2_name"];
}

- (void)setAddress2_Name:(NSString *)Address2_Name {
	self.attributes[@"address2_name"] = Address2_Name;
}

- (NSString *)Address2_PostalCode {
	return (NSString *)self.attributes[@"address2_postalcode"];
}

- (void)setAddress2_PostalCode:(NSString *)Address2_PostalCode {
	self.attributes[@"address2_postalcode"] = Address2_PostalCode;
}

- (NSString *)Address2_PostOfficeBox {
	return (NSString *)self.attributes[@"address2_postofficebox"];
}

- (void)setAddress2_PostOfficeBox:(NSString *)Address2_PostOfficeBox {
	self.attributes[@"address2_postofficebox"] = Address2_PostOfficeBox;
}

- (NSString *)Address2_PrimaryContactName {
	return (NSString *)self.attributes[@"address2_primarycontactname"];
}

- (void)setAddress2_PrimaryContactName:(NSString *)Address2_PrimaryContactName {
	self.attributes[@"address2_primarycontactname"] = Address2_PrimaryContactName;
}

- (OptionSetValue *)Address2_ShippingMethodCode {
	return (OptionSetValue *)self.attributes[@"address2_shippingmethodcode"];
}

- (void)setAddress2_ShippingMethodCode:(OptionSetValue *)Address2_ShippingMethodCode {
	self.attributes[@"address2_shippingmethodcode"] = Address2_ShippingMethodCode;
}

- (NSString *)Address2_StateOrProvince {
	return (NSString *)self.attributes[@"address2_stateorprovince"];
}

- (void)setAddress2_StateOrProvince:(NSString *)Address2_StateOrProvince {
	self.attributes[@"address2_stateorprovince"] = Address2_StateOrProvince;
}

- (NSString *)Address2_Telephone1 {
	return (NSString *)self.attributes[@"address2_telephone1"];
}

- (void)setAddress2_Telephone1:(NSString *)Address2_Telephone1 {
	self.attributes[@"address2_telephone1"] = Address2_Telephone1;
}

- (NSString *)Address2_Telephone2 {
	return (NSString *)self.attributes[@"address2_telephone2"];
}

- (void)setAddress2_Telephone2:(NSString *)Address2_Telephone2 {
	self.attributes[@"address2_telephone2"] = Address2_Telephone2;
}

- (NSString *)Address2_Telephone3 {
	return (NSString *)self.attributes[@"address2_telephone3"];
}

- (void)setAddress2_Telephone3:(NSString *)Address2_Telephone3 {
	self.attributes[@"address2_telephone3"] = Address2_Telephone3;
}

- (NSString *)Address2_UPSZone {
	return (NSString *)self.attributes[@"address2_upszone"];
}

- (void)setAddress2_UPSZone:(NSString *)Address2_UPSZone {
	self.attributes[@"address2_upszone"] = Address2_UPSZone;
}

- (CRMInteger *)Address2_UTCOffset {
	return (CRMInteger *)self.attributes[@"address2_utcoffset"];
}

- (void)setAddress2_UTCOffset:(CRMInteger *)Address2_UTCOffset {
	self.attributes[@"address2_utcoffset"] = Address2_UTCOffset;
}

- (NSUUID *)Address3_AddressId {
	return (NSUUID *)self.attributes[@"address3_addressid"];
}

- (void)setAddress3_AddressId:(NSUUID *)Address3_AddressId {
	self.attributes[@"address3_addressid"] = Address3_AddressId;
}

- (OptionSetValue *)Address3_AddressTypeCode {
	return (OptionSetValue *)self.attributes[@"address3_addresstypecode"];
}

- (void)setAddress3_AddressTypeCode:(OptionSetValue *)Address3_AddressTypeCode {
	self.attributes[@"address3_addresstypecode"] = Address3_AddressTypeCode;
}

- (NSString *)Address3_City {
	return (NSString *)self.attributes[@"address3_city"];
}

- (void)setAddress3_City:(NSString *)Address3_City {
	self.attributes[@"address3_city"] = Address3_City;
}

- (NSString *)Address3_Composite {
	return (NSString *)self.attributes[@"address3_composite"];
}

- (void)setAddress3_Composite:(NSString *)Address3_Composite {
	self.attributes[@"address3_composite"] = Address3_Composite;
}

- (NSString *)Address3_Country {
	return (NSString *)self.attributes[@"address3_country"];
}

- (void)setAddress3_Country:(NSString *)Address3_Country {
	self.attributes[@"address3_country"] = Address3_Country;
}

- (NSString *)Address3_County {
	return (NSString *)self.attributes[@"address3_county"];
}

- (void)setAddress3_County:(NSString *)Address3_County {
	self.attributes[@"address3_county"] = Address3_County;
}

- (NSString *)Address3_Fax {
	return (NSString *)self.attributes[@"address3_fax"];
}

- (void)setAddress3_Fax:(NSString *)Address3_Fax {
	self.attributes[@"address3_fax"] = Address3_Fax;
}

- (OptionSetValue *)Address3_FreightTermsCode {
	return (OptionSetValue *)self.attributes[@"address3_freighttermscode"];
}

- (void)setAddress3_FreightTermsCode:(OptionSetValue *)Address3_FreightTermsCode {
	self.attributes[@"address3_freighttermscode"] = Address3_FreightTermsCode;
}

- (CRMDouble *)Address3_Latitude {
	return (CRMDouble *)self.attributes[@"address3_latitude"];
}

- (void)setAddress3_Latitude:(CRMDouble *)Address3_Latitude {
	self.attributes[@"address3_latitude"] = Address3_Latitude;
}

- (NSString *)Address3_Line1 {
	return (NSString *)self.attributes[@"address3_line1"];
}

- (void)setAddress3_Line1:(NSString *)Address3_Line1 {
	self.attributes[@"address3_line1"] = Address3_Line1;
}

- (NSString *)Address3_Line2 {
	return (NSString *)self.attributes[@"address3_line2"];
}

- (void)setAddress3_Line2:(NSString *)Address3_Line2 {
	self.attributes[@"address3_line2"] = Address3_Line2;
}

- (NSString *)Address3_Line3 {
	return (NSString *)self.attributes[@"address3_line3"];
}

- (void)setAddress3_Line3:(NSString *)Address3_Line3 {
	self.attributes[@"address3_line3"] = Address3_Line3;
}

- (CRMDouble *)Address3_Longitude {
	return (CRMDouble *)self.attributes[@"address3_longitude"];
}

- (void)setAddress3_Longitude:(CRMDouble *)Address3_Longitude {
	self.attributes[@"address3_longitude"] = Address3_Longitude;
}

- (NSString *)Address3_Name {
	return (NSString *)self.attributes[@"address3_name"];
}

- (void)setAddress3_Name:(NSString *)Address3_Name {
	self.attributes[@"address3_name"] = Address3_Name;
}

- (NSString *)Address3_PostalCode {
	return (NSString *)self.attributes[@"address3_postalcode"];
}

- (void)setAddress3_PostalCode:(NSString *)Address3_PostalCode {
	self.attributes[@"address3_postalcode"] = Address3_PostalCode;
}

- (NSString *)Address3_PostOfficeBox {
	return (NSString *)self.attributes[@"address3_postofficebox"];
}

- (void)setAddress3_PostOfficeBox:(NSString *)Address3_PostOfficeBox {
	self.attributes[@"address3_postofficebox"] = Address3_PostOfficeBox;
}

- (NSString *)Address3_PrimaryContactName {
	return (NSString *)self.attributes[@"address3_primarycontactname"];
}

- (void)setAddress3_PrimaryContactName:(NSString *)Address3_PrimaryContactName {
	self.attributes[@"address3_primarycontactname"] = Address3_PrimaryContactName;
}

- (OptionSetValue *)Address3_ShippingMethodCode {
	return (OptionSetValue *)self.attributes[@"address3_shippingmethodcode"];
}

- (void)setAddress3_ShippingMethodCode:(OptionSetValue *)Address3_ShippingMethodCode {
	self.attributes[@"address3_shippingmethodcode"] = Address3_ShippingMethodCode;
}

- (NSString *)Address3_StateOrProvince {
	return (NSString *)self.attributes[@"address3_stateorprovince"];
}

- (void)setAddress3_StateOrProvince:(NSString *)Address3_StateOrProvince {
	self.attributes[@"address3_stateorprovince"] = Address3_StateOrProvince;
}

- (NSString *)Address3_Telephone1 {
	return (NSString *)self.attributes[@"address3_telephone1"];
}

- (void)setAddress3_Telephone1:(NSString *)Address3_Telephone1 {
	self.attributes[@"address3_telephone1"] = Address3_Telephone1;
}

- (NSString *)Address3_Telephone2 {
	return (NSString *)self.attributes[@"address3_telephone2"];
}

- (void)setAddress3_Telephone2:(NSString *)Address3_Telephone2 {
	self.attributes[@"address3_telephone2"] = Address3_Telephone2;
}

- (NSString *)Address3_Telephone3 {
	return (NSString *)self.attributes[@"address3_telephone3"];
}

- (void)setAddress3_Telephone3:(NSString *)Address3_Telephone3 {
	self.attributes[@"address3_telephone3"] = Address3_Telephone3;
}

- (NSString *)Address3_UPSZone {
	return (NSString *)self.attributes[@"address3_upszone"];
}

- (void)setAddress3_UPSZone:(NSString *)Address3_UPSZone {
	self.attributes[@"address3_upszone"] = Address3_UPSZone;
}

- (CRMInteger *)Address3_UTCOffset {
	return (CRMInteger *)self.attributes[@"address3_utcoffset"];
}

- (void)setAddress3_UTCOffset:(CRMInteger *)Address3_UTCOffset {
	self.attributes[@"address3_utcoffset"] = Address3_UTCOffset;
}

- (Money *)Aging30 {
	return (Money *)self.attributes[@"aging30"];
}

- (void)setAging30:(Money *)Aging30 {
	self.attributes[@"aging30"] = Aging30;
}

- (Money *)Aging30_Base {
	return (Money *)self.attributes[@"aging30_base"];
}

- (void)setAging30_Base:(Money *)Aging30_Base {
	self.attributes[@"aging30_base"] = Aging30_Base;
}

- (Money *)Aging60 {
	return (Money *)self.attributes[@"aging60"];
}

- (void)setAging60:(Money *)Aging60 {
	self.attributes[@"aging60"] = Aging60;
}

- (Money *)Aging60_Base {
	return (Money *)self.attributes[@"aging60_base"];
}

- (void)setAging60_Base:(Money *)Aging60_Base {
	self.attributes[@"aging60_base"] = Aging60_Base;
}

- (Money *)Aging90 {
	return (Money *)self.attributes[@"aging90"];
}

- (void)setAging90:(Money *)Aging90 {
	self.attributes[@"aging90"] = Aging90;
}

- (Money *)Aging90_Base {
	return (Money *)self.attributes[@"aging90_base"];
}

- (void)setAging90_Base:(Money *)Aging90_Base {
	self.attributes[@"aging90_base"] = Aging90_Base;
}

- (NSDate *)Anniversary {
	return (NSDate *)self.attributes[@"anniversary"];
}

- (void)setAnniversary:(NSDate *)Anniversary {
	self.attributes[@"anniversary"] = Anniversary;
}

- (Money *)AnnualIncome {
	return (Money *)self.attributes[@"annualincome"];
}

- (void)setAnnualIncome:(Money *)AnnualIncome {
	self.attributes[@"annualincome"] = AnnualIncome;
}

- (Money *)AnnualIncome_Base {
	return (Money *)self.attributes[@"annualincome_base"];
}

- (void)setAnnualIncome_Base:(Money *)AnnualIncome_Base {
	self.attributes[@"annualincome_base"] = AnnualIncome_Base;
}

- (NSString *)AssistantName {
	return (NSString *)self.attributes[@"assistantname"];
}

- (void)setAssistantName:(NSString *)AssistantName {
	self.attributes[@"assistantname"] = AssistantName;
}

- (NSString *)AssistantPhone {
	return (NSString *)self.attributes[@"assistantphone"];
}

- (void)setAssistantPhone:(NSString *)AssistantPhone {
	self.attributes[@"assistantphone"] = AssistantPhone;
}

- (NSDate *)BirthDate {
	return (NSDate *)self.attributes[@"birthdate"];
}

- (void)setBirthDate:(NSDate *)BirthDate {
	self.attributes[@"birthdate"] = BirthDate;
}

- (NSString *)Business2 {
	return (NSString *)self.attributes[@"business2"];
}

- (void)setBusiness2:(NSString *)Business2 {
	self.attributes[@"business2"] = Business2;
}

- (NSString *)Callback {
	return (NSString *)self.attributes[@"callback"];
}

- (void)setCallback:(NSString *)Callback {
	self.attributes[@"callback"] = Callback;
}

- (NSString *)ChildrensNames {
	return (NSString *)self.attributes[@"childrensnames"];
}

- (void)setChildrensNames:(NSString *)ChildrensNames {
	self.attributes[@"childrensnames"] = ChildrensNames;
}

- (NSString *)Company {
	return (NSString *)self.attributes[@"company"];
}

- (void)setCompany:(NSString *)Company {
	self.attributes[@"company"] = Company;
}

- (NSUUID *)ContactId {
	return (NSUUID *)self.attributes[@"contactid"];
}

- (void)setContactId:(NSUUID *)ContactId {
	self.attributes[@"contactid"] = ContactId;
}

- (EntityReference *)CreatedBy {
	return (EntityReference *)self.attributes[@"createdby"];
}

- (void)setCreatedBy:(EntityReference *)CreatedBy {
	self.attributes[@"createdby"] = CreatedBy;
}

- (NSString *)CreatedByName {
	return (NSString *)self.attributes[@"createdbyname"];
}

- (void)setCreatedByName:(NSString *)CreatedByName {
	self.attributes[@"createdbyname"] = CreatedByName;
}

- (NSString *)CreatedByYomiName {
	return (NSString *)self.attributes[@"createdbyyominame"];
}

- (void)setCreatedByYomiName:(NSString *)CreatedByYomiName {
	self.attributes[@"createdbyyominame"] = CreatedByYomiName;
}

- (NSDate *)CreatedOn {
	return (NSDate *)self.attributes[@"createdon"];
}

- (void)setCreatedOn:(NSDate *)CreatedOn {
	self.attributes[@"createdon"] = CreatedOn;
}

- (EntityReference *)CreatedOnBehalfBy {
	return (EntityReference *)self.attributes[@"createdonbehalfby"];
}

- (void)setCreatedOnBehalfBy:(EntityReference *)CreatedOnBehalfBy {
	self.attributes[@"createdonbehalfby"] = CreatedOnBehalfBy;
}

- (NSString *)CreatedOnBehalfByName {
	return (NSString *)self.attributes[@"createdonbehalfbyname"];
}

- (void)setCreatedOnBehalfByName:(NSString *)CreatedOnBehalfByName {
	self.attributes[@"createdonbehalfbyname"] = CreatedOnBehalfByName;
}

- (NSString *)CreatedOnBehalfByYomiName {
	return (NSString *)self.attributes[@"createdonbehalfbyyominame"];
}

- (void)setCreatedOnBehalfByYomiName:(NSString *)CreatedOnBehalfByYomiName {
	self.attributes[@"createdonbehalfbyyominame"] = CreatedOnBehalfByYomiName;
}

- (Money *)CreditLimit {
	return (Money *)self.attributes[@"creditlimit"];
}

- (void)setCreditLimit:(Money *)CreditLimit {
	self.attributes[@"creditlimit"] = CreditLimit;
}

- (Money *)CreditLimit_Base {
	return (Money *)self.attributes[@"creditlimit_base"];
}

- (void)setCreditLimit_Base:(Money *)CreditLimit_Base {
	self.attributes[@"creditlimit_base"] = CreditLimit_Base;
}

- (CRMBoolean *)CreditOnHold {
	return (CRMBoolean *)self.attributes[@"creditonhold"];
}

- (void)setCreditOnHold:(CRMBoolean *)CreditOnHold {
	self.attributes[@"creditonhold"] = CreditOnHold;
}

- (OptionSetValue *)CustomerSizeCode {
	return (OptionSetValue *)self.attributes[@"customersizecode"];
}

- (void)setCustomerSizeCode:(OptionSetValue *)CustomerSizeCode {
	self.attributes[@"customersizecode"] = CustomerSizeCode;
}

- (OptionSetValue *)CustomerTypeCode {
	return (OptionSetValue *)self.attributes[@"customertypecode"];
}

- (void)setCustomerTypeCode:(OptionSetValue *)CustomerTypeCode {
	self.attributes[@"customertypecode"] = CustomerTypeCode;
}

- (EntityReference *)DefaultPriceLevelId {
	return (EntityReference *)self.attributes[@"defaultpricelevelid"];
}

- (void)setDefaultPriceLevelId:(EntityReference *)DefaultPriceLevelId {
	self.attributes[@"defaultpricelevelid"] = DefaultPriceLevelId;
}

- (NSString *)DefaultPriceLevelIdName {
	return (NSString *)self.attributes[@"defaultpricelevelidname"];
}

- (void)setDefaultPriceLevelIdName:(NSString *)DefaultPriceLevelIdName {
	self.attributes[@"defaultpricelevelidname"] = DefaultPriceLevelIdName;
}

- (NSString *)Department {
	return (NSString *)self.attributes[@"department"];
}

- (void)setDepartment:(NSString *)Department {
	self.attributes[@"department"] = Department;
}

- (NSString *)Description {
	return (NSString *)self.attributes[@"description"];
}

- (void)setDescription:(NSString *)Description {
	self.attributes[@"description"] = Description;
}

- (CRMBoolean *)DoNotBulkEMail {
	return (CRMBoolean *)self.attributes[@"donotbulkemail"];
}

- (void)setDoNotBulkEMail:(CRMBoolean *)DoNotBulkEMail {
	self.attributes[@"donotbulkemail"] = DoNotBulkEMail;
}

- (CRMBoolean *)DoNotBulkPostalMail {
	return (CRMBoolean *)self.attributes[@"donotbulkpostalmail"];
}

- (void)setDoNotBulkPostalMail:(CRMBoolean *)DoNotBulkPostalMail {
	self.attributes[@"donotbulkpostalmail"] = DoNotBulkPostalMail;
}

- (CRMBoolean *)DoNotEMail {
	return (CRMBoolean *)self.attributes[@"donotemail"];
}

- (void)setDoNotEMail:(CRMBoolean *)DoNotEMail {
	self.attributes[@"donotemail"] = DoNotEMail;
}

- (CRMBoolean *)DoNotFax {
	return (CRMBoolean *)self.attributes[@"donotfax"];
}

- (void)setDoNotFax:(CRMBoolean *)DoNotFax {
	self.attributes[@"donotfax"] = DoNotFax;
}

- (CRMBoolean *)DoNotPhone {
	return (CRMBoolean *)self.attributes[@"donotphone"];
}

- (void)setDoNotPhone:(CRMBoolean *)DoNotPhone {
	self.attributes[@"donotphone"] = DoNotPhone;
}

- (CRMBoolean *)DoNotPostalMail {
	return (CRMBoolean *)self.attributes[@"donotpostalmail"];
}

- (void)setDoNotPostalMail:(CRMBoolean *)DoNotPostalMail {
	self.attributes[@"donotpostalmail"] = DoNotPostalMail;
}

- (CRMBoolean *)DoNotSendMM {
	return (CRMBoolean *)self.attributes[@"donotsendmm"];
}

- (void)setDoNotSendMM:(CRMBoolean *)DoNotSendMM {
	self.attributes[@"donotsendmm"] = DoNotSendMM;
}

- (OptionSetValue *)EducationCode {
	return (OptionSetValue *)self.attributes[@"educationcode"];
}

- (void)setEducationCode:(OptionSetValue *)EducationCode {
	self.attributes[@"educationcode"] = EducationCode;
}

- (NSString *)EMailAddress1 {
	return (NSString *)self.attributes[@"emailaddress1"];
}

- (void)setEMailAddress1:(NSString *)EMailAddress1 {
	self.attributes[@"emailaddress1"] = EMailAddress1;
}

- (NSString *)EMailAddress2 {
	return (NSString *)self.attributes[@"emailaddress2"];
}

- (void)setEMailAddress2:(NSString *)EMailAddress2 {
	self.attributes[@"emailaddress2"] = EMailAddress2;
}

- (NSString *)EMailAddress3 {
	return (NSString *)self.attributes[@"emailaddress3"];
}

- (void)setEMailAddress3:(NSString *)EMailAddress3 {
	self.attributes[@"emailaddress3"] = EMailAddress3;
}

- (NSString *)EmployeeId {
	return (NSString *)self.attributes[@"employeeid"];
}

- (void)setEmployeeId:(NSString *)EmployeeId {
	self.attributes[@"employeeid"] = EmployeeId;
}

- (CRMBigInt *)EntityImage_Timestamp {
	return (CRMBigInt *)self.attributes[@"entityimage_timestamp"];
}

- (void)setEntityImage_Timestamp:(CRMBigInt *)EntityImage_Timestamp {
	self.attributes[@"entityimage_timestamp"] = EntityImage_Timestamp;
}

- (NSString *)EntityImage_URL {
	return (NSString *)self.attributes[@"entityimage_url"];
}

- (void)setEntityImage_URL:(NSString *)EntityImage_URL {
	self.attributes[@"entityimage_url"] = EntityImage_URL;
}

- (NSUUID *)EntityImageId {
	return (NSUUID *)self.attributes[@"entityimageid"];
}

- (void)setEntityImageId:(NSUUID *)EntityImageId {
	self.attributes[@"entityimageid"] = EntityImageId;
}

- (NSDecimalNumber *)ExchangeRate {
	return (NSDecimalNumber *)self.attributes[@"exchangerate"];
}

- (void)setExchangeRate:(NSDecimalNumber *)ExchangeRate {
	self.attributes[@"exchangerate"] = ExchangeRate;
}

- (NSString *)ExternalUserIdentifier {
	return (NSString *)self.attributes[@"externaluseridentifier"];
}

- (void)setExternalUserIdentifier:(NSString *)ExternalUserIdentifier {
	self.attributes[@"externaluseridentifier"] = ExternalUserIdentifier;
}

- (OptionSetValue *)FamilyStatusCode {
	return (OptionSetValue *)self.attributes[@"familystatuscode"];
}

- (void)setFamilyStatusCode:(OptionSetValue *)FamilyStatusCode {
	self.attributes[@"familystatuscode"] = FamilyStatusCode;
}

- (NSString *)Fax {
	return (NSString *)self.attributes[@"fax"];
}

- (void)setFax:(NSString *)Fax {
	self.attributes[@"fax"] = Fax;
}

- (NSString *)FirstName {
	return (NSString *)self.attributes[@"firstname"];
}

- (void)setFirstName:(NSString *)FirstName {
	self.attributes[@"firstname"] = FirstName;
}

- (NSString *)FtpSiteUrl {
	return (NSString *)self.attributes[@"ftpsiteurl"];
}

- (void)setFtpSiteUrl:(NSString *)FtpSiteUrl {
	self.attributes[@"ftpsiteurl"] = FtpSiteUrl;
}

- (NSString *)FullName {
	return (NSString *)self.attributes[@"fullname"];
}

- (void)setFullName:(NSString *)FullName {
	self.attributes[@"fullname"] = FullName;
}

- (OptionSetValue *)GenderCode {
	return (OptionSetValue *)self.attributes[@"gendercode"];
}

- (void)setGenderCode:(OptionSetValue *)GenderCode {
	self.attributes[@"gendercode"] = GenderCode;
}

- (NSString *)GovernmentId {
	return (NSString *)self.attributes[@"governmentid"];
}

- (void)setGovernmentId:(NSString *)GovernmentId {
	self.attributes[@"governmentid"] = GovernmentId;
}

- (OptionSetValue *)HasChildrenCode {
	return (OptionSetValue *)self.attributes[@"haschildrencode"];
}

- (void)setHasChildrenCode:(OptionSetValue *)HasChildrenCode {
	self.attributes[@"haschildrencode"] = HasChildrenCode;
}

- (NSString *)Home2 {
	return (NSString *)self.attributes[@"home2"];
}

- (void)setHome2:(NSString *)Home2 {
	self.attributes[@"home2"] = Home2;
}

- (CRMInteger *)ImportSequenceNumber {
	return (CRMInteger *)self.attributes[@"importsequencenumber"];
}

- (void)setImportSequenceNumber:(CRMInteger *)ImportSequenceNumber {
	self.attributes[@"importsequencenumber"] = ImportSequenceNumber;
}

- (CRMBoolean *)IsAutoCreate {
	return (CRMBoolean *)self.attributes[@"isautocreate"];
}

- (void)setIsAutoCreate:(CRMBoolean *)IsAutoCreate {
	self.attributes[@"isautocreate"] = IsAutoCreate;
}

- (CRMBoolean *)IsBackofficeCustomer {
	return (CRMBoolean *)self.attributes[@"isbackofficecustomer"];
}

- (void)setIsBackofficeCustomer:(CRMBoolean *)IsBackofficeCustomer {
	self.attributes[@"isbackofficecustomer"] = IsBackofficeCustomer;
}

- (CRMBoolean *)IsPrivate {
	return (CRMBoolean *)self.attributes[@"isprivate"];
}

- (void)setIsPrivate:(CRMBoolean *)IsPrivate {
	self.attributes[@"isprivate"] = IsPrivate;
}

- (NSString *)JobTitle {
	return (NSString *)self.attributes[@"jobtitle"];
}

- (void)setJobTitle:(NSString *)JobTitle {
	self.attributes[@"jobtitle"] = JobTitle;
}

- (NSString *)LastName {
	return (NSString *)self.attributes[@"lastname"];
}

- (void)setLastName:(NSString *)LastName {
	self.attributes[@"lastname"] = LastName;
}

- (NSDate *)LastUsedInCampaign {
	return (NSDate *)self.attributes[@"lastusedincampaign"];
}

- (void)setLastUsedInCampaign:(NSDate *)LastUsedInCampaign {
	self.attributes[@"lastusedincampaign"] = LastUsedInCampaign;
}

- (OptionSetValue *)LeadSourceCode {
	return (OptionSetValue *)self.attributes[@"leadsourcecode"];
}

- (void)setLeadSourceCode:(OptionSetValue *)LeadSourceCode {
	self.attributes[@"leadsourcecode"] = LeadSourceCode;
}

- (NSString *)ManagerName {
	return (NSString *)self.attributes[@"managername"];
}

- (void)setManagerName:(NSString *)ManagerName {
	self.attributes[@"managername"] = ManagerName;
}

- (NSString *)ManagerPhone {
	return (NSString *)self.attributes[@"managerphone"];
}

- (void)setManagerPhone:(NSString *)ManagerPhone {
	self.attributes[@"managerphone"] = ManagerPhone;
}

- (NSString *)MasterContactIdName {
	return (NSString *)self.attributes[@"mastercontactidname"];
}

- (void)setMasterContactIdName:(NSString *)MasterContactIdName {
	self.attributes[@"mastercontactidname"] = MasterContactIdName;
}

- (NSString *)MasterContactIdYomiName {
	return (NSString *)self.attributes[@"mastercontactidyominame"];
}

- (void)setMasterContactIdYomiName:(NSString *)MasterContactIdYomiName {
	self.attributes[@"mastercontactidyominame"] = MasterContactIdYomiName;
}

- (EntityReference *)MasterId {
	return (EntityReference *)self.attributes[@"masterid"];
}

- (void)setMasterId:(EntityReference *)MasterId {
	self.attributes[@"masterid"] = MasterId;
}

- (CRMBoolean *)Merged {
	return (CRMBoolean *)self.attributes[@"merged"];
}

- (void)setMerged:(CRMBoolean *)Merged {
	self.attributes[@"merged"] = Merged;
}

- (NSString *)MiddleName {
	return (NSString *)self.attributes[@"middlename"];
}

- (void)setMiddleName:(NSString *)MiddleName {
	self.attributes[@"middlename"] = MiddleName;
}

- (NSString *)MobilePhone {
	return (NSString *)self.attributes[@"mobilephone"];
}

- (void)setMobilePhone:(NSString *)MobilePhone {
	self.attributes[@"mobilephone"] = MobilePhone;
}

- (EntityReference *)ModifiedBy {
	return (EntityReference *)self.attributes[@"modifiedby"];
}

- (void)setModifiedBy:(EntityReference *)ModifiedBy {
	self.attributes[@"modifiedby"] = ModifiedBy;
}

- (NSString *)ModifiedByName {
	return (NSString *)self.attributes[@"modifiedbyname"];
}

- (void)setModifiedByName:(NSString *)ModifiedByName {
	self.attributes[@"modifiedbyname"] = ModifiedByName;
}

- (NSString *)ModifiedByYomiName {
	return (NSString *)self.attributes[@"modifiedbyyominame"];
}

- (void)setModifiedByYomiName:(NSString *)ModifiedByYomiName {
	self.attributes[@"modifiedbyyominame"] = ModifiedByYomiName;
}

- (NSDate *)ModifiedOn {
	return (NSDate *)self.attributes[@"modifiedon"];
}

- (void)setModifiedOn:(NSDate *)ModifiedOn {
	self.attributes[@"modifiedon"] = ModifiedOn;
}

- (EntityReference *)ModifiedOnBehalfBy {
	return (EntityReference *)self.attributes[@"modifiedonbehalfby"];
}

- (void)setModifiedOnBehalfBy:(EntityReference *)ModifiedOnBehalfBy {
	self.attributes[@"modifiedonbehalfby"] = ModifiedOnBehalfBy;
}

- (NSString *)ModifiedOnBehalfByName {
	return (NSString *)self.attributes[@"modifiedonbehalfbyname"];
}

- (void)setModifiedOnBehalfByName:(NSString *)ModifiedOnBehalfByName {
	self.attributes[@"modifiedonbehalfbyname"] = ModifiedOnBehalfByName;
}

- (NSString *)ModifiedOnBehalfByYomiName {
	return (NSString *)self.attributes[@"modifiedonbehalfbyyominame"];
}

- (void)setModifiedOnBehalfByYomiName:(NSString *)ModifiedOnBehalfByYomiName {
	self.attributes[@"modifiedonbehalfbyyominame"] = ModifiedOnBehalfByYomiName;
}

- (NSString *)NickName {
	return (NSString *)self.attributes[@"nickname"];
}

- (void)setNickName:(NSString *)NickName {
	self.attributes[@"nickname"] = NickName;
}

- (CRMInteger *)NumberOfChildren {
	return (CRMInteger *)self.attributes[@"numberofchildren"];
}

- (void)setNumberOfChildren:(CRMInteger *)NumberOfChildren {
	self.attributes[@"numberofchildren"] = NumberOfChildren;
}

- (EntityReference *)OriginatingLeadId {
	return (EntityReference *)self.attributes[@"originatingleadid"];
}

- (void)setOriginatingLeadId:(EntityReference *)OriginatingLeadId {
	self.attributes[@"originatingleadid"] = OriginatingLeadId;
}

- (NSString *)OriginatingLeadIdName {
	return (NSString *)self.attributes[@"originatingleadidname"];
}

- (void)setOriginatingLeadIdName:(NSString *)OriginatingLeadIdName {
	self.attributes[@"originatingleadidname"] = OriginatingLeadIdName;
}

- (NSString *)OriginatingLeadIdYomiName {
	return (NSString *)self.attributes[@"originatingleadidyominame"];
}

- (void)setOriginatingLeadIdYomiName:(NSString *)OriginatingLeadIdYomiName {
	self.attributes[@"originatingleadidyominame"] = OriginatingLeadIdYomiName;
}

- (NSDate *)OverriddenCreatedOn {
	return (NSDate *)self.attributes[@"overriddencreatedon"];
}

- (void)setOverriddenCreatedOn:(NSDate *)OverriddenCreatedOn {
	self.attributes[@"overriddencreatedon"] = OverriddenCreatedOn;
}

- (EntityReference *)OwnerId {
	return (EntityReference *)self.attributes[@"ownerid"];
}

- (void)setOwnerId:(EntityReference *)OwnerId {
	self.attributes[@"ownerid"] = OwnerId;
}

- (NSString *)OwnerIdName {
	return (NSString *)self.attributes[@"owneridname"];
}

- (void)setOwnerIdName:(NSString *)OwnerIdName {
	self.attributes[@"owneridname"] = OwnerIdName;
}

- (NSString *)OwnerIdType {
	return (NSString *)self.attributes[@"owneridtype"];
}

- (void)setOwnerIdType:(NSString *)OwnerIdType {
	self.attributes[@"owneridtype"] = OwnerIdType;
}

- (NSString *)OwnerIdYomiName {
	return (NSString *)self.attributes[@"owneridyominame"];
}

- (void)setOwnerIdYomiName:(NSString *)OwnerIdYomiName {
	self.attributes[@"owneridyominame"] = OwnerIdYomiName;
}

- (EntityReference *)OwningBusinessUnit {
	return (EntityReference *)self.attributes[@"owningbusinessunit"];
}

- (void)setOwningBusinessUnit:(EntityReference *)OwningBusinessUnit {
	self.attributes[@"owningbusinessunit"] = OwningBusinessUnit;
}

- (EntityReference *)OwningTeam {
	return (EntityReference *)self.attributes[@"owningteam"];
}

- (void)setOwningTeam:(EntityReference *)OwningTeam {
	self.attributes[@"owningteam"] = OwningTeam;
}

- (EntityReference *)OwningUser {
	return (EntityReference *)self.attributes[@"owninguser"];
}

- (void)setOwningUser:(EntityReference *)OwningUser {
	self.attributes[@"owninguser"] = OwningUser;
}

- (NSString *)Pager {
	return (NSString *)self.attributes[@"pager"];
}

- (void)setPager:(NSString *)Pager {
	self.attributes[@"pager"] = Pager;
}

- (EntityReference *)ParentContactId {
	return (EntityReference *)self.attributes[@"parentcontactid"];
}

- (void)setParentContactId:(EntityReference *)ParentContactId {
	self.attributes[@"parentcontactid"] = ParentContactId;
}

- (NSString *)ParentContactIdName {
	return (NSString *)self.attributes[@"parentcontactidname"];
}

- (void)setParentContactIdName:(NSString *)ParentContactIdName {
	self.attributes[@"parentcontactidname"] = ParentContactIdName;
}

- (NSString *)ParentContactIdYomiName {
	return (NSString *)self.attributes[@"parentcontactidyominame"];
}

- (void)setParentContactIdYomiName:(NSString *)ParentContactIdYomiName {
	self.attributes[@"parentcontactidyominame"] = ParentContactIdYomiName;
}

- (EntityReference *)ParentCustomerId {
	return (EntityReference *)self.attributes[@"parentcustomerid"];
}

- (void)setParentCustomerId:(EntityReference *)ParentCustomerId {
	self.attributes[@"parentcustomerid"] = ParentCustomerId;
}

- (NSString *)ParentCustomerIdName {
	return (NSString *)self.attributes[@"parentcustomeridname"];
}

- (void)setParentCustomerIdName:(NSString *)ParentCustomerIdName {
	self.attributes[@"parentcustomeridname"] = ParentCustomerIdName;
}

- (NSString *)ParentCustomerIdType {
	return (NSString *)self.attributes[@"parentcustomeridtype"];
}

- (void)setParentCustomerIdType:(NSString *)ParentCustomerIdType {
	self.attributes[@"parentcustomeridtype"] = ParentCustomerIdType;
}

- (NSString *)ParentCustomerIdYomiName {
	return (NSString *)self.attributes[@"parentcustomeridyominame"];
}

- (void)setParentCustomerIdYomiName:(NSString *)ParentCustomerIdYomiName {
	self.attributes[@"parentcustomeridyominame"] = ParentCustomerIdYomiName;
}

- (CRMBoolean *)ParticipatesInWorkflow {
	return (CRMBoolean *)self.attributes[@"participatesinworkflow"];
}

- (void)setParticipatesInWorkflow:(CRMBoolean *)ParticipatesInWorkflow {
	self.attributes[@"participatesinworkflow"] = ParticipatesInWorkflow;
}

- (OptionSetValue *)PaymentTermsCode {
	return (OptionSetValue *)self.attributes[@"paymenttermscode"];
}

- (void)setPaymentTermsCode:(OptionSetValue *)PaymentTermsCode {
	self.attributes[@"paymenttermscode"] = PaymentTermsCode;
}

- (OptionSetValue *)PreferredAppointmentDayCode {
	return (OptionSetValue *)self.attributes[@"preferredappointmentdaycode"];
}

- (void)setPreferredAppointmentDayCode:(OptionSetValue *)PreferredAppointmentDayCode {
	self.attributes[@"preferredappointmentdaycode"] = PreferredAppointmentDayCode;
}

- (OptionSetValue *)PreferredAppointmentTimeCode {
	return (OptionSetValue *)self.attributes[@"preferredappointmenttimecode"];
}

- (void)setPreferredAppointmentTimeCode:(OptionSetValue *)PreferredAppointmentTimeCode {
	self.attributes[@"preferredappointmenttimecode"] = PreferredAppointmentTimeCode;
}

- (OptionSetValue *)PreferredContactMethodCode {
	return (OptionSetValue *)self.attributes[@"preferredcontactmethodcode"];
}

- (void)setPreferredContactMethodCode:(OptionSetValue *)PreferredContactMethodCode {
	self.attributes[@"preferredcontactmethodcode"] = PreferredContactMethodCode;
}

- (EntityReference *)PreferredEquipmentId {
	return (EntityReference *)self.attributes[@"preferredequipmentid"];
}

- (void)setPreferredEquipmentId:(EntityReference *)PreferredEquipmentId {
	self.attributes[@"preferredequipmentid"] = PreferredEquipmentId;
}

- (NSString *)PreferredEquipmentIdName {
	return (NSString *)self.attributes[@"preferredequipmentidname"];
}

- (void)setPreferredEquipmentIdName:(NSString *)PreferredEquipmentIdName {
	self.attributes[@"preferredequipmentidname"] = PreferredEquipmentIdName;
}

- (EntityReference *)PreferredServiceId {
	return (EntityReference *)self.attributes[@"preferredserviceid"];
}

- (void)setPreferredServiceId:(EntityReference *)PreferredServiceId {
	self.attributes[@"preferredserviceid"] = PreferredServiceId;
}

- (NSString *)PreferredServiceIdName {
	return (NSString *)self.attributes[@"preferredserviceidname"];
}

- (void)setPreferredServiceIdName:(NSString *)PreferredServiceIdName {
	self.attributes[@"preferredserviceidname"] = PreferredServiceIdName;
}

- (EntityReference *)PreferredSystemUserId {
	return (EntityReference *)self.attributes[@"preferredsystemuserid"];
}

- (void)setPreferredSystemUserId:(EntityReference *)PreferredSystemUserId {
	self.attributes[@"preferredsystemuserid"] = PreferredSystemUserId;
}

- (NSString *)PreferredSystemUserIdName {
	return (NSString *)self.attributes[@"preferredsystemuseridname"];
}

- (void)setPreferredSystemUserIdName:(NSString *)PreferredSystemUserIdName {
	self.attributes[@"preferredsystemuseridname"] = PreferredSystemUserIdName;
}

- (NSString *)PreferredSystemUserIdYomiName {
	return (NSString *)self.attributes[@"preferredsystemuseridyominame"];
}

- (void)setPreferredSystemUserIdYomiName:(NSString *)PreferredSystemUserIdYomiName {
	self.attributes[@"preferredsystemuseridyominame"] = PreferredSystemUserIdYomiName;
}

- (NSUUID *)ProcessId {
	return (NSUUID *)self.attributes[@"processid"];
}

- (void)setProcessId:(NSUUID *)ProcessId {
	self.attributes[@"processid"] = ProcessId;
}

- (NSString *)Salutation {
	return (NSString *)self.attributes[@"salutation"];
}

- (void)setSalutation:(NSString *)Salutation {
	self.attributes[@"salutation"] = Salutation;
}

- (OptionSetValue *)ShippingMethodCode {
	return (OptionSetValue *)self.attributes[@"shippingmethodcode"];
}

- (void)setShippingMethodCode:(OptionSetValue *)ShippingMethodCode {
	self.attributes[@"shippingmethodcode"] = ShippingMethodCode;
}

- (NSString *)SpousesName {
	return (NSString *)self.attributes[@"spousesname"];
}

- (void)setSpousesName:(NSString *)SpousesName {
	self.attributes[@"spousesname"] = SpousesName;
}

- (NSUUID *)StageId {
	return (NSUUID *)self.attributes[@"stageid"];
}

- (void)setStageId:(NSUUID *)StageId {
	self.attributes[@"stageid"] = StageId;
}

- (OptionSetValue *)StateCode {
	return (OptionSetValue *)self.attributes[@"statecode"];
}

- (void)setStateCode:(OptionSetValue *)StateCode {
	self.attributes[@"statecode"] = StateCode;
}

- (OptionSetValue *)StatusCode {
	return (OptionSetValue *)self.attributes[@"statuscode"];
}

- (void)setStatusCode:(OptionSetValue *)StatusCode {
	self.attributes[@"statuscode"] = StatusCode;
}

- (NSUUID *)SubscriptionId {
	return (NSUUID *)self.attributes[@"subscriptionid"];
}

- (void)setSubscriptionId:(NSUUID *)SubscriptionId {
	self.attributes[@"subscriptionid"] = SubscriptionId;
}

- (NSString *)Suffix {
	return (NSString *)self.attributes[@"suffix"];
}

- (void)setSuffix:(NSString *)Suffix {
	self.attributes[@"suffix"] = Suffix;
}

- (NSString *)Telephone1 {
	return (NSString *)self.attributes[@"telephone1"];
}

- (void)setTelephone1:(NSString *)Telephone1 {
	self.attributes[@"telephone1"] = Telephone1;
}

- (NSString *)Telephone2 {
	return (NSString *)self.attributes[@"telephone2"];
}

- (void)setTelephone2:(NSString *)Telephone2 {
	self.attributes[@"telephone2"] = Telephone2;
}

- (NSString *)Telephone3 {
	return (NSString *)self.attributes[@"telephone3"];
}

- (void)setTelephone3:(NSString *)Telephone3 {
	self.attributes[@"telephone3"] = Telephone3;
}

- (OptionSetValue *)TerritoryCode {
	return (OptionSetValue *)self.attributes[@"territorycode"];
}

- (void)setTerritoryCode:(OptionSetValue *)TerritoryCode {
	self.attributes[@"territorycode"] = TerritoryCode;
}

- (CRMInteger *)TimeZoneRuleVersionNumber {
	return (CRMInteger *)self.attributes[@"timezoneruleversionnumber"];
}

- (void)setTimeZoneRuleVersionNumber:(CRMInteger *)TimeZoneRuleVersionNumber {
	self.attributes[@"timezoneruleversionnumber"] = TimeZoneRuleVersionNumber;
}

- (EntityReference *)TransactionCurrencyId {
	return (EntityReference *)self.attributes[@"transactioncurrencyid"];
}

- (void)setTransactionCurrencyId:(EntityReference *)TransactionCurrencyId {
	self.attributes[@"transactioncurrencyid"] = TransactionCurrencyId;
}

- (NSString *)TransactionCurrencyIdName {
	return (NSString *)self.attributes[@"transactioncurrencyidname"];
}

- (void)setTransactionCurrencyIdName:(NSString *)TransactionCurrencyIdName {
	self.attributes[@"transactioncurrencyidname"] = TransactionCurrencyIdName;
}

- (NSString *)TraversedPath {
	return (NSString *)self.attributes[@"traversedpath"];
}

- (void)setTraversedPath:(NSString *)TraversedPath {
	self.attributes[@"traversedpath"] = TraversedPath;
}

- (CRMInteger *)UTCConversionTimeZoneCode {
	return (CRMInteger *)self.attributes[@"utcconversiontimezonecode"];
}

- (void)setUTCConversionTimeZoneCode:(CRMInteger *)UTCConversionTimeZoneCode {
	self.attributes[@"utcconversiontimezonecode"] = UTCConversionTimeZoneCode;
}

- (CRMBigInt *)VersionNumber {
	return (CRMBigInt *)self.attributes[@"versionnumber"];
}

- (void)setVersionNumber:(CRMBigInt *)VersionNumber {
	self.attributes[@"versionnumber"] = VersionNumber;
}

- (NSString *)WebSiteUrl {
	return (NSString *)self.attributes[@"websiteurl"];
}

- (void)setWebSiteUrl:(NSString *)WebSiteUrl {
	self.attributes[@"websiteurl"] = WebSiteUrl;
}

- (NSString *)YomiFirstName {
	return (NSString *)self.attributes[@"yomifirstname"];
}

- (void)setYomiFirstName:(NSString *)YomiFirstName {
	self.attributes[@"yomifirstname"] = YomiFirstName;
}

- (NSString *)YomiFullName {
	return (NSString *)self.attributes[@"yomifullname"];
}

- (void)setYomiFullName:(NSString *)YomiFullName {
	self.attributes[@"yomifullname"] = YomiFullName;
}

- (NSString *)YomiLastName {
	return (NSString *)self.attributes[@"yomilastname"];
}

- (void)setYomiLastName:(NSString *)YomiLastName {
	self.attributes[@"yomilastname"] = YomiLastName;
}

- (NSString *)YomiMiddleName {
	return (NSString *)self.attributes[@"yomimiddlename"];
}

- (void)setYomiMiddleName:(NSString *)YomiMiddleName {
	self.attributes[@"yomimiddlename"] = YomiMiddleName;
}

- (id)init
{
	return [super initWithLogicalName:@"contact"];
}

@end


@implementation Task

+ (NSString *)entityLogicalName
{
	return @"task";
}

+ (NSNumber *)entityTypeCode
{
	return [NSNumber numberWithInt:4212];
}

- (NSUUID *)id
{
	return (NSUUID *)self.attributes[@"activityid"];
}

- (void)setId:(NSUUID *)id
{
	self.attributes[@"activityid"] = id;
}

- (NSUUID *)ActivityId {
	return (NSUUID *)self.attributes[@"activityid"];
}

- (void)setActivityId:(NSUUID *)ActivityId {
	self.attributes[@"activityid"] = ActivityId;
}

- (NSString *)ActivityTypeCode {
	return (NSString *)self.attributes[@"activitytypecode"];
}

- (void)setActivityTypeCode:(NSString *)ActivityTypeCode {
	self.attributes[@"activitytypecode"] = ActivityTypeCode;
}

- (CRMInteger *)ActualDurationMinutes {
	return (CRMInteger *)self.attributes[@"actualdurationminutes"];
}

- (void)setActualDurationMinutes:(CRMInteger *)ActualDurationMinutes {
	self.attributes[@"actualdurationminutes"] = ActualDurationMinutes;
}

- (NSDate *)ActualEnd {
	return (NSDate *)self.attributes[@"actualend"];
}

- (void)setActualEnd:(NSDate *)ActualEnd {
	self.attributes[@"actualend"] = ActualEnd;
}

- (NSDate *)ActualStart {
	return (NSDate *)self.attributes[@"actualstart"];
}

- (void)setActualStart:(NSDate *)ActualStart {
	self.attributes[@"actualstart"] = ActualStart;
}

- (NSString *)Category {
	return (NSString *)self.attributes[@"category"];
}

- (void)setCategory:(NSString *)Category {
	self.attributes[@"category"] = Category;
}

- (EntityReference *)CreatedBy {
	return (EntityReference *)self.attributes[@"createdby"];
}

- (void)setCreatedBy:(EntityReference *)CreatedBy {
	self.attributes[@"createdby"] = CreatedBy;
}

- (NSString *)CreatedByName {
	return (NSString *)self.attributes[@"createdbyname"];
}

- (void)setCreatedByName:(NSString *)CreatedByName {
	self.attributes[@"createdbyname"] = CreatedByName;
}

- (NSString *)CreatedByYomiName {
	return (NSString *)self.attributes[@"createdbyyominame"];
}

- (void)setCreatedByYomiName:(NSString *)CreatedByYomiName {
	self.attributes[@"createdbyyominame"] = CreatedByYomiName;
}

- (NSDate *)CreatedOn {
	return (NSDate *)self.attributes[@"createdon"];
}

- (void)setCreatedOn:(NSDate *)CreatedOn {
	self.attributes[@"createdon"] = CreatedOn;
}

- (EntityReference *)CreatedOnBehalfBy {
	return (EntityReference *)self.attributes[@"createdonbehalfby"];
}

- (void)setCreatedOnBehalfBy:(EntityReference *)CreatedOnBehalfBy {
	self.attributes[@"createdonbehalfby"] = CreatedOnBehalfBy;
}

- (NSString *)CreatedOnBehalfByName {
	return (NSString *)self.attributes[@"createdonbehalfbyname"];
}

- (void)setCreatedOnBehalfByName:(NSString *)CreatedOnBehalfByName {
	self.attributes[@"createdonbehalfbyname"] = CreatedOnBehalfByName;
}

- (NSString *)CreatedOnBehalfByYomiName {
	return (NSString *)self.attributes[@"createdonbehalfbyyominame"];
}

- (void)setCreatedOnBehalfByYomiName:(NSString *)CreatedOnBehalfByYomiName {
	self.attributes[@"createdonbehalfbyyominame"] = CreatedOnBehalfByYomiName;
}

- (NSUUID *)CrmTaskAssignedUniqueId {
	return (NSUUID *)self.attributes[@"crmtaskassigneduniqueid"];
}

- (void)setCrmTaskAssignedUniqueId:(NSUUID *)CrmTaskAssignedUniqueId {
	self.attributes[@"crmtaskassigneduniqueid"] = CrmTaskAssignedUniqueId;
}

- (NSString *)Description {
	return (NSString *)self.attributes[@"description"];
}

- (void)setDescription:(NSString *)Description {
	self.attributes[@"description"] = Description;
}

- (NSDecimalNumber *)ExchangeRate {
	return (NSDecimalNumber *)self.attributes[@"exchangerate"];
}

- (void)setExchangeRate:(NSDecimalNumber *)ExchangeRate {
	self.attributes[@"exchangerate"] = ExchangeRate;
}

- (CRMInteger *)ImportSequenceNumber {
	return (CRMInteger *)self.attributes[@"importsequencenumber"];
}

- (void)setImportSequenceNumber:(CRMInteger *)ImportSequenceNumber {
	self.attributes[@"importsequencenumber"] = ImportSequenceNumber;
}

- (CRMBoolean *)IsBilled {
	return (CRMBoolean *)self.attributes[@"isbilled"];
}

- (void)setIsBilled:(CRMBoolean *)IsBilled {
	self.attributes[@"isbilled"] = IsBilled;
}

- (CRMBoolean *)IsRegularActivity {
	return (CRMBoolean *)self.attributes[@"isregularactivity"];
}

- (void)setIsRegularActivity:(CRMBoolean *)IsRegularActivity {
	self.attributes[@"isregularactivity"] = IsRegularActivity;
}

- (CRMBoolean *)IsWorkflowCreated {
	return (CRMBoolean *)self.attributes[@"isworkflowcreated"];
}

- (void)setIsWorkflowCreated:(CRMBoolean *)IsWorkflowCreated {
	self.attributes[@"isworkflowcreated"] = IsWorkflowCreated;
}

- (EntityReference *)ModifiedBy {
	return (EntityReference *)self.attributes[@"modifiedby"];
}

- (void)setModifiedBy:(EntityReference *)ModifiedBy {
	self.attributes[@"modifiedby"] = ModifiedBy;
}

- (NSString *)ModifiedByName {
	return (NSString *)self.attributes[@"modifiedbyname"];
}

- (void)setModifiedByName:(NSString *)ModifiedByName {
	self.attributes[@"modifiedbyname"] = ModifiedByName;
}

- (NSString *)ModifiedByYomiName {
	return (NSString *)self.attributes[@"modifiedbyyominame"];
}

- (void)setModifiedByYomiName:(NSString *)ModifiedByYomiName {
	self.attributes[@"modifiedbyyominame"] = ModifiedByYomiName;
}

- (NSDate *)ModifiedOn {
	return (NSDate *)self.attributes[@"modifiedon"];
}

- (void)setModifiedOn:(NSDate *)ModifiedOn {
	self.attributes[@"modifiedon"] = ModifiedOn;
}

- (EntityReference *)ModifiedOnBehalfBy {
	return (EntityReference *)self.attributes[@"modifiedonbehalfby"];
}

- (void)setModifiedOnBehalfBy:(EntityReference *)ModifiedOnBehalfBy {
	self.attributes[@"modifiedonbehalfby"] = ModifiedOnBehalfBy;
}

- (NSString *)ModifiedOnBehalfByName {
	return (NSString *)self.attributes[@"modifiedonbehalfbyname"];
}

- (void)setModifiedOnBehalfByName:(NSString *)ModifiedOnBehalfByName {
	self.attributes[@"modifiedonbehalfbyname"] = ModifiedOnBehalfByName;
}

- (NSString *)ModifiedOnBehalfByYomiName {
	return (NSString *)self.attributes[@"modifiedonbehalfbyyominame"];
}

- (void)setModifiedOnBehalfByYomiName:(NSString *)ModifiedOnBehalfByYomiName {
	self.attributes[@"modifiedonbehalfbyyominame"] = ModifiedOnBehalfByYomiName;
}

- (NSDate *)OverriddenCreatedOn {
	return (NSDate *)self.attributes[@"overriddencreatedon"];
}

- (void)setOverriddenCreatedOn:(NSDate *)OverriddenCreatedOn {
	self.attributes[@"overriddencreatedon"] = OverriddenCreatedOn;
}

- (EntityReference *)OwnerId {
	return (EntityReference *)self.attributes[@"ownerid"];
}

- (void)setOwnerId:(EntityReference *)OwnerId {
	self.attributes[@"ownerid"] = OwnerId;
}

- (NSString *)OwnerIdName {
	return (NSString *)self.attributes[@"owneridname"];
}

- (void)setOwnerIdName:(NSString *)OwnerIdName {
	self.attributes[@"owneridname"] = OwnerIdName;
}

- (NSString *)OwnerIdType {
	return (NSString *)self.attributes[@"owneridtype"];
}

- (void)setOwnerIdType:(NSString *)OwnerIdType {
	self.attributes[@"owneridtype"] = OwnerIdType;
}

- (NSString *)OwnerIdYomiName {
	return (NSString *)self.attributes[@"owneridyominame"];
}

- (void)setOwnerIdYomiName:(NSString *)OwnerIdYomiName {
	self.attributes[@"owneridyominame"] = OwnerIdYomiName;
}

- (EntityReference *)OwningBusinessUnit {
	return (EntityReference *)self.attributes[@"owningbusinessunit"];
}

- (void)setOwningBusinessUnit:(EntityReference *)OwningBusinessUnit {
	self.attributes[@"owningbusinessunit"] = OwningBusinessUnit;
}

- (EntityReference *)OwningTeam {
	return (EntityReference *)self.attributes[@"owningteam"];
}

- (void)setOwningTeam:(EntityReference *)OwningTeam {
	self.attributes[@"owningteam"] = OwningTeam;
}

- (EntityReference *)OwningUser {
	return (EntityReference *)self.attributes[@"owninguser"];
}

- (void)setOwningUser:(EntityReference *)OwningUser {
	self.attributes[@"owninguser"] = OwningUser;
}

- (CRMInteger *)PercentComplete {
	return (CRMInteger *)self.attributes[@"percentcomplete"];
}

- (void)setPercentComplete:(CRMInteger *)PercentComplete {
	self.attributes[@"percentcomplete"] = PercentComplete;
}

- (OptionSetValue *)PriorityCode {
	return (OptionSetValue *)self.attributes[@"prioritycode"];
}

- (void)setPriorityCode:(OptionSetValue *)PriorityCode {
	self.attributes[@"prioritycode"] = PriorityCode;
}

- (NSUUID *)ProcessId {
	return (NSUUID *)self.attributes[@"processid"];
}

- (void)setProcessId:(NSUUID *)ProcessId {
	self.attributes[@"processid"] = ProcessId;
}

- (EntityReference *)RegardingObjectId {
	return (EntityReference *)self.attributes[@"regardingobjectid"];
}

- (void)setRegardingObjectId:(EntityReference *)RegardingObjectId {
	self.attributes[@"regardingobjectid"] = RegardingObjectId;
}

- (NSString *)RegardingObjectIdName {
	return (NSString *)self.attributes[@"regardingobjectidname"];
}

- (void)setRegardingObjectIdName:(NSString *)RegardingObjectIdName {
	self.attributes[@"regardingobjectidname"] = RegardingObjectIdName;
}

- (NSString *)RegardingObjectIdYomiName {
	return (NSString *)self.attributes[@"regardingobjectidyominame"];
}

- (void)setRegardingObjectIdYomiName:(NSString *)RegardingObjectIdYomiName {
	self.attributes[@"regardingobjectidyominame"] = RegardingObjectIdYomiName;
}

- (NSString *)RegardingObjectTypeCode {
	return (NSString *)self.attributes[@"regardingobjecttypecode"];
}

- (void)setRegardingObjectTypeCode:(NSString *)RegardingObjectTypeCode {
	self.attributes[@"regardingobjecttypecode"] = RegardingObjectTypeCode;
}

- (CRMInteger *)ScheduledDurationMinutes {
	return (CRMInteger *)self.attributes[@"scheduleddurationminutes"];
}

- (void)setScheduledDurationMinutes:(CRMInteger *)ScheduledDurationMinutes {
	self.attributes[@"scheduleddurationminutes"] = ScheduledDurationMinutes;
}

- (NSDate *)ScheduledEnd {
	return (NSDate *)self.attributes[@"scheduledend"];
}

- (void)setScheduledEnd:(NSDate *)ScheduledEnd {
	self.attributes[@"scheduledend"] = ScheduledEnd;
}

- (NSDate *)ScheduledStart {
	return (NSDate *)self.attributes[@"scheduledstart"];
}

- (void)setScheduledStart:(NSDate *)ScheduledStart {
	self.attributes[@"scheduledstart"] = ScheduledStart;
}

- (EntityReference *)ServiceId {
	return (EntityReference *)self.attributes[@"serviceid"];
}

- (void)setServiceId:(EntityReference *)ServiceId {
	self.attributes[@"serviceid"] = ServiceId;
}

- (NSUUID *)StageId {
	return (NSUUID *)self.attributes[@"stageid"];
}

- (void)setStageId:(NSUUID *)StageId {
	self.attributes[@"stageid"] = StageId;
}

- (OptionSetValue *)StateCode {
	return (OptionSetValue *)self.attributes[@"statecode"];
}

- (void)setStateCode:(OptionSetValue *)StateCode {
	self.attributes[@"statecode"] = StateCode;
}

- (OptionSetValue *)StatusCode {
	return (OptionSetValue *)self.attributes[@"statuscode"];
}

- (void)setStatusCode:(OptionSetValue *)StatusCode {
	self.attributes[@"statuscode"] = StatusCode;
}

- (NSString *)Subcategory {
	return (NSString *)self.attributes[@"subcategory"];
}

- (void)setSubcategory:(NSString *)Subcategory {
	self.attributes[@"subcategory"] = Subcategory;
}

- (NSString *)Subject {
	return (NSString *)self.attributes[@"subject"];
}

- (void)setSubject:(NSString *)Subject {
	self.attributes[@"subject"] = Subject;
}

- (NSUUID *)SubscriptionId {
	return (NSUUID *)self.attributes[@"subscriptionid"];
}

- (void)setSubscriptionId:(NSUUID *)SubscriptionId {
	self.attributes[@"subscriptionid"] = SubscriptionId;
}

- (CRMInteger *)TimeZoneRuleVersionNumber {
	return (CRMInteger *)self.attributes[@"timezoneruleversionnumber"];
}

- (void)setTimeZoneRuleVersionNumber:(CRMInteger *)TimeZoneRuleVersionNumber {
	self.attributes[@"timezoneruleversionnumber"] = TimeZoneRuleVersionNumber;
}

- (EntityReference *)TransactionCurrencyId {
	return (EntityReference *)self.attributes[@"transactioncurrencyid"];
}

- (void)setTransactionCurrencyId:(EntityReference *)TransactionCurrencyId {
	self.attributes[@"transactioncurrencyid"] = TransactionCurrencyId;
}

- (NSString *)TransactionCurrencyIdName {
	return (NSString *)self.attributes[@"transactioncurrencyidname"];
}

- (void)setTransactionCurrencyIdName:(NSString *)TransactionCurrencyIdName {
	self.attributes[@"transactioncurrencyidname"] = TransactionCurrencyIdName;
}

- (NSString *)TraversedPath {
	return (NSString *)self.attributes[@"traversedpath"];
}

- (void)setTraversedPath:(NSString *)TraversedPath {
	self.attributes[@"traversedpath"] = TraversedPath;
}

- (CRMInteger *)UTCConversionTimeZoneCode {
	return (CRMInteger *)self.attributes[@"utcconversiontimezonecode"];
}

- (void)setUTCConversionTimeZoneCode:(CRMInteger *)UTCConversionTimeZoneCode {
	self.attributes[@"utcconversiontimezonecode"] = UTCConversionTimeZoneCode;
}

- (CRMBigInt *)VersionNumber {
	return (CRMBigInt *)self.attributes[@"versionnumber"];
}

- (void)setVersionNumber:(CRMBigInt *)VersionNumber {
	self.attributes[@"versionnumber"] = VersionNumber;
}

- (id)init
{
	return [super initWithLogicalName:@"task"];
}

@end

