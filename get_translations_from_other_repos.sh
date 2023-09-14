#!/bin/bash

rm messages-de.po messages-es.po messages-fr.po messages-it.po

pull_translations() {
  mkdir "$1"
  cd "$1"
  git init
  git remote add -f origin "git@gitlab.com:lulu-press/upp/frontends/$1.git"

  git config core.sparseCheckout true
  echo "$2" >> .git/info/sparse-checkout

  git pull --depth 1 origin main
  cd ..
}

pull_translations "project-wizard" "src/locales/"
pull_translations "lulu-direct-ui" "src/i18n/locales/"
pull_translations "lulu-website" "locales/"
pull_translations "cover-tool" "src/i18n/locales/"
pull_translations "lulu-checkout" "src/i18n/locales/"

cd project-wizard/src/locales
mv de es it fr ../../
cd ../../../
rm -rf project-wizard/src

cd lulu-direct-ui/src/i18n/locales
mv de es it fr ../../../
cd ../../../../
rm -rf lulu-direct-ui/src

cd lulu-website/locales
mv de es it fr ..
cd ../../
rm -rf lulu-website/locales

cd cover-tool/src/i18n/locales
mv de es it fr ../../../
cd ../../../../
rm -rf cover-tool/src

cd lulu-checkout/src/i18n/locales
mv de es it fr ../../../
cd ../../../../
rm -rf lulu-checkout/src

msgcat --no-wrap --use-first project-wizard/de/messages.po lulu-direct-ui/de/messages.po lulu-website/de/messages.po cover-tool/de/messages.po lulu-checkout/de/messages.po -o messages-de.po
msgcat --no-wrap --use-first project-wizard/es/messages.po lulu-direct-ui/es/messages.po lulu-website/es/messages.po cover-tool/es/messages.po lulu-checkout/es/messages.po -o messages-es.po
msgcat --no-wrap --use-first project-wizard/fr/messages.po lulu-direct-ui/fr/messages.po lulu-website/fr/messages.po cover-tool/fr/messages.po lulu-checkout/fr/messages.po -o messages-fr.po
msgcat --no-wrap --use-first project-wizard/it/messages.po lulu-direct-ui/it/messages.po lulu-website/it/messages.po cover-tool/it/messages.po lulu-checkout/it/messages.po -o messages-it.po

rm -rf project-wizard lulu-direct-ui lulu-website cover-tool lulu-checkout
