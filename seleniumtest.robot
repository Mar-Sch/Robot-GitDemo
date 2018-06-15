*** Settings ***
Library  SeleniumLibrary


*** Variables ***


*** Test Cases ***
Open Amazon
    click link  default=/gp/registry/wishlist/ref=nav_wishlist_create?ie=UTF8&triggerElementID=createList

Search results page should contain 30 products
    [Tags]  Current
    AmazonApp.Search for Products  {

*** Keywords ***

