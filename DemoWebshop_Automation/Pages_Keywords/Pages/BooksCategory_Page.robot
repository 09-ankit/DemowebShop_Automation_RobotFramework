*** Settings ***
Library         SeleniumLibrary
Resource        C:/Users/HP/PycharmProjects/RobotFramework_2023/DemoWebshop_Automation/Pages_Keywords/Pages/Global_Methods.robot



*** Keywords ***
Set Filter Option In Books Page
	[Arguments]    ${OrderBy}    ${ProductSize}   ${ViewMode}
	Select From List By Label    name:products-orderby      ${OrderBy}
	Select From List By Label    name:products-pagesize     ${ProductSize}
	Select From List By Index    name:products-viewmode     ${ViewMode}



Select Books From Store
	[Arguments]     ${Book_Name}
	${ElementsCount}  Get Element Count      xpath://h2[@class='product-title']
	FOR     ${i}    IN RANGE    1   ${ElementsCount}
            ${BookName}      get text      xpath:(//h2[@class='product-title']//a)[${i}]
            IF      '${BookName}'=='${Book_Name}'
                Click Locator   xpath:(//h2[@class='product-title']//a)[${i}]
                sleep    2
                BREAK
            ELSE
                 log to console      Book Not Found In Book Store
                 Capture Page Screenshot
            END
    END


Alternate Way 2 Select Books From Store
	[Arguments]     ${BookName}
	${Elements}    Get WebElements     xpath:(//h2[@class='product-title']//a)
	FOR     ${Element}     IN      @{Elements}
            IF      '${Element.text}'=='${BookName}'
                Click Locator   ${Element}
                sleep    2
                BREAK
            ELSE
                 log to console      Book Not Found In Book Store
                 Capture Page Screenshot
            END

    END


Alternate Way 2 Print All Books Available In Store
	${elements}=    Get WebElements    xpath:(//h2[@class='product-title']//a)
    FOR    ${element}    IN    @{elements}
        Log    ${element.text}
    END


Print All Books Available In Store
	${ElementsCount}  Get Element Count      xpath://h2[@class='product-title']
	FOR     ${i}    IN RANGE    1   ${ElementsCount}
            ${BookName}      get text      xpath:(//h2[@class='product-title']//a)[${i}]
            Log     ${BookName}
    END

Add Product2_Cart
	Wait Until Page Contains Element    xpath:(//*[@value="Add to cart"])[1]
	Click Button    xpath:(//*[@value="Add to cart"])[1]