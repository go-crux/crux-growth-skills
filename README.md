# The Crux plugin

Crux best practice, installed inside your own Claude.

Your Crux Growth Brain already lets you ask questions of your own warehouse. It knows your
tables, your metrics and how they are defined. What it does not carry is craft: how to design a
report that is worth reading, how to pin its figures so they mean the same thing every morning,
and how to have it arrive without anyone opening a laptop.

That is what this plugin adds. Install it once and it sits alongside your brain, in the same
Claude, working on your own data.

## Before you start

You need a Claude account and Claude Code. Claude Code comes with the Claude desktop app, under
the **Code** tab, so if you have the desktop app you already have it.

That is the whole list. This repository is public, so there is nothing to request access to and
no GitHub account needed.

## Install on the Claude desktop app

1. Open Claude and click the **Code** tab along the top.
2. Open or create any folder when it asks. It does not matter which one: the plugin installs to
   your account, not to the folder.
3. Click into the message box at the bottom and send this, exactly as written:

   ```
   /plugin marketplace add go-crux/crux-plugin
   ```

   Claude will confirm it has added a marketplace called `crux-plugin`. A marketplace is just
   Claude's word for a catalogue it can install from.

4. Send this next:

   ```
   /plugin install crux@crux-plugin
   ```

   Choose **User** when it asks about scope, so the plugin is there in every folder you open
   rather than only this one.

5. If Claude replies that you need to reload, send `/reload-plugins`.

You can also browse to it rather than typing: click the **+** next to the message box, choose
**Plugins**, then **Add plugin**. The typed commands are faster and are the ones we support, so
start there.

## Install on Claude Code in a terminal

If you run Claude Code from a terminal, start it in any folder with `claude`, then send the same
two commands:

```
/plugin marketplace add go-crux/crux-plugin
/plugin install crux@crux-plugin
```

Choose **User** scope, and run `/reload-plugins` if Claude asks you to.

## Check it worked

Send this:

```
/plugin list
```

`crux@crux-plugin` should appear in the list. If it does, you are done.

If it does not, the most common cause is that the install has not loaded into the conversation
you are in yet. Send `/reload-plugins`, or close Claude and open it again.

## What is in it

Nothing yet. The plugin is new, and its first skill, `scheduled-reports`, is being built now. It
will interview you down to a report worth reading, show you the real figures before anything is
scheduled, and walk you through setting it to arrive daily or weekly by email or into a Slack
channel.

Installing now means you get that skill and everything after it without doing this again.

## Staying up to date

Claude checks for updates on its own shortly after each session starts, and tells you when it has
pulled one. To pull an update immediately:

```
/plugin marketplace update crux-plugin
/plugin update crux
/reload-plugins
```

## Something not working

Email matt@gocrux.io, or reply in your usual Crux channel. Tell us which of the two surfaces you
were on and paste what Claude said back, which is almost always enough to spot it.
