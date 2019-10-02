% is member?
isMember(X, [X|_]).
isMember(X, [_|R]):- isMember(X, R).

% find the el with number
%find(1, [X|_], X) :- !.
%find(I, [_| Rest], El) :- I1 is I-1, find(I1, Rest, El).
find(1, [Elem | _], Elem).
find(N, [_ | Rest], Elem) :- N > 1, K is N-1, find(K, Rest, Elem).

% X is to the left from Y
%isLeft(X, Y, L):- append(_, [X, Y | _], L).
toTheLeft(L, R, [L, R | _]).
toTheLeft(L, R, [_| Rest]) :- toTheLeft(L, R, Rest).

near(X, Y, T):- toTheLeft(X, Y, T).
near(X, Y, T):- toTheLeft(Y, X, T).

% Задача Эйнштейна: национальность, напиток,сигареты, животные, цвет.
einstein :- 

Houses = [_, _, _, _, _],

%  1 норвежец живет в первом доме
find(1, Houses, [norwegian, _, _, _, _]),

% 2 англичанин в красном доме
isMember([englishman, _, _, _, red], Houses),

% 3 зеденый дом стоит слева от белого
toTheLeft([_, _, _, _, green], [_, _, _, _, white], Houses),

% 4 Даьтчанин пьет чай
isMember([dane, tea, _, _, _], Houses),

% 5 Курильщик malboro живет около того, кто держит кошку
near([_, _, malboro, _, _ ], [_, _,  _, cat, _ ], Houses),

% 6 Человек из желтого дома курит dunhill
isMember([_, _, dunhill, _, yellow], Houses),

% немец курит TroathMans
isMember([german,_,troatmans,_,_], Houses),

% жилец мз среднего дома ипьют молоко
find(3, Houses, [_, milk, _, _, _]),

% курильщик malboro живет по соседству с человеком, который пьет воду
near([_, water, _,  _, _ ], [_, _,  malboro, _, _ ], Houses),

% Человек, который курит pall mall, держит птицу
isMember([_,_,pallmall,bird,_], Houses),

% Швед держит собаку
isMember([swede, _, _, dog, _], Houses),

%норвежец живет около голубого дома
near([norwegian, _, _, _, _], [_, _, _, _, blue], Houses),



% 13 Человек, который держит лошадь, живет рядом с тем, котрый курит dunhill
%near([_, _,  _, horse, _ ], [_, _,  danhell, _, _ ], Houses),
isMember([_, _, _, horse, blue], Houses),



% Курильщик windfield пьет пиво
isMember([_, beer, windfield, _, _], Houses),

% 15 жилец зеденого дома пьет кофе
isMember([_, coffee, _, _, green], Houses),
% from wikipedia: isMember([_, coffee, _, _, green], Houses),

isMember([Owner, _,_, fish, _], Houses), 
print(Owner), nl.

