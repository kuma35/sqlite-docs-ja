#!/bin/bash
PROJ=${HOME}/work/sqlite-docs-ja
PO_DIR=${PROJ}/po
C3REF_DIR=c3ref
SESSION_DIR=session
SYNTAX_DIR=syntax

pushd ${PO_DIR}
ls -1 *.po ${C3REF_DIR}/*.po ${SESSION_DIR}/*.po ${SYNTAX_DIR}/*.po | gawk -f ${PROJ}/po_count.awk
date
popd
