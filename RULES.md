# Development Guidelines: GSD + Ralph Loop + Ponytail + CodeRabbit

This project follows 4 interconnected engineering pillars:

## 1. ⚡ GSD (Get Shit Done)
- **Phase-Driven**: Decompose tasks into clear phases with upfront requirements.
- **Wave Execution**: Group independent tasks together, test in parallel.
- **Human Checkpoints**: Present verified deliverables at clear milestones.

## 2. 🔁 The Ralph Loop
- **Context Hygiene**: State lives in the filesystem (`TASK.md`, git log, code), not in conversational memory.
- **Atomic Iterations**: Each cycle handles one task: Read Task $\rightarrow$ Implement $\rightarrow$ Test/Analyze $\rightarrow$ Commit.
- **Continuous Validation**: Never mark a task complete without automated verification.

## 3. ✂️ Ponytail (Pragmatic Anti-Bloat & YAGNI)
- **You Ain't Gonna Need It**: Do not write anticipatory abstractions, unnecessary wrappers, or complex multi-layer architectures for simple requirements.
- **Native-First**: Leverage Flutter’s built-in widgets, layout engines, and standard Dart capabilities before bringing in third-party dependencies.
- **Lean Code**: Keep files focused, concise, readable, and direct.

## 4. 🐇 CodeRabbit Standards
- **Zero Static Errors**: Code must pass `dart analyze` / `flutter analyze` cleanly.
- **Lifecycle Discipline**: Always dispose controllers, stream subscriptions, and listeners.
- **Const Correctness**: Use `const` widgets and constructors to avoid unnecessary widget rebuilds.
- **Defensive Null-Safety**: Handle edge cases, null fields, and failed async calls gracefully.
