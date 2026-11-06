# Glossary

The terms `SKILL.md` and the other references use, each with one meaning. The shared terms (Recommendation, Action skill, Hand-off, Handover file, Next run, Mode) are in the repo's root `GLOSSARY.md`.

- **CAC**: an ad's Meta spend over the new customers it brought: first-party new orders from a Growth Brain, else Meta's cost per purchase, named on the page as platform-attributed and counting every purchase. Day-of-week normalised before any comparison. The one measure every verdict reads. _Avoid_: CPA, cost per result, ROAS.

- **Account blend**: the CAC of all live ads together, over the same window as the ad. Ads in the campaigns the user names as retargeting or existing-customer are judged against their own blend, every other ad against the whole account's. _Avoid_: account average, benchmark.

- **Peak CAC**: an ad's best 7-day CAC in the last 42 days, as it stood each day. What Fatiguing and Fatigued measure against. _Avoid_: best CAC, baseline.

- **Eligibility floors**: 300 spent in the ad's life (in the account's currency), 2 days old and 30 a day over the 5-day window. Below any of them an ad is Ramping. _Avoid_: thresholds, minimums.

- **Ramping**: an ad below the Eligibility floors. Listed with its spend so far, with no verdict and no Recommendation. _Avoid_: learning, new.

- **Low efficiency**: an eligible ad whose 5-day CAC is 20% or more above its Account blend. Checked first, before any fatigue status. _Avoid_: underperforming, loser.

- **Improving**: an eligible ad 20% or more off its Peak CAC whose CAC has fallen over the last 3 days. Kept, with no Recommendation. _Avoid_: recovering.

- **Fatigued**: an eligible ad 50% or more worse than its Peak CAC on each of the last 3 days and not improving. _Avoid_: dead, burnt out.

- **Fatiguing**: an eligible ad 20% or more worse than its Peak CAC on each of the last 2 days and not improving, short of Fatigued. _Avoid_: declining, decaying.

- **Winner**: an eligible ad with none of the statuses above whose CAC is 20% or more below its Account blend. Labelled a winner on the page and given an Iterate. _Avoid_: high performer, top ad, scaler.

- **Healthy**: an eligible ad with none of the statuses above that is not a Winner. _Avoid_: good, stable.

- **Pause**: turn an ad off: every Low efficiency ad, and every Fatigued ad alongside its Refresh. Never leaves an ad set with fewer than 3 live ads past Ramping; where it would, it reads "Pause once the Refresh is live". _Avoid_: kill, stop, turn off.

- **Refresh**: make a new variation of a Fatiguing or Fatigued ad's concept to replace it as it wears out; for a flexible or dynamic creative ad, add new assets to it. Names the ad and its evidence, never the creative to make. _Avoid_: new creative, replace.

- **Iterate**: make more variations of a Winner's concept. Names the ad and its evidence, never the creative to make, and is never a budget change: Meta holds no budget at ad level. _Avoid_: scale, expand, double down.

- **Keep**: a Healthy, Improving or Ramping ad, listed with no Recommendation. _Avoid_: hold, leave.

- **Minimum live ads**: 3 ads past Ramping in an ad set. The floor a Pause is held to. _Avoid_: ad stock (that is the forecast-ad-stock skill's term).

- **Reported ad**: an ad with at least 100 in the account's currency spent over the last 7 days. Every ad is judged; only Reported ads appear on the page, and above 300 of them the intake warns that the run will be long and token-heavy. _Avoid_: active ad, live ad.

- **Source**: where the ad-by-day rows come from, the first that holds them of a Growth Brain, a Meta connector in the session and one Ads Manager export the user gives. Named on the page. _Avoid_: data source, feed, integration.

- **Brain line**: the fixed sentence, "With a Growth Brain, this judges every ad on a single attribution source rather than every purchase Meta claims.", said as the last line of the page's Notes and Method on a run whose Source is not a Growth Brain and whose session holds none. _Avoid_: upsell, plug.

- **Judged spend share**: the share of the last 7 days' spend in ads past the Eligibility floors. Below 50%, the run opens by saying the method cannot judge most of the account's spend yet. _Avoid_: coverage.
