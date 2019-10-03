#!/bin/sh
rm -r ../test_results/* ;
pytest ../tests/test_users_endpoint.py --html=../test_results/api_test_report.html --self-contained-html
