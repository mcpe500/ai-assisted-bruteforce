# Simulator

## Architecture

The simulator is split into three layers:

```
simulator/models/       Core physics and math (pure computation, no rendering)
simulator/threejs/      3D visualization and interaction (browser-based Three.js)
simulator/validation/   Tests comparing simulation output against known results
```

The physics engine must work independently of the renderer. Three.js is a visualization layer, not the physics engine.

## Models layer

Reusable modules for:

* Ray geometry (origin, direction, intersection)
* Reflection (angle computation)
* Refraction (Snell's law)
* Lens behavior (thin lens equation)
* Beam splitting
* Material properties (refractive index, absorption, reflectivity)
* Detector hit detection
* Scene graph (sources, elements, detectors)

Each model should be:

* Pure function or class (no side effects)
* Deterministic for given inputs
* Testable independently
* Documented with assumptions

## Three.js layer

Browser-based visualization:

* 3D scene setup (camera, lights, objects)
* Optical element meshes (mirrors, lenses, beam splitters, detectors)
* Ray path visualization (lines, beams, caustics)
* Interactive controls (drag mirrors, adjust angles, move sources)
* Parameter panels (input values, encoding selection)
* Result display (detector states, output values)

Three.js code should:

* Import from `models/` for computation
* Not duplicate physics logic
* Be modular (one component per optical element)
* Support both interactive and programmatic use

## Validation layer

Tests that verify simulation correctness:

* Known-angle reflection test
* Snell's law refraction test
* Thin lens focal length test
* Detector hit/miss boundary test
* Optical path length test
* Beam splitter ratio test

Each test should have:

* Input parameters
* Expected output (analytical or well-established)
* Tolerance
* Pass/fail result

## Simulation layers (future)

### Layer 1: Geometric optics (current priority)

Rays, mirrors, reflection, refraction, lenses, detectors, beam paths.

### Layer 2: Wave optics (future)

Interference, diffraction, phase, coherence, wavelength-dependent effects.

### Layer 3: Monte Carlo photon simulation (future)

Probabilistic photon paths, scattering, absorption, material interaction.

### Layer 4: Optical computing abstraction (future)

Logic gates, arithmetic encoding, matrix-vector multiplication, signal routing.

## Getting started

1. Read `PROJECT-VISION.md` for the overall goal
2. Read `knowledge/concepts/` for relevant physics
3. Start with geometric optics in `models/`
4. Build validation tests for each model
5. Add Three.js visualization after models are validated
6. Run experiments via `experiments/`
