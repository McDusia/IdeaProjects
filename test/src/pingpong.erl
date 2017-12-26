%%%-------------------------------------------------------------------
%%% @author Madzia
%%% @copyright (C) 2017, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 11. kwi 2017 09:47
%%%-------------------------------------------------------------------
-module(pingpong).
-author("Madzia").

%% API
-export([start/0, pin_loop/0, pong_loop/0, stop/0, play/1]).


start() ->
  Pin1 = spawn(pingpong, pin_loop, [3]),
  register(ping, Pin1),
  Pin2 = spawn(pingpong, pong_loop, [3]),
  register(pong,Pin2).

pin_loop() ->
  receive
    [0] -> pingpong:pingloop();
    [N] -> ping ! [N-1], timer:sleep(3000), io:format("ping"),
      pinloop()
    after
      20000 -> stop()
  end.

pong_loop() ->
  receive
    [N] -> pong ! [N-1], timer:sleep(3000), io:format("pong"),
      pongloop();
    [0] -> pingpong:pongloop()
  after
    20000 -> stop()
  end.

stop() -> ok.
play(N) -> ping ! N.