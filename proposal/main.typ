#set page(margin: 2.5cm)
#set text(font: "Libertinus Serif", size: 11pt)
#set par(
  justify: true,
  leading: 0.75em,
  justification-limits: (
    tracking: (min: -0.01em, max: 0.02em),
  ),
)
#show heading: set block(below: 1em)

#let todo(content) = text(fill: red, [ToDo: #content])

= Tutorial Proposal: Data-Driven Modeling of Hybrid Automata within a Unified Model Learning Framework

Understanding the behavior of complex Cyber-Physical Systems (CPS) requires models that capture both their physical dynamics and embedded control logic.
As systems scale in complexity, manual modeling becomes infeasible, while traditional data-driven methods often lack structure, interpretability, and reproducibility.
This creates a strong need for unified workflows that guide practitioners from data collection to model deployment in a principled, transparent, and CPS-aware manner.

Hybrid automata are a powerful and interpretable model for CPS, capturing both continuous physical dynamics and discrete mode transitions.
Interpretable hybrid models enable developers to reason about system behavior, understand operational modes, examine transition logic, and support downstream tasks such as monitoring, prediction, anomaly detection, and debugging.
However, identifying hybrid automata directly from data is challenging: segmenting trajectories, inferring flow functions, and discovering guard conditions form a coupled learning problem.
@fig:ha-flow illustrates a common perspective to this problem, alternating between learning flow functions and segmenting data, followed by guard condition identification and model construction.
Recent advances in data-driven hybrid system identification @plambeck2026identification make this feasible, providing a novel approach to interpretable CPS modeling.

#figure(
  include "ha-flow.typ",
  caption: [Learning Process for Hybrid Automata Identification],
)<fig:ha-flow>

At the same time, CPS research lacks a reproducible, library-agnostic framework for structuring modeling workflows.
Existing tools fragment across libraries such as scikit-learn, PyTorch, and custom domain scripts, making experiments difficult to compare or reuse.
Flowcean #footnote[https://github.com/flowcean] addresses this gap by providing unified abstractions for data sourcing, transformation, learning, evaluation, and deployment (see @fig:flowcean).
It enables researchers to construct modeling pipelines using diverse learning algorithms while maintaining a consistent interface and experiment structure @schmidtFlowceanModelLearning2024.

#figure(
  image("pipeline-light.svg", width: 53%),
  caption: [Learning Pipeline of Flowcean],
)<fig:flowcean>

The proposed tutorial introduces Flowcean as an enabling framework for data-driven CPS modeling and demonstrates its synergy with hybrid automaton identification methods.
Participants will gain both conceptual understanding and practical skills to build interpretable, data-driven CPS models using real examples.
This tutorial targets a broad audience across the CPS-IoT Week community, including researchers and practitioners in model-based design, system identification, learning-enabled CPS, hybrid systems, and interpretable machine learning.

#set text(size: 8.5pt)

#bibliography("bibliography.bib",title: none)

#set text(size: 11pt)

== Learning Objectives

By the end of this tutorial, participants will:

+ Understand the structure of data-driven modeling pipelines for CPS.
+ Learn how Flowcean unifies machine learning workflows across multiple libraries.
+ Build and evaluate modeling pipelines using regression trees and neural networks.
+ Understand the principles of hybrid automaton identification: flow function learning, segmentation, and guard condition discovery.
+ Apply a modern hybrid system identification algorithm to data from a simulated cyber-physical system.
+ Compare interpretable hybrid models with black-box baselines.
+ Use Flowcean to design, run, and analyze experiments in a reproducible manner.

== Tutorial Agenda (Half Day)

This half-day tutorial consists of two main parts, each combining conceptual lectures with hands-on exercises.
//All exercises require only lightweight computation and can run locally on participant laptops.

=== Part I --- Unified CPS Modeling with Flowcean

This session ensures that participants understand Flowcean's workflow and are prepared for the hybrid system identification exercise.

#grid(
  columns: (1fr,1fr),
  column-gutter: 15pt,
  [
    ==== Lecture (45 mins)
    - Data acquisition from simulated or real CPS
    - Feature engineering and preprocessing
    - Learning strategies and model interfaces
    - Integration of models, e.g., scikit-learn, PyTorch
    - Evaluation strategies, metrics, and analysis

  ],
  [
    ==== Hands-on (45 min)
    - Load and transform CPS-relevant data
    - Train baseline models (e.g., regression trees, feed-forward neural networks)
    - Evaluate accuracy, runtime, and generalization
    - Store and reload models using Flowcean
  ]
)

