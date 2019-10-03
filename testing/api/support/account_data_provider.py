#!/usr/bin/python
import sys
import json
import os

test_data_directory = os.path.dirname(os.path.dirname(__file__))
sys.path.append(test_data_directory)

account_data_file = os.path.join(test_data_directory, 'test_data/account_data.json')

with open(account_data_file, 'r') as file:
    json_data_file = json.load(file)


def get_user_attribute_value(user, attribute_value):
    return json_data_file[user][attribute_value]


def get_account_username(user):
    return get_user_attribute_value(user, 'username')


def get_account_password(user):
    return get_user_attribute_value(user, 'password')


def get_account_first_name(user):
    return get_user_attribute_value(user, 'firstname')


def get_account_last_name(user):
    return get_user_attribute_value(user, 'lastname')


def get_account_phone(user):
    return get_user_attribute_value(user, 'phone')
