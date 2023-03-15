646s|</ol>||
s|\(</blockquote>\)</li>|\1|g
/<blockquote>/,/<\/blockquote>/ {
    s/<p>//g
    s|</p>||g
}
