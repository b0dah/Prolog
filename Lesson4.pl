% bubble sort
		%swap([F,S | R], Res):- Res is [S,F | R].
		%swap(F,S, Temp ):- Temp is F, S is Temp, F is S.

swap([F,S | R], [S,F | R]):- F>S, !.
swap([H|R], [H | R1]):- swap(R, R1).

bSort(L, Res):- 
	swap(L, Swaped), !, 
	bSort(Swaped, Res).  %bSort([S|R], Swaped), F>S, !, swap([F,S | R], Swaped).
bSort(L, L):-!.

% Почему аспирантура того не стоит

% Hoare's one (qsort)
  % 1st implement
cAppend([], X, X):- !.
cAppend([X1|Y1], Z, [X1|Y2]) :- cAppend(Y1, Z, Y2).

partition([X|Xs],Y,[X|Ls],Rs) :-
  X <= Y, partition(Xs,Y,Ls,Rs).
partition([X|Xs],Y,Ls,[X|Rs]) :-
  X > Y, partition(Xs,Y,Ls,Rs).
partition([],Y,[],[]).

quicksort([X|Xs],Ys) :-
  partition(Xs,X,Left,Right),
  quicksort(Left,Ls),
  quicksort(Right,Rs),
  append(Ls,[X|Rs],Ys).
quicksort([],[]).

  % 2nd implement
split([],[],[]):-!.
split([H],[H|_],_):-!.
split([H1,H2|T],[H2|T1],BList):-
    H1>=H2,!,
    split([H1|T],T1,BList).
split([H1,H2|T],MList,[H2|T1]):-
    split([H1|T],MList,T1).

qs([],[]):-!.
qs([X],[X]):-!.
qs(L,L1):-
    split(L,ML,BL),
    qs(ML,ML1),
    qs(BL,BL1),
    append(ML1,BL1,L1).

