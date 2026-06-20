*** Settings ***
Resource    ../../resources/keywords/common_keywords.robot
Resource    ../../resources/pages/home_page.robot
Resource    ../../resources/pages/open_new_account_page.robot

Suite Setup       Run Keywords  Load Environment  AND    Set GLobal Timeout
Test Setup        Open Application And Login
Test Teardown     Close Application


*** Test Cases ***
TC-AC-UI-02
    [Documentation]    Create Checking Account with Default Funding Options
    [Tags]    ui   positive

    Click Open New Account
    Wait Until Location Contains    openaccount

    Select Account Type    0

    Click Open Account Button

    Wait Until Page Contains    Account Opened!
    Wait Until Page Contains    Your new account number