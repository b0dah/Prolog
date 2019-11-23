% первая вершина вторая вершина, длина ребра
p(1,2,1).
p(1, 3, 2).
p(2,4,1).
p(3,4,2).
p(4,5,3).

% console prompt trying:
%				^ = ignore
%	listing(p).
	
%	bagof(Z, p(X, Y, Z), Bag).	
%	findall(Z, p(X, Y, Z), Bag). % put all the Z-components to Bag 
	
	
	
	
%	bagof(Z, X^Y^p(x,y,z), Bag).
%	setof(Z, X^Y^p(X, Y, Z), Bag).
%	bagof(Z, (p(X, Y, Z), Z>1), Bag).
%	findall(Z, (p(X, Y, Z), Z>1), Bag).

%/////////////

find_all(X, G, Bag) :- post_it(X, G), gather([], Bag).
post_it(X, G) :- call(G), asserta(data999(X)), fail.
post_it(_, _).
gather(B, Bag) :- data999(X), retract(data999(X)), gather([X|B], Bag), !, gather(B, B).

% поиск пути мужду двумя вершинами графа
search(X, Y, [X, Y]) :- p(X, Y, _); p(Y, X, _), !.
search(X, Y, [X|T]) :- (p(X, Z, _); p(Z, X, _)), search(Z, Y, T), not(member(X, T)), !.

% поиск ВСЕХ путей между двумя вершинами графа
search(X, Y, [X, Y]) :- p(X, Y, _); p(Y, X, _).
search(X, Y, [X|T]) :- (p(X, Z, _); p(Z, X, _)), search(Z, Y, T), !.

% task: найти вершину графа с максимальной степенью
%max_deg()

%новый findall
f([X|L], MaxX, MaxDegree) :- f(... B1), f(... B2), 
	append(B1, B2), Len is length(B),  