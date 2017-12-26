%%%-------------------------------------------------------------------
%%% @author Madzia
%%% @copyright (C) 2017, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 14. mar 2017 09:44
%%%-------------------------------------------------------------------
-module(factorial).
-author("Madzia").

%% API
-export([factorial/1]).

factorial(1) -> 1;
factorial(A) -> A * factorial(A-1).
