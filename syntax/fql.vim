" Vim syntax file
" Language:    Ferret Query Language
" Homepage:    https://github.com/Rafflesiaceae/vim-fql
" Author:      Rafflesiaceae
" Last Change: 15 January 2023

if exists("b:current_syntax")
  finish
endif

let b:current_syntax = "fql"

" see https://www.montferret.dev/docs/fql/syntax/

" Keywords/Operators {{{1
syn keyword basicLanguageKeywords AGGREGATE ALL AND ANY ASC COLLECT DESC DISTINCT FALSE FILTER FOR IN WHILE LET LIMIT NONE NOT NULL OR RETURN SORT TRUE
syn keyword operators NOT IN LIKE

" Functions {{{1
" arrays
syn keyword functions APPEND FIRST FLATTEN INTERSECTION LAST MINUS NTH OUTERSECTION POP POSITION PUSH REMOVE_NTH REMOVE_VALUE REMOVE_VALUES SHIFT SLICE SORTED SORTED_UNIQUE UNION UNION_DISTINCT UNIQUE UNSHIFT
" collections
syn keyword functions INCLUDES LENGTH REVERSE
" datetime
syn keyword functions DATE DATE_ADD DATE_COMPARE DATE_DAY DATE_DAYOFWEEK DATE_DAYOFYEAR DATE_DAYS_IN_MONTH DATE_DIFF DATE_FORMAT DATE_HOUR DATE_LEAPYEAR DATE_MILLISECOND DATE_MINUTE DATE_MONTH DATE_QUARTER DATE_SECOND DATE_SUBTRACT DATE_YEAR NOW
" html
syn keyword functions ATTR_GET ATTR_QUERY ATTR_REMOVE ATTR_SET BLUR CLICK CLICK_ALL COOKIE_DEL COOKIE_GET COOKIE_SET DOCUMENT DOCUMENT_EXISTS DOWNLOAD ELEMENT ELEMENTS ELEMENTS_COUNT ELEMENT_EXISTS FOCUS FRAMES HOVER INNER_HTML INNER_HTML_ALL INNER_HTML_SET INNER_TEXT INNER_TEXT_ALL INNER_TEXT_SET INPUT INPUT_CLEAR MOUSE NAVIGATE NAVIGATE_BACK NAVIGATE_FORWARD PAGINATION PARSE PDF SCREENSHOT SCROLL SCROLL_BOTTOM SCROLL_ELEMENT SCROLL_TOP SELECT STYLE_GET STYLE_REMOVE STYLE_SET WAIT_ATTR WAIT_ATTR_ALL WAIT_CLASS WAIT_CLASS_ALL WAIT_ELEMENT WAIT_NAVIGATION WAIT_NO_ATTR WAIT_NO_ATTR_ALL WAIT_NO_CLASS WAIT_NO_CLASS_ALL WAIT_NO_ELEMENT WAIT_NO_STYLE WAIT_NO_STYLE_ALL WAIT_STYLE WAIT_STYLE_ALL XPATH
" io/fs
syn keyword functions READ WRITE
" io/net/http
syn keyword functions DELETE DO GET POST PUT
" math
syn keyword functions ABS ACOS ASIN ATAN ATAN2 AVERAGE CEIL COS DEGREES EXP EXP2 FLOOR LOG LOG10 LOG2 MAX MEDIAN MIN PERCENTILE PI POW RADIANS RAND RANGE ROUND SIN SQRT STDDEV_POPULATION STDDEV_SAMPLE SUM TAN VARIANCE_POPULATION VARIANCE_SAMPLE
" objects
syn keyword functions HAS KEEP_KEYS KEYS MERGE MERGE_RECURSIVE VALUES ZIP
" path
syn keyword functions BASE CLEAN DIR EXT IS_ABS JOIN MATCH SEPARATE
" strings
syn keyword functions CONCAT CONCAT_SEPARATOR CONTAINS
syn keyword functions DECODE_URI_COMPONENT ENCODE_URI_COMPONENT ESCAPE_HTML FIND_FIRST FIND_LAST FMT FROM_BASE64 JSON_PARSE JSON_STRINGIFY LEFT LOWER LTRIM MD5 RANDOM_TOKEN REGEX_MATCH REGEX_REPLACE REGEX_SPLIT REGEX_TEST RIGHT RTRIM SHA1 SHA512 SPLIT SUBSTITUTE SUBSTRING TO_BASE64 TRIM UNESCAPE_HTML UPPER
" testing
syn keyword functions ARRAY BINARY DATETIME EMPTY EQUAL FAIL FALSE FLOAT GT GTE INCLUDE INT LEN LT LTE MATCH NONE OBJECT STRING TRUE
" types
syn keyword functions IS_ARRAY IS_BINARY IS_BOOL IS_DATETIME IS_FLOAT IS_HTML_DOCUMENT IS_HTML_ELEMENT IS_INT IS_NAN IS_NONE IS_OBJECT IS_STRING TO_ARRAY TO_BOOL TO_DATETIME TO_FLOAT TO_INT TO_STRING TYPENAME
" utils
syn keyword functions PRINT WAIT

" Highlighting {{{1
hi def basicLanguageKeywords        ctermfg=yellow
hi def operators                    ctermfg=yellow

hi def functions                    ctermfg=blue

" Comments {{{1
syn region rMultilineComment matchgroup=multiLineComment start="/\*" end="\*/" extend
hi link multiLineComment Comment
hi link rMultilineComment Comment

syn region  singleLineComment	start="//" skip="\\$" end="$" keepend
hi link singleLineComment Comment

" {{{1 @XXX String literals from python.vim syntax
" Triple-quoted strings can contain doctests.
syn match   pythonEscape    +\\[abfnrtv'"\\]+ contained
syn match   pythonEscape    "\\\o\{1,3}" contained
syn match   pythonEscape    "\\x\x\{2}" contained
syn match   pythonEscape    "\%(\\u\x\{4}\|\\U\x\{8}\)" contained
" Python allows case-insensitive Unicode IDs: http://www.unicode.org/charts/
syn match   pythonEscape    "\\N{\a\+\%(\s\a\+\)*}" contained
syn match   pythonEscape    "\\$"

syn region  pythonString matchgroup=pythonQuotes
      \ start=+[uU]\=\z(['"]\)+ end="\z1" skip="\\\\\|\\\z1"
      \ contains=pythonEscape,@Spell
syn region  pythonString matchgroup=pythonTripleQuotes
      \ start=+[uU]\=\z('''\|"""\)+ skip=+\\["']+ end="\z1" keepend
      \ contains=pythonEscape,pythonSpaceError,pythonDoctest,@Spell
syn region  pythonRawString matchgroup=pythonQuotes
      \ start=+[uU]\=[rR]\z(['"]\)+ end="\z1" skip="\\\\\|\\\z1"
      \ contains=@Spell
syn region  pythonRawString matchgroup=pythonTripleQuotes
      \ start=+[uU]\=[rR]\z('''\|"""\)+ end="\z1" keepend
      \ contains=pythonSpaceError,pythonDoctest,@Spell

hi def link pythonString        String
hi def link pythonRawString     String
hi def link pythonQuotes        String
