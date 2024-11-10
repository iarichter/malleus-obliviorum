---
title: slack migration automation
layout: template
filename: slack.md
tags:
    - admin
    - APIs
---
# slack migration automation

## Who:
IT Admin Team in charge slack (me and my team) and then 200+ new employees from an acquisition
## What:
Automate the moving, archiving, and renaming of hundreds of Slack channels from the acquired company's Slack instance.
## Why:
The acquired company had a rich history of using Slack and many years of content they relied on as historical reference. Rather than lose all of it, we integrated their instance into ours, and rather than doing all the moving, archiving, and renaming manually, I automated those steps using Slack APIs in PowerShell.
## The scripts:
1. [bulk-archive-channels.ps1](https://github.com/iarichter/slack-powershell/blob/main/bulk-archive-channels.ps1)
2. [bulk-move-channels.ps1](https://github.com/iarichter/slack-powershell/blob/main/bulk-move-channels.ps1)
3. [bulk-rename-channels.ps1](https://github.com/iarichter/slack-powershell/blob/main/bulk-rename-channels.ps1)