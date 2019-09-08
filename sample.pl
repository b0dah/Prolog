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

has_child(X) :- parent(X, Y).

granchild(X, Z) :- parent(Y, X), parent(Z, Y).