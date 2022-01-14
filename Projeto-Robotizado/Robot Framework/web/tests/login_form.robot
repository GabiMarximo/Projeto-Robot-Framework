*** Settings ***
Resource        base.robot
Test Setup      Nova sessão
Test Teardown   Encerra sessão

*** Test Cases ***
Login com sucesso
    Go To                       ${url}/login
    Login With                  stark       jarvis!
    Should See Logged User      Tony Stark

Senha invalida
    Go To                           ${url}/login
    Login With                      stark       errada
    Should Contain Login Alert      Senha é invalida!

Usuário não cadastrado  
    Go To                           ${url}/login
    Login With                      gabi        jarvis!
    Should Contain Login Alert      O usuário informado não está cadastrado!

*** Keywords ***
Login With
    [Arguments]     ${uname}        ${pass}

    Input text          css:input[name=username]        ${uname}
    Input text          css:input[name=password]        ${pass}
    Click Element       class:btn-login

Should Contain Login Alert
    [Arguments]     ${expected_message}

    ${message}=         Get WebElement      id:flash
    Should Contain      ${message.text}     ${expected_message}

Should See Logged User 
    [Arguments]     ${full_name}    
    
    Page Should Contain     Olá, ${full_name}. Você acessou a área logada!
