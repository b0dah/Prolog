% Факториал
/*fact(1, 1).
fact(X, Y):- X1 is X-1,fact(X1, Y1),Y is Y1*X.


facti(X,Y):- factn(X,Y,1,1).
factn(X,Y,I,P):- I=<X, !, P1 is P*I, I1 is I+1, factn(X, Y, I1, P1).
factn(_, P, _, P). */

% после точки отсечения (!) пррграмма ниже не идет

facti(X,Y):- factn(X,Y,1,1). % декларативно
factn(X, P, X, P) :- !.
factn(X, Y, I, P) :- I1 is I+1, P1 is P * I1, factn(X,Y,I1, P1).


% Фибоначчи
/*fib(1,1):-!.	 % в лоб
fib(2,1):-!.
fib(X, Y): X1 is X-1, fib(X1, Y1), X2 is X-2, fib(X2, Y2), Y is Y1 + Y2.*/


fibi(X, Y):- fibn(X, Y, 1/*номер текущий*/,0/*i-й фиб*/,1/*i-1 фиб */).   %декларативно
fibn(X,P,X,_,P) :-!.
fibn(X,Y, I, T, P):- P1 is T+P, I1 is I+1, fibn(X,Y, I1, P, P1).

% Алгоритм Евклида
gcd(A, 0, A):-!.
gcd(0, A, A):-!. 
gcd(A, B, C) :- B =< A, !, X is A-B, gcd(B, X, C).
gcd(A, B, C) :- X is B-A, gcd(A, X, C).

% HMWRK
% Min(), Max().
% C из N по M
