# Smart quotes for Kakoune

This is a simple [Kakoune](https://kakoune.org) plugin that replaces, as
you type, the usual typewriter-style straight quotes with
typographically pleasing curly quotes. It also works with contractions
like `I’m` and `‘em`.

    'example'  →  ‘example’
    "example"  →  “example”

[![Demonstration of the smart quotes
functionality](https://asciinema.org/a/9mfchs3KboH7EAwgGSV86F034.svg)](https://asciinema.org/a/9mfchs3KboH7EAwgGSV86F034)

## Installation

Put a copy of or link to `smart-quotes.kak` anywhere within your
`~/.config/kak/autoload/` directory.

## Usage

In Kakoune, do `:smart-quotes-enable<ret>` to enable the conversion. To
enable it for certain filetypes (e.g. reStructuredText), you could put
something like the following in your `~/.config/kak/kakrc`:

    hook global WinSetOption "filetype=restructuredtext" smart-quotes-enable
