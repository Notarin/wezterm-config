def check-executable-binary [command_name] {
    let which = which $command_name
    if ($which | length) > 0 {true} else {false}
}

let fish_completer = {
    engine: {|spans|
        fish --command $'complete "--do-complete=($spans | str join " ")"'
        | from tsv --flexible --noheaders --no-infer
        | rename value description
    }
    valid: (check-executable-binary "fish")
}

let carapace_completer = {
    engine: {|spans: list<string>|
        carapace $spans.0 nushell ...$spans
        | from json
        | if ($in | default [] | where value =~ '^-.*ERR$' | is-empty) { $in } else { null }
    }
    valid: (check-executable-binary "carapace")
}

let zoxide_completer = {
    engine: {|spans|
        $spans | skip 1 | zoxide query -l ...$in | lines | where {|x| $x != $env.PWD}
    }
    valid: (check-executable-binary "zoxide")
}

let external_completer = {|spans|
    let expanded_alias = scope aliases
    | where name == $spans.0
    | get -i 0.expansion

    let spans = if $expanded_alias != null {
        $spans
        | skip 1
        | prepend ($expanded_alias | split row ' ' | take 1)
    } else {
        $spans
    }

    match $spans.0 {
        # carapace completions are incorrect for nu
        nu if $fish_completer.valid => $fish_completer.engine
        # fish completes commits and branch names in a nicer way
        git if $fish_completer.valid => $fish_completer.engine
        # main completion engine
        _ if $carapace_completer.valid => $carapace_completer.engine
        # backup if it isn't present
        _ => $fish_completer.engine
    } | do $in $spans
}
