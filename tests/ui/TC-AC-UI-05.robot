*** Settings ***
Library    SeleniumLibrary
Resource    ../../resources/pages/register_page.robot
Resource    ../../resources/keywords/common_keywords.robot

Suite Setup       Run Keywords  Load Environment  AND    Set GLobal Timeout
Test Setup        Open Application
Test Teardown     Close Application

*** Test Cases ***
Register
    [Documentation]     Register Form Validation
    [Tags]    ui   positive

    Register btn
    Wait Until Location Contains    register.htm
    Registration

    Wait Until Page Contains    Welcome


    