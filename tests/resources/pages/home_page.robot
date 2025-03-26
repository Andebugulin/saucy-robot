*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${HOME_ELEMENT}     xpath=//*[@id="products-grid"]/div[1] 
${CART}    xpath=//*[@id="product-page"]/div[1]/div/div
${PRODUCTS_LIST}    //*[@id="products-grid"]

*** Keywords ***
Verify Home Page Loading
    Wait Until Element Is Visible    ${HOME_ELEMENT}
    Element Should Be Visible        ${HOME_ELEMENT}

Buy N Product
    [Arguments]    ${PRODUCT_ID}
    Verify Home Page Loading
    #   !NOTE! first product has index 1
    ${product}=    Get WebElement    ${PRODUCTS_LIST}/div[${PRODUCT_ID}]/button
    Click Element    ${product}

Go To Cart
    Verify Home Page Loading
    ${cart}=    Get WebElement    ${CART}
    Click Element    ${cart}