*** Settings ***
Library    SeleniumLibrary
Resource    ../../variables/open_new_account_variables.robot

*** Keywords ***
Select Account Type
    [Arguments]    ${account_type}
    Select From List By Value    ${ACCOUNT_TYPE_DROPDOWN}    ${account_type}
    Sleep    1s

Select Account ID
    [Arguments]    ${account_id}
    Select From List By Value    ${ACCOUNT_ID_DROPDOWN}    ${account_id}
    Sleep    1s

Click Open Account Button
    Click Element    ${OPEN_ACCOUNT_BUTTON}
    Sleep    2s

Click Account Details Link
    Click Element    ${ACCOUNT_DETAILS_LINK}
    Sleep    1s

Get New Account Number
    Wait Until Element Is Visible    ${ACCOUNT_DETAILS_LINK}    timeout=20s

    ${account_id}=    Get Text    ${ACCOUNT_DETAILS_LINK}

    Log To Console    Account ID = ${account_id}

    RETURN    ${account_id}