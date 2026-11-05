% SWI-Prolog: facts form a tiny library, rules derive reading choices.
% Atoms start lowercase; variables start uppercase or with an underscore.
book(dune, fiction, 3).
book(foundation, fiction, 0).
book(cosmos, science, 5).
book(planets, science, 2).

reader(ada, [fiction, science]).
reader(grace, [science]).

% A rule succeeds when each goal in its body succeeds.
available(Title) :-
    book(Title, _, Copies),
    Copies > 0.

recommend(Person, Title) :-
    reader(Person, Categories),
    member(Category, Categories),
    book(Title, Category, _),
    available(Title).

% Pattern matching decomposes lists; recursion visits each item.
show_titles([]).
show_titles([Title|Rest]) :-
    format('  ~w~n', [Title]),
    show_titles(Rest).

% This relation preserves input order while selecting available titles.
keep_available([], []).
keep_available([Title|Rest], Kept) :-
    ( available(Title) ->
        Kept = [Title|Tail]
    ;
        Kept = Tail
    ),
    keep_available(Rest, Tail).

main :-
    % findall collects solutions discovered through backtracking.
    findall(Title, recommend(ada, Title), Choices),
    writeln('Choices for ada:'),
    show_titles(Choices),
    length(Choices, Count),
    format('Available choices: ~d~n', [Count]),
    keep_available([foundation, dune, planets], Kept),
    format('Filtered list: ~w~n', [Kept]),
    ( recommend(grace, dune) ->
        writeln('Dune matches grace')
    ;
        writeln('Dune does not match grace')
    ),
    % Negation as failure is useful on these fully bound goals.
    \+ available(foundation).

% Only run automatically as a script, allowing interactive consultation.
:- initialization(main, main).
