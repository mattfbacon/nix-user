{ pkgs, lib, ... }:
{
	programs.neovim = {
		enable = true;
		viAlias = true;
		vimAlias = true;
		withNodeJs = true;
		withRuby = true;
		withPython3 = true;
		extraConfig = ''
set nocompatible

if has("termguicolors")
	set termguicolors
else
	set notermguicolors
endif

set noet ts=2 sts=2 sw=2
set autoindent

set rnu nu
set list

set mouse=a

set undofile backup
call mkdir($HOME . "/.cache/vimswap", "p", 0700)
call mkdir($HOME . "/.cache/vimbackup", "p", 0700)
let &viminfofile = $HOME . "/.cache/viminfo"
let &directory = $HOME . "/.cache/vimswap//"
let &backupdir = $HOME . "/.cache/vimbackup//"

filetype plugin off
filetype indent on
syntax on

set wrap

set laststatus=2
set hlsearch
set incsearch

set timeout timeoutlen=700 ttimeoutlen=50
set updatetime=300

set shortmess=flmnrxoOtTc

set completeopt-=preview
set completeopt+=longest,menuone,noselect

set belloff+=ctrlg

set cursorline

set modeline
set whichwrap+=<,>,[,]
set spell spelllang=en_us
'';
	};
}
