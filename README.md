# Crux Growth Skills

Free skills for your own Claude, written by operators who have scaled ecommerce brands (Fussy,
£2.2M to £22M GMV; DogBuddy, acquired by Rover). Each skill carries one piece of the craft we use
with our clients, such as planning Black Friday from last year's numbers, auditing a landing page
or finding out why a number moved, and runs on your own data inside your own Claude.

The skills work best with a **Crux Growth Brain** connected: a Claude connector that answers
questions from your own warehouse, with your orders, marketing and customers in one place. You
do not need one to install the skills, and each skill below says what it needs.

## Before you start

You need a Claude account and the Claude desktop app. This repository is public, so there is
nothing to request access to and no GitHub account needed.

## Install in the Claude desktop app

1. Click **Customize** in the menu on the left.
2. Select **Plugins**.
3. Click the **Add** dropdown in the top right and choose **Add marketplace**.
4. Select **Add from a repository** and enter this repository's address:

   ```
   https://github.com/go-crux/crux-growth-skills
   ```

5. Press **Sync**.
6. **Crux Growth Skills** now appears in your plugins. Install it if Claude asks.

Ask Claude for the skill in any new conversation, for example "help me plan Black
Friday".

## Install in Claude Code

If you use Claude Code, in the desktop app's **Code** tab or in a terminal, send these two
commands in any folder:

```
/plugin marketplace add go-crux/crux-growth-skills
/plugin install crux-growth-skills@crux
```

Choose **User** when it asks about scope, so the skills are there in every folder you open, and
send `/reload-plugins` if Claude asks you to. Send `/plugin list` to check: `crux-growth-skills@crux`
should be in the list.

## What is in it

**Plan Black Friday** (`plan-black-friday`) plans your Black Friday and the run to Christmas. It
reads how last year's Black Friday went against the year before, tests your November and December
targets against what those years achieved, and shows what has to change if a
target is a stretch. It then takes you through your offer, products, marketing and targets one
question at a time, with a recommendation for each, and you can say "just write it" to accept
them all. You leave with one page for your team: last year's read across five short pages
(overview, offer, marketing, retention and targets) and your plan on a sixth, with a target for
every day of each month you agree, which you can download as a CSV. Nothing is changed in your budget
or your data.

*Needs:* nothing to start. It is best with a Crux Growth Brain connected, and it also works
without one, from your Shopify data plus GA4, Google Ads, Meta Ads and Klaviyo, through connectors
or exports it asks for in one go. If your budget is not in the brain or given, it proposes targets
from last year for you to confirm or change. Ask Claude to plan Black Friday, or send
`/plan-black-friday` in Claude Code.

**Audit landing pages** (`audit-landing-pages`) finds the pages that let your traffic down and
shows what to fix. Ask "which of my landing pages are underperforming?" and it ranks them by what
each is costing you against pages of the same kind on your site. Ask it to "audit this page" with a
link and it scores the page against sixty checks across six ingredients, then gives you the
findings in priority order, the quick wins, and a backlog of tests to run, in one page you can
share with your team. It asks you a few short questions about what your brand will not do or say,
so nothing it recommends breaks your rules. Nothing is changed on your site.

*Needs:* nothing. Give it the link to any page and it audits the page itself. To find your weakest
pages without a Growth Brain, give it a Shopify export of sessions by landing page, and it ranks
them by the orders each is missing. A Crux Growth Brain adds the revenue each page is missing,
traffic by channel and device, and the full funnel, so the audit starts with the step where the
page loses most people. Ask Claude to audit a landing page, or send `/audit-landing-pages` in
Claude Code.

**Diagnose performance** (`diagnose-performance`) finds out why a number moved. Pick the
figure you are judging, such as net sales, orders or profit, and any two periods, such as last
month against the month before, or this quarter against the same quarter last year. It splits the figure into
the levers that build it (visits, conversion and order value, for example), says how much of the
change each lever explains, and names the main driver. It then drills into that driver one level
at a time, by channel, product or customer group, asks you what you think caused it, and
recommends what to do about it, with what to watch and how to check it worked. You leave with one
page for your team: the change, the levers, the drill-down and the recommendations. Nothing is
changed in your ads, your store or your data.

*Needs:* nothing to start. Without a Growth Brain it reads what Claude is connected to (Shopify,
Google Analytics 4, Google Ads or Meta Ads) and asks you for a report export where a lever has no
connector, and it says plainly which levers it could not read. A Crux Growth Brain adds profit
margin, one source for every lever, and the drill-down by channel, product and customer cohort.
Ask Claude why a number moved, or send `/diagnose-performance` in Claude Code.

**Review month** (`review-month`) writes your monthly performance review. It reads the month just
gone against the month before and the same month last year, and covers how you traded, where your
new customers came from and what they cost, how well you keep customers and what they are worth
over time, and what customers spend and which products they buy. You tell it what happened in the
month (a promotion, a launch, a stockout), and it can pull out up to two questions you care about.
You leave with one deck for your team, with a short summary up front, up to three recommendations
for each part, and the three actions to take next month. Give it last month's review and it checks
which of those actions were done. Nothing is changed in your ads, your store or your data.

*Needs:* nothing to start, but it is best with a Crux Growth Brain. Without one it reads what
Claude is connected to (Shopify and your ad accounts) and asks you for a report export where a view
has no connector. The views only a Growth Brain fills, such as lifetime value by order category and
the line items behind your products, are marked in the deck as needing one, and so is any view your
connectors and exports cannot fill. A Crux Growth Brain also adds your budget and profit margin to
the deck where it holds them. Ask Claude for your monthly review, or send `/review-month` in Claude Code.

## Getting a Growth Brain

We build each Growth Brain on the brand's own data. To see what one would read for yours, book a
call at [gocrux.io/contact](https://gocrux.io/contact).

## Staying up to date

Claude checks for updates on its own and tells you when it has pulled one. In Claude Code you can
pull one straight away:

```
/plugin marketplace update crux
/plugin update crux-growth-skills
/reload-plugins
```

## Something not working

Email matt@gocrux.io with what you were doing and what Claude said back, which is almost always
enough to spot it.
