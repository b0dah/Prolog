%loves(me, nobody). 
%hurts(me, me).

%факты родительства
parent(tom, ann).
parent(tom, mike).
parent(mary, mike).
parent(mike, sue).
parent(mike, john).
parent(mike, nick).
parent(john, jane).
parent(john, jim).
parent(john, lucie).

man(tom).
man(nick).
man(mike).
man(john).
man(jim).

woman(mary).
woman(ann).
woman(sue).
woman(jane).
woman(lucie).

%married (man is the first)
married(dave, jane).
married(matt, lucie).

has_child(X) :- parent(X, Y).

granchild(X, Z) :- parent(Y, X), parent(Z, Y).
sisters(X, Y) :- parent(Z, X), parent(Z, Y), woman(X), dif(X, Y).

patriarch(X):- parent(X, _), not(parent(_, X)).

ancestor(X, Y) :- parent(X, Y).
ancestor(X, Y) :- parent(X, Z), ancestor(Z, Y).

%relatives
relatives(X, Y) :- parent(X, Y) ; parent(Y, X).
relatives(X, Y) :- ancestor(A, X), ancestor(A, Y).

%married to sisters
married_to_sisters(FM, SM) :- married(FM, FW), married(SM, SW), sisters(FW, SW), dif(FM, SM).