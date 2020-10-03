# See LICENSE file for copyright and license details.

provide-module smart-quotes %{

    set-option -add global matching_pairs ‘ ’ “ ” ‹ › « »

    define-command -params 3 smart-quotes-insert %{
        execute-keys -itersel %sh{
            # Is the cursor at the beginning of the buffer?
            if [ $kak_cursor_byte_offset -eq 0 ]; then
                printf $3  # Set up for an opening quote replacement.
            fi
            printf "<left>"
        }
        execute-keys -itersel %sh{
            # Consider the character prior:
            case "$kak_selection" in
            $1)                     # If it’s a straight quote,
                printf "<del>$3"    # replace it with a closing quote.
                ;;
            $2)                     # If it’s an opening quote,
                printf "<del>$1"    # replace it with a straight quote.
                ;;
            $3)                     # If it’s a closing quote,
                printf "<del>$2"    # replace it with an opening quote.
                ;;
            [[:space:]\'\"])        # If it’s whitespace or ' or ",
                printf "<right>$2"  # insert an opening quote.
                ;;
            *)                      # Otherwise,
                printf "<right>$3"  # insert a closing quote.
                ;;
            esac
        }
    }

    define-command smart-quotes-enable -docstring \
    'Automatically curl inserted quotes
    i.e. ''…'' → ‘…’ and "…" → “…”' %{
        map window insert "'" "<a-;>: smart-quotes-insert \' ‘ ’<ret>" -docstring "smartly insert a single quote"
        map window insert '"' '<a-;>: smart-quotes-insert \" “ ”<ret>' -docstring "smartly insert a double quote"
    }

    define-command smart-quotes-disable -docstring \
    "Disable automatic curling of quotes" %{
        unmap window insert "'" "<a-;>: smart-quotes-insert \' ‘ ’<ret>"
        unmap window insert '"' '<a-;>: smart-quotes-insert \" “ ”<ret>'
    }

    define-command smart-quotes-mode -docstring \
    "Enable smart quoting for the next insert session" %{
        smart-quotes-enable
        hook -always -once window ModeChange 'pop:insert:.*' smart-quotes-disable
    }

}

require-module smart-quotes
