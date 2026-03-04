*** Settings ***
Library    Browser
Resource    ../resources/webElements.resource

*** Variables ***
${url}  https://exxeta.com/
${menuPoint}  Branchen
${branche}  Financial Services
${expectedTitle}  Unlock your financial potentials

*** Test Cases ***
open Financial Services
    [Documentation]    Open EXXETA Website and go to Financial Services
    New Page    ${url}
    ${menuPointElement}  Get Element By Role    BUTTON    name=${menuPoint}
    Click    ${menuPointElement}
    Take Screenshot
    ${brancheElement}  Get Element By Role    MENUITEM    name=${branche}  exact=true
    Click    ${brancheElement}
    Take Screenshot
    ${title}  Get Element By Role  HEADING  level=1
    ${titleText}  Get Text  ${title}
    Log Many    ${titleText}
    Should Contain    ${titleText}    ${expectedTitle}

open Financial Serivices Keyword
    [Documentation]    Open EXXETA Website and go to Financial Services. Uses customizing Keyword from ../resources/webElements.resource
    Open EXXETA Web Site
    Click On Menu    ${menuPoint}
    Click On Menu Item    ${branche}
    ${titleText}  Retrive Title Text
    Should Contain    ${titleText}    ${expectedTitle}

    


    
