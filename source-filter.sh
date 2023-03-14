#!/bin/sh
src=$1
dst=$2
if [ ${src} = "sqlite-doc-3410100/capi3ref.html" ]; then
    sed -f capi3ref.sed < ${src} | sed -f fix-xhtml.sed > ${dst}
elif [ ${src} = "sqlite-doc-3410100/changes.html" ]; then
    sed -e "6782c <dl></dl>" < ${src} | sed -f fix-xhtml.sed > ${dst}
elif [ ${src} = "sqlite-doc-3410100/chronology.html" ]; then
    sed -e "921i -->" -e "803a <\!--" < ${src} | sed -f fix-xhtml.sed > ${dst}
elif [ ${src} = "sqlite-doc-3410100/compile.html" ]; then
    sed -e "1125c <ul>" -e "1126,1148s/^<p>\s*<li>/<li>/" -e "1126,1148s/<\/p>$//g" < ${src} | sed -f fix-xhtml.sed > ${dst}
elif [ ${src} = "sqlite-doc-3410100/consortium_agreement-20071201.html" ]; then
    sed -e "31s|</b>|</p>|" -e "77s/^.*$//" -e "93s/^.*$//" -e "247s/^.*$//" -e "331s/<\/p>$//" -e "389s|</h3>$|</h2>|" < ${src} > ${dst}
else
    sed -f fix-xhtml.sed < ${src} > ${dst}
fi
