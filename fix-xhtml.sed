# HTML表現に治す
s/<</\&lt;\&lt;/
s/>>/\&gt;\&gt;/
# <h[:digit:]> と </h[:digit:]> で対応が取れてない場合、<h[:digit:]>に合わせる。
s|\(<h\([[:digit:]]\)[^<]*\)</h[^\2]>|\1</h\2>|g
# <B>...</b> を <B>...</B> に、 <b>...</B> を <b>...</b> に。
s|<B>\([^<]*\)</b>|<B>\1</B>|g
s|<b>\([^<]*\)</B>|<b>\1</b>|g
# <a href="https://sqlite.org/fiddle">Try it live!</li> に </a> を挿入
s|\(<[Aa][^<]\+\)\(</[^Aa]\)|\1</a>\2|g

# 34to35.html:49 and oters <input> to <input />
s|\(<input\s[^>]*\)>|\1/>|g
# s|<input type="text" name="q" id="searchbox" value="">|<input type="text" name="q" id="searchbox" value=""/>|
# s|<input type="submit" value="Go">|<input type="submit" value="Go"/>|
# 34to35.html:last line and oters <small><i>...</small></i> なテレコを修正
s|</small></i></p>|</i></small></p>|
# for arch.html
s|<file>tokenize.c</b>|<b>tokenize.c</b>|
# for c_interface.html
s|entire database.</p>|entire database.|
# s|<h4>3.10 Performing background jobs during large queries</h3>|<h4>3.10 Performing background jobs during large queries</h4>|
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
# for changes.html:6726 po4aは <B>...</B>, <b>...</b> は許すが <B>...</b>,<b>...</B>はダメ…
# s|<B>UNION</b>, <b>UNION ALL</B>|<B>UNION</B>, <B>UNION ALL</B>|
# for changes.html:6726 同上
# s|<B>COPY</b>|<B>COPY</B>|

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
