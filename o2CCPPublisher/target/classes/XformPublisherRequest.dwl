%dw 1.0
%output application/json
---
"Customer":
{
	"ClientID" : "MCDS",
	"VendorID": "TBD",
	"VendorKey": "TBD",
	"ProgramID": "O2 Wifi",
	"SubProgramID": "Agility",
	("EmailAddress" : payload.Customer.email[0 .. 80] when (sizeOf payload.Customer.email) > 80 and payload.Customer.email != null otherwise payload.Customer.email) when payload.Customer.email != null,
	("FirstName" : payload.Customer.forename[0..30] when (sizeOf payload.Customer.forename) > 30 otherwise payload.Customer.forename) when payload.Customer.forename != null,
	("LastName" : payload.Customer.surname[0..30] when (sizeOf payload.Customer.surname) > 30 otherwise payload.Customer.surname) when payload.Customer.surname != null,
	"PostalCode" : payload.Customer.postcode,
	("PhoneNumber" : payload.Customer.telephone) when payload.Customer.telephone != null,
	"CreateDate" : payload.Customer.dateRegistered when payload.Customer.dateRegistered != null otherwise now as :string {format: "dd-MMM-yyyy hh:mm:ss a"},
	"IP" : payload.Venue.ClientIp,
	"DOB" : payload.Customer.dob,
	"Source" : payload.Device.name,
	"SourceApp" : "O2 Wifi",
	"SourceSendDate" : now as :string {format: "dd-MMM-yyyy hh:mm:ss a"},
	"Subscriptions":
		"Subscription":
		[
			{
			"ID" : "1",
			"OptStatus" : "Y"
			}
		] 
}
