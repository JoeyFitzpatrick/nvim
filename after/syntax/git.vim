" Highlight custom tab-separated log format: hash<TAB>date<TAB>author<TAB>subject
syn match gitLogTabHash    /^\x\{4,40}\ze\t/ nextgroup=gitLogTabDate
syn match gitLogTabDate    /\t[^\t]*\ze\t/   contained nextgroup=gitLogTabAuthor
syn match gitLogTabAuthor  /\t[^\t]*\ze\t/   contained nextgroup=gitLogTabSubject
syn match gitLogTabSubject /\t.*$/           contained

hi def link gitLogTabHash    Identifier
hi def link gitLogTabDate    Function
hi def link gitLogTabAuthor  String
hi def link gitLogTabSubject Normal
