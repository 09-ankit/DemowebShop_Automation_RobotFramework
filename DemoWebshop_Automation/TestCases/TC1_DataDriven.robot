"""
Project: Demo Shop Workshop
Author: Ankit Bhattad
Date: September 10, 2023
Description:End To End Demo Shop Website Order Process
"""



*** Settings ***
Library         SeleniumLibrary
Test Template   TC0_End2End_OrderProcess
Library         DataDriver  C:/Users/HP/PycharmProjects/RobotFramework_2023/TestData/TestData.xlsx  sheet_name=Sheet1
Resource        C:/Users/HP/PycharmProjects/RobotFramework_2023/DemoWebshop_Automation/Pages_Keywords/Pages/Global_Methods.robot
Resource        C:/Users/HP/PycharmProjects/RobotFramework_2023/DemoWebshop_Automation/Pages_Keywords/Pages/Login_Page.robot
Resource        C:/Users/HP/PycharmProjects/RobotFramework_2023/DemoWebshop_Automation/Pages_Keywords/Pages/Home_Page.robot
Resource        C:/Users/HP/PycharmProjects/RobotFramework_2023/DemoWebshop_Automation/Pages_Keywords/Pages/BooksCategory_Page.robot
Resource        C:/Users/HP/PycharmProjects/RobotFramework_2023/DemoWebshop_Automation/Pages_Keywords/Pages/Shopping_Cart_Page.robot
Resource        C:/Users/HP/PycharmProjects/RobotFramework_2023/DemoWebshop_Automation/Pages_Keywords/Pages/Checkout_Page.robot



#Using TestTemplate and Data Driven Perform End 2 End Book Order Process
*** Test Cases ***
Regression Test     ${URL}     ${Browser}     ${Email}   ${Password}     ${Category}     ${OrderBy}    ${ProductSize}   ${ViewMode}  ${BookName}  ${Country}  ${City}   ${PostalCode}   ${Mobile}




*** Keywords ***
TC0_End2End_OrderProcess
	[Arguments]     ${URL}     ${Browser}     ${Email}   ${Password}     ${Category}     ${OrderBy}    ${ProductSize}   ${ViewMode}  ${BookName}  ${Country}  ${City}   ${PostalCode}   ${Mobile}
	Launch Chrome    ${URL}     ${Browser}
	PreRequisite_Login
	Do Login    ${Email}    ${Password}
	Verify_AccountName_OnHomeScreen    ${Email}
	Select Shop Category    ${Category}
    	Set Filter Option In Books Page  ${OrderBy}    ${ProductSize}   ${ViewMode}
    	Print All Books Available In Store
    	Alternate Way 2 Select Books From Store   ${BookName}
    	Add Product2_Cart
    	Go To ShoppingCart Cart Page
    	Select Product Checkbox
   	Select Shipping Country     ${Country}
    	Agree TermsService
    	Click Checkout Button
    	Verify Email Populated In Billing_Details   ${Email}
    	Enter Billing Details   ${Country}  ${City}   ${PostalCode}   ${Mobile}
    	Continue Button  1
    	Continue Button  2
    	Continue Button  3
    	Continue Button  4
    	Continue Button  5
    	Confirm Order
    	Verify Order Successfully Placed


