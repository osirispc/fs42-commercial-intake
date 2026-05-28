# FieldStation42 Commercial Intake

CLI toolkit for downloading YouTube commercial clips and preparing them for FieldStation42.

Built for the Raspberry Pi cyberdeck and FieldStation42 setup.

---

## What This Project Does

This project gives the cyberdeck two simple commands:

- commercial-one
- commercial-playlist

commercial-one downloads one YouTube video and converts it for FieldStation42.

commercial-playlist downloads a YouTube playlist and converts all videos for FieldStation42.

The goal is to make a small commercial intake system for retro TV channels, themed FieldStation42 schedules, Twin Peaks nights, Blade Runner blocks, Saturday morning channels, and other broadcast-style programming.

Raw signal comes in.

Clean broadcast signal goes out.

---

## Project Location

Expected project folder:

    /home/osirisortiz/projects/fs42-commercial-intake

---

## Project Layout

    fs42-commercial-intake/
    ├── config/
    │   └── intake.env
    ├── scripts/
    │   ├── commercial-one
    │   ├── commercial-playlist
    │   └── install-shortcuts.sh
    ├── .gitignore
    └── README.md

Downloaded media, cookies, secrets, logs, and the Python virtual environment are ignored by Git.

---

## Requirements

Install system tools:

    sudo apt update
    sudo apt install -y ffmpeg python3-venv

Create the project Python environment:

    cd ~/projects/fs42-commercial-intake
    python3 -m venv .venv
    ./.venv/bin/python -m pip install --upgrade pip
    ./.venv/bin/python -m pip install -U "yt-dlp[default]"

Check yt-dlp:

    ./.venv/bin/yt-dlp --version

---

## Configuration

Main config file:

    config/intake.env

Important settings:

    RAW_DIR="$HOME/Videos/fieldstation42-commercials/raw"
    READY_DIR="$HOME/Videos/fieldstation42-commercials/ready"
    MAX_HEIGHT="720"
    VIDEO_CRF="23"
    AUDIO_BITRATE="128k"
    FS42_COMMERCIAL_DIR=""
    YTDLP_BIN="$HOME/projects/fs42-commercial-intake/.venv/bin/yt-dlp"

The YTDLP_BIN setting makes sure this project uses its own yt-dlp instead of accidentally using FieldStation42's Python environment.

---

## Install Shortcuts

From the project folder:

    cd ~/projects/fs42-commercial-intake
    ./scripts/install-shortcuts.sh
    source ~/.bashrc

After that, these commands should work from anywhere:

    commercial-one
    commercial-playlist

Check them:

    which commercial-one
    which commercial-playlist

Expected:

    /home/osirisortiz/bin/commercial-one
    /home/osirisortiz/bin/commercial-playlist

---

## Download One Commercial

Use:

    commercial-one "YOUTUBE_VIDEO_URL"

Example:

    commercial-one "https://youtu.be/Hvkosk50i6c?si=86OpRlvoMdPM4C0C"

---

## Download a Playlist

Use:

    commercial-playlist "YOUTUBE_PLAYLIST_URL"

Example:

    commercial-playlist "https://www.youtube.com/playlist?list=PLAYLIST_ID"

---

## Output Folders

Raw downloaded files go here:

    ~/Videos/fieldstation42-commercials/raw

Converted FieldStation42-ready files go here:

    ~/Videos/fieldstation42-commercials/ready

Check ready files:

    ls -lh ~/Videos/fieldstation42-commercials/ready

---

## Test Play a Commercial

Using VLC:

    vlc "$HOME/Videos/fieldstation42-commercials/ready/Twin Peaks Commercial 1990 on ABC.mp4"

Using ffplay:

    ffplay "$HOME/Videos/fieldstation42-commercials/ready/Twin Peaks Commercial 1990 on ABC.mp4"

---

## YouTube Bot / Sign-In Problems

Sometimes YouTube may return:

    Sign in to confirm you are not a bot.

The project supports three authentication modes:

    YTDLP_AUTH_MODE="none"
    YTDLP_AUTH_MODE="browser"
    YTDLP_AUTH_MODE="file"

Browser cookie mode example:

    YTDLP_AUTH_MODE="browser"
    YTDLP_BROWSER="firefox"

Cookie file mode example:

    YTDLP_AUTH_MODE="file"
    YTDLP_COOKIES_FILE="$HOME/projects/fs42-commercial-intake/secrets/youtube-cookies.txt"

Never commit cookie files to GitHub.

---

## GitHub Safety

The repo ignores:

    .venv/
    secrets/
    raw/
    ready/
    logs/
    *.mp4
    *.mkv
    *.webm
    *.part
    *.ytdl
    *.temp
    *cookies*.txt

Do not commit:

- downloaded commercials
- cookies
- secrets
- virtual environments
- temporary download files

---

## Git Commands

Check status:

    git status
    git log --oneline -5

Add GitHub remote later:

    git remote add origin git@github.com:YOUR-GITHUB-USERNAME/fs42-commercial-intake.git
    git push -u origin main

Replace YOUR-GITHUB-USERNAME with your real GitHub username.

---

## Legal Note

Only download videos you own, have permission to use, or that are licensed for your intended use.

---

## Cyberdeck Note

This is a broadcast intake bay for the cyberdeck.

The machine pulls in raw signal, cleans it, converts it, and prepares it for FieldStation42.

A little commercial cart system for a haunted television station.
