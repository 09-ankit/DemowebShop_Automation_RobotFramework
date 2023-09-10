*** Settings ***
Library         SeleniumLibrary
Resource        C:/Users/HP/PycharmProjects/RobotFramework_2023/DemoWebshop_Automation/Pages_Keywords/Pages/Global_Methods.robot
Resource        C:/Users/HP/PycharmProjects/RobotFramework_2023/DemoWebshop_Automation/Pages_Keywords/Pages/Login_Page.robot
Resource        C:/Users/HP/PycharmProjects/RobotFramework_2023/DemoWebshop_Automation/Pages_Keywords/Pages/Home_Page.robot
Resource        C:/Users/HP/PycharmProjects/RobotFramework_2023/DemoWebshop_Automation/Pages_Keywords/Pages/BooksCategory_Page.robot



*** Variables ***
${url}  https://demowebshop.tricentis.com/
${Browser}  chrome
${Email}  ankitbhattad1999@gmail.com
${Password}  ""
${PageTitle}  Demo Web Shop
${Category}  Books
${OrderBy}  Price: Low to High
${ProductSize}  12
${ViewMode}  1
${BookName}  Fiction




*** Test Cases ***
#Verify Login Functionality
TC1_LoginTest
	[Tags]   Sanity
	[Arguments]    ${URL}     ${Browser}    ${Email}    ${Password}     ${PageTitle}
	Launch Chrome    ${URL}     ${Browser}
	PreRequisite_Login
	Do Login    ${Email}    ${Password}
	Verify Title    ${PageTitle}

#Verify HomePage Functionality
TC2_HomeTest
	[Tags]   Sanity
	[Arguments]     ${URL}     ${Browser}     ${Email}   ${Password}     ${Category}
	Launch Chrome    ${URL}     ${Browser}
	PreRequisite_Login
	Do Login    ${Email}    ${Password}
	Verify_AccountName_OnHomeScreen    ${Email}
	Print All Shop Category Options
	Select Shop Category    ${Category}

#Select Book From Store and Add to Cart
TC2_Select_BooksTest
	[Tags]   Regression
	[Arguments]     ${URL}     ${Browser}     ${Email}   ${Password}     ${Category}     ${OrderBy}    ${ProductSize}   ${ViewMode}  ${BookName}
	Launch Chrome    ${URL}     ${Browser}
	PreRequisite_Login
	Do Login    ${Email}    ${Password}
	Verify_AccountName_OnHomeScreen    ${Email}
	Select Shop Category    ${Category}
    Set Filter Option In Books  ${OrderBy}    ${ProductSize}   ${ViewMode}
    Print All Books Available In Store
    Alternate Way 2 Select Books From Store   ${BookName}
    Add Product2_Cart
















