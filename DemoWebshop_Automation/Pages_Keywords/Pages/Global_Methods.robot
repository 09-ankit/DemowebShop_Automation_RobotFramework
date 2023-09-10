*** Settings ***
Library         SeleniumLibrary



*** Keywords ***

Click Locator
	[Arguments]    ${locator}
	Wait Until Element Is Visible   ${locator}
	Click Element    ${locator}
	Log    Element CLicked

Send Text
	[Arguments]    ${locator}   ${Text2Pass}
	Wait Until Element Is Visible   ${locator}
	Input Text  ${locator}  ${Text2Pass}
	Log    Text Entered

Launch Chrome
	[Arguments]     ${URL}   ${Browser}
	Open Browser    ${URL}      ${Browser}
	Maximize Browser Window
	Sleep    10


Verify Title
	[Arguments]    ${Title}
	Title Should Be     ${Title}


Go To ShoppingCart Cart Page
	Click Locator   xpath://span[text()='Shopping cart']