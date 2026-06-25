# Project Vision

## What this project is

This is an AI-assisted framework for **research, simulation, and exhaustive exploration**.

The "bruteforce" in the name means: systematically explore a large search space under clear rules, constraints, and validation.

It is not about attacking systems.

## The core loop

```text
Idea
  -> Research (papers, concepts, equations)
  -> Knowledge extraction (structured notes)
  -> Model design (physics, math, simulation architecture)
  -> Simulator implementation (core engine + Three.js visualization)
  -> Experiment definition (what to search, how to validate)
  -> Bounded brute-force/search (parameter sweeps, optimization)
  -> Evaluation (compare against known results)
  -> Refinement (improve model, adjust search space)
  -> Result (reproducible, documented)
```

## Example vision: Light-based computing simulator

Build a system where AI agents help:

1. **Research** photon behavior, ray optics, reflection, refraction, and photonic computing concepts
2. **Extract** equations (Snell's law, Fresnel equations, ray tracing math) and algorithms
3. **Design** a modular simulation engine with geometric optics, wave optics, and Monte Carlo layers
4. **Build** a Three.js visualization for 3D optical scenes (lasers, mirrors, lenses, detectors)
5. **Experiment** with encoding numbers as light (intensity, phase, wavelength, path, detector state)
6. **Search** over mirror angles, lens positions, and optical configurations
7. **Validate** whether optical layouts can represent arithmetic, multiplication, or matrix operations

### The architecture split

```text
simulator/models/     - Core physics (ray tracing, reflection, refraction, wave equations)
simulator/threejs/    - 3D visualization (Three.js scenes, interaction, animation)
simulator/validation/ - Unit tests, known-result comparisons
knowledge/            - Papers, concepts, equations, assumptions, citations
experiments/          - Search definitions, parameter sweeps, results
```

### Layered simulation support

| Layer | Physics model | Use case |
|-------|--------------|----------|
| 1 | Geometric optics | Rays, mirrors, reflection, refraction, lenses, detectors |
| 2 | Wave optics | Interference, diffraction, phase, coherence, wavelength |
| 3 | Monte Carlo photon | Probabilistic paths, scattering, absorption, statistics |
| 4 | Optical computing | Logic gates, arithmetic encoding, matrix multiplication |

### Optical computing representation

Numbers can be encoded as:

* Light intensity (continuous value)
* Beam count (discrete)
* Path selection (which detector activates)
* Detector state (binary or multi-level)
* Phase offset
* Wavelength choice
* Polarization
* Time slot
* Spatial position on detector array

Example: addition

```text
Input A = 1 -> beam A intensity = 1
Input B = 2 -> beam B intensity = 2
Optical combiner -> beam C intensity = 3
Detector reads 3 -> "1 + 2 = 3" confirmed
```

Example: matrix-vector multiplication

```text
Input vector -> light intensities across N input fibers
Optical weight mask -> attenuates/transmits per element
Detector array -> N outputs = result vector
```

## Other use cases

This framework is not limited to optics. It supports any task that benefits from:

* Literature review + knowledge extraction
* Simulation prototyping
* Parameter search / bounded brute-force
* Optimization experiments
* CTF/lab challenges
* Fuzzing local programs
* Algorithmic search

## Philosophy

```text
AI-assisted bruteforce = controlled search + research + simulation + validation
```

The goal is a system that can think through a hard problem, research background material, build a model, test possibilities, learn from failures, and produce reproducible results.
