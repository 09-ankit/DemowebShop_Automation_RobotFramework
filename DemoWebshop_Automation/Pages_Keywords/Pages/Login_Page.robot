*** Settings ***
Library         SeleniumLibrary
Resource        C:/Users/HP/PycharmProjects/RobotFramework_2023/DemoWebshop_Automation/Pages_Keywords/Pages/Global_Methods.robot



*** Keywords ***
PreRequisite_Login
	Log    Click on Login Button and Add Credentials
	Click Locator   xpath://a[text()='Log in']


Do Login
	[Arguments]    ${Username}   ${Password}
	Send Text    id:Email  ${Username}
	Send Text    id:Password   ${Password}
	Click Locator    xpath://*[@value="Log in"]




