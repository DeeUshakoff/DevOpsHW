#!/bin/bash

log() {
    echo "$1"
    echo "$1" >> script.log
}

get_root_directory() {
    if [ -z "$1" ]; then
        read -p "Введите путь до корневого каталога: " root_dir
    else
        root_dir=$1
    fi

    echo "$root_dir"
}

while getopts "d:" opt; do
    case $opt in
        d)
            root_directory=$(get_root_directory "$OPTARG")
            ;;
        \?)
            echo "Неверная опция: -$OPTARG" >&2
            exit 1
            ;;
    esac
done

if [ -z "$root_directory" ]; then
    root_directory=$(get_root_directory)
fi

if [ ! -d "$root_directory" ]; then
    sudo mkdir -p "$root_directory"
    log "Создана директория $root_directory"
fi

users=$(cut -d: -f1 /etc/passwd)

for user in $users; do
    user_directory="$root_directory/$user"

    if [ ! -d "$user_directory" ]; then
        sudo mkdir -m 755 "$user_directory"
        sudo chown "$user:$user" "$user_directory"
        log "Создана директория $user_directory с правами 755 и владельцем $user"
    else
        log "Директория $user_directory уже существует"
    fi
done