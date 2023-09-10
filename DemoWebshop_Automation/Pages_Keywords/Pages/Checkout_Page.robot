*** Settings ***
Library         SeleniumLibrary
Resource        C:/Users/HP/PycharmProjects/RobotFramework_2023/DemoWebshop_Automation/Pages_Keywords/Pages/Global_Methods.robot


*** Keywords ***

Verify Email Populated In Billing_Details
	[Arguments]    ${Email}
	${Actual_Email}     Get Webelement  xpath://*[@id="BillingNewAddress_Email"]
	Log  Billing Details Page Contains Email -> ${Actual_Email.text}
	IF  '${Actual_Email.text}'=='${Email}'
		Log    Actual Email and Expected Email Are Correct
	ELSE
		Log    Actual Email and Expected Email Does Not Matches
	END


Enter Billing Details
	[Arguments]     ${Country}  ${City}  ${Postal_Code}  ${MobileNum}
	Select From List By Label    id:billing-address-select      New Address
	Select From List By Label    id:BillingNewAddress_CountryId     ${Country}
	Input Text    name:BillingNewAddress.City   ${City}
	Press Key     name:BillingNewAddress.City   \\13    # This represents the Tab key
	Input Text    id:BillingNewAddress_Address1     ${City}
	Press Key     id:BillingNewAddress_Address1  \\13    # This represents the Tab key
	Input Text    id:BillingNewAddress_ZipPostalCode    ${Postal_Code}
	Press Key     id:BillingNewAddress_ZipPostalCode    \\13    # This represents the Tab key
	Input Text    id:BillingNewAddress_PhoneNumber      ${MobileNum}
	Press Key     id:BillingNewAddress_PhoneNumber   \\13    # This represents the Tab key

Continue Button
	[Arguments]    ${Index}
	Wait Until Element Is Enabled   xpath:(//*[@value="Continue"])[${Index}]
	Click Locator    xpath:(//*[@value="Continue"])[${Index}]

Confirm Order
	Wait Until Element Is Enabled   xpath://*[@value="Confirm"]
	Click Locator    xpath://*[@value="Confirm"]

Verify Order Successfully Placed
	Wait Until Page Contains    Your order has been successfully processed!
