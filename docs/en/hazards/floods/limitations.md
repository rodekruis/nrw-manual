---
title: Limitations and Feedback
hide:
  - toc
---

Known limitations of the flood information in this pre-release, in one place. None of these are secrets: knowing them is part of using the platform well.

### What the flood information cannot tell you

- **Whether a specific community will flood.** The forecast is modeled at basin and admin area level. It cannot resolve individual villages, and it does not know local defenses or drainage.
- **How the flood develops.** The flood depth layer shows the peak only, not the arrival or the recession.
- **Flash and urban flooding.** The platform currently works from river discharge. Rainfall driven flash flooding and urban drainage flooding are not represented.
- **Where the water will be on a low or medium event.** Flood depth and exposed population are only produced for events that reach the trigger return period. See [Flood layers explained](./layers.md).
- **Who exactly is exposed.** The exposed population is a 100 m population grid intersected with a modeled flood depth grid, counting people in water forecast to be at least 10 cm deep. It is not a count of individuals and not a beneficiary list.
- **How many people live there in total.** Only the exposed population is shown. Total population per admin area, and the ratio between the two, are not in this release.

### What varies by country

- Which forecast sources are configured
- Which admin levels are available, and whether their names match your own
- What thresholds and return periods are set, and whether they match your Early Action Protocol

!!! Important "Check your configuration"
    If the thresholds, return periods, admin names or river stations in the platform do not match what your National Society works with, that is a configuration issue we can fix. Tell your focal point or contact us directly.

### Tell us what is missing

This pre-release exists to be corrected. The team is particularly interested in hearing about:

- Flood depth or flood extent data for your country that we do not have, at any return period
- National, regional or basin specific forecast models that perform better than the global source in your basins
- Thresholds or return periods that do not match your protocol
- Admin boundary names that do not match yours
- Anything on screen that you or your colleagues read differently than intended

[Send feedback to the National Risk Watch team](mailto:support@nationalriskwatch.org).

-8<- "docs/en/_snippets/contact-support.md"
