*** Settings ***
Library    SeleniumLibrary

*** Variables ***                  
${CART_ITEMS}    css=#cart-items
${CART_ELEMENT}    xpath=/html/body/div[3]/h2
${FIRST_NAME_FIELD}    id=first-name
${LAST_NAME_FIELD}    id=last-name
${POSTAL_CODE_FIELD}    id=postal-code
${COMPLETE_PURCHASE_BUTTON}    xpath=/html/body/div[3]/div[2]/button
${PURCHASE_COMPLETED}    xpath=/html/body/div[4]/h2

*** Keywords ***
Verify Cart Page Loaded
    Wait Until Element Is Visible    ${CART_ELEMENT}
    Element Should Be Visible        ${CART_ELEMENT}

Remove N Product from Cart
    [Arguments]    ${PRODUCT_ID}
    Verify Cart Page Loaded
    #   !NOTE! first product has index 1 
    Log    Removing product at index ${PRODUCT_ID}
    # CSS selector to remove a specific product from cart
    Wait Until Element Is Visible    ${CART_ITEMS} .cart-item:nth-child(${PRODUCT_ID}) button
    Click Button    ${CART_ITEMS} .cart-item:nth-child(${PRODUCT_ID}) button

Fill Information and Complete Purchase
    [Arguments]    ${first_name}    ${last_name}    ${postal_code}
    Verify Cart Page Loaded
    Input Text    ${FIRST_NAME_FIELD}    ${first_name}
    Input Text    ${LAST_NAME_FIELD}    ${last_name}
    Input Text    ${POSTAL_CODE_FIELD}    ${postal_code}
    Click Button    ${COMPLETE_PURCHASE_BUTTON}

Verify Purchase Completed
    Wait Until Element Is Visible    ${PURCHASE_COMPLETED}
    ${text}=    Get Text    ${PURCHASE_COMPLETED}
    Should Contain    ${text}    Thank You For Your Order!