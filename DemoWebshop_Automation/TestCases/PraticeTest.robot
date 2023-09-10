"""
Project: Pratice Robot Tests
Author: Ankit Bhattad
Date: September 08, 2023
Description:Handling Diffrent Test Scenario using Robot Keywords
"""



*** Settings ***
Library     SeleniumLibrary

*** Variables ***



*** Test Cases ***

TestPratice_1
	Open Browser    https://www.vinsguru.com/selenium-webdriver-automating-hoverable-multilevel-dropdowns/      chrome
	${Text}=        Get Text        xpath://*[text()='Development']
	Mouse Over      xpath://*[text()='Development']
	Wait Until Element Is Visible    xpath:(//*[text()='Spring'])[1]
	Click Element    xpath:(//*[text()='Spring'])[1]
    Wait Until Page Contains Element    xpath://*[text()='Development']
    Scroll Element Into View    xpath://a[@class="zta-button"]//span[text()='Spring Data R2DBC Pagination']
    Wait Until Page Contains Element    xpath://span[text()='Spring Data R2DBC Pagination']/..
    Click Element    xpath://span[text()='Spring Data R2DBC Pagination']/..
    Wait Until Page Contains Element    xpath://input[@name="author"]/preceding-sibling::label
    Scroll Element Into View    xpath://input[@name="author"]/preceding-sibling::label
    Set Focus To Element    xpath://input[@name="author"]/preceding-sibling::label
    Press Keys  None  TAB
    Input Text      xpath://input[@name="author"]   Ankit


Test_WebTables
	Open Browser        http://www.techlistic.com/2017/02/automate-demo-web-table-with-selenium.html#google_vignette    chrome
	Table Column Should Contain     xpath://table[@id="customers"]  2   Maria Anders
    Table Row Should Contain    xpath://table[@id="customers"]      6       Adobe
    Table Header Should Contain     xpath://table[@id="customers"]  Country
    Table Cell Should Contain       xpath://table[@id="customers"]  6   3   Canada


TestPratice_OrangeHRM
    Open Browser    https://opensource-demo.orangehrmlive.com/web/index.php/auth/login      chrome
    Maximize Browser Window
    Wait Until Page Contains    Login
    Input Text      name:username   Admin
    Input Text      name:password   admin123
    Click Button    xpath://button[@type="submit"]
    Wait Until Page Contains    Dashboard
    @{Options}=        Get Webelements        xpath://ul[@class="oxd-main-menu"]/child::li//a
	FOR  ${Option}   IN    @{Options}
		Log   ${Option.text}
        IF    '${Option.text}'=='Recruitment'
            Click Element    ${Option}
            BREAK
        END
	END
	Wait Until Page Contains    Vacancy
	Wait Until Element Is Enabled    xpath:(//i[contains(@class,'checkbox')])[7]
	Click Element    xpath:(//i[contains(@class,'checkbox')])[7]


    Wait Until Page Contains    Vacancy
    ${Lenght}=        Get Length          xpath://i[contains(@class,'checkbox')]
	FOR  ${i}   IN RANGE    1   ${Lenght-3}
		Wait Until Element Is Enabled    xpath:(//i[contains(@class,'checkbox')])[${i}]
		IF    ${i}>2
			Click Element    xpath:(//i[contains(@class,'checkbox')])[${i}]
		END
	END


Test_HandleFrame_Herokuapp
	Open Browser    https://the-internet.herokuapp.com/iframe      Chrome
	Sleep    2
	Select Frame    mce_0_ifr
	Input Text    xpath://body[@id="tinymce"]//p    Ankit
	Unselect Frame

TestPratice_OrangeHRM_DeleteAllRecords
	Open Browser    https://opensource-demo.orangehrmlive.com/web/index.php/auth/login      chrome
	Maximize Browser Window
	Wait Until Page Contains    Login
	Input Text      name:username   Admin
	Input Text      name:password   admin123
	Click Button    xpath://button[@type="submit"]
	Wait Until Page Contains    Dashboard

	@{Options}=        Get Webelements        xpath://ul[@class="oxd-main-menu"]/child::li//a
	FOR  ${Option}   IN    @{Options}
		Log   ${Option.text}
        IF    '${Option.text}'=='Recruitment'
            Click Element    ${Option}
            BREAK
        END
	END

    Wait Until Page Contains    Candidates
    Select JobTitle     Chief Technical Officer
    Select Status    Job Offered
    Sleep   2
    Click Element    xpath:(//i[contains(@class,'calendar')])[1]
    Wait Until Page Contains Element    xpath:(//div[contains(@class,'calendar')])[37]
    Click Element    xpath:(//div[contains(@class,'calendar')])[37]
    Wait Until Page Contains    Vacancy
    Delete All Records



*** Keywords ***

Select Checkbox Positon
	Click Element    //div[text()='Software Engineer']//..//..//child::label//input[@type="checkbox" and @value=2]

Select JobTitle
	[Arguments]    ${Position}
	Wait Until Page Contains    Candidates
	Click Element    xpath://label[text()='Job Title']/../following-sibling::div//child::i
	Wait Until Page Contains    Chief Technical Officer
	@{DD_Options}=       Get Webelements      xpath://div[@role="listbox"]//child::div//span
	FOR  ${Option}   IN    @{DD_Options}
		 Log     ${Option.text}
		 IF    '${Option.text}'=='${Position}'
            Click Element    ${Option}
            BREAK
         END
	END

Select Status
	[Arguments]    ${Position}
	Wait Until Page Contains    Candidates
	Click Element    xpath://label[text()='Status']/../following-sibling::div//child::i
	Wait Until Page Contains    Chief Technical Officer
	@{DD_Options}=       Get Webelements      xpath://div[@role="listbox"]//child::div//span
	FOR  ${Option}   IN    @{DD_Options}
		 Log     ${Option.text}
		 IF    '${Option.text}'=='${Position}'
            Click Element    ${Option}
            BREAK
         END
	END


Delete All Records
	${Checkboxes}       Get Webelements    xpath://button[@type="button"]//i[contains(@class,"bi-trash")]
	FOR     ${Checkbox}     IN      @{Checkboxes}
		Wait Until Page Contains Element    ${Checkbox}
		Click Element       ${Checkbox}
		Log    Selected Checkbox

		TRY
			Wait Until Page Contains    Yes, Delete
			Click Element   xpath://div[@class="orangehrm-modal-footer"]//button[2][text()=' Yes, Delete ']
		EXCEPT
			Wait Until Page Contains Element    xpath://div[@class="orangehrm-modal-footer"]//button[2][text()=' Yes, Delete ']
			Click Element   xpath://div[@class="orangehrm-modal-footer"]//button[2][text()=' Yes, Delete ']
		END
		Wait Until Page Contains    Success
		Wait Until Page Does Not Contain    Success
		Sleep    3
	END


