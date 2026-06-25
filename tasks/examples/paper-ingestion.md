# Task: Paper Ingestion — Photonic Computing Survey

```yaml
task_id: paper-ingestion-photonic-computing
mode: paper_ingestion
objective: >
  Discover, collect metadata, summarize, and organize open-access papers
  related to optical computing, photonic matrix multiplication, ray optics
  simulation, and light-based logic gates.
background: >
  A knowledge base is needed before simulation design can begin.
  This task collects research sources, extracts key concepts and equations,
  and produces structured notes for downstream simulation work.
target: knowledge/
inputs:
  search_topics:
    - photonic computing
    - optical matrix multiplication
    - ray tracing simulation
    - optical logic gates
    - light-based arithmetic
    - diffractive neural networks
    - spatial light modulators
    - free-space optical computing
  preferred_sources:
    - arXiv
    - Optica Publishing Group (open access)
    - Nature Communications (open access)
    - IEEE Xplore (open access only)
    - Google Scholar metadata
    - Semantic Scholar
outputs:
  - knowledge/papers/<year>-<short-title>.md (one per paper)
  - knowledge/concepts/photonic-computing-overview.md
  - knowledge/concepts/ray-optics-basics.md
  - knowledge/glossary.md (updated)
constraints:
  max_attempts: 50
  timeout_seconds: 1200
  network_allowed: true
  destructive_actions_allowed: false
  download_policy: open_access_only
  paywall_bypass_allowed: false
  copyrighted_mass_download_allowed: false
success_condition: >
  At least 10 papers with structured notes, covering the main search topics,
  with metadata, summaries, key equations, and simulation relevance.
stop_condition: >
  10+ papers processed, or timeout, or all topics covered.
validation_method: >
  Each paper note must have all required fields filled.
  No paywalled PDFs downloaded. Citations stored.
```

## Paper note format

For each paper, create `knowledge/papers/<year>-<short-title>.md`:

```md
# <Paper Title>

## Metadata
- Title:
- Authors:
- Year:
- Venue:
- DOI:
- URL:
- Access type: open_access | abstract_only | user_provided

## Summary
(2-3 paragraphs in your own words)

## Key concepts
(List of concepts introduced or used)

## Equations
(Important equations, with variable definitions)

## Algorithms
(Any algorithms or procedures described)

## Simulation relevance
(How this paper relates to the simulation goals)

## Limitations
(Author-acknowledged or observed limitations)

## Follow-up papers
(Cited or related papers worth reading)

## Tags
(photonics, matrix-multiplication, ray-optics, etc.)
```

## Rules

* Only download PDFs that are legally open-access.
* If a PDF is behind a paywall, store metadata + abstract only.
* Summaries must be in the agent's own words.
* Store DOI and URL for every paper.
* Do not mass-scrape any website.
* Respect rate limits on APIs.
* Track which topics are well-covered and which need more sources.
