# Crux growth skills

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
   /plugin marketplace add go-crux/growth-skills
   ```

   Claude will confirm it has added a marketplace called `crux`. A marketplace is just
   Claude's word for a catalogue it can install from.

4. Send this next:

   ```
   /plugin install crux-growth-skills@crux
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
/plugin marketplace add go-crux/growth-skills
/plugin install crux-growth-skills@crux
```

Choose **User** scope, and run `/reload-plugins` if Claude asks you to.

## Check it worked

Send this:

```
/plugin list
```

`crux-growth-skills@crux` should appear in the list. If it does, you are done.

If it does not, the most common cause is that the install has not loaded into the conversation
you are in yet. Send `/reload-plugins`, or close Claude and open it again.

## What is in it

**`plan-black-friday`** plans your Black Friday and the run to Christmas from your own data. Ask
Claude to plan Black Friday, or send `/plan-black-friday`, with your Crux Growth Brain connected.
It reads how last year's Black Friday went against the year before, tests your November and
December targets from your budget against what those years achieved, and shows what has to
change if a target is a stretch. It then takes you through your offer, products and marketing
one question at a time, with a recommendation for each, and you can say "just write it" to accept
them all. You leave with one page for your team: last year's read across five short pages (overview,
offer, marketing, retention and targets) and your plan on a sixth, with a day-by-day target for
every day you can download as a CSV. Nothing is changed in your budget or your data.

## Staying up to date

Claude checks for updates on its own shortly after each session starts, and tells you when it has
pulled one. To pull an update immediately:

```
/plugin marketplace update crux
/plugin update crux-growth-skills
/reload-plugins
```

## Something not working

Email matt@gocrux.io, or reply in your usual Crux channel. Tell us which of the two surfaces you
were on and paste what Claude said back, which is almost always enough to spot it.
