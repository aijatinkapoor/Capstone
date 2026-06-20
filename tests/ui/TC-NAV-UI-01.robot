*** Settings ***
Resource    ../../resources/keywords/common_keywords.robot
Resource    ../../resources/pages/home_page.robot

Suite Setup       Run Keywords  Load Environment  AND    Set GLobal Timeout
Test Setup        Open Application And Login
Test Teardown     Close Application

*** Test Cases ***
TC-NAV-UI-01
    [Documentation]    Verify Navigation Flow and Menu Link Integrity
    [Tags]    ui   positive

    Click Open New Account
    Wait Until Location Contains    openaccount

    Click Transfer Funds
    Wait Until Location Contains    transfer