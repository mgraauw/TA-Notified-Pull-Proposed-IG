Alias: $loinc = http://loinc.org
Alias: $sct = http://snomed.info/sct
Alias: $tanp-codes = https://www.twiin.nl/tanp/CodeSystem/tanp-codes

Profile:  NotificationTask
Parent:   Task
Id:       tanp-task
Title:    "TA Notified Pull Notification Task"
Description: "The TA Notified Pull Notification message is sent by the Sending System when it needs to notify the 
Receiving System about one or more FHIR resources that have been made available to the Receiving System."

* identifier 1..1
* groupIdentifier 1..1
* status = #requested
* code 1..1
* code.coding from TanpTaskValues (required)
* requester 1..1
* owner 1..1
* input.type.coding.code from TanpTaskParameterValues (required)

Instance:  NewTask
InstanceOf: NotificationTask

* groupIdentifier.system = "urn:ietf:rfc:3986"
* groupIdentifier.value = "urn:uuid:484639e6-e647-464c-8722-6e8a73cda4e0"
* identifier.system = "urn:ietf:rfc:3986"
* identifier.value = "urn:uuid:6128cfe7-0e89-4d37-ba90-e4ca3b3fcbbe"
* status = #requested
* intent = #proposal
* code = $tanp-codes#pull-notification
* restriction.period.end = "2023-10-14T15:36:05+02:00"
* for.identifier.system = "http://fhir.nl/fhir/NamingSystem/bsn"
* for.identifier.value = "172642863"
* authoredOn = "2023-04-13T15:01:54+02:00"
* requester.identifier.system = "http://example.com/fhir/NamingSystem/dummy"
* requester.identifier.value = "sending-ehr-system-id"
* owner.identifier.system = "http://example.com/fhir/NamingSystem/dummy"
* owner.identifier.value = "receiving-organization-id"
* input[0].type = $tanp-codes#authorization-base
* input[=].valueString = "ZGFhNDFjY2MtZGFmMi00YjZkLThiNDYtN2JlZDk1MWEyYzk2"
* input[+].type = $tanp-codes#read-resource "Read resource"
* input[=].valueReference = Reference(Observation/SomeObservation)
* input[+].type = $loinc#77599-9 "Additional documentation"
* input[=].valueString = "DocumentReference?status=current"

Instance: SomeObservation
InstanceOf: Observation

* status = #final
* code = $loinc#15074-8 "Glucose [Moles/volume] in Blood"
* subject = Reference(Patient/SomePatient)
* effectiveDateTime = "2023-04-13T15:01:54+02:00"
* valueQuantity.value = 6.3
* valueQuantity.unit = "mmol/L"
* valueQuantity.system = "http://unitsofmeasure.org"

Instance: SomePatient
InstanceOf: Patient

* identifier[0].system = "http://example.com/fhir/NamingSystem/bsn"
* identifier[0].value = "172642863"
* name[0].family = "Test"
* name[0].given[0] = "Teun"

