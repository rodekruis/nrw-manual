---
title: Event Dates and Statuses
hide:
  - toc
---

An event carries several dates, and they answer different questions. This page explains each one and what the status chips mean.

### The dates on an event card

| Date | Where it appears | What it means |
| :--- | :--- | :--- |
| **Event created** | Bottom of the event card | When National Risk Watch first opened this event, which is the first forecast run that crossed a threshold for this region. It is when monitoring of this event began, not when the flooding starts. |
| **Starts** | Top of the expanded card | The main date. This is the first day in the forecast window on which the forecast crosses the threshold set for the location, either your configured threshold or the one from your Early Action Protocol. |
| **Peak** | In the river discharge graph | The day the forecast discharge is highest. It is usually later than the start date. |
| **Last updated** | Bottom of the event card | When the forecast behind this event last refreshed. Use this to judge how current what you are looking at is. |

!!! Warning "Start date and peak date are not the same"
    The start date tells you when the situation becomes actionable by your threshold. The peak tells you when the river is expected to be at its highest. Plan against both: your lead time runs to the start date, your worst case runs to the peak.

!!! Note "When the forecast crosses the threshold on several days"
    A forecast often stays above the threshold for more than one day of the 7 day window. The start date is the **first** crossing, not the worst one and not the last one. Use the return period lines on the [discharge graph](./discharge-graph.md) to see the full shape: which days cross which thresholds, and where the peak sits relative to the start.

### Statuses

The outlined chip on the event card tells you where the event sits in time.

| Status | Meaning |
| :--- | :--- |
| **Imminent** | The event is in the future. The forecast has crossed a threshold but the flooding has not started yet. This is the window in which early action is possible. |
| **Ongoing** | The event is happening now. |
| **Ended** | The event is in the past. It stays visible for a period after it has happened so you can still use it while you plan and run a response. |

!!! Important "Ended events are not shown in this pre-release"
    The **ended** status is designed but not yet built. In this pre-release, once an event is over it disappears from the events overview rather than appearing as ended. If an event you were following is no longer in the list, that is why. Note down what you need from an event before it passes.

### Why an event does not open and close repeatedly

Forecasts change between runs. Rather than closing an event every time a forecast dips and opening a new one when it rises again, National Risk Watch keeps one event per region and updates it. A more severe forecast raises the alert level of the same event. This is why the **last updated** timestamp matters more than the event count.

-8<- "docs/en/_snippets/contact-support.md"