/*
==== Lecture (45 min)
We introduce Flowcean as a framework that abstracts the entire data-driven modeling process.
Topics include:
- Data acquisition from simulated or real CPS environments
- Transformation pipelines: feature engineering, augmentation, and preprocessing
- Learning strategies and model interfaces
- Integration of models from diverse libraries (scikit-learn, PyTorch, and custom learners)
- Evaluation strategies, metrics, and experiment tracking
- Benefits for reproducibility, comparability, and CPS-focused experimentation

==== Hands-on (45 min)
Participants construct a full modeling pipeline in Flowcean:
- Load and transform CPS-relevant data
- Train simple baseline models (e.g., regression trees, feed-forward neural networks)
- Evaluate accuracy, runtime, and generalization across models
- Store and reload models using Flowcean

This session ensures that participants understand Flowcean's workflow and are prepared for the hybrid system identification exercise.
*/

=== Part II --- Data-Driven Identification of Hybrid Automata

In this session, participants gain experience with an interpretable modeling paradigm and understand how Flowcean supports experimentation with advanced CPS modeling strategies.

#grid(
  columns: (1fr,1fr),
  column-gutter: 15pt,
  [
    ==== Lecture (45 min)
    - Motivation for hybrid models in CPS
    - Flow functions and their physical interpretation
    - Segmentation of time-series data
    - Guard conditions and transition logic
    - Iterative process for segmentation and flow identification
  ],
  [
    ==== Hands-on (45–60 min)
    - Load datasets or generate data via simulation
    - Run the segmentation and identification pipeline
    - Infer guard conditions and construct a model
    - Visualize modes, flows, and transitions
    - Compare interpretability and performance against regression trees and neural
  ]
)

/*
==== Lecture (45 min)
We introduce hybrid automata as interpretable models for CPS and describe the data-driven identification pipeline:
- Motivation for hybrid models in CPS
- Mode-dependent flow functions and their physical interpretation
- Segmentation of time-series data into dynamically consistent modes
- Guard condition identification and transition logic
- Iterative learning process for jointly estimating segments and flow functions
- Strengths and trade-offs compared to black-box models

A thermostat system serves as an illustrative running example. Its simple structure allows participants to reason about modes and transitions while still capturing essential hybrid dynamics.

==== Hands-on (45–60 min)
Participants apply the hybrid system identification algorithm to thermostat data:
- Load the provided dataset or generate traces via simulation
- Run the segmentation and flow function identification pipeline
- Infer guard conditions and construct a complete hybrid automaton
- Visualize modes, flows, and transitions
- Compare the hybrid model's interpretability and performance against regression trees and neural networks
- Discuss applications such as monitoring, prediction, and understanding operational behavior

Through this workflow, participants gain experience with an interpretable modeling paradigm and understand how Flowcean supports experimentation with advanced CPS modeling strategies.
*/

== Technical Requirements

The tutorial requires:
- A lecture room with projector and WiFi
- Participants to bring a laptop with Python installed (optional fallback: Google Colab notebooks for browser-based execution)
- All datasets, code templates, and installation instructions will be provided beforehand

All materials will remain publicly available to support reproducibility and continued learning.

#pagebreak()
= Organizers

#grid(
  columns: (1fr, 4fr),
  row-gutter: 10pt,
  [Name], [*Maximilian Schmidt*],
  [Affiliation],
  [Institute of Embedded Systems, Hamburg University of Technology],

  [Contact e-mail], [maximilian.schmidt\@tuhh.de],
  [Short Bio],
  [
    Maximilian Schmidt is a research assistant and doctoral student at the Institute of Embedded Systems at Hamburg University of Technology (TUHH).
    He received his bachelor's and master's degree at TUHH in computer science and engineering.
    Since 2023 he is working as a research assistant in the group for computer engineering on data-driven modeling of cyber-physical systems.
    He is part of the research project AGenC (automatic generation of models for the prediction, monitoring, and testing of cyber-physical systems) and one of the developers of Flowcean.
    He is core developer of the open-source robotics framework of the RoboCup Team HULKs and has published several peer-reviewed papers on data-driven modeling for CPS.
  ],
)
#v(2em)
#grid(
  columns: (1fr, 4fr),
  row-gutter: 10pt,
  [Name], [*Swantje Plambeck*],
  [Affiliation],
  [Institute of Embedded Systems, Hamburg University of Technology],

  [Contact e-mail], [swantje.plambeck\@tuhh.de],
  [Short Bio],
  [
    Swantje Plambeck is a research assistant and doctoral candidate at the Institute of Embedded Systems at Hamburg University of Technology (TUHH).
    She received her bachelor's and master's degree at TUHH in electrical engineering in 2018 and 2020, respectively.
    Since 2020 she is working as a research assistant in the group for computer engineering on data-driven modeling of cyber-physical system.
    She is part of the research project AGenC (automatic generation of models for the prediction, monitoring, and testing of cyber-physical systems) and one of the developers of Flowcean.
    She already published more than 20 peer-reviewed journal, conference, and workshop papers.
  ],
)