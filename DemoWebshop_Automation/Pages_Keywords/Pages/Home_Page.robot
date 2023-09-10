*** Settings ***
Library         SeleniumLibrary
Resource         C:/Users/HP/PycharmProjects/RobotFramework_2023/DemoWebshop_Automation/Pages_Keywords/Pages/Global_Methods.robot



*** Keywords ***
Verify_AccountName_OnHomeScreen
	[Arguments]    ${AccountHolderName}
	Wait Until Page Contains Element    xpath://*[text()="${AccountHolderName}"]

Print All Shop Category Options
	${ElementsCount}  Get Element Count  xpath://ul[@class="list"]//li
	FOR     ${i}    IN RANGE    1   ${ElementsCount}
            ${CategoryName}     get text    xpath://ul[@class="list"]//li[${i}]//a
            Log     ${CategoryName}
    END

Select Shop Category
	[Arguments]     ${Category_Name}
	${ElementsCount}  Get Element Count  xpath://ul[@class="list"]//li
	FOR     ${i}    IN RANGE    1   ${ElementsCount}
            ${CategoryName}     get text    xpath://ul[@class="list"]//li[${i}]//a
            Log     ${CategoryName}
            IF   '${CategoryName}'=='${Category_Name}'
            	Click Locator   xpath://ul[@class="list"]//li[${i}]//a
            	BREAK
            END
    END


Select Community Type
	[Arguments]     ${Community_Name}
	Select Radio Button    pollanswers-1     ${Community_Name}