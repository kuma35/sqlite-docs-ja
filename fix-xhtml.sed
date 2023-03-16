# HTML表現に治す
s/<</\&lt;\&lt;/
s/>>/\&gt;\&gt;/

# <> を HTML表現に。
s/<=/\&lt;=/g

# >= を HTML表現に。
# <a href="hoge">fuga</a>=0 ( fuga=0 ) という表現は弾く
s/\([^/][^a]\)>=/\1\&gt;=/g


s/\(\s\)<\(\s\)/\1\&lt;\2/g
s/\(\s\)>\(\s\)/\1\&gt;\2/g

# hogehoge<100 とかのパターン
# 100>hogehoge はタグとしてあるかもなので無理
s/<\([[:digit:]]\)/\&lt\1/g

# <h[:digit:]> と </h[:digit:]> で対応が取れてない場合、<h[:digit:]>に合わせる。
# 対応が取れている場合は同じ値を上書きするだけなので結果として書き換え無し。
s|\(<h\([[:digit:]]\)[^<]*\)</h[[:digit:]]>|\1</h\2>|g

# <B>...</b> を <B>...</B> に、 <b>...</B> を <b>...</b> に。
s|<B>\([^<]*\)</b>|<B>\1</B>|g
s|<b>\([^<]*\)</B>|<b>\1</b>|g

# <a href="https://sqlite.org/fiddle">Try it live!</li> に </a> を挿入
s|\(<[Aa][^<]\+\)\(</[^Aa]\)|\1</a>\2|g

# <input> to <input />
s|\(<input\s[^>]*\)>|\1/>|g

# 34to35.html:last line and oters <small><i>...</small></i> なテレコを修正
/<small><i>/,/<\/small><\/i>/s|\(</small>\)\(</i>\)|\2\1|

# capi3ref.html, c3ref/c_dbconfig_defensive.html
s|\(<dt>[^<]*\)</td>|\1</dt>|g

# for arch.html
s|<file>tokenize.c</b>|<b>tokenize.c</b>|

# for c_interface.html
s|entire database.</p>|entire database.|

# for changes.html (releaselog/3_8_1.html)
s/docid<$limit/docid\&lt;$limit/

# for changes.html
s|"table_info" pragma"|"table_info" pragma|

# for changes.html (releaselog/3_6_14.html)
s|and code simplifications and cleanups.</p>|and code simplifications and cleanups.|

# for changes.html (releaselog/3_4_0.html)
s|</a> API</a>|</a> API |

# for changes.html:6746
s|parser's stack|parser\&#39;s stack|

/<ul>/,/<\/ul>/{
	s/<p>//g
	s|</p>||g
}
/<\/ul>/,+1s|</p>||g

/<dl>/,/<\/dl>/{
	s/<p>//g
	s|</p>||g
}
/<\/dl>/,+1s|</p>||g

/<ol>/,/<\/ol>/{
	s/<p>//g
	s|</p>||g
}
/<\/ol>/,+1s|</p>||g
