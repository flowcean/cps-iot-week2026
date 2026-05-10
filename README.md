# CPS-IoT Week 2026

Static workshop website and proposal material for the CPS-IoT Week 2026 tutorial, "Data-Driven Modeling of Hybrid Automata within a Unified Model Learning Framework".

## Website

GitHub Pages publishes the contents of `pages/`.

- `pages/index.html`: public tutorial landing page.
- `pages/participant-guide.html`: local setup and hands-on workshop companion.
- `pages/static/data/`: downloadable workshop datasets and other static data files.

## Local Preview

Run a static server from the repository root:

```bash
python -m http.server 8000 --directory pages
```

Then open `http://localhost:8000/`.
