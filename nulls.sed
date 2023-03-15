# <pre>...</pre> で、 <pre>と</pre>自身は含めずに置換
/<pre>/,/<\/pre>/ {
    /<pre>/ {
	n
    }
    /<\/pre>/ {
	n
	q
    }
    s/</\&lt;/
    s/>/\&gt;/
}
