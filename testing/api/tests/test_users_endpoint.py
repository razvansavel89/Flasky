#!/usr/bin/python
# -*- coding: utf-8 -*-
import sys
import os
import requests

from testing.api.support import account_data_provider
from testing.api.config.environment_constants import get_formatted_URL
from testing.api.config.endpoints import Endpoints
from unittest import TestCase

path = os.path.dirname(os.path.dirname(os.path.dirname(os.path.dirname(__file__))))
sys.path.append(path)


def perform_token_call():
    return requests.get(get_formatted_endpoint_url(Endpoints.AUTHENTICATION),
                        auth=(account_data_provider.get_account_username(expectedUserData),
                              account_data_provider.get_account_password(expectedUserData)))


def get_token():
    token_response = perform_token_call()

    if token_response.status_code >= 400:
        raise Exception('Response call returned status code: {}'.format(token_response.status_code))
    else:
        return token_response.json()["token"]


def get_formatted_endpoint_url(endpoint):
    return "{}{}".format(get_formatted_URL(), endpoint)


def getUserResponse(endpoint):
    return requests.get(get_formatted_endpoint_url(endpoint),
                        headers={'Token': '{}'.format(get_token()),
                                 'Content-Type': 'application/json',
                                 'Accept': 'application/json'})


expectedUserData = 'EXISTING_USER_A'
EXISTING_USER_ENDPOINT = Endpoints.USERS + '/' + account_data_provider.get_account_username(expectedUserData)


class TestUser(TestCase):

    def test_token_endpoint(self):
        response = perform_token_call()

        self.assertEqual("application/json", response.headers['Content-Type'])
        self.assertTrue(response.ok)
        self.assertTrue(200, response.status_code)
        self.assertEqual('SUCCESS', response.json()['status'])
        self.assertEqual(52, len(response.json()['token']))
        self.assertTrue(response.json()['token'].isalnum())

    def test_responseHeader(self):
        response = getUserResponse(EXISTING_USER_ENDPOINT)

        self.assertEqual('application/json', response.headers['Content-Type'])
        self.assertEqual('Werkzeug/0.15.3 Python/2.7.16', response.headers['Server'])
        self.assertEqual(126, int(response.headers['Content-Length']))

    def test_positive_get_user_data(self):
        response = getUserResponse(EXISTING_USER_ENDPOINT)

        self.assertTrue(response.ok)
        self.assertEqual('SUCCESS', response.json()['status'])
        self.assertEqual("retrieval succesful", response.json()['message'])

        self.assertEqual(account_data_provider.get_user_attribute_value(expectedUserData, 'firstname'),
                         response.json()['payload']['firstname'])
        self.assertEqual(account_data_provider.get_user_attribute_value(expectedUserData, 'lastname'),
                         response.json()['payload']['lastname'])
        self.assertEqual(account_data_provider.get_user_attribute_value(expectedUserData, 'phone'),
                         response.json()['payload']['phone'])

    def test_negative_get_user_data(self):
        response = getUserResponse('INVALID_USER_ENDPOINT')
        self.assertFalse(response.ok)
        self.assertEqual(404, int(response.status_code))

    def test_get_users_list(self):
        response = getUserResponse(Endpoints.USERS)
        self.assertTrue(response.ok)
        self.assertEqual(200, response.status_code)

        users = response.json()['payload']
        expected_username = account_data_provider.get_account_username(expectedUserData)
        if expected_username not in users:
            self.fail(expected_username + ' could not be found within the users list!')

    def test_put_user(self):
        user = 'NEW_USER'
        # password = generate_password_hash('CRFTest1234!')
        # print(password)
        myHeaders = {'Token': '{}'.format(get_token()),
                     'Content-Type': 'application/json',
                     'Accept': 'application/json'
                     }
        response = requests.put(
            get_formatted_endpoint_url(Endpoints.USERS + '/' + account_data_provider.get_account_username(user)),
            json=user,
            headers=myHeaders)

        self.assertTrue(response.ok)
        self.assertEqual(201, response.status_code)

        createResponseCheck = getUserResponse(user)

        self.assertEqual(200, createResponseCheck.status_code)
        self.assertEqual(account_data_provider.get_account_username(user),
                         createResponseCheck.json()['payload']['username'],
                         'Response First name was not the appropriate one')
        self.assertEqual(account_data_provider.get_account_first_name(user),
                         createResponseCheck.json()['payload']['firstname'])
        self.assertEqual(account_data_provider.get_account_last_name(user),
                         createResponseCheck.json()['payload']['lastname'])
        self.assertEqual(account_data_provider.get_account_phone(user),
                         createResponseCheck.json()['payload']['phone'])