Instance: AdditionalTask
InstanceOf: NotificationTask
Usage: #example
* groupIdentifier.system = "urn:ietf:rfc:3986"
* groupIdentifier.value = "urn:uuid:484639e6-e647-464c-8722-6e8a73cda4e0"
* identifier.system = "urn:ietf:rfc:3986"
* identifier.value = "urn:uuid:6128cfe7-0e89-4d37-ba90-e4ca3b3fcbbe"
* status = #requested
* intent = #proposal
* code = $tanp-codes#pull-notification
* restriction.period.end = "2023-10-14T15:36:05+02:00"
* for.identifier.system = "http://fhir.nl/fhir/NamingSystem/bsn"
* for.identifier.value = "172642863"
* authoredOn = "2023-04-13T15:01:54+02:00"
* requester.identifier.system = "http://example.com/fhir/NamingSystem/dummy"
* requester.identifier.value = "sending-ehr-system-id"
* owner.identifier.system = "http://example.com/fhir/NamingSystem/dummy"
* owner.identifier.value = "receiving-organization-id"
* input[0].type = $tanp-codes#authorization-base
* input[=].valueString = "ZGFhNDFjY2MtZGFmMi00YjZkLThiNDYtN2JlZDk1MWEyYzk2"
* input[+].type = $loinc#79191-3 "Patient demographics panel"
* input[=].valueString = "Patient?_include=Patient:general-practitioner"
* input[+].type = $loinc#48768-6 "Payment sources Document"
* input[=].valueString = "Coverage?_include=Coverage:payor:Organization&_include=Coverage:payor:Patient"
* input[+].type = $sct#11291000146105 "Treatment instructions"
* input[=].valueString = "Consent?category=http%3A%2F%2Fsnomed.info%2Fsct%7C11291000146105"
* input[+].type = $sct#11341000146107 "Living will and advance directive record"
* input[=].valueString = "Consent?category=http%3A%2F%2Fsnomed.info%2Fsct%7C11341000146107"
* input[+].type = $loinc#47420-5 "Functional status assessment note"
* input[=].valueString = "Observation/$lastn?category=http%3A%2F%2Fsnomed.info%2Fsct%7C118228005,http%3A%2F%2Fsnomed.info%2Fsct%7C384821006"
* input[+].type = $loinc#11450-4 "Problem list - Reported"
* input[=].valueString = "Condition"
* input[+].type = $sct#365508006 "Residence and accommodation circumstances - finding"
* input[=].valueString = "Observation/$lastn?code=http%3A%2F%2Fsnomed.info%2Fsct%7C365508006"
* input[+].type = $sct#228366006 "Finding relating to drug misuse behavior"
* input[=].valueString = "Observation?code=http%3A%2F%2Fsnomed.info%2Fsct%7C228366006"
* input[+].type = $sct#228273003 "Finding relating to alcohol drinking behavior"
* input[=].valueString = "Observation?code=http%3A%2F%2Fsnomed.info%2Fsct%7C228273003"
* input[+].type = $sct#365980008 "Finding of tobacco use and exposure"
* input[=].valueString = "Observation?code=http%3A%2F%2Fsnomed.info%2Fsct%7C365980008"
* input[+].type = $sct#11816003 "Diet education"
* input[=].valueString = "NutritionOrder"
* input[+].type = $loinc#75310-3 "Health concerns Document"
* input[=].valueString = "Flag"
* input[+].type = $loinc#48765-2 "Allergies and adverse reactions Document"
* input[=].valueString = "AllergyIntolerance"
* input[+].type = $sct#422979000 "Medication regimen behavior finding"
* input[=].valueString = "MedicationStatement?category=urn:oid:2.16.840.1.113883.2.4.3.11.60.20.77.5.3|6&_include=MedicationStatement:medication"
* input[+].type = $sct#16076005 "Prescription"
* input[=].valueString = "MedicationRequest?category=http%3A%2F%2Fsnomed.info%2Fsct%7C16076005&_include=MedicationRequest:medication"
* input[+].type = $sct#422037009 "Provider medication administration instructions"
* input[=].valueString = "MedicationDispense?category=http%3A%2F%2Fsnomed.info%2Fsct%7C422037009&_include=MedicationDispense:medication"
* input[+].type = $loinc#46264-8 "History of medical device use"
* input[=].valueString = "DeviceUseStatement?_include=DeviceUseStatement:device"
* input[+].type = $loinc#11369-6 "History of Immunization Narrative"
* input[=].valueString = "Immunization?status=completed"
* input[+].type = $loinc#85354-9 "Blood pressure panel with all children optional"
* input[=].valueString = "Observation/$lastn?code=http://loinc.org|85354-9"
* input[+].type = $loinc#29463-7 "Body weight"
* input[=].valueString = "Observation/$lastn?code=http://loinc.org|29463-7"
* input[+].type = $loinc#8302-2 "Body height"
* input[=].valueString = "Observation/$lastn?code=http://loinc.org|8302-2,http://loinc.org|8306-3,http://loinc.org|8308-9"
* input[+].type = $sct#15220000 "Laboratory test"
* input[=].valueString = "Observation/$lastn?category=http%3A%2F%2Fsnomed.info%2Fsct%7C275711006&_include=Observation:related-target&_include=Observation:specimen"
* input[+].type = $loinc#47519-4 "History of Procedures Document"
* input[=].valueString = "Procedure?category=http%3A%2F%2Fsnomed.info%2Fsct%7C387713003"
* input[+].type = $loinc#46240-8 "History of Hospitalizations+Outpatient visits Narrative"
* input[=].valueString = "Encounter?class=http%3A%2F%hl7.org%2Ffhir%2Fv3%2FActCode%7CIMP,http%3A%2F%hl7.org%2Ffhir%2Fv3%2FActCode%7CACUTE,http%3A%2F%hl7.org%2Ffhir%2Fv3%2FActCode%7CNONAC"
* input[+].type = $loinc#18776-5 "Plan of care note"
* input[=].valueString = "ProcedureRequest?status=active"
* input[+].type = $loinc#18776-5 "Plan of care note"
* input[=].valueString = "ImmunizationRecommendation"
* input[+].type = $loinc#18776-5 "Plan of care note"
* input[=].valueString = "DeviceRequest?status=active&_include=DeviceRequest:device"
* input[+].type = $loinc#18776-5 "Plan of care note"
* input[=].valueString = "Appointment?status=booked,pending,proposed"
* input[+].type = $loinc#77599-9 "Additional documentation"
* input[=].valueString = "DocumentReference?status=current"

Profile:  CancellationTask
Parent:   Task
Id:       tanp-canceltask
Title:    "TA Notified Pull Cancellation Task"
Description: "The Sending System can cancel a previous Notification using a conditional update interaction 
on the Task that represents that previous Notification."

* identifier 1..1
* status = #cancelled

Instance: CancelTask
InstanceOf: CancellationTask
Usage: #example
* identifier.system = "urn:ietf:rfc:3986"
* identifier.value = "urn:uuid:6128cfe7-0e89-4d37-ba90-e4ca3b3fcbbe"
* status = #cancelled
* intent = #proposal

ValueSet: TanpTaskValues
Id: tanp-taskvalues
Title: "TA Notified Pull Notification Task"
Description: "The codes for the TA Notified Pull Notification Task"

* ^experimental = true
* TanpCodes#pull-notification "Pull Notification"

ValueSet: TanpTaskParameterValues
Id: tanp-taskparametervalues
Title: "TA Notified Pull Notification Task Parameters"
Description: "The codes for the TA Notified Pull Notification Task Parameters"

* ^experimental = true
* include TanpCodes#authorization-base "Authorization"
* include TanpCodes#get-workflow-task "Get Workflow Task"
* include TanpCodes#read-resource "Read Resource"
* include TanpCodes#search-resource "Search Resource"
* include codes from system $sct 
* include codes from system $loinc 

CodeSystem: TanpCodes
Id: tanp-codes
Title: "TA Notified Pull CodeSystem"
Description: "The codes for the TA Notified Pull"

* ^experimental = true
* ^caseSensitive = true
* #pull-notification "Pull Notification"
* #authorization-base "Authorization Base"
* #get-workflow-task "Get Workflow Task"
* #read-resource "Read Resource"
* #search-resource "Search Resource"
