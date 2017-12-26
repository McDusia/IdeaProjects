%%%-------------------------------------------------------------------
%%% @author Madzia
%%% @copyright (C) 2017, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 28. mar 2017 09:54
%%%-------------------------------------------------------------------
-module(qsort).
-author("Madzia").

%% API
-export([lessThan/2, grtEqThan/2, qs/1, randomElems/3, compareSpeed/3]).

lessThan (L,A) -> [X || X <- L, X < A].

grtEqThan(L,A) -> [X || X <- L, X >= A].

qs([]) -> [];
qs([Pivot|Tail]) -> qs(lessThan(Tail,Pivot)) ++ [Pivot] ++ qs(grtEqThan(Tail,Pivot)).

randomElems(N,Min,Max) -> [ random:uniform((Max-Min)+Min) || X <- lists:seq(1,N)].

compareSpeed(List, Fun1, Fun2) ->
  {Time1, _ } = timer:tc(Fun1, [List]),
  {Time2, _ } = timer:tc(Fun2, [List]),
  io:format("~w, ~w ~n", [Time1, Time2]).

% zadanie modul Pollution !!!! rekordy/krotki/mapy, co się chce