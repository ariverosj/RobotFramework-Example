*** Settings ***
Library    ../libraries/CSVResource.py

*** Variables ***
${CSV_PATH}      testCSV.csv
${NEW_COLUMN_NAME}   status
${EXPECTED}      active

*** Test Cases ***
csv resource
    [Documentation]    Proof csv resource
    ${theCSV}  Read Csv And Edit Column  ${CSV_PATH}  ${NEW_COLUMN_NAME}  ${EXPECTED}
    Log Many    ${theCSV}
    csv should contain value  ${theCSV}  ${NEW_COLUMN_NAME}  ${EXPECTED}
    csv should contain value  ${theCSV}  ${NEW_COLUMN_NAME}  ${EXPECTED}_False