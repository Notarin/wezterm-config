# Starship prompt
source ./starship.nu

# Converts env variables to usable data
$env.ENV_CONVERSIONS = {
    # Converts unix PATH to usable data
    "PATH": {
        from_string: { |s| $s | split row (char esep) | path expand --no-symlink }
        to_string: { |v| $v | path expand --no-symlink | str join (char esep) }
    }
    # Converts Windows Path to usable data
    "Path": {
        from_string: { |s| $s | split row (char esep) | path expand --no-symlink }
        to_string: { |v| $v | path expand --no-symlink | str join (char esep) }
    }
}

$env.EDITOR = "helix"

# SSH Agent
^ssh-agent -c
    | lines
    | first 2
    | parse "setenv {name} {value};"
    | transpose -r
    | into record
    | load-env
