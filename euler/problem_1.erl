-module(problem_1).

-compile([export_all]).


problem_1_rec() ->
    problem_1_rec(999).

problem_1_rec(0) ->
    0;
problem_1_rec(N) when N rem 3 =:= 0 orelse N rem 5 =:= 0 ->
    N + problem_1_rec(N-1);
problem_1_rec(N) ->
    problem_1_rec(N-1).



problem_1_filter() ->
    lists:sum(
      lists:filter(fun (N) ->
                           N rem 3 =:= 0 orelse N rem 5 =:= 0
                   end, seq(1, 999))).


problem_1_lc() ->
    lists:sum([N || N <- lists:seq(1, 999), N rem 3 =:= 0 orelse N rem 5 =:= 0]).


problem_1_tl() ->
    problem_1_tl(lists:seq(1, 999), 0).

problem_1_tl([], Acc) ->
    Acc;
problem_1_tl([N | Rest], Acc) ->
    case N rem 3 =:= 0 orelse N rem 5 =:= 0 of
        true ->
            problem_1_tl(Rest, Acc + N);
        false ->
            problem_1_tl(Rest, Acc)
    end.


seq(End, End) ->
    [End];
seq(Start, End) ->
    [Start | seq(Start+1, End)].


seq_tl(Start, End) ->
    seq_tl(Start, End+1, []).

seq_tl(End, End, Acc) ->
    lists:reverse(Acc);
seq_tl(Start, End, Acc) ->
    seq_tl(Start+1, End, [Start | Acc]).
