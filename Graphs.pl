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
	%search(X, Y, [X, Y]) :- p(X, Y, _); p(Y, X, _), !.
	%search(X, Y, [X|T]) :- (p(X, Z, _); p(Z, X, _)), search(Z, Y, T), not(member(X, T)), !.
	%
	%% поиск ВСЕХ путей между двумя вершинами графа
	%search(X, Y, [X, Y]) :- p(X, Y, _); p(Y, X, _).
	%search(X, Y, [X|T]) :- (p(X, Z, _); p(Z, X, _)), search(Z, Y, T), !.

% task: найти вершину графа с максимальной степенью
%max_deg()

%новый findall
%f([X|L], MaxX, MaxDegree) :- f(... B1), f(... B2), 
%	append(B1, B2), Len is length(B),  
	
	
%======== next class ===========
edge(1,2).
edge(1,3).
edge(1,4).
edge(2,4).
edge(3,4).
edge(4,5).
edge(3,5).
edge(5,6).

%only one path
search(X, Y, [X, Y]) :- edge(X, Y); edge(Y, X), !.
search(X, Y, [X|T]) :- (edge(X,Z); edge(Z, X)), search(Z, Y, T), not(member(X, T)), !.
search(X, Y, T) :- ( edge(X, Z); edge(Z, X) ), search(Z,Y,T).

%all the pathes
path(X,Y,T) :- path(X,Y,[], T).
path(X,Y, Seen, [X,Y]):- \+ memberchk(X, Seen), (edge(X,Y); edge(Y,X)).

path(X,Z,Seen, [X|T]) :- \+ memberchk(X, Seen), 
			(edge(X,Y);edge(Y,X)),
			path(Y,Z, [X|Seen], T), \+ memberchk(X,T).
			
%longest_path 
	%путь из Х
	%.... детей Х
	%одного из детей Х

path_first(Start, Answer) :- path_start([Start], Answer), !.
path_start([X|T], Y) :- children(X,C), path_start(T1, Y).


