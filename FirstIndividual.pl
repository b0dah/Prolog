% Condition
% Для введенного списка положительных чисел построить список 
% всех положительных делителей элементов списка без повторений.

isDivider(N, D):- M is mod(N, D), M = 0.

% Merge sorted ones
mergeSortedOnes([], S, S) :- !.
mergeSortedOnes(S, [], S) :- !.


mergeSortedOnes([H | T1], [ H | T2 ], [H | ResTail] ):-!,
mergeSortedOnes(T1,T2,ResTail).

mergeSortedOnes([H1 | T1], [ H2 | T2 ], [H1 | ResTail] ) :-
	H1 < H2, !, mergeSortedOnes( T1, [H2 | T2], ResTail ).	

mergeSortedOnes([H1 | T1], [ H2 | T2 ], [H2 | ResTail] ) :-
	 mergeSortedOnes( T2,[H1 | T1], ResTail ).



% Collect Dividers for particular Integer 
collectDivisors(Numb, Divisors) :- collector(Numb, 1, Divisors).
collector(Numb, Current, []) :- Lim is (Numb div 2), Current > Lim, ! .
collector(Numb, Current, [Current|T]) :- isDivider(Numb, Current), !, 
		%print(Current), Next is Current+1, collector(Numb, Next).
		%append([Current], Divisors, NewDivisors),
		Next is Current+1, collector(Numb, Next, T).
collector(Numb, Current, Divisors) :- Next is Current+1, collector(Numb, Next, Divisors).

% Collect Divisors for List of Integers
listIterator([],[]) :- !. 
listIterator([H|R], NewResponse) :- collectDivisors(H, H_Divisors), listIterator(R, R_Divisors), 
			mergeSortedOnes(H_Divisors, R_Divisors, NewResponse).













% ######### ADDITIONAL STUFF ##########
start(End, List) :- cycle(1, End, [], List).
cycle(I, End, Current, List) :- I > End, !, append([], Current, List).
cycle(I, End, Current, List) :- append([I], Current, NewCurrent), I1 is I+1, cycle(I1, End, NewCurrent, List).




startCycle(End) :- forStatememt(0, End).
forStatememt(I, End) :- I >= End, !. 
forStatememt(I, End) :- I < End, isDivider(I, 2),!,
			print(I), I1 is I+1, forStatememt(I1, End). 
forStatememt(I, End) :- I1 is I+1, forStatememt(I1, End) .


% min isMember of the List
minElement(M, [M]):-!.
minElement(M, [H | T]) :-  minElement(M1, T), H =< M1, !, M is H.
minElement(M, [H|T]) :- minElement(M, T). 


compute(First, R):- R is First div 2.

%collectDividers(Numb, Dividers) :- collector(Numb, []/*Dividers*/, 1).
%collector(Numb, NewDividers, Current) :- 
%	isDivider(Numb, Current), !,
%	append([Current], Dividers, NewDividers).
%collector(Numb, Dividers, Current) :- Lim is Numb div 2, Current =< Lim, !, Incremented is Current+1,
%	collector(Numb, Dividers, Incremented). 