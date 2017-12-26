%%%-------------------------------------------------------------------
%%% @author Madzia
%%% @copyright (C) 2017, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 25. mar 2017 21:40
%%%-------------------------------------------------------------------
-module(myFunctions).
-author("Madzia").

%% API
-export([factorial/1, power/2, contains/2, duplicateElements/1, divisibleBy/2,  toBinary/1, onp/1, test/1, sqrt/1, isDivided/1, funkcja/1, map/2]).


factorial(1) -> 1;
factorial(A) -> A * factorial(A-1).

power(A,1) -> A;
power(A,N) -> A * power (A,N-1).

contains([],_) -> false;
contains([A|_],A) -> true;
contains([_|Tail],A) -> contains(Tail,A).

duplicateElements([]) -> [];
duplicateElements([H|Tail]) -> [H,H| duplicateElements(Tail)].

divisibleBy([],_) -> [];
divisibleBy([H|Tail],A) when (H rem A == 0) -> [H|divisibleBy(Tail,A)];
divisibleBy([_|Tail],A) -> divisibleBy(Tail,A).

toBinary(0) -> [0];
toBinary(1) -> [1];
toBinary(N) when (N rem 2 == 0) -> toBinary(N div 2)++[0];
toBinary(N) -> toBinary(N div 2)++[1].

test(A)-> list_to_integer(A).

onp(A) -> Parsed = string:tokens(A," "),
  onpc(Parsed,[]).


onpc([],[R]) -> R;
onpc([A|List],[L1,L2|L]) when (A=="+") -> onpc(List,[(L1+L2)|L]);
onpc([A|List],[L1,L2|L]) when (A=="-") -> onpc(List,[(L2-L1)|L]);
onpc([A|List],[L1,L2|L]) when (A=="*") -> onpc(List,[(L1*L2)|L]);
onpc([A|List],[L1,L2|L]) when (A=="/") -> onpc(List,[(L2 div L1)|L]);
onpc([A|List],[]) -> onpc(List,[list_to_integer(A)]); %now it must be a number
onpc([A|List],[L|Rest]) -> onpc(List,[list_to_integer(A)]++[L|Rest]).

sqrt(A) -> sqrtc(A,0).
sqrtc(A,R) when ((R*R)== A) -> R;
sqrtc(A,R) when ((R*R)<A) -> sqrtc(A,R+1);
sqrtc(_,R) -> R - 1.

isDivided(A) when ((A rem 3 == 0) and (A rem 7 == 0)) -> true;
isDivided(_) -> false.


funkcja(A) when (A rem ( A div 2 )==0) -> true;
funkcja(_) -> false.


map([],_) -> [];
map([H|Tail],F) -> [F(H)|map(Tail,F)].

