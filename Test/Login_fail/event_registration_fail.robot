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
${INVALID_PHONE}          1234
${EMPTY_VALUE}            [EMPTY]

*** Test Cases ***
Event Registration Validation Scenario
    Test Empty First Name
    Test Empty Last Name
    Test Empty First Name and Last Name
    Test Empty Email
    Test Empty Phone Number
    Test Invalid Phone Number

*** Keywords ***
Open Registration Page
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Wait Until Page Contains    Event Registration    timeout=10s

Test Empty First Name
    Log    === Test Case 1: Empty First Name ===
    Open Registration Page
    Clear Element Text    name=firstname
    Input Text    name=lastname        ${LAST_NAME}
    Input Text    name=organization    ${ORGANIZATION}
    Input Text    name=email           ${EMAIL}
    Input Text    name=phone           ${PHONE}
    Click Button    Register
    Generate Test Report    Empty First Name    ${EMPTY_VALUE}    ${LAST_NAME}    ${ORGANIZATION}    ${EMAIL}    ${PHONE}
    Close Browser

Test Empty Last Name
    Log    === Test Case 2: Empty Last Name ===
    Open Registration Page
    Input Text    name=firstname      ${FIRST_NAME}
    Clear Element Text    name=lastname
    Input Text    name=organization   ${ORGANIZATION}
    Input Text    name=email          ${EMAIL}
    Input Text    name=phone          ${PHONE}
    Click Button    Register
    Generate Test Report    Empty Last Name    ${FIRST_NAME}    ${EMPTY_VALUE}    ${ORGANIZATION}    ${EMAIL}    ${PHONE}
    Close Browser

Test Empty First Name and Last Name
    Log    === Test Case 3: Empty First Name and Last Name ===
    Open Registration Page
    Clear Element Text    name=firstname
    Clear Element Text    name=lastname
    Input Text    name=organization    ${ORGANIZATION}
    Input Text    name=email           ${EMAIL}
    Input Text    name=phone           ${PHONE}
    Click Button    Register
    Generate Test Report    Empty First Name and Last Name    ${EMPTY_VALUE}    ${EMPTY_VALUE}    ${ORGANIZATION}    ${EMAIL}    ${PHONE}
    Close Browser

Test Empty Email
    Log    === Test Case 4: Empty Email ===
    Open Registration Page
    Input Text    name=firstname      ${FIRST_NAME}
    Input Text    name=lastname       ${LAST_NAME}
    Input Text    name=organization   ${ORGANIZATION}
    Clear Element Text    name=email
    Input Text    name=phone          ${PHONE}
    Click Button    Register
    Generate Test Report    Empty Email    ${FIRST_NAME}    ${LAST_NAME}    ${ORGANIZATION}    ${EMPTY_VALUE}    ${PHONE}
    Close Browser

Test Empty Phone Number
    Log    === Test Case 5: Empty Phone Number ===
    Open Registration Page
    Input Text    name=firstname      ${FIRST_NAME}
    Input Text    name=lastname       ${LAST_NAME}
    Input Text    name=organization   ${ORGANIZATION}
    Input Text    name=email          ${EMAIL}
    Clear Element Text    name=phone
    Click Button    Register
    Generate Test Report    Empty Phone Number    ${FIRST_NAME}    ${LAST_NAME}    ${ORGANIZATION}    ${EMAIL}    ${EMPTY_VALUE}
    Close Browser

Test Invalid Phone Number
    Log    === Test Case 6: Invalid Phone Number ===
    Open Registration Page
    Input Text    name=firstname      ${FIRST_NAME}
    Input Text    name=lastname       ${LAST_NAME}
    Input Text    name=organization   ${ORGANIZATION}
    Input Text    name=email          ${EMAIL}
    Input Text    name=phone          ${INVALID_PHONE}
    Click Button    Register
    Generate Test Report    Invalid Phone Number    ${FIRST_NAME}    ${LAST_NAME}    ${ORGANIZATION}    ${EMAIL}    ${INVALID_PHONE}
    Close Browser

Generate Test Report
    [Documentation]    สร้างรายงานสำหรับแต่ละ Test Case
    [Arguments]    ${test_case_name}    ${firstname}    ${lastname}    ${organization}    ${email}    ${phone}
    
    ${current_time}=    Get Time
    
    Log    ========== TEST CASE REPORT ==========
    Log    Test Case: ${test_case_name}
    Log    URL: ${URL}
    Log    Browser: ${BROWSER}
    Log    Timestamp: ${current_time}
    Log    ${SPACE}
    Log    === Form Data ===
    Log    First Name: ${firstname}
    Log    Last Name: ${lastname}
    Log    Organization: ${organization}
    Log    Email: ${email}
    Log    Phone: ${phone}
    Log    ${SPACE}
    Log    === Action ===
    Log    Action: Clicked Register Button
    Log    Status: Form Submitted
    Log    =====================================
