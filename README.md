# Smart quotes for Kakoune

This is a simple [Kakoune](https://kakoune.org) plugin that replaces, as
you type, the usual typewriter-style straight quotes with
typographically pleasing curly quotes, based on context. It works with
apostrophes too.

    'example'  →  ‘example’
    "example"  →  “example”
    I'm        →  I’m

[![Demonstration of the smart quotes
functionality](https://asciinema.org/a/9mfchs3KboH7EAwgGSV86F034.svg)](https://asciinema.org/a/9mfchs3KboH7EAwgGSV86F034)

## Installation

Put a copy of `smart-quotes.kak` anywhere within your
`~/.config/kak/autoload/` directory, e.g.

``` bash
mkdir -pv ~/.config/kak/autoload/
ln -fis /usr/share/kak/autoload ~/.config/kak/autoload/  # Include Kakoune’s defaults
git clone https://github.com/chambln/kakoune-smart-quotes ~/.config/kak/autoload/kakoune-smart-quotes
```

## Usage

Manually enable smart quoting in the current window:

    :smart-quotes-enable<ret>

Always use smart quoting for e.g. reStructuredText:

    # ~/.config/kak/kakrc
    hook global WinSetOption filetype=restructuredtext smart-quotes-enable

Hit `<a-'>` and `<a-">` to insert the appropriate curly quote:

    # ~/.config/kak/kakrc
    map global insert <a-'> '<a-;>: smart-quotes-insert-single<ret>'
    map global insert <a-"> '<a-;>: smart-quotes-insert-double<ret>'

## Bugs and notes

  - A contraction at the beginning of a word should have an apostrophe,
    but smart-quotes will insert an opening single quote instead; e.g.
      - `the ‘80s` (incorrect) instead of `the ’80s` (correct),
      - `fish ‘n’ chips` (incorrect) instead of `fish ’n’ chips`
        (correct).
  - Typing consecutive quotes at the very beginning of the buffer (0:0
    or 0:1) results in strange behaviour.
  - This makes a rough guess based on context—it can’t read your mind.
