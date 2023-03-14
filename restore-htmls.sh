#!/bin/sh
# in sh,bash, ture is 0(zero), false is non-zero
PROJ=${HOME}/work/sqlite-docs-ja
cd ${PROJ}/docs/html
git ls-files -m -- "*.html" | while read line; do
    if test -e ${line} &&
	    ! git diff --quiet HEAD -- ${line}
    then
	git restore --source HEAD -- ${line}
    fi
done
