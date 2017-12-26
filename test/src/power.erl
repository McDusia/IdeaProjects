%%%-------------------------------------------------------------------
%%% @author Madzia
%%% @copyright (C) 2017, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 14. mar 2017 10:15
%%%-------------------------------------------------------------------
-module(power).
-author("Madzia").

%% API
-export([power/2,contains/2,duplicateElements/1,divisibleBy/2]).

  power(A,1) -> A;
  power(A,N) -> A * power(A,N-1).


  contains([],_) -> false;
  contains([B|_], B) -> true;
  contains([_|Tail],B) -> contains(Tail,B).

  duplicateElements([]) -> [];
  duplicateElements([H|T]) -> [H,H|duplicateElements(T)].

  divisibleBy([],_) -> [];
  divisibleBy([H|Tail],A) -> if (H rem A == 0) -> [H|divisibleBy(Tail, A)];
                               true -> divisibleBy(Tail,A)
                             end.

  %%toBinary([]) -> [];
  %%toBinary(A) -> if (A rem 2 ==0)