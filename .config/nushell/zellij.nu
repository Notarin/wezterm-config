let sessions: list<string> = (
    zellij ls -n | lines | split column --number 2 " "
).column1

if ($sessions | length) < 1 {
    exec zellij
}

let meta_options: list<string> = ["No Session", "New Session"]

let options: list<string> = $sessions | append $meta_options

let choice: string = $options | input list -f

let smtn: string = match $choice {
    "No Session" => (exec nu)
    "New Session" => (exec zellij)
    _ => (exec zellij attach $choice)
}