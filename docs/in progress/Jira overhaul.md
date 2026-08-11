---
tags:
  - jira
  - swip
---
* Part of [[SWIP]]
* **Owner**: me
* **Link**: https://miro.com/app/board/uXjVHCJMsmY=/?moveToWidget=3458764676412128737&cot=14

## Objective

- Improve ease-of-use across teams
- Standardize its use
- Support estimations and effort needed for each feature or technology
- Emphasis on working on the right thing

## Main building blocks

- Goals
- Work item hierarchy (NPI, Capability, Epic, Task, Risk)
- Story point and original estimate fields. Explained in [[Estimations]].
- Priority
- Risks management. Explained in [[Risk management]]

## Main stakeholders

- PM - Provide and maintain goals in Atlassian
- Mozart
- QA
- Audio
- PjM
- HW

## Execution plan

| Track #1                                | Track #2                                            |
| --------------------------------------- | --------------------------------------------------- |
| 1. Setup components to mozart and NPIs  | 1. Formalize what fields should be removed          |
| 2. Add capabilities for mozart and NPIs | 2. Find out who uses Jira                           |
| 3. Setup Teams                          | 3. Notify users of the changes and address feedback |
| 4. Setup estimations automations        |                                                     |
## Epics living under NPI, or Platform space

### NPI

| Pros                              | Cons                                                        |
| --------------------------------- | ----------------------------------------------------------- |
| Filters are much easier to set up | Bringing platform releases to NPI spaces becomes cumbersome |
| Work logically belongs to the NPI |                                                             |
### Platform space

| Pros                               | Cons                                                                                                |
| ---------------------------------- | --------------------------------------------------------------------------------------------------- |
| Platform release overview improves | Very difficult to track                                                                             |
|                                    | Not scalable. Adding a new team or platform will force every filter/board/dashboard to get updated. |
