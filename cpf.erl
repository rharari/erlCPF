%% @author Ricardo A. Harari - ricardo.harari@gmail.com
%% @doc CPF is the brazilian federal tax id
%% @doc isValid/1 - return true when the argument is a valid CPF(string). 
-module(cpf).
-export([isValid/1]).

isValid(S) ->
	C = normalizar(lists:filter(fun(X) -> X>47 andalso X<58 end, S)),
	D = lists:sum( lists:zipwith(fun(X,Y) -> (X-48)*Y end, C, [1,2,3,4,5,6,7,8,9,0,0]) ) rem 11,
	D =:= lists:nth(10, C) - 48 andalso 
		( lists:sum(lists:zipwith(fun(X,Y) -> (X-48)*Y end, C, [0,1,2,3,4,5,6,7,8,0,0]) ) + D * 9 ) rem 11 =:= lists:nth(11, C) - 48.
		

%% Internal functions
%% ====================================================================
normalizar(S) when length(S) < 11 -> normalizar("0" ++ S);
normalizar(S) when length(S) =:= 11 -> S;
normalizar(S) when length(S) > 11 -> lists:sublist(S, 11).
