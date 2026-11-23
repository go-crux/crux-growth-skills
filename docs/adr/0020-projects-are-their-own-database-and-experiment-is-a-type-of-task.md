# Projects are their own database, and Experiment is a type of Task

**Status:** Accepted, 2026-11-23.

S3 keeps projects, experiments and tasks on one Cards board split by `Type`, and the mix made its boards and filters awkward to read. The growth system has seven databases instead: Initiatives, Projects, Tasks, Issues, Decisions, Learnings and Insights, with Task → Project → Initiative as relations, and `Type` on Tasks only, Task or Experiment. Only an Experiment carries the hypothesis, the ICE score and `Outcome`, so wins count experiments and nothing else; Projects are chosen against their initiative on a `Priority`, never scored. Each Initiative serves one quarterly **Objective** and carries one **Key result**, OKR style, 3 to 5 initiatives an objective. This diverges from S3 on purpose, so a port from S3 maps Cards rows by `Type` rather than copying the board.
