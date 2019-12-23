%1. Смешанный граф представлен списком ребер, вводится с клавиатуры. 

%	Реализованы пункты добавить вершину и добавить ребра. 
	
%	Вывести в отдельный файл все возможные способы пометить данный граф (задать имена вершинам).
	
	:- dynamic vertex/1.
	:- dynamic edge/2.
	
	addVertex :- write('•••••••••••• Добавляем вершину ••••••••••••'), nl,nl,
		write('Вершина: '), read(Vertex),	
		Vertex>0, Vertex<10,
		( vertex(Vertex), write('Дубликат!!');
		assertz(vertex(Vertex)), write('Добавлено!')
		),nl.
	
	addEdge :- write('%%%%%%%%%%%%% Добавляем ребро %%%%%%%%%%%%%'), nl,nl,
		write('Начало: '), read(BegVertex),  vertex(BegVertex),
		write('Конец: '), read(EndVertex),  vertex(BegVertex),
		
		( edge(BegVertex,EndVertex), write('Дубликат!!');
		assertz(edge(BegVertex,EndVertex)), write('Добавлено!')), nl.

	edges(EdgeList) :- findall(A - B, edge(A,B), EdgeList).
%	generateNeighboursList(Neighbours) :-
%	neighbours(Res) :- bagof( ,edge())


