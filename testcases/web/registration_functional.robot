*** Setting ***
Resource        ${CURDIR}/../../keywords/web_import.robot 

Test Setup      Run Keywords    common_keywords.Open    ${powerbuy}[homePageUrl]    ${browser}    AND    home_page.Go to Registration page
Test Teardown  Close All Browsers

*** Test Cases ***

TC01: Registration success

    registration_page.Generate a random Interger
    # input first name
    registration_page.Input First Name   ${registrationPageLocator}[txtFirstName]    ${user}[fistName] 
    #input last name 
    registration_page.Input Last Name    ${registrationPageLocator}[txtLastName]    ${user}[lastName]
    #input email
    registration_page.Input Email    ${registrationPageLocator}[txtEmail]    ${user}[emailUser]    ${user}[emailDomain]
    #input password
    common_keywords.Input Text    ${registrationPageLocator}[txtPassword]    ${user}[password]
    #input confirmation password
    common_keywords.Input Text    ${registrationPageLocator}[txtConfirmationPassword]    ${user}[password]
    #select consent for marketing
    common_keywords.Click Element    ${registrationPageLocator}[ckbConsentForMarketing]
    #register
    common_keywords.Click Button    ${registrationPageLocator}[btnSubmit]

    registration_page.Verify Register Successfully

TC02: Registration failed with existed email

    # input first name
    registration_page.Input First Name   ${registrationPageLocator}[txtFirstName]    ${user}[fistName] 
    #input last name 
    registration_page.Input Last Name    ${registrationPageLocator}[txtLastName]    ${user}[lastName]
    #input email
    registration_page.Input Email    ${registrationPageLocator}[txtEmail]    ${user}[emailUser]    ${user}[emailDomain]
    #input password
    common_keywords.Input Text    ${registrationPageLocator}[txtPassword]    ${user}[password]
    #input confirmation password
    common_keywords.Input Text    ${registrationPageLocator}[txtConfirmationPassword]    ${user}[password]
    #select consent for marketing
    common_keywords.Click Element    ${registrationPageLocator}[ckbConsentForMarketing]
    #register
    common_keywords.Click Button    ${registrationPageLocator}[btnSubmit]

    registration_page.Verify Error Message    ${registrationPageLocator}[lblNotificationErr]    ${error}[errCanNotCreateAccount]


TC03: Registration failed with empty first name

    #input last name 
    registration_page.Input Last Name    ${registrationPageLocator}[txtLastName]    ${user}[lastName]
    #input email
    registration_page.Input Email    ${registrationPageLocator}[txtEmail]    ${user}[emailUser]    ${user}[emailDomain]
    #input password
    common_keywords.Input Text    ${registrationPageLocator}[txtPassword]    ${user}[password]
    #input confirmation password
    common_keywords.Input Text    ${registrationPageLocator}[txtConfirmationPassword]    ${user}[password]
    #register
    common_keywords.Click Button    ${registrationPageLocator}[btnSubmit]

    #verify error message for empty first name
    registration_page.Verify Error Message    ${registrationPageLocator}[lblErrFirstName]    ${error}[errEmpty]

TC04: Registration failed with invalid email

    # input first name
    registration_page.Input First Name   ${registrationPageLocator}[txtFirstName]    ${user}[fistName]
    #input last name 
    registration_page.Input Last Name    ${registrationPageLocator}[txtLastName]    ${user}[lastName]
    #input email
    common_keywords.Input Text    ${registrationPageLocator}[txtEmail]    ${user}[emailUser]
    #input password
    common_keywords.Input Text    ${registrationPageLocator}[txtPassword]    ${user}[password]
    #input confirmation password
    common_keywords.Input Text    ${registrationPageLocator}[txtConfirmationPassword]    ${user}[password]
    #register
    common_keywords.Click Button    ${registrationPageLocator}[btnSubmit]

    #verify error message for invalid email
    registration_page.Verify Error Message    ${registrationPageLocator}[lblErrEegisterEmail]    ${error}[errRegisterEmail]
