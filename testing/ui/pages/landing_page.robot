*** Settings ***
Documentation   This abstraction is responsible with exposing the variables used inside landing_page_steps.robot file

*** Variables ***

${LANDING_PAGE_TITLE}              index page - Demo App
${LANDING_PAGE_HEADER}             css = h1 a
${LANDING_PAGE_REGISTER_ELEMENT}   css = ul>li:first-of-type a
${LANDING_PAGE_LOGIN_ELEMENT}      css = ul>li:last-of-type a
${LANDING_PAGE_REGISTER_LINK}      xpath = //a[text()='Register']
${LANDING_PAGE_LOGIN_LINK}         xpath = //a[text()='Log In']