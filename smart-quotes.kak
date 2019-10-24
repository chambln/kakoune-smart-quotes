# See LICENSE file for copyright and license details.

define-command -hidden -params 2 smart-quotes-insert %{
    execute-keys <left>
    execute-keys %sh{
        # Is the cursor at the beginning of the buffer?
        if [ $kak_cursor_byte_offset -eq 0 ]; then
            printf "$1"             # Insert an opening quote.
        else
            # Consider the character prior:
            case "$kak_reg_dot" in
            [[:space:]\'\"$2])      # It’s whitespace or a quote,
                printf "<right>$1"  # so insert an opening quote.
                ;;
            *)
                printf "<right>$2"  # Otherwise insert a closing quote.
                ;;
            esac
        fi
    }
}

define-command -hidden smart-quotes-insert-single %{
    smart-quotes-insert ‘ ’
}

define-command -hidden smart-quotes-insert-double %{
    smart-quotes-insert “ ”
}

define-command smart-quotes-enable -docstring 'Automatically curl inserted quotes (''…'' → ‘…’ and "…" → “…”)' %{
    hook -group smart-quotes window InsertChar "'" %{
        execute-keys <backspace>
        smart-quotes-insert-single
    }
    hook -group smart-quotes window InsertChar '"' %{
        execute-keys <backspace>
        smart-quotes-insert-double
    }
}

define-command smart-quotes-disable -docstring "Disable automatic curling of quotes" %{
    remove-hooks window smart-quotes
}

try %{
    set-option -add global auto_pairs ‘ ’ “ ”
    set-option -add global auto_pairs_surround ‘ ’ “ ”
}

set-option -add global matching_pairs ‘ ’ “ ”
