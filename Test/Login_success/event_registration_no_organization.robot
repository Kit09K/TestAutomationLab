*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${URL}                    http://localhost:7272/Lab4/Registration.html
${BROWSER}                Chrome
${FIRST_NAME}             Somyod
${LAST_NAME}              Sodsai
${EMAIL}                  somyod@kkumail.com
${PHONE}                  091-001-1234

*** Test Cases ***
Open Event Registration Page
    Open Registration Page

Register Success No Organization Info
    [Setup]            Open Registration Page
    Fill Registration Form Without Organization
    Submit Registration Form
    Generate Registration Report
    Close Browser

*** Keywords ***
Open Registration Page
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Wait Until Page Contains    Event Registration    timeout=10s

Fill Registration Form Without Organization
    Input Text    name=firstname    ${FIRST_NAME}
    Input Text    name=lastname     ${LAST_NAME}
    Input Text    name=email        ${EMAIL}
    Input Text    name=phone        ${PHONE}


Submit Registration Form
    Click Button    Register
    Log    Registration form submitted


Generate Registration Report
    [Documentation]    สร้างรายงานการลงทะเบียน
    
    Log    ========== REGISTRATION REPORT ==========
    Log    Registration Type: No Organization Info
    Log    First Name: ${FIRST_NAME}
    Log    Last Name: ${LAST_NAME}
    Log    Organization: [NOT PROVIDED]
    Log    Email: ${EMAIL}
    Log    Phone: ${PHONE}
    Log    Registration Status: SUCCESS
    Log    Note: Registration successful without organization information
    Log    ==========================================  

