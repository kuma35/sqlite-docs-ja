#!/bin/sh
src=$1
dst=$2
if [ ${src} = "sqlite-doc-3410100/capi3ref.html" ]; then
    # sed -f capi3ref.sed < ${src} | sed -f fix-xhtml.sed > ${dst}
    sed -f capi3ref_2.sed < ${src} | sed -f fix-xhtml.sed > ${dst}
elif [ ${src} = "sqlite-doc-3410100/changes.html" ]; then
    sed -e "6782c <dl></dl>" < ${src} | sed -f fix-xhtml.sed > ${dst}
elif [ ${src} = "sqlite-doc-3410100/chronology.html" ]; then
    # po4aがJavaScriptをパースしようとしてコケてたのでいにしえの方法でコメントアウト
    # 後方互換のため、この方法でコメントアウトしてあってもも script は有効である。
    sed -e "921i -->" -e "803a <\!--" < ${src} | sed -f fix-xhtml.sed > ${dst}
elif [ ${src} = "sqlite-doc-3410100/compile.html" ]; then
    sed -e "1125c <ul>" -e "1126,1148s/^<p>\s*<li>/<li>/" -e "1126,1148s/<\/p>$//g" < ${src} | sed -f fix-xhtml.sed > ${dst}
elif [ ${src} = "sqlite-doc-3410100/consortium_agreement-20071201.html" ]; then
    sed -e "31s|</b>|</p>|" -e "77s/^.*$//" -e "93s/^.*$//" -e "247s/^.*$//" -e "331s/<\/p>$//" -e "389s|</h3>$|</h2>|" < ${src} > ${dst}
elif [ ${src} = "sqlite-doc-3410100/copyright-release.html" ]; then
    sed -e "103c </td></tr><tr>" < ${src} > ${dst}
elif [ ${src} = "sqlite-doc-3410100/copyright.html" ]; then
    sed -e "190s|>|/>|" < ${src} | sed -f fix-xhtml.sed > ${dst}
# elif [ ${src} = "sqlite-doc-3410100/docs.html" ]; then
#    sed -e "127s|\(</li>\)|</a>\1|" < ${src} | sed -f fix-xhtml.sed > ${dst}
elif [ ${src} = "sqlite-doc-3410100/faq.html" ]; then
    sed -f faq.sed < ${src} | sed -f fix-xhtml.sed > ${dst}
elif [ ${src} = "sqlite-doc-3410100/fts3.html" ]; then
    # "#automerge"" と "automerge"" を修正
    sed -e "s|\(\"#\?automerge\"\)\">|\1>|" < ${src} | sed -f fix-xhtml.sed > ${dst}
elif [ ${src} = "sqlite-doc-3410100/index.html" ]; then
    sed -e "/<\/script>/i -->" -e "/<script>/a <\!--" < ${src} | sed -f fix-xhtml.sed > ${dst}
elif [ ${src} = "sqlite-doc-3410100/lang_keywords.html" ]; then
    sed -e "360s|</ul>||" < ${src} | sed -f fix-xhtml.sed > ${dst}
elif [ ${src} = "sqlite-doc-3410100/news.html" ]; then
    sed -e "261s|</p>||" -e "642s|</p>||" < ${src} | sed -f fix-xhtml.sed > ${dst}
else
    sed -f fix-xhtml.sed < ${src} > ${dst}
fi
