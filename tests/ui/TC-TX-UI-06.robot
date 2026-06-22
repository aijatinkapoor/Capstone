*** Settings ***
Resource    ../../resources/keywords/common_keywords.robot
Resource    ../../resources/pages/home_page.robot
Resource    ../../resources/pages/transfer_funds_page.robot

Suite Setup       Run Keywords  Load Environment  AND    Set GLobal Timeout
Test Setup        Open Application And Login
Test Teardown     Close Application

*** Test Cases ***
TC-TX-UI-06
    [Documentation]    Verify transfer fails when negative amount is entered
    [Tags]    ui   negative    Bug-001

    Click Transfer Funds
    Wait Until Location Contains    transfer

    Wait Until Element Is Visible    ${AMOUNT_FIELD}
    Input Text    ${AMOUNT_FIELD}    -250

    Wait Until Keyword Succeeds    10s    1s    Select From List By Index    ${FROM_ACCOUNT_DROPDOWN}    0

    Wait Until Keyword Succeeds    10s    1s    Select From List By Index    ${TO_ACCOUNT_DROPDOWN}    1

    Click Transfer Button
    Page Should  Contain    Transfer Complete!