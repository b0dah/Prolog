% Condition
% Для введенного списка положительных чисел построить список 
% всех положительных делителей элементов списка без повторений.

isDivider(N, D):- M is mod(N, D), M = 0.



% Merge sorted ones
mergeSortedOnes([], S, S) :- !.
mergeSortedOnes(F, [], F) :- !.

mergeSortedOnes([H1 | T1], [ H2 | T2 ], [H1 | ResTail] ) :-
	H1 < H2, !, mergeSortedOnes( T1, [H2 | T2], ResTail ).
mergeSortedOnes([H1 | T1], [ H2 | T2 ], [H2 | ResTail] ) :-
	 mergeSortedOnes( [H1 | T1], T2, ResTail ).

% Collect Dividers for particular Integer 
collectDivisors(Numb, Divisors) :- collector(Numb, 1, Divisors).
collector(Numb, Current, Divisors) :- Lim is (Numb div 2), Current > Lim, ! .
collector(Numb, Current, Divisors) :- isDivider(Numb, Current), !, 
		%print(Current), Next is Current+1, collector(Numb, Next).
		append([Current], Divisors, NewDivisors),
		Next is Current+1, collector(Numb, Next, NewDivisors).
collector(Numb, Current, Divisors) :- Next is Current+1, collector(Numb, Next, Divisors).

% Collect Divisors for List of Integers
listIterator([], Response) :- !. 
listIterator([H|R], Response) :- collectDivisors(H, Divisors), mergeSortedOnes(Divisors, Response, NewResponse),
		listIterator(R, NewResponse).



% ######### ADDITIONAL STUFF ##########

start(End, List) :- cycle(1, End, [], List).
cycle(I, End, Current, List) :- I > End, !, append([], Current, List).
cycle(I, End, Current, List) :- append([I], Current, NewCurrent), I1 is I+1, cycle(I1, End, NewCurrent, List).









startCycle(End) :- forStatememt(0, End).
forStatememt(I, End) :- I >= End, !. 
forStatememt(I, End) :- I < End, isDivider(I, 2),!,
			print(I), I1 is I+1, forStatememt(I1, End). 
forStatememt(I, End) :- I1 is I+1, forStatememt(I1, End) .


% min member of the List
minElement(M, [M]):-!.
minElement(M, [H | T]) :-  minElement(M1, T), H =< M1, !, M is H.
minElement(M, [H|T]) :- minElement(M, T). 


compute(X, R):- R is X div 2.

%collectDividers(Numb, Dividers) :- collector(Numb, []/*Dividers*/, 1).
%collector(Numb, NewDividers, Current) :- 
%	isDivider(Numb, Current), !,
%	append([Current], Dividers, NewDividers).
%collector(Numb, Dividers, Current) :- Lim is Numb div 2, Current =< Lim, !, Incremented is Current+1,
%	collector(Numb, Dividers, Incremented). 