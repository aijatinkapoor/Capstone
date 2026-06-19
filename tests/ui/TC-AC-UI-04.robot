*** Settings ***
Resource    ../../resources/keywords/common_keywords.robot
Resource    ../../resources/pages/home_page.robot
Resource    ../../resources/pages/open_new_account_page.robot

Suite Setup       Run Keywords  Load Environment  AND    Set GLobal Timeout
Test Setup        Open Application And Login
Test Teardown     Close Application

*** Test Cases ***
TC-AC-UI-04
    [Documentation]    Verify Open New Account Form Controls

    Click Open New Account
    Wait Until Location Contains    openaccount

    Element Should Be Visible    ${ACCOUNT_TYPE_DROPDOWN}
    Element Should Be Visible    ${ACCOUNT_ID_DROPDOWN}
    Element Should Be Visible    ${OPEN_ACCOUNT_BUTTON}