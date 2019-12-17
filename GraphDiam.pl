%edge(1,2).
%edge(2, 3).
%edge(3,5).
%edge(5,7).
%edge(5,6).
%edge(2,4).
%edge(4,6).
%edge(4,5).

edge(1,2).
edge(2,3).
edge(2,4).
edge(3,5).
edge(4,5).
edge(4,6).
edge(5,6).
edge(5,7).

diam(N) :- findall(V, (edge(V,_);edge(_, V)),T),
	findall(P, (member(A, T), member(B,T), A\=B, findMinPath(A,B,P)), L),
	maxPath(L, N).
	
% список всех путей, из них самый короткий
findMinPath(A,B,P) :- findall(X, findPath(A,B,X),L), minPath(L,P), !.

% находит путь из А в B
findPath(A,B,P) :- findPath(A,B,[A],P).
findPath(A,A,P,P).
findPath(A,B,T,P) :- (edge(A,Z); edge(Z,A)), not(member(Z,T)), findPath(Z,B,[Z|T], P).

% minPath - аргумент - список путей(список списков), ответ - самый длинный из подсписков
minPath([A], A):-!.
minPath([H|T], P) :- minPath(T,P1),!,length(H,N), length(P1, M), (N<M, P=H; P=P1).

maxPath([A], A):-!.
maxPath([H|T], P) :- maxPath(T,P1),!,length(H,N), length(P1, M), (N>M, P=H; P=P1).


