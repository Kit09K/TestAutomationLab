*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${URL}                    http://localhost:7272/Lab4/Registration.html
${BROWSER}                Chrome
${FIRST_NAME}             Somyod
${LAST_NAME}              Sodsai
${ORGANIZATION}           CS KKU
${EMAIL}                  somyod@kkumail.com
${PHONE}                  091-001-1234

*** Test Cases ***
Open Event Registration Page
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Wait Until Page Contains    Event Registration

Register Success
    [Setup]    Open Browser    ${URL}    ${BROWSER}
    Input Text    name=firstname     ${FIRST_NAME}
    Input Text    name=lastname      ${LAST_NAME}
    Input Text    name=organization  ${ORGANIZATION}
    Input Text    name=email         ${EMAIL}
    Input Text    name=phone         ${PHONE}
    Click Button    Register

    Log    Registration completed successfully
    Log    ========== REGISTRATION REPORT ==========
    Log    First Name: ${FIRST_NAME}
    Log    Last Name: ${LAST_NAME}
    Log    Organization: ${ORGANIZATION}
    Log    Email: ${EMAIL}
    Log    Phone: ${PHONE}
    Log    Status: Registration Successful
    Log    =========================================
    Close Browser
