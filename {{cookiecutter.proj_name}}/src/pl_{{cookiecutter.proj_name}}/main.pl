#!/usr/bin/env swipl
%% -t halt : stops entering the repl
%% from https://stackoverflow.com/questions/25467090

%% Setup:
%% :- set_prolog_flag(verbose, silent).
:- initialization main.
%% Load other files:
:- [data].
:- [rules].

main :-
    current_prolog_flag(argv, [Argv|_]),
    place(Argv),
    getPairedPerson(X, Argv),
    likes(X, Y),
    format("Got: ~q~n", Argv),
    format("Result: ~q likes ~q in ~q~n", [X, Y, Argv]),
    halt().

main :-
    format("Call with a location: london/cairo/ny.~n"),
    halt(1).

