#!/bin/bash

yarn clean
yarn test

if [[ ! -z "${ALLURE_PORT}" && -d ./allure-report ]]; then
    yarn report
fi