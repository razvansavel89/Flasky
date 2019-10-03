*** Settings ***
Documentation   This file is responsible with exposing the generic config data used used across all the framework
Library           SeleniumLibrary

*** Variables ***
${URL}            http://0.0.0.0:5000
${BROWSER}        Firefox
${DELAY}          0
${IMPLICIT_WAIT_INTERVAL}       10