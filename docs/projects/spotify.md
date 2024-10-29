---
title: spotify auto playlists
layout: template
filename: spotify.md
tags:
    - PowerShell
    - APIs
---

## Who:
[Myself!](https://www.last.fm/user/eNG3EN) A massive music nerd who listens to a lot of music and takes pride in my many Spotify playlists.
## What:
A script that queries a specific [Subreddit](https://www.reddit.com/r/Firehouse), finds posts with Spotify links, then processes those URLs adding any new tracks to my relevant Spotify playlist.
## Why:
I've spent countless nights of my life searching for music. Even when I first figured out [Reddit's APIs](https://www.reddit.com/dev/api/) and started generating spreadsheets of Spotify URLs it would still take me a couple hours every month to stay current on the new tunes. By fully scripting the process it's easier than ever to stay up-to-date on any number of genres and my playlists get populated in seconds.
## Project Scripts
### [Auto List Creator](https://github.com/iarichter/spotify-powershell-scripting/blob/main/newReleasesFromSubredditToSpotifyPlaylist.ps1)
Input a subreddit and have it create a brand new playlist based upon all the Spotify links posted there. Set variables for minimum allowed upvotes or how far back to scan for results.
### [Firehouse Fresh Auto Updater]()
Updates my existing set of Firehouse playlists with any new songs posted to the subreddit since the last time I ran the script.