def prompt_helix [args?: string] {
  cowsay -f hellokitty Yuck! Try helix!
  commandline edit $"hx ($args)"
}

def nano [args?: string] {
  prompt_helix $args
}

def vim [args?: string] {
  prompt_helix $args
}

def nvim [args?: string] {
  prompt_helix $args
}

def combine-list-of-records [list_of_records] {
    $list_of_records | reduce {
        |it, acc|
        $acc | merge $it
    }
}