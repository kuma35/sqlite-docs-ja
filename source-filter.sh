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
elif [ ${src} = "sqlite-doc-3410100/consortium_agreement-20071201.html" ]; then
    sed -e "31s|</b>|</p>|" -e "77s/^.*$//" -e "93s/^.*$//" -e "247s/^.*$//" -e "331s/<\/p>$//" < ${src} | sed -f fix-xhtml.sed > ${dst}
elif [ ${src} = "sqlite-doc-3410100/copyright-release.html" ]; then
    sed -e "103c </td></tr><tr>" < ${src} > ${dst}
elif [ ${src} = "sqlite-doc-3410100/copyright.html" ]; then
    sed -e "190s|>|/>|" < ${src} | sed -f fix-xhtml.sed > ${dst}
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
elif [ ${src} = "sqlite-doc-3410100/nulls.html" ]; then
    sed -f nulls.sed < ${src} | sed -f fix-xhtml.sed > ${dst}
elif [ ${src} = "sqlite-doc-3410100/oldnews.html" ]; then
    sed -f oldnews.sed < ${src} | sed -f fix-xhtml.sed > ${dst}
elif [ ${src} = "sqlite-doc-3410100/omitted.html" ]; then
    sed -e "s|\(<td width=\"10\">&nbsp;\)</th>|\1</td>|" < ${src} | sed -f fix-xhtml.sed > ${dst}
elif [ ${src} = "sqlite-doc-3410100/onefile.html" ]; then
    sed -e "157s|</p>||" < ${src} | sed -f fix-xhtml.sed > ${dst}
elif [ ${src} = "sqlite-doc-3410100/opcode.html" ]; then
    sed -e "464s|cellpaddin||" -e "s|<p>||g" -e "s|</p>||g" < ${src} | sed -f fix-xhtml.sed > ${dst}
elif [ ${src} = "sqlite-doc-3410100/pragma.html" ]; then
    sed -e "713s|</i>||" -e "909s|</b>\(</p>\)|\1|" -e "1593s|</b>$||" < ${src} | sed -f fix-xhtml.sed > ${dst}
elif [ ${src} = "sqlite-doc-3410100/requirements.html" ]; then
    sed -f requirements.sed  < ${src} | sed -f fix-xhtml.sed > ${dst}
elif [ ${src} = "sqlite-doc-3410100/session.html" ]; then
    sed -e "s|<p>||g" -e "s|</p>||g" < ${src} | sed -f fix-xhtml.sed > ${dst}
elif [ ${src} = "sqlite-doc-3410100/c3ref/column_blob.html" ] ; then
    sed -e "s|<p>||g" -e "s|</p>||g"  < ${src} | sed -f fix-xhtml.sed > ${dst}
elif [ ${src} = "sqlite-doc-3410100/c3ref/table_column_metadata.html" ]; then
    sed -e "s|<p>||g" -e "s|</p>||g"  < ${src} | sed -f fix-xhtml.sed > ${dst}
elif [ ${src} = "sqlite-doc-3410100/session/changeset_iter.html" ]; then
    sed -e "s|<p>||g" -e "s|</p>||g"  < ${src} | sed -f fix-xhtml.sed > ${dst}
elif [ ${src} = "sqlite-doc-3410100/session/session.html" ]; then
    sed -e "s|<p>||g" -e "s|</p>||g"  < ${src} | sed -f fix-xhtml.sed > ${dst}
elif [ ${src} = "sqlite-doc-3410100/useovernet.html" ]; then
    # <a href=https://postgresql.org/> という記述が <a/> と見なされ、以降の </a> でエラーになっていた。
    sed -e "333s|<a href=https://postgresql.org/>|<a href=\"https://postgresql.org/\">|" < ${src} | sed -f fix-xhtml.sed > ${dst}
elif [ ${src} = "sqlite-doc-3410100/vdbe.html" ]; then
    sed -e "301s|</ul>||" -e "301s|</ul>||" < ${src} | sed -f fix-xhtml.sed > ${dst}
elif [ ${src} = "sqlite-doc-3410100/version3.html" ]; then
    sed -e "264s|\(</i>\)</a>|\1|" < ${src} | sed -f fix-xhtml.sed > ${dst}
else
    sed -f fix-xhtml.sed < ${src} > ${dst}
fi
