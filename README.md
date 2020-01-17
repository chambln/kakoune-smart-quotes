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

Put a copy of `smart-quotes.kak` anywhere within your
`~/.config/kak/autoload/` directory, e.g.

``` bash
mkdir -pv ~/.config/kak/autoload/
ln -fis /usr/share/kak/autoload ~/.config/kak/autoload/  # Include Kakoune’s defaults
git clone https://github.com/chambln/kakoune-smart-quotes ~/.config/kak/autoload/kakoune-smart-quotes
```

### [plug.kak](https://gitlab.com/andreyorst/plug.kak)

Suggested configuration:

``` kak
plug chambln/kakoune-smart-quotes config %{
    map global insert <a-'> '<a-;>: smart-quotes-insert-single<ret>'
    map global insert <a-"> '<a-;>: smart-quotes-insert-double<ret>'
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

    # ~/.config/kak/kakrc
    hook global WinSetOption filetype=restructuredtext smart-quotes-enable

Use <kbd>Alt</kbd> to smartly insert a quote:

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
