# $ tree -d -A
#├── docs
#│   └── html
#├── po
#└── sqlite-doc-3410100
#    ├── c3ref
#    ├── images 画像ファイル
#    │   ├── ac
#    │   ├── books
#    │   ├── fileformat
#    │   ├── foreignlogos
#    │   └── qp
#    ├── releaselog 翻訳対象外
#    ├── search.d HTMLではない。翻訳対象外。
#    ├── session
#    └── syntax

SRC_DIR = sqlite-doc-3410100
SEDOUT_DIR = sedout
PO_DIR = po
DST_DIR = docs/html
C3REF_DIR = c3ref
SESSION_DIR = session
SYNTAX_DIR = syntax
HTML_EXT = .html
PO_EXT = .po

SRC_ROOT = $(notdir $(wildcard $(SRC_DIR)/*$(HTML_EXT)))
SRC_C3REF = $(addprefix $(C3REF_DIR)/,$(notdir $(wildcard $(SRC_DIR)/$(C3REF_DIR)/*$(HTML_EXT))))
SRC_SESSION = $(addprefix $(SESSION_DIR)/,$(notdir $(wildcard $(SRC_DIR)/$(SESSION_DIR)/*$(HTML_EXT))))
SRC_SYNTAX = $(addprefix $(SYNTAX_DIR)/,$(notdir $(wildcard $(SRC_DIR)/$(SYNTAX_DIR)/*$(HTML_EXT))))

SRC_PACKAGE = $(SRC_ROOT) $(SRC_C3REF) $(SRC_SESSION) $(SRC_SYNTAX)

SRC_FILES = $(addprefix $(SRC_DIR)/,$(SRC_PACKAGE))

# $(warning SRC_FILES = $(SRC_FILES))

SEDOUT_FILES = $(addprefix $(SEDOUT_DIR)/,$(SRC_PACKAGE))

# $(warning SEDOUT_FILES = $(SEDOUT_FILES))

PO_FILES = $(addprefix $(PO_DIR)/,$(SRC_PACKAGE:$(HTML_EXT)=$(PO_EXT)))

# $(warning PO_FILES = $(PO_FILES))

DST_FILES = $(addprefix $(DST_DIR)/,$(SRC_PACKAGE))

# $(warning DST_FILES = $(DST_FILES))

ja: $(DST_FILES)

$(SEDOUT_FILES): $(SEDOUT_DIR)/%$(HTML_EXT) : $(SRC_DIR)/%$(HTML_EXT)
	sh source-filter.sh $< $@

$(PO_FILES): $(PO_DIR)/%$(PO_EXT) : $(SEDOUT_DIR)/%$(HTML_EXT)
	po4a-updatepo -M utf8 -f xhtml -m $< -p $@

$(DST_FILES): $(DST_DIR)/%$(HTML_EXT) : $(PO_DIR)/%$(PO_EXT)
	po4a-translate -f xhtml -keep 0 -M utf8 -m $(subst $(DST_DIR),$(SEDOUT_DIR),$(@:$(PO_EXT)=$(HTML_EXT))) -p $< -l $@


# rsyncの $(SRC_DIR)の直後の / 重要。超重要
# cmds-*.txt are templates. not need translation. copy from $(SRC_DIR) to $(DST_DIR)
# rsync -av --exclude "*.txt" $(SRC_DIR)/ $(DST_DIR)
clean:
	find $(DST_DIR) -type f | xargs rm -f
	find $(DST_DIR) -empty | xargs rmdir
	rsync -av --include "releaselog/*.html" --exclude "*.html" $(SRC_DIR)/ $(DST_DIR)

.PHONEY: ja clean
