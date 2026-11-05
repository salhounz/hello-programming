-module(examples).
-export([main/0]).

%% Atoms name keys, binaries hold UTF-8 text, and lists keep order.
books() ->
    [#{title => <<"Dune">>, available => true},
     #{title => <<"Emma">>, available => false},
     #{title => <<"Sapiens">>, available => true}].

%% Function clauses pattern-match maps and distinguish boolean values.
label(#{title := Title, available := true}) ->
    <<Title/binary, " - on shelf">>;
label(#{title := Title, available := false}) ->
    <<Title/binary, " - on loan">>.

%% An empty list has its own clause; _Rest is deliberately unused.
first_title([]) ->
    <<"No books">>;
first_title([#{title := Title} | _Rest]) ->
    Title.

main() ->
    Catalog = books(),

    %% A comprehension both filters and transforms a list.
    Available = [Title || #{title := Title, available := true} <- Catalog],
    lists:foreach(
        fun(Book) -> io:format("~ts~n", [label(Book)]) end,
        Catalog),
    io:format("Available: ~p~n", [Available]),
    io:format("First: ~ts~n", [first_title(Catalog)]),
    io:format("Empty: ~ts~n", [first_title([])]),

    %% Variables bind once; map update creates a fresh value.
    [Original | _] = Catalog,
    Borrowed = Original#{available := false},
    io:format("Original: ~ts~n", [label(Original)]),
    io:format("Updated: ~ts~n", [label(Borrowed)]),

    %% Tagged tuples make lookup outcomes explicit.
    case maps:find(title, Original) of
        {ok, Title} -> io:format("Found: ~ts~n", [Title]);
        error -> io:format("Missing title~n")
    end,

    %% Capture the parent PID before spawning a worker process.
    Parent = self(),
    Ref = make_ref(),
    spawn(fun() -> Parent ! {Ref, length(Available)} end),
    receive
        {Ref, Count} -> io:format("Available count: ~B~n", [Count])
    after 1000 ->
        io:format("Worker timed out~n")
    end.
