---
title: Data Sources
hide:
  - toc
---

Every event card has a **Data sources** section. Open it to see exactly which datasets that event was built from. This is deliberate: you should always be able to tell what is behind a number before you act on it.

!!! Important "None of these forecasts are ours"
    National Risk Watch does not produce forecasts. We tap into existing sources and combine them. If you disagree with a forecast, the discussion is with the forecast producer and with your national services, not with the platform.

### The three inputs behind a flood event

| Source | What it provides | Provider |
| :--- | :--- | :--- |
| **Forecast river discharge** | The forecast volume of water in the river, in cubic meters per second, for each of the next 7 days, as a set of 51 possible outcomes | GloFAS, the Global Flood Awareness System, run by Copernicus. The only discharge source for now |
| **Flood depth map** | The depth and the area expected to flood, one map per return period | The global flood hazard maps published by the Joint Research Centre of the European Commission |
| **Population counts** | How many people live where, at 100 m resolution | WorldPop, constrained population counts, 2026 release |

### How they combine

1. GloFAS gives 51 discharge forecasts per day per station, out to 7 days.
2. Each forecast is compared with the return period thresholds for that location, which produces the severity and the probability behind the alert level. See [Reading the discharge graph](./discharge-graph.md).
3. If the event reaches the trigger return period, the flood depth map for that return period is clipped to the affected admin areas.
4. WorldPop counts are clipped to the area where flood depth reaches at least 10 cm. What remains is the **exposed population**, totaled per admin area.

!!! Note "Why the exposed population figure can look coarse"
    It is a 100 m population grid intersected with a modeled flood depth grid. It is strong enough to tell you where to concentrate attention and roughly how large a response might need to be. It is not a count of individuals and not a beneficiary list.

### Why the source matters

- **GloFAS is global and therefore coarse.** It does not know every tributary, and its stations may sit some distance from the community you care about. Check where the station is before you read its forecast as local.
- **Accuracy varies by basin.** Users in several countries report that global flood forecasts over or under estimate in their basins. Where a national or basin specific model exists, it is usually closer to reality.
- **More sources are possible.** The platform is built so that additional forecast sources can be fed in, including national and regional models. This is not automatic: it needs a data quality assessment and configuration work per country.

!!! Question "Have a better source for your country?"
    If your National Society, hydrological service or a research partner runs a flood model for your basins, tell us. Adding national and local sources is planned work, and knowing what exists helps us prioritize. [Contact us](mailto:support@nationalriskwatch.org).

-8<- "docs/en/_snippets/contact-support.md"
