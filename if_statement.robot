*** Settings ***

# robot
# Robot -d Results -i if if_statement.robot

*** Variables ***
${myVariable} =  100

*** Test Cases ***
Testing the if logic
    [tags]  if
    RUN KEYWORD IF  ${myvariable} > 50  Keyword 1

Testing if, else statement
    [tags]  if
    RUN KEYWORD IF  ${myVariable} < 50  keyword 1
    ...  ELSE  keyword 2

Testing if, else if statement
    [tags]  if
    run keyword if  ${myVariable} < 50  keyword 1
    ...  ELSE IF  ${myvariable} == 100  Keyword 3

*** Keywords ***
Keyword 1
    log  keyword 1 executed

Keyword 2
    log  keyword 2 executed

Keyword 3
    log  keyword 3 executed