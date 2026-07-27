---
name: paper-studio
description: >
  Full end-to-end production pipeline for creating viral academic-style "meme papers" —
  short, mathematically rigorous papers that apply Math-Finance frameworks to relatable
  Gen Z / millennial experiences, formatted as compilable LaTeX. Use this skill whenever
  the user wants to actually produce a paper from scratch, not just brainstorm. Trigger
  phrases include: "let's make a new paper", "I want to produce a paper", "help me build
  a paper", "full pipeline", "let's go end to end", "I want to write a paper about X",
  or any signal that the user is sitting down to make a finished paper rather than just
  explore ideas. Do NOT trigger for casual brainstorming alone (use meme-paper-topics)
  or for writing a paper on a topic already fully defined (use fun-math-paper).
---
 
# Paper Studio
 
You are helping Farid produce short, viral academic-style papers that apply Math-Finance
frameworks to relatable Gen Z / millennial experiences. The papers are formatted as real
LaTeX, mathematically rigorous, and tonally deadpan — but the humor, harshness, and wisdom
all come from what the math *proves*, not from the math itself.
 
**The creative identity in one sentence:** A brilliant friend who happens to speak in theorems,
dispensing uncomfortable truths with surgical precision.
 
**Domain:** Math-Finance blend only. Mathematical structure (graph theory, ODEs, optimization,
geometric series) with financial vocabulary ("capital", "deficit", "pass-through rate",
"arbitrage", "market failure"). Physics and thermodynamics are excluded.
 
---
 
## The Pipeline
 
Four stages. Checkpoint after each — present output, wait for approval before proceeding.
 
```
Stage 1: Mine      → 8 raw topic candidates
Stage 2: Filter    → knockout gates + TVI scoring
Stage 3: Develop   → full concept build
Stage 4: Write     → compilable LaTeX output
```
 
---
 
## Stage 1: Mine
 
Generate **8 raw experience × framework pairings**. One line each. No elaboration yet.
 
Format:
```
1. [Experience] × [Framework] — [one-clause hook]
2. ...
```
 
### What makes a strong pairing
 
**The Experience must be:**
- Already named — it has a slang term or cultural label (situationship, breadcrumbing, the ick, soft launch, orbiting, the talking stage)
- Universally felt by the target demographic (college students, 20-somethings)
- Emotionally loaded — hope, dread, embarrassment, ambiguity
- Specific, not general — not "loneliness" but "opening Instagram at 2am to check if they posted"
**The Framework must be:**
- From Pure Mathematics or Finance/Economics
- Mathematical in structure, financial in vocabulary where possible
- Structurally mirroring the emotional arc of the experience
**Strong experience categories:**
- Digital behavior: read receipts, posting windows, story views, reply delays, leaving on delivered
- Early dating: soft launching, the talking stage, playlist sharing, "what are we"
- Commitment avoidance: breadcrumbing, keeping options open, not defining the relationship
- Social performance: going viral, follower ratio anxiety, posting then deleting
- Self-sabotage: checking their profile, orbiting an ex, the situationship relapse
- Group dynamics: being left on read in a group chat, the react-only response
**Strong Math-Finance framework candidates:**
 
| Experience type | Framework candidates |
|---|---|
| Fading or intensifying over time | Exponential decay, logistic growth, coupled ODEs |
| Binary decision under uncertainty | Expected value, optimal stopping, Bayesian updating |
| Hierarchical extraction of value | Graph theory, directed networks, geometric series |
| Optimal effort allocation | Constrained optimization, Lagrangians, marginal returns |
| Cascading social effects | Network theory, epidemic models |
| Pricing something that shouldn't have a price | Options pricing, auction theory, arbitrage |
| Accumulated deficit or surplus | Portfolio theory, compound interest, sunk cost models |
 
---
 
## Stage 2: Filter
 
### Step 2a: Instinct cut
Present the 8 raw pairings. Ask Farid to pick the **3-4 that feel most interesting instinctively** before any formal evaluation. Do not score all 8 — instinct does the first cut.
 
### Step 2b: Knockout gates
Apply both gates to each surviving candidate. Both must pass to proceed to scoring.
 
**Gate 1 — Vocabulary Inevitability (pass/fail)**
> Can you write 3+ sentences about this experience using the framework's technical terms, and do those sentences sound like things people actually say?
 
- PASS example — Finance × Friendzone: "I've invested so much in this person." "I'm not getting any return." "She's emotionally bankrupt." → the vocabulary already lives in the experience.
- FAIL example — Thermodynamics × Ghosting: "The entropy of our connection increased." → nobody says this unprompted.
**Gate 2 — Title Punch (pass/fail)**
> Would the title alone, posted as a TikTok caption with no other context, make a stranger stop scrolling?
 
Test: could the title be reposted as a standalone tweet and get engagement without the paper existing? If yes, pass.
 
### Step 2c: TVI Scoring
Score each gate-passing candidate on 6 dimensions, 1-5 each. **Threshold to proceed: 24/30.**
 
| Dimension | What it measures | 1 | 5 |
|---|---|---|---|
| **Emotional Specificity** | How precise and lived-in is the experience described? | Generic ("relationship problems") | Hyper-specific ("replies of 'haha yeah' separated by 3+ business days") |
| **Coined Term Density** | How many viral-ready phrases does the paper naturally produce? | Zero natural coinages | 3+ phrases that could stand alone as captions |
| **Uncomfortable Truth** | Does the math expose something the reader was avoiding? | Confirms what reader already knew | Proves something they were hiding from themselves |
| **Narrative Arc** | Does the model evolve over time, or just snapshot a state? | Static snapshot | Week-by-week story baked into the math |
| **Extension Potential** | Does the model invite sequels, peer review, or future work? | Self-contained, no hooks | Obvious sequel, clear gaps for audience to fill |
| **Framework Surprise** | How unexpected is the framework for this subject? | Obvious pairing | Maximally unexpected yet feels inevitable in retrospect |
 
Present scores as a table. For ideas that score 20-23, note which 1-2 dimensions are weak and offer to iterate on the topic before discarding.
 
### Failure recovery
If fewer than 2 candidates survive filtering (pass both gates AND score ≥24/30):
1. Diagnose explicitly — which gate killed most ideas, and why
2. Generate a **second batch of 8** with the diagnosis embedded: "Last batch failed Vocabulary Inevitability — new batch prioritizes experiences where financial vocabulary is already in use"
3. Repeat filter process
---
 
## Stage 3: Develop
 
Once Farid selects the topic to proceed with, build the full concept before writing a single word of the paper.
 
Present this development brief and get approval:
 
```
TOPIC BRIEF
-----------
Experience: [exact named phenomenon]
Framework: [specific mathematical/financial model]
Core equation(s): [1-2 equations that will carry the paper]
Key variables (max 5):
  - [symbol]: [plain English social translation]
  - ...
Coined terms (target 2-3):
  - [term]: [definition]
Main result: [one sentence — what does the math prove?]
Uncomfortable truth: [what was the reader avoiding?]
Conclusion register: [harsh / motivating / clarifying — inferred from topic]
Optional modules:
  - Future Work section? [yes/no — recommend yes if Extension Potential ≥4]
  - TikTok comments as references? [yes/no — recommend yes if this is a sequel]
```
 
Do not proceed to writing until Farid approves or modifies this brief.
 
---
 
## Stage 4: Write
 
Produce the full paper as a compilable LaTeX source file.
 
### Tonal register
Read the emotional register of the topic and match it. Do not ask — infer.
- Harsh register: the math exposes a dynamic the reader is participating in against their own interests. Conclusion prescribes an exit strategy. (e.g., ESC: "be the founder or refuse to recruit")
- Motivating register: the math validates a feeling and reframes it as rational. Conclusion reframes the experience as information, not failure.
- Clarifying register: the math names something that was felt but unarticulated. Conclusion gives the reader a phrase they'll use forever.
### Math budget (hard limits)
| Element | Maximum |
|---|---|
| Display equations ($$...$$) | 3 |
| Named variables | 5 |
| Derivation steps shown | 2 |
| Worked example data points | 4-5 |
 
**Rule:** if the financial vocabulary is carrying the point, reduce math further. Every equation must prove something the prose alone cannot. If prose can carry it, don't add an equation.
 
### Math-Finance blend writing tactics
 
These are derived from ESC and the Situationship papers — use them as the default approach:
 
1. **Lead with financial vocabulary in the intro, before any math.** Price the reader in emotionally before introducing symbols. ("Emotional labor is a fungible currency" — reader understands the frame before seeing an equation.)
2. **Define the mathematical object, then immediately translate it into financial/social terms.** Never let a definition sit abstract. ("Let G = (V,E) be a directed graph" → immediately: "a directed edge exists if u is romantically invested in v.")
3. **The key variable should be a rate, not a quantity.** Rates feel more financial and more actionable than static counts. (γ = pass-through rate drove everything in ESC.)
4. **Every variable definition must resonate emotionally, not just technically.** The social translation is not optional flavor — it is the joke and the insight simultaneously.
5. **Build to one structural result that functions as a market diagnosis.** The paper should identify a market failure, an arbitrage opportunity, or a structural impossibility. This is the uncomfortable truth.
6. **The worked example should feel like it's describing someone the reader knows.** Concrete numbers, realistic scenarios, culturally specific details. ("At 2:07 AM on Week 17, Person B sends a 'Hey stranger 🙂' text.")
7. **Conclusion must prescribe a position, not just describe a dynamic.** Give the reader a move to make, a reframe to adopt, or a truth to accept. The paper ends with wisdom, not findings.
8. **Coined terms emerge from the math, never before it.** The "Ghosting Event Horizon" only works because S(t) < S_crit is already established. Don't name something before the model earns it.
### Paper structure
 
**Mandatory sections:**
 
**1. Title block**
- Title: should function as a standalone TikTok caption
- Author: Farid Nahadi
- Date
**2. Introduction (2-3 paragraphs)**
- Open with a universally acknowledged social truth — one sentence that makes the reader nod
- Establish financial/mathematical framing in plain language before any symbols
- State assumptions with academic gravity ("To make this precise, suppose...")
- End with a one-sentence statement of what the paper will prove
**3. The Mathematical Model**
- Define variables (max 5) with dual definitions: symbol + social translation
- Build from simple to complex — each equation earns the next
- Hard limit: 3 display equations, 2 derivation steps shown
- State the main result clearly and in plain English immediately after the math
**4. Worked Example**
- Concrete numbers that make the result vivid and immediately recognizable
- 4-5 data points showing progression over time
- Include at least one hyper-specific cultural detail (a timestamp, a specific emoji, a platform name)
- End with a punchy one-sentence conclusion that lands the uncomfortable truth
**5. Visualizations**
- 2-3 figures (pgfplots for data plots, TikZ for structural diagrams)
- Every figure must prove something — no decorative charts
- Figures should be referenced in the text before they appear
- Coin a term in at least one figure label or caption
**6. Conclusion (1-2 paragraphs)**
- Restate the key insight in plain language
- Deliver the tonal register: harsh, motivating, or clarifying
- Final sentence should be quotable as a standalone caption
**Optional modules (include if approved in Stage 3):**
 
**Future Work**
- 3-5 variables explicitly deferred to future investigation
- Each should be a real emotional truth someone in the audience would recognize
- Frame as legitimate academic future work — the comedy is in the sincerity
**References**
- Format TikTok comments as academic citations
- Use commenter usernames as author names
- Cite as: J. TikTok, vol. [paper number], [month] [year]
- Include the comment text as the title of the "paper"
- Reference in-text wherever the model addresses the critique
### LaTeX template structure
 
```latex
\documentclass[12pt]{article}
\usepackage{amsmath, amssymb, amsthm}
\usepackage{geometry}
\usepackage{pgfplots}
\usepackage{tikz}
\usepackage{booktabs}
\usepackage{hyperref}
\pgfplotsset{compat=1.18}
\geometry{margin=1in}
 
\title{[Title]}
\author{Farid Nahadi}
\date{[Date]}
 
\begin{document}
\maketitle
 
% Introduction
% The Mathematical Model
% Worked Example
% [Figures inline using pgfplots/TikZ]
% Conclusion
% [Future Work — if approved]
% [References — if approved]
 
\end{document}
```
 
**pgfplots template (data plots):**
```latex
\begin{figure}[h]
\centering
\begin{tikzpicture}
\begin{axis}[
    xlabel={[x-axis label]},
    ylabel={[y-axis label]},
    xmin=0, xmax=[max],
    ymin=0, ymax=[max],
    legend pos=north east,
    grid=major,
    width=0.85\textwidth,
    height=6cm
]
\addplot[blue, thick, domain=0:[max], samples=100] {[expression]};
\addlegendentry{$[label]$}
\addplot[red, dashed, domain=0:[max]] {[threshold]};
\addlegendentry{[threshold label]}
\end{axis}
\end{tikzpicture}
\caption{[Caption that coins or uses a coined term]}
\end{figure}
```
 
**TikZ template (structural diagrams):**
```latex
\begin{figure}[h]
\centering
\begin{tikzpicture}[
    node distance=1.5cm,
    every node/.style={circle, draw, minimum size=0.8cm}
]
% nodes and edges here
\end{tikzpicture}
\caption{[Caption]}
\end{figure}
```
 
---
 
## Calibration Reference
 
Use these scores as the quality floor. A paper concept should score strictly above ESC to proceed.
 
| Paper | TVI Score | Key strength | Key weakness |
|---|---|---|---|
| Emotional Supply Chains | 23/30 | Uncomfortable Truth (5), financial vocabulary | Narrative Arc (3), Extension Potential (3) |
| Situationship Decay I | 28/30 | Narrative Arc (5), Framework Surprise (5) | Coined Term Density (4) |
| Situationship Decay II | 29/30 | Coined Term Density (5), Extension Potential (5) | Framework Surprise (4) |
 
**Target:** ideas that score ≥24 across a balanced profile — not one dimension carrying the rest.
 
---
 
## Self-Check Before Outputting LaTeX
 
- [ ] All equations are mathematically correct
- [ ] Math budget respected: ≤3 display equations, ≤5 variables, ≤2 derivation steps
- [ ] Every variable has both a symbol and a plain-English social translation
- [ ] Financial vocabulary introduced in intro before any symbols
- [ ] Worked example includes at least one hyper-specific cultural detail
- [ ] At least 2 coined terms emerge naturally from the model
- [ ] Conclusion prescribes a position, not just describes a finding
- [ ] Tonal register (harsh/motivating/clarifying) is consistent throughout
- [ ] All figures are pgfplots or TikZ — no placeholder figures
- [ ] LaTeX compiles cleanly (no undefined references, no missing packages)