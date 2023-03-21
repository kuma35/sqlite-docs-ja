#!/usr/bin/bash -x
PROJ=${HOME}/work/sqlite-docs-ja
SEDOUT_DIR=${PROJ}/sedout
PO_DIR=${PROJ}/po
DST_DIR=${PROJ}/docs/html
C3REF_DIR=c3ref
SESSION_DIR=session
SYNTAX_DIR=syntax

pushd ${PROJ}

for target_dir in ${SEDOUT_DIR} ${PO_DIR} ${DST_DIR}
do
    pushd ${target_dir}
    for dir_name in ${C3REF_DIR} ${SESSION_DIR} ${SYNTAX_DIR}
    do
	if [ ! -d ${dir_name} ]; then
	    mkdir ${dir_name}
	fi
    done
    popd
done
make
exitcode=$?
if [ ${exitcode} -ne 0 ]; then
    notify-send -u critical sqlite-docs-ja "Makefile エラー"
    exit ${exitcode}
fi
notify-send -u normal sqlite-docs-ja "compile完了。"

popd
