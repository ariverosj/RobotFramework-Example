*** Settings ***
Library    Browser

*** Variables ***
${url}  https://exxeta.com/

*** Keywords ***
open EXXETA Web site
    [Documentation]    open EXXETA Web site '${url}'
    New Page    ${url}

click on menu
    [Documentation]    click on a menu point and take Screenshot
    [Arguments]    ${menuPoint}
    ${menuPointElement}  Get Element By Role    BUTTON    name=${menuPoint}
    Click    ${menuPointElement}
    Take Screenshot

click on menu item
    [Documentation]    click on a menu item and take Screenshot
    [Arguments]    ${branche}
    ${brancheElement}  Get Element By Role    MENUITEM    name=${branche}  exact=true
    Click    ${brancheElement}
    Take Screenshot

retrive title text
    [Documentation]  get title from h1 tag
    ${title}  Get Element By Role  HEADING  level=1
    ${titleText}  Get Text  ${title}
    Log Many    ${titleText}
    RETURN  ${titleText}


