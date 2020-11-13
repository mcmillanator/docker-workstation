# Cheat Sheet

Command | Effect
------- | ------
gt 			| next tab
C-d 		| list possible command auto complete
mksession | save session to a session file
help [command] | display help

## Navigating help

Command | Effect
------- | ------
C-]		 	| follow link
C-o		 	| go back
C-w w 	| switch panes

## [Projectionist](https://github.com/tpope/vim-projectionist)

Command   | Effect
--------- | -----
:Etype 		| Opens the specified type in the current window 
:Stype 		| Opens the specified type in a horizontal split 
:Vtype 		| Opens the specified type in a vertical split 
:Ttype 		| Opens the specified type in a new tabpage

## [ALE](https://github.com/w0rp/ale)

Command | Effect
------- | ------
[W      | ale_first
[w			| ale_previous
]w			| ale_next
]W 			| ale_last

## Vim-Test

Command | Effect
------- | ------
:TestSuite | Run entire test suite
:TestFile | Run the current test file
:TestNearest | Run the test closest to your current cursor position 
:TestLast | Re-Run the most recent test runner

## Obsession

Command | Effect
------- | ------
:Obsession | Track the session in Session.vim
:Obsession! | Remove the Session.vim file and stop tracking the session
