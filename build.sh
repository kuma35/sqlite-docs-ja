#!/bin/sh

PROJ=${HOME}/work/splite-docs-ja
make
exitcode=$?
if [ ${exitcode} -ne 0 ]; then
    notify-send -u critical sqlite-docs-ja "Makefile エラー"
    exit ${exitcode}
fi
echo "restore htmls..."
${PROJ}/restore-htmls.sh

notify-send -u normal sqlite-docs-ja "compile完了。"
