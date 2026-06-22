*** Settings ***
Library    SeleniumLibrary
Library    DataDriver    ../../register_data.xlsx

Resource    ../../resources/pages/register_page.robot
Resource    ../../resources/keywords/common_keywords.robot

Suite Setup       Run Keywords    Load Environment    AND    Set GLobal Timeout
Test Setup        Open Application
Test Teardown     Close Application

Test Template     Register User


*** Test Cases ***
Registration With Excel Data


*** Keywords ***
Register User
    [Arguments]
    ...    ${FirstName}
    ...    ${LastName}
    ...    ${Address}
    ...    ${City}
    ...    ${State}
    ...    ${Zip}
    ...    ${Phone}
    ...    ${SSN}
    ...    ${Username}
    ...    ${Password}

    Register btn

    Registration
    ...    ${FirstName}
    ...    ${LastName}
    ...    ${Address}
    ...    ${City}
    ...    ${State}
    ...    ${Zip}
    ...    ${Phone}
    ...    ${SSN}
    ...    ${Username}
    ...    ${Password}

    ${already_exists}=    Run Keyword And Return Status
    ...    Page Should Contain    This username already exists


    IF    ${already_exists}
        Log    Username already exists - Negative TC Passed

    ELSE
        Page Should Contain    Welcome
        Log    Registration successful - Positive TC Passed

    END