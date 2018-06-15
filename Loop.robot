*** Settings ***
Library  String
# Robot -d Results Loop.robot

*** Test Cases ***
FOR loop with Upper Bounds Range
    [Documentation]  This gives a 0 based range
    :FOR  ${Index}  IN RANGE  5
    \  Do Something  ${Index}
    \  ${RANDOM_STRING} =  generate random string  ${Index}  #this will generate a random string with ${Index} amount of characters
    \  Log  ${RANDOM_STRING}

FOR loop with Start and Finish Range
    [Documentation]  no longer a 0 based range because I provided the start
    :FOR  ${Index}  IN RANGE  1  4
    \  Do Something  ${Index}
    \  ${RANDOM_STRING} =  generate random string  ${Index}
    \  Log  ${RANDOM_STRING}

FOR loop with Start and Finish and Step Range
    [Documentation]  the counter will jump by 2 each time ("step" value = 2)
    :FOR  ${Index}  IN RANGE  1  10  2
    \  Do Something  ${Index}
    \  ${RANDOM_STRING} =  generate random string  ${Index}
    \  Log  ${RANDOM_STRING}

FOR loop with list
    @{ITEMS} =  create list  Item 1  Item 2  Item 3

    :FOR  ${myItem}  in  @{ITEMS}
    \  log  ${myItem}

Exit a FOR loop with list
    @{ITEMS} =  create list  Item 1  Item 2  Item 3  Item 4

    :FOR  ${myItem}  in  @{ITEMS}
    \  log  ${myItem}
    \  run keyword if  "${myItem}" == "Item 3"  exit for loop
    \  log  Didn't exit yet

    Log  Now we're out of the loop

Repeat a keyword many times
    repeat keyword  5  A repeatable keyword
    repeat keyword  5 times  A repeatable keyword
    repeat keyword  3 s  A repeatable keyword

*** Keywords ***
Do Something
    [Arguments]  ${PassedIndex}
    Log  I was passed a value of ${PassedIndex}!

A repeatable keyword
    Log  this is a repeatable keyword