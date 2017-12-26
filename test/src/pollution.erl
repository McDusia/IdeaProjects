%%%-------------------------------------------------------------------
%%% @author Madzia
%%% @copyright (C) 2017, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 08. kwi 2017 19:15
%%%-------------------------------------------------------------------
-module(pollution).
-author("Madzia").

%% API
-export([ createMonitor/0, addValue/5, addStation/3, getDailyMean/3, forStation/3,
  getStationMean/3, getOneValue/4, removeValue/4, getMaximumGradientStation/2]).

-record(station, {name, coordinates, list}).
-record(measurement, { date, hour, type, value}).
%-enum(measureType, {p10,p5,temp}).

createMonitor () -> [].

addStation(Name, {X,Y}, Monitor) ->
  case ((lists:any(fun(#station{name = A}) -> A =:= Name end,Monitor))
    or (lists:any(fun(#station{coordinates = A}) -> A =:= {X,Y} end,Monitor)))of
    false -> [#station{ name = Name, coordinates ={X, Y}, list = [] } | Monitor];
    true -> io:write('There is station like this.')
  end.

addValue({X,Y}, {D,T}, Type, Value, Monitor) ->
  case (
      (lists:any(fun(#station{coordinates = A}) -> A =:= {X,Y} end,Monitor)== true)
        and (lists:any(fun(#station{coordinates = A, list = B}) -> (A =:= {X,Y} andalso
        noSuchMeasurement(D,T,Type,Value,B) == false) end,Monitor) == true)) of
    true ->
      replaceMonitor2({X,Y}, {D,T}, Type, Value, Monitor);
    false -> io:write('You can not add such measurement')
  end;
addValue(Name, {D,T}, Type, Value, Monitor) ->
  case (
      (lists:any(fun(#station{name = A}) -> A =:= Name end,Monitor)== true)
        and (lists:any(fun(#station{name = A, list = B}) -> (A =:= Name andalso
        noSuchMeasurement(D,T,Type,Value,B) == false) end,Monitor) == true)) of
    true ->
      replaceMonitor(Name, {D,T}, Type, Value, Monitor);
    false -> io:write('You can not add such measurement')
  end.
%----------------------------------------

removeValue(Name, {D,T}, Type, Monitor) -> replaceMonitor3(Name,{D,T}, Type, Monitor).

replaceMonitor3(Name, {D,T}, Type, Monitor) ->
  lists:keyreplace(Name, 2, Monitor, deleteMeasurement(getStation(Name, Monitor), {D,T}, Type)).

deleteMeasurement(#station{name = N, coordinates = C, list = L}, {D,T}, Type) ->
  #station{name = N,coordinates = C,list =
  lists:filter(fun(#measurement{date=D1,hour=T1,type = Type1}) -> ((D1=/=D) or (T1=/=T) or (Type1=/=Type)) end,L)}.


getMeasurement(#station{name = N, coordinates = C, list = L}, {D,T}, Type) ->
  lists:last(lists:filter(fun(#measurement{date=D1,hour=T1,type = Type1}) -> ((D1=:=D) and (T1=:=T) and (Type1=:=Type)) end,L)).

%-------------------------------------------------------

getOneValue(Name, Type, {D,T}, Monitor) -> getOne(getMeasurement(getStation(Name,Monitor),{D,T}, Type)).

getOne(#measurement{date=D1,hour=T1,type = Type1, value = V}) -> V.

%-------------------------------------------------------
getStationMean(Name, Type, Monitor) -> average(getList(getStation(Name, Monitor), Type)).
getList(#station{name = N, coordinates = C, list = L}, Type) ->
  lists:map(fun(#measurement{date=D1,hour=T1,type = Type1, value = V}) -> V end,
    lists:filter(fun(#measurement{type = Type1}) -> (Type1=:=Type) end,L)).

lengthOfList(L) -> lists:foldl(fun(X, Acc) -> 1 + Acc end, 0, L).
average(L) -> lists:sum(L)/lengthOfList(L).
%-------------------------------------------------------

getSomeMeas(Type, Day, Monitor) ->
  lists:filter(fun(#measurement{type = Type1, date = Date1}) -> ((Type1=:=Type) and (Date1=:=Day))end, makeAllMeasList(Monitor)).

makeAllMeasList(Monitor) ->
zipper(lists:map(fun(#station{name=N, coordinates = C, list=L}) -> L end ,Monitor)).

zipper([]) -> [];
zipper([H|Tail]) -> H++zipper(Tail).

getDailyMean(Type, Day, Monitor) -> average(getList2(getSomeMeas(Type,Day,Monitor))).

%make list of values for list of measurements records
getList2(List) ->
  lists:map(fun(#measurement{date=D1,hour=T1,type = Type1, value = V}) -> V end, List).
%------ to do -----------------------------------------------------
getMaximumGradientStation(Monitor, Type)->[].

%this function count average gradient for one specified station
forStation(Name, Monitor,Type) -> forStationCount(filterList(getAllMeasurementForStation(getStation(Name, Monitor)),Type)).

%get records with specified measurement type
filterList(List, Type) ->
  lists:filter(fun(#measurement{type = Type1}) -> (Type1=:=Type)end, List).

%receive measurements list, return average change of specified type of pollution
forStationCount(L) -> av(sorted(getList2(L)))/av(sorted(getDays(L))).

getAllMeasurementForStation(#station{name = N, coordinates = C, list = L}) -> L.

getDays(List) ->
  lists:map(fun(#measurement{date=D1,hour=T1,type = Type1, value = V}) -> D1 end, List).

sorted(L) -> lists:sort(L).

diff([]) -> io:write('Empty list');
diff([L]) -> L;
diff([A,B]) -> (B-A);
diff([A,B|Tail]) -> (B-A) + diff([B|Tail]).
%average difference between elements of sorted list
av(L) -> diff(L)/(lengthOfList(L)-1).

%-----------------------------------------------------------
getStation(Name, Monitor) -> lists:keyfind(Name, 2, Monitor).
getStation2({X,Y}, Monitor) -> lists:keyfind({X,Y}, 3, Monitor).

changeStation(#station{name = N, coordinates = C, list = L}, {D,T}, Type, Value) ->
  #station{name = N,coordinates = C,list = [#measurement{date = D, hour = T, type = Type, value = Value} | L]}.

replaceMonitor(Name, {D,T}, Type, Value, Monitor) ->
  lists:keyreplace(Name, 2, Monitor, changeStation(getStation(Name, Monitor), {D,T}, Type, Value)).
replaceMonitor2({X,Y}, {D,T}, Type, Value, Monitor) ->
  lists:keyreplace({X,Y}, 3, Monitor, changeStation(getStation2({X,Y}, Monitor), {D,T}, Type, Value)).

noSuchMeasurement(D,T,Type,Value,B) ->
(lists:any(fun(#measurement{date = C, hour = H, type = E, value = F}) ->
(C =:= D) andalso (H =:= T) andalso (E =:= Type) andalso (F =:= Value) end,B)).
