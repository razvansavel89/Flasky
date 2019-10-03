*** Settings ***
Documentation   This abstraction is responsible with exposing the variables used inside home_page_steps.robot file

Resource    ../config/config.robot

*** Variables ***

${ERROR_PAGE_TITLE}         Login Failure - Demo App
${ERROR_HEADER}             Login Failure
${ERROR_MESSAGE}            You provided incorrect login details

${ERROR_PAGE_TITLE_ELEMENT}         css = header h1
${ERROR_PAGE_MESSAGE_ELEMENT}       css = header + p