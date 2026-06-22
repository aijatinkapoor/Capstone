*** Settings ***
Library    SeleniumLibrary
Resource    ../../variables/register_variables.robot


*** Keywords ***
Register btn
    Click Element    ${register}


Registration
    [Arguments]
    ...    ${fname}
    ...    ${lname}
    ...    ${address}
    ...    ${city_value}
    ...    ${state_value}
    ...    ${zip_value}
    ...    ${phone_value}
    ...    ${ssn_value}
    ...    ${username}
    ...    ${password}

    Wait Until Element Is Visible    ${fn}

    Input Text    ${fn}    ${fname}
    Input Text    ${ln}    ${lname}
    Input Text    ${add}    ${address}
    Input Text    ${city}    ${city_value}
    Input Text    ${state}    ${state_value}
    Input Text    ${zip}    ${zip_value}
    Input Text    ${phone}    ${phone_value}
    Input Text    ${ssn}    ${ssn_value}
    Input Text    ${user}    ${username}
    Input Text    ${pass}    ${password}
    Input Text    ${conf_pass}    ${password}

    Click Element    ${rgstr_btn}