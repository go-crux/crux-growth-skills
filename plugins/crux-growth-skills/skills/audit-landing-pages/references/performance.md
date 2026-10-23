# Performance from a Growth Brain: the funnel, devices and the Leaking step

Opened by the Performance step when `<client>-ecommerce_funnel` is on the roster. The page's
visits, conversion, revenue per visit, Benchmark, Revenue at stake and top 3 channels come from
`references/audit.sql` (on `references/find.sql`'s CTEs), never from here, so the shortlist and the audit agree on a
page's gap.

## The query

Run `references/funnel.sql` as its header says: it starts from find.sql's `period` CTE, so the
funnel uses the same period. It returns the page and its Page type, on all devices, mobile and
desktop, and the first and last day the table holds inside the period.

The funnel table starts when the GA4 raw event stream began, so it often covers only the last part
of a 90-day period. Every funnel figure covers those days only. If the first day is later than the
period's first day, the footnote says so. If the page has no rows, drop the funnel and device
split with one line saying the funnel table holds no sessions for the page in the period.

## The rates

Each rate is the **sum** of its numerator over the page's rows divided by the **sum** of its
denominator, never an average of row rates. The Page type's rate is the same sum over every
ranked page of the same Page type in the same days. The Page type is read from the path, as
`references/find.sql` reads it, never from the funnel table's own type column, so the funnel and
the Benchmark compare the page with the same pages.

| Rate | Numerator over denominator |
|---|---|
| Engagement rate | engaged sessions over sessions |
| Product view rate | sessions with a product view over sessions |
| Add to basket rate | sessions that added to basket over sessions with a product view |
| Checkout start rate | sessions that started checkout over sessions that added to basket |
| Checkout completion rate | purchase sessions over sessions that started checkout |
| Session purchase conversion rate | purchase sessions over sessions |

## Which conversion the page headlines

The Audit shows two conversions and they differ: conversion from `<client>-channel_reporting`
(orders over visits, from `audit.sql`) and the funnel's Session purchase conversion rate
(purchase sessions over the funnel's own sessions). The page headlines the first, in its
Summary, its figures table and every Read as cell. The funnel's
appears only in the funnel table and the device split, and a footnote says so: "Conversion in
the page's figures is orders over visits from the traffic table. The funnel and device figures
count purchase sessions over the funnel's own sessions, on the days the funnel holds, so their
purchase rate differs." The page never places the two side by side as one rate.

The page shows each rate beside its Page type's, with the relative gap. Mobile against desktop is
the session purchase conversion rate on each device, for the page and for its Page type. A
device with no sessions reads "No sessions". Other devices are left out.

## The Leaking step

The step where the page's visits leak is the one with the largest relative shortfall against the
same Page type:

```
shortfall = (Page type rate − page rate) ÷ Page type rate
```

Take it over the first five rates in the table. A rate whose denominator holds fewer than 100 of
the page's sessions is shown but cannot be the Leaking step, because a handful of sessions
swings it. With no positive shortfall, the page has no Leaking step and the findings keep their
usual order.

The Leaking step puts these findings first, structural first within them; the rest follow:

| Leaking step | Findings first |
|---|---|
| Engagement rate, Product view rate | The benefits ingredient (makes the benefits clear), then fit (gives people what they want) |
| Add to basket rate, Checkout start rate | The offer ingredient (has an irresistible offer), then the buy box (user-friendly checks 6 to 8) |
| Checkout completion rate | The trust ingredient (is trustworthy) |

## The footnote

Under the funnel table: the first and last day it covers ("Funnel and device figures cover 12
March to 30 March, the days of the period the funnel table holds"), and that every rate is
summed over summed, then the conversion note above.
