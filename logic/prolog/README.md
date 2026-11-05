# Prolog

Prolog is used for logic programming, symbolic reasoning, and knowledge-based systems.

Official documentation: [SWI-Prolog documentation](https://www.swi-prolog.org/pldoc/doc_for?object=manual)

Run: `swipl -q -s hello.pl`

## Concise introduction

[examples.pl](./examples.pl) covers atoms, variables, facts, rules, unification,
list patterns, recursion, backtracking, findall, negation as failure, and
if-then-else. Predicates express relations rather than imperative functions.

From this directory run `swipl -q -s examples.pl` with SWI-Prolog. Expect three
choices for ada and a filtered list containing dune and planets. For interactive
queries use `swipl -q`, consult with `[examples].`, then enter
`recommend(ada, Title).` and press `;` to request further solutions. Enter `halt.`
to exit. The main predicate runs automatically only in script mode.
