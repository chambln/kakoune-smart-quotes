define-command -hidden -params 2 smart-quotes %{
    # The user just typed a quote. What character comes before it? Store
    # that in register q.
    execute-keys -draft '<esc>hh"qy'

    # Now we attempt to replace that quote with the correct curly one.
    execute-keys -with-hooks %sh{
        case "$kak_reg_q" in
        [[:space:]\'\"$2])
            # Replace it with an opening quote mark.
            printf "<backspace>$1"
            ;;
        *)
            # Replace it with a closing quote mark.
            printf "<backspace>$2"
            ;;
        esac
    }
}

define-command smart-quotes-enable -docstring 'Automatically curl inserted quotes (''…'' → ‘…’ and "…" → “…”)' %{
    hook -group smart-quotes window InsertChar "'" %{smart-quotes ‘ ’}
    hook -group smart-quotes window InsertChar '"' %{smart-quotes “ ”}
}

define-command smart-quotes-disable -docstring "Disable automatic curling of quotes" %{
    remove-hooks window smart-quotes
}

try %{
    set-option -add global auto_pairs ‘ ’ “ ”
}

set-option -add global matching_pairs ‘ ’ “ ”
