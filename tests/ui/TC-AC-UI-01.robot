*** Settings ***
Resource    ../../resources/keywords/common_keywords.robot
Resource    ../../resources/pages/home_page.robot
Resource    ../../resources/pages/open_new_account_page.robot

Suite Setup       Run Keywords  Load Environment  AND    Set GLobal Timeout
Test Setup        Open Application And Login
Test Teardown     Close Application

    
*** Test Cases ***
TC-AC-UI-01
    [Documentation]    Create Savings Account with Specific Source Funding Account
    [Tags]    ui   positive

    Click Open New Account
    Wait Until Location Contains    openaccount

    Select Account Type    1
    wait until keyword Succeeds  10s  1s  Select Account ID    13344

    Click Open Account Button

    Wait Until Page Contains    Account Opened!
    Wait Until Page Contains    Your new account number