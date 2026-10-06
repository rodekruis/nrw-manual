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
| **Languages** | English only. The `docs/<lang>` and `www/<lang>` layout is ready for more |

## Structure

```
zensical.toml            site config and nav (English)
pyproject.toml, uv.lock  Python dependencies, managed with uv
docs/en/                 page content, one .md per page
  _snippets/             shared fragments included with -8<-, not rendered as pages
  assets/img/            screenshots
theme/assets/            language independent: stylesheet and self hosted fonts
```

Zensical requires `docs_dir` and `site_dir` to sit inside the directory of the config file, so configs live at the repository root. See [Multiple languages](#multiple-languages) for adding a second language.

Sections: introduction and positioning, navigating the platform, hazard guides, about this release, glossary.

## Development

### Getting started

- Install [uv](https://docs.astral.sh/uv/getting-started/installation/), for example with `brew install uv` on macOS

- Install dependencies into `.venv`. uv fetches a matching Python if needed:

  ```sh
  uv sync
  ```

- Serve the documentation, preview at <http://localhost:8000>:

  ```sh
  uv run zensical serve
  ```

- Build the static site into `www/en/`:

  ```sh
  uv run zensical build
  ```

To upgrade Zensical, run `uv lock --upgrade-package zensical` and commit the updated `uv.lock`.

### With Docker

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
> The image installs Zensical with uv from `uv.lock`, so Docker and local builds use the same version. The entrypoint is `zensical`, so the `CMD` in the `Dockerfile` is a list of Zensical arguments. `--dev-addr 0.0.0.0:8000` is required: binding to localhost inside the container would make the server unreachable from the host.

### Writing conventions

- One page per `.md` file, with front matter setting `title` and `hide: toc`
- Append the support snippet at the end of every page: `-8<- "docs/en/_snippets/contact-support.md"`
- Use admonitions for anything a reader could act on wrongly: `!!! Note`, `!!! Important`, `!!! Warning`, `!!! Question`
- No em dashes, en dashes, or hyphens used as a pause. US English
- Add new pages to the `nav` in `zensical.toml`. A page not in `nav` will not appear
- `navigation.tabs` is deliberately not enabled, so every section sits in the left sidebar

### Screenshots

Screenshots live in `docs/en/assets/img/` and are captured from the demo prototype. When the interface changes, replace the file and keep the filename, so no page needs editing.

| File | State captured |
| :--- | :--- |
| `ScreenOverview.png` | National overview, events panel with two events |
| `EventsPanel.png` | Events panel, list of events |
| `FloodLayers.png` | Event view, flood depth and exposed population on the map |
| `EventView.png` | Event view, full screen, one event open with the event card, exposed admin areas and legend |
| `ImpactBasedMap.png` | Event view, full screen with the exposed population legend row |
| `MapDrillDown.png` | Drilled into a zone, woreda level table |
| `LegendExposure.png` | Legend strip, flood depth and exposed population classes |
| `DischargeGraph.png` | River discharge forecast, expanded |

### Multiple languages

Each language is a separate Zensical site with its own config, content folder and output folder. English is the default and uses `zensical.toml`; every other language gets `zensical.<lang>.toml`. French is used as the example below.

| | English | French |
| :--- | :--- | :--- |
| Config | `zensical.toml` | `zensical.fr.toml` |
| Content | `docs/en/` | `docs/fr/` |
| Output | `www/en/` | `www/fr/` |
| URL | `/en/` | `/fr/` |

To add a language:

1. Copy `docs/en/` to `docs/fr/` and translate the pages. Keep the filenames, so the `nav` paths and links between pages stay the same
2. Point the snippet include at the end of each page to the translated snippet: `-8<- "docs/fr/_snippets/contact-support.md"`
3. Replace screenshots in `docs/fr/assets/img/` if the interface is shown in French. Keep the filenames
4. Copy `zensical.toml` to `zensical.fr.toml` and change:
   - `site_url` to `https://manual.nationalriskwatch.org/fr/`
   - `docs_dir` to `docs/fr` and `site_dir` to `www/fr`
   - `language` under `[project.theme]` to `fr`, which translates the theme's own labels such as search and navigation
   - `site_name` and the titles in `nav`
5. Add the language selector to the `[project.extra]` section of **every** config, so each site links to the others:

   ```toml
   [project.extra]
   generator = false
   alternate = [
     { name = "English", link = "/en/", lang = "en" },
     { name = "Français", link = "/fr/", lang = "fr" },
   ]
   ```

Serve or build a language by passing its config:

```sh
uv run zensical serve --config-file zensical.fr.toml
uv run zensical build --config-file zensical.fr.toml
```

With Docker:

```sh
docker compose run --rm build build --config-file zensical.fr.toml
```

Things to know:

- The stylesheet and fonts in `theme/assets/` are shared through `custom_dir = "theme"`, which the copied config keeps, so there is nothing to copy or keep in sync
- The selector links to the home page of the other language, not to the same page in that language
- Search only covers the language being read
- Builds land in `www/<lang>/`, so the host has to serve `www/` as the site root. Nothing redirects `/` to `/en/` yet; that belongs in the deployment setup

## Open items before publishing

- Terminology in the text is from an earlier Malawi mock and does not yet match the screenshots: pages say districts and TAs where the app shows zones and woredas, and call the gauge a GloFAS station where the app labels it River gauge
- Alert level pages describe low, medium and high; the app legend currently shows low and high only
- `platform/exporting.md` and `platform/logging-in.md` describe intent, since neither feature exists yet
- Theme assets are missing: no logo or favicon
- No deployment workflow yet. Nothing publishes this site

## Tools in use

- Zensical: <https://zensical.org/docs/>, default theme with [IFRC primary colors](https://brand.ifrc.org/ifrc-brand-system/basics/colour) set in `theme/assets/stylesheets/extra.css`
- uv: <https://docs.astral.sh/uv/>
- Layout and conventions follow the [121 Platform manual](https://github.com/global-121/manual)
