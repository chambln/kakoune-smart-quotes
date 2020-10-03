# Smart quotes for Kakoune

This simple [Kakoune](https://kakoune.org) plugin converts
typewriter-style straight quotes to typographically pleasing curly
quotes as you type.

    'example'  →  ‘example’
    "example"  →  “example”
    I'm        →  I’m

[![Demonstration of smart quoting in
Kakoune](https://asciinema.org/a/GbokpvZb5accDhJI7cXNEb3Gb.svg)](https://asciinema.org/a/GbokpvZb5accDhJI7cXNEb3Gb)

## Installation

### Manual

Put a copy of or link to `smart-quotes.kak` anywhere within
`~/.config/kak/autoload/`.

### [plug.kak](https://gitlab.com/andreyorst/plug.kak)

Suggested configuration:

``` kak
plug chambln/kakoune-smart-quotes config %{
    map global insert <a-'> "<a-;>: smart-quotes-insert \' ‘ ’<ret>"
    map global insert <a-"> '<a-;>: smart-quotes-insert \" “ ”<ret>'
    hook global \
         WinSetOption \
         filetype=(mail|markdown|restructuredtext|git-commit) \
         smart-quotes-enable
}
```

## Usage

Manually enable smart quoting in the current window:

    :smart-quotes-enable<ret>

Enable smart quoting for one insert session:

    :smart-quotes-mode<ret>i

Always use smart quoting for e.g. reStructuredText:

``` kak
# ~/.config/kak/kakrc
hook global WinSetOption filetype=restructuredtext smart-quotes-enable
```

Use <kbd>Alt</kbd> to smartly insert a quote:

``` kak
# ~/.config/kak/kakrc
map global insert <a-'> "<a-;>: smart-quotes-insert \' ‘ ’<ret>"
map global insert <a-"> '<a-;>: smart-quotes-insert \" “ ”<ret>'
```

Or use guillemets instead:

``` kak
# ~/.config/kak/kakrc
map global insert <a-'> "<a-;>: smart-quotes-insert \' ‹ › <ret>"
map global insert <a-"> '<a-;>: smart-quotes-insert \" « » <ret>'
```

### Notes

  - Repeated keypresses cycle opening, straight, and closing quotes.
  - `<c-v>` bypasses smart-quotes whereas `\i` does not.
  - A contraction at the beginning of a word should have an apostrophe
    (`’`), but smart-quotes will erroneously insert an opening quote
    (`‘`) instead; e.g.
      - `the ‘80s` (incorrect) instead of `the ’80s` (correct),
      - `fish ‘n’ chips` (incorrect) instead of `fish ’n’ chips`
        (correct).
