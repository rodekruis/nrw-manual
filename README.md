# NRW Manual

User manual for National Risk Watch, the multi hazard risk monitoring and early warning platform built by the Netherlands Red Cross 510 team together with the IFRC GO team.

> [!IMPORTANT]
> This manual covers the **standalone platform** and the **floods pre-release**. It is written for National Society staff moving over from the IBF Portal. Not yet published.

## Scope

| | |
| :--- | :--- |
| **Interface** | Standalone platform only. The National Risk Watch view embedded in IFRC GO is not covered |
| **Reader** | National Society staff, assumed to know the IBF Portal |
| **Hazards** | Floods only. The Hazard Guides section is structured to take more hazards as children |
| **Languages** | English only. The `docs/<lang>` and `config/<lang>` layout is ready for more |

## Structure

```
config/en/mkdocs.yml     site config and nav
docs/en/                 page content, one .md per page
  _snippets/             shared fragments included with -8<-
  assets/img/            screenshots
```

Sections: introduction and positioning, navigating the platform, hazard guides, about this release, glossary.

## Development

### Getting started

- Create a [Python virtual environment](https://realpython.com/python-virtual-environments-a-primer/) (Linux/macOS):

  ```sh
  python3 -m venv venv
  source venv/bin/activate
  ```

- Install dependencies:

  ```sh
  pip install -r requirements.txt
  ```

- Serve the documentation, preview at <http://localhost:8000>:

  ```sh
  mkdocs serve --config-file config/en/mkdocs.yml --dev-addr localhost:8000
  ```

#### With Docker

No Python setup needed. Serve at <http://localhost:8000>:

```sh
docker compose up
```

Content is mounted, not copied, so edits reload live. Stop with `Ctrl+C`.

To produce the static site in `www/en/` instead of serving it:

```sh
docker compose run --rm build
```

Plain Docker, without compose:

```sh
docker build --tag nrw-manual .
docker run --rm -it -p 8000:8000 -v ${PWD}:/docs nrw-manual
```

> [!NOTE]
> The image is built on `squidfunk/mkdocs-material`, whose entrypoint is `mkdocs` itself, so the `CMD` in the `Dockerfile` is a list of mkdocs arguments. `--dev-addr 0.0.0.0:8000` is required: binding to localhost inside the container would make the server unreachable from the host.

### Writing conventions

- One page per `.md` file, with front matter setting `title` and `hide: toc`
- Append the support snippet at the end of every page: `-8<- "docs/en/_snippets/contact-support.md"`
- Use admonitions for anything a reader could act on wrongly: `!!! Note`, `!!! Important`, `!!! Warning`, `!!! Question`
- No em dashes, en dashes, or hyphens used as a pause. US English
- Add new pages to the `nav` in `config/en/mkdocs.yml`. A page not in `nav` will not appear
- `navigation.tabs` is deliberately not enabled, so every section sits in the left sidebar

### Screenshots

Screenshots live in `docs/en/assets/img/` and are captured from the demo prototype. When the interface changes, replace the file and keep the filename, so no page needs editing.

| File | State captured |
| :--- | :--- |
| `ScreenOverview.png` | National overview, events panel with two events |
| `EventsPanel.png` | Events panel, collapsed cards |
| `FloodLayers.png` | Event view, flood depth and exposed population on the map |
| `ImpactBasedMap.png` | Event view, map only |
| `MapDrillDown.png` | Drilled into a zone, woreda level table |
| `LegendExposure.png` | Legend strip, flood depth and exposed population classes |
| `DischargeGraph.png` | River discharge forecast, expanded |

## Open items before publishing

- Terminology in the text is from an earlier Malawi mock and does not yet match the screenshots: pages say districts and TAs where the app shows zones and woredas, and call the gauge a GloFAS station where the app labels it River gauge
- Alert level pages describe low, medium and high; the app legend currently shows low and high only
- `platform/exporting.md` and `platform/logging-in.md` describe intent, since neither feature exists yet
- Theme assets are missing: no logo, favicon or `extra.css`, so the site renders in stock Material blue rather than Red Cross red and navy
- No deployment workflow yet. Nothing publishes this site

## Tools in use

- Material for MkDocs: <https://squidfunk.github.io/mkdocs-material/>
- Layout and conventions follow the [121 Platform manual](https://github.com/global-121/manual)
