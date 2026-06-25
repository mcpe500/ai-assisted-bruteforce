# Glossary

## Optics and Photonics

**Ray optics (geometric optics)** - Model where light travels as straight-line rays. Valid when wavelength is much smaller than obstacles.

**Reflection** - Light bouncing off a surface. Angle of incidence equals angle of reflection.

**Refraction** - Light changing direction when passing between media with different refractive indices. Governed by Snell's law.

**Snell's law** - `n1 * sin(theta1) = n2 * sin(theta2)`, relating angles and refractive indices at a media boundary.

**Fresnel equations** - Equations describing the fraction of light reflected/transmitted at an interface, depending on polarization and angle.

**Refractive index (n)** - Ratio of light speed in vacuum to speed in a medium. Glass ~1.5, water ~1.33, vacuum = 1.

**Beam splitter** - Optical element that splits a beam into two (transmitted + reflected).

**Detector** - Device that converts received light into a measurable signal (voltage, current, digital state).

**Coherence** - Property describing phase relationship between light waves. High coherence = laser-like.

**Diffraction** - Bending of light around obstacles or through openings. Significant when aperture size approaches wavelength.

**Interference** - Superposition of two or more waves, producing constructive (amplification) or destructive (cancellation) patterns.

**Polarization** - Orientation of the electric field oscillation in a light wave.

**Wavelength** - Distance between successive wave peaks. Determines color in visible light (~400-700nm).

## Optical Computing

**Optical computing** - Using light (photons) instead of electricity (electrons) for computation.

**Photonic computing** - Computing paradigm based on photon manipulation for logic, arithmetic, or signal processing.

**Optical logic gate** - A device that performs Boolean operations using light inputs and outputs.

**Optical matrix multiplication** - Performing matrix operations using optical elements (lenses, masks, interferometers) rather than electronic circuits.

**Input encoding** - How numbers are represented as physical properties of light (intensity, phase, wavelength, path).

**Output decoding** - How detector states are interpreted as numerical results.

**Spatial light modulator (SLM)** - Device that modulates light amplitude or phase in a spatially resolved pattern.

## Simulation

**Monte Carlo simulation** - Method using random sampling to model probabilistic systems. Useful for photon scattering and absorption.

**Ray tracing** - Algorithm that follows light ray paths through a scene, computing reflections, refractions, and intersections.

**Deterministic** - Produces the same output for the same input every time. Essential for reproducible experiments.

**Seed** - Initial value for a random number generator. Same seed = same sequence = reproducibility.

**Validation** - Comparing simulation output against known analytical solutions or real-world measurements.

## Search and Brute-force

**Bounded brute-force** - Systematic exploration of a search space with explicit limits (max attempts, timeout, scope).

**Parameter sweep** - Iterating over a range of parameter values to find optimal or interesting configurations.

**Search space** - The set of all possible candidates or configurations to explore.

**Scoring function** - Function that evaluates how good a candidate is. Lower (or higher) = better.

**Success condition** - The measurable criterion that determines when the task is complete.

**Stop condition** - The rule that halts execution (success, timeout, max attempts, safety concern).
