---
title: From Early Warning to Early Action
hide:
  - toc
---

National Risk Watch supports early warning and early action. That is broader than anticipatory action alone: the platform is useful whether you are running a formal Early Action Protocol, a contingency plan, or a local preparedness process.

### The decision chain

1. **A forecast is issued** by a global or national forecast provider.
2. **National Risk Watch turns that forecast into an event** for a region in your country, with an alert level and an estimate of the population exposed.
3. **You interpret the event** against what you know about the area, the season, and the reliability of the forecast in your context.
4. **You decide whether to act**, following your own protocol. The platform can tell you that a threshold has been crossed. It cannot tell you that acting is the right call.

---

### Two ingredients behind every forecast: severity and probability

Every event on the map is the product of two separate things, and you need both to read it correctly.

- **Severity** is how bad the forecast situation is, expressed as a **return period**. A 5 year flood is one that the historical record at that location says happens on average once every five years. Rarer means more severe.
- **Probability** is how confident the forecast is that this severity will actually be reached. Forecast providers run their model many times with slightly different starting conditions, producing a set of possible outcomes. The probability is the share of those runs that cross the threshold. If 38 of 51 model runs exceed the 5 year level, the probability of a 5 year flood is roughly 75 percent.

The two move independently. A rare, severe forecast with low confidence and a common, mild forecast with high confidence are very different situations, and neither is described by severity alone.

!!! Note "Why you see both"
    A forecast can be severe and uncertain at the same time. Showing only severity would overstate the case, and showing only probability would hide how bad it could get. The alert level combines them, and the event card lets you see the underlying figures.

---

### Alert level

The alert level tells you **how severe and how likely** the forecast situation is. Colors are fixed and always mean the same thing.

| On screen | What it means |
| :--- | :--- |
| **Low warning** | A situation worth monitoring. |
| **Medium warning** | A more severe or more likely forecast, above monitoring and below the top class. |
| **High warning** | The most severe class, a forecast that is both rare and reasonably likely. |

How the three classes are calculated is configured per country. In most countries the classes are set on return period, with a minimum probability that has to be met before a class applies. In others it is the reverse: one return period, with the three classes set on increasing probability. Either way the alert level already accounts for both severity and probability.

---

### Trigger

**A trigger is not a higher alert level. It is a separate thing.**

A trigger means the conditions in your Early Action Protocol for activating are met. That takes three conditions at once:

| Condition | Meaning |
| :--- | :--- |
| **Severity** | The forecast reaches the return period your protocol activates on, for example 5 or 10 year. |
| **Probability** | It reaches it with at least the confidence your protocol requires, for example 75 percent or 85 percent. |
| **Lead time** | There is still enough time before the event for your actions to be carried out. Your protocol sets the maximum lead time a trigger can be declared at. |

The lead time condition is why alert level and trigger have to be read separately.

!!! Important "A high warning without a trigger is not a contradiction"
    An event can sit at high warning and still not be a trigger. The most common reason is lead time: the forecast is severe and likely, but the event is too close for the actions in your Early Action Protocol to be delivered in time. The severity is real. The activation window has closed.
    <br><br>
    The reverse also happens: a trigger with a lower alert level, where your protocol's activation threshold is crossed before the forecast reaches the top severity class.

On the event card, **trigger reached** appears in red next to the alert level chip, and the advisory tells you what your protocol expects. Everything a trigger depends on, the return period, the probability and the lead time, is configured for your country and normally comes straight out of your Early Action Protocol.

### Where the event advisory fits

Each event card shows an **advisory**, for example "Trigger reached, activate EAP". The advisory is a short reminder of what your protocol says in this situation. It is not an instruction from the IFRC or from the Netherlands Red Cross, and it does not replace your own sign off process.

!!! Important "Thresholds are yours, not ours"
    The return periods, minimum probabilities and lead times that decide alert levels and triggers are configured per country, and thresholds differ per location within a country because they are derived from each location's own history. They usually come from your Early Action Protocol or from an agreement with your national hydrological or meteorological service. If any of them does not match your protocol, contact us so it can be corrected.

-8<- "docs/en/_snippets/contact-support.md"
