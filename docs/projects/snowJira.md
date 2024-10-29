---
title: new Jira project automation from ServiceNow
layout: template
filename: snowJira.md
tags:
    - JavaScript
    - APIs
    - ServiceNow
    - Jira
---

## Who:
Jira users who want new projects created for them, and the IT team who admins Jira.
## What:
An automated process to spin up new Jira Projects for end users based on a few inputs in ServiceNow.
## Why:
Creating new Jira projects requires Admin credentials so end users couldn't perform the task themselves, but in a mid-sized company IT was getting daily requests for this process. A standard request requried tedious manual work by IT and the end users would have to wait for IT to get to the task. In busy seasons end users could end up waiting hours or even days for the results of fairly straightforward request. Automation gives end users immediate project creation and removes IT intervention from all but trouble shooting.
## Automation Overview
* ServiceNow:
    * Custom service portal form
    * API integration of Jira credentials
    * Custom workflow:
        * Formats response of form
        * Validates requester has valid Jira license
        * API calls to Jira:
            * Create Jira Project
            * Add requester as Owner of Project
            * Create Jira filter
            * Create Project Board with new filter
    * Notifications:
        * To end user with link to their new Project
        * To IT team notifiying them of another succesful run