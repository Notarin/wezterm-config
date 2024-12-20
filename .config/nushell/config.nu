use themes.nu themes

# Before command-name changes
source zoxide.nu
source completion_engine.nu
# After command-name changes
source aliases.nu
source functions.nu

$env.config = {
    show_banner: false
    ls: {
        use_ls_colors: true
        clickable_links: true
    }
    rm: {
        always_trash: true
    }
    history: {
        max_size: 100_000
    }
    completions: {
        external: {
            completer: $external_completer
        }
    }
    filesize: {
        metric: true
    }
    color_config: $themes.dark_theme
    edit_mode: emacs
    use_kitty_protocol: false
}
