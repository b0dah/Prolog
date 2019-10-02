% is member?
isMember(X, [X|_]).
isMember(X, [_|R]):- isMember(X, R).

% find the el with naumber
find(1, [X|Y], X) :-!.
find(I, [X | Y], Z) :- I1 is I-1, find(I1, Y, Z).

% X is to the left from Y
%isLeft(X, Y, [X, Y | _]):- !.
%isLeft(X, Y, [Z|T]):- X\=Z, !, isLeft(X,Y,T).
%isLeft(X, Y, [Z, S| T]):- Y\=S, isLeft(X, Y, [S|T]). 

%isLeft(X, Y, L):- append(_, [X, Y | _], L).

toTheLeft(L, R, [L, R | _]).
toTheLeft(L, R, [_| Rest]) :- toTheLeft(L, R, Rest).

near(X, Y, T):- toTheLeft(X, Y, T).
near(X, Y, T):- toTheLeft(Y, X, T).

% Задача Эйнштейна: национальность, напиток,сигареты, животные, цвет.
einstein(Houses) :- 

Houses = [_, _, _, _, _],

% норвежец живет в первом доме
find(1, Houses, [north, _, _, _, _]),

% жилец мз среднего дома ипьют молоко
find(3, Houses, [_, milk, _, _, _]),

% курильщик malboro живет по соседству с человеком, который пьет воду
near([_, water, _,  _, _ ], [_, _,  malboro, _, _ ], Houses),

%норвежец живет около голубого дома
near([north, _, _, _, _], [_, _, _, _, blue], Houses),

% Человек, который держит лошадь, живет рядом с тем, котрый курит danhell
near([_, _,  _, horse, _ ], [_, _,  danhell, _, _ ], Houses),

% Курильщик malboro живет около того, кто держит кошку
%isMember([_, _, malboro, _, _ ], [_, _,  _, horse, _ ]),
near([_, _, malboro, _, _ ], [_, _,  _, horse, _ ], Houses),

 % зеденый дом стоит слева от белого
toTheLeft([_, _, _, _, green], [_, _, _, _, white], Houses),
%англичанин в красном доме
isMember([eng, _, _, _, red], Houses),
% Швед держит собаку
isMember([eng, _, _, dog, _], Houses),
% Даьтчанин пьет чай
isMember(dat, [_, tea, _, _, _]),

% жилец зеденого дома пьет кофе
isMember([_, _, _, _, green], [_, coffee, _,_,_]),

% Человек, который курит pall mall, держит птицу
isMember([_,_,pallmall,_], [_,_,_,bird,_]),

% Человек из желтого дома курит danhell
isMember([_, _, _, _, yellow], [_, _, danhell, _, _ ]),

% Курильщик windfield пьет пиво
isMember([_,_, windfield, _, _], [_, beer, _ ,_, _]),

% немец курит TroathMans
isMember([deu,_,_,_,_], [_, _, troathmans, _ ,_]),

isMember([Owner, _,_, fish, _], Houses), 
print(Owner), nl.

