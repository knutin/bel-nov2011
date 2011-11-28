-module(types).
-compile([export_all]).

int() ->
    1.

atom() ->
    foobar.

string() ->
    "foobar".

list() ->
    [1, atom, "quux"].

cons() ->
    [quux | [bar | [foo | []]]].

tuple() ->
    {first, second, third}.

closure() ->
    fun () -> tuple() end.
