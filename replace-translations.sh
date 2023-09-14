#!/bin/bash

PROJECT_LOCALES_PATH=~/Lulu/upp/platform/services/auth_service/keycloak-theme-v2/src/i18n/locales

msgcat --no-wrap --use-first $PROJECT_LOCALES_PATH/messages-de.po ./messages-de.po -o $PROJECT_LOCALES_PATH/messages-de.po
msgcat --no-wrap --use-first $PROJECT_LOCALES_PATH/messages-es.po ./messages-es.po -o $PROJECT_LOCALES_PATH/messages-es.po
msgcat --no-wrap --use-first $PROJECT_LOCALES_PATH/messages-fr.po ./messages-fr.po -o $PROJECT_LOCALES_PATH/messages-fr.po
msgcat --no-wrap --use-first $PROJECT_LOCALES_PATH/messages-it.po ./messages-it.po -o $PROJECT_LOCALES_PATH/messages-it.po
