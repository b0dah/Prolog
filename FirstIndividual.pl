% Condition
% Для введенного списка положительных чисел построить список 
% всех положительных делителей элементов списка без повторений.

isDivider(N, D):- M is mod(N, D), M = 0.


%collectDividers(Numb, Dividers) :- collector(Numb, []/*Dividers*/, 1).
%collector(Numb, NewDividers, Current) :- 
%	isDivider(Numb, Current), !,
%	append([Current], Dividers, NewDividers).
%collector(Numb, Dividers, Current) :- Lim is Numb div 2, Current =< Lim, !, Incremented is Current+1,
%	collector(Numb, Dividers, Incremented). 





collectDividers(Numb) :- collector(Numb, 1).
collector(Numb, Current) :- Lim is (Numb div 2), Current > Lim, ! .
collector(Numb, Current) :- isDivider(Numb, Current), !, 
		print(Current), Next is Current+1, collector(Numb, Next).
collector(Numb, Current) :- Next is Current+1, collector(Numb, Next).





% ######### ADDITIONAL STUFF ##########

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