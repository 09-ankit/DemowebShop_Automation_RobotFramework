*** Settings ***
Library         SeleniumLibrary
Resource        C:/Users/HP/PycharmProjects/RobotFramework_2023/DemoWebshop_Automation/Pages_Keywords/Pages/Global_Methods.robot



*** Keywords ***
Select Product Checkbox
	Wait Until Page Does Not Contain    Availability: In stock
	Select Checkbox    removefromcart

Select Shipping Country
	[Arguments]    ${Country}
	Select From List By Label    CountryId    ${Country}
	Select From List By Label    name:StateProvinceId    Other (Non US)

Agree TermsService
	Select Checkbox     termsofservice

Click Checkout Button
	Click Locator   xpath://*[@id='checkout']

Get Estimate Shipping Details
	Click Locator    name:estimateshipping