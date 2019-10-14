sum([], 0):-!.
sum([H | T], A) :- sum(T, A1), A is A1 + H.

% seek for i-th el of the list
find(0, [X|Y], X) :-!.
find(I, [X | Y], Z) :- I1 is I-1, find(I1, Y, Z).

% isMember of the list
isMember(X, [X|_]):-!.
isMember(X, [_|Y]):- isMember(X, Y).

% min member of the List
minElement(M, [M]):-!.
minElement(M, [H | T]) :-  minElement(M1, T), H =< M1, !, M is H.
minElement(M, [H|T]) :- minElement(M, T). 
 
% HMWRK: Минимум итеративно: Минимум первых двух сравниваем со вторым, третьим и т.д.

% reverse list [1,2,3,4] -> [4,3,2,1]
reverse(X, Y) :- reverse(X, [], Y). % from x to [] all wrote
reverse([], Y, Y) :- !.
reverse([X, Y], Z, T) :- reverse(Y, [X|Z], T).

% subList
isBegin([], _):- ! .
isBegin([X | Y], [X | Z]) :- isBegin(Y, Z).

sublist(X, Y) :- isBegin(X, Y), !.
sublist(X, [Y|Z]) :- sublist(X, Z).

% delete all the els with the given value
customDelete([], _, _):- !.
customDelete([V|T], V, A):- delete(T, V, A), !.
customDelete([X | Y], T, [X | Z]) :- delete(Y, T, Z).

% Append(first, second, result)
append([], X, X):- !.
append([X1|Y1], Z, [X1|Y2]) :- append(Y1, Z, Y2).

%=========================================================================
% HMWRK: 1) Написать предикат, который истинен, если в списке нет повторяющихся эдементов
% 2) Объединить два отсортированнызх списка в один отсортированный список
% 3) Длина списка

%length of the list
length1([], 0):- !.
length1([H|T], L):- length1(T, L1), L is L1 + 1.

% iterational min
minInTheList([ F, S | Tail], M):-
	F > S, !,
	minInTheList([S | Tail], M).
minInTheList([ F, S | Tail], M) :- minInTheList( [F|Tail], M).

% Repeating Element
hasRepeat([H | Tail] ):- isMember(H, Tail), !.
hasRepeat([H | Tail]) :- hasRepeat(Tail).

% Merge sorted ones
mergeSortedOnes([], S, S) :- !.
mergeSortedOnes(F, [], F) :- !.

mergeSortedOnes([H1 | T1], [ H2 | T2 ], [H1 | ResTail] ) :-
	H1 < H2, !, mergeSortedOnes( T1, [H2 | T2], ResTail ).
mergeSortedOnes([H1 | T1], [ H2 | T2 ], [H2 | ResTail] ) :-
	 mergeSortedOnes( [H1 | T1], T2, ResTail ).
































