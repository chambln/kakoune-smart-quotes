# Smart quotes for Kakoune

This simple [Kakoune](https://kakoune.org) plugin converts
typewriter-style straight quotes to typographically pleasing curly
quotes as you type.

    'example'  →  ‘example’
    "example"  →  “example”
    I'm        →  I’m

[![Demonstration of smart quoting in
Kakoune](https://asciinema.org/a/PDoUNK4m07xuDJA7fgQZrXSJ9.svg)](https://asciinema.org/a/PDoUNK4m07xuDJA7fgQZrXSJ9)

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

Use Alt to smartly insert a quote:

    # ~/.config/kak/kakrc
    map global insert <a-'> '<a-;>: smart-quotes-insert-single<ret>'
    map global insert <a-"> '<a-;>: smart-quotes-insert-double<ret>'

### Notes

  - Repeated keypresses cycle opening, straight, and closing quotes.
  - `<c-v>` bypasses smart-quotes whereas `\i` does not.
  - A contraction at the beginning of a word should have an apostrophe
    (`’`), but smart-quotes will insert an opening quote (`‘`) instead;
    e.g.
      - `the ‘80s` (incorrect) instead of `the ’80s` (correct),
      - `fish ‘n’ chips` (incorrect) instead of `fish ’n’ chips`
        (correct).
