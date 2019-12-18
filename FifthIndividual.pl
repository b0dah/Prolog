
%Индивидуальное задание № 5. База данных
%
%Составить базу данных на произвольную выбранную тему. Таблицы хранятся в виде фактов в отдельном файле. 3 таблицы, две независимые, одна зависимая, связь 1 ко многим. Должна быть реализована возможность просмотра каждой таблицы, добавления, изменения и удаления выбранных записей. При отображении зависимой таблицы отображать не ключи, а записи в соответствующих полях. Должно быть реализовано три запроса, вывод на экран и в файл. 2 запроса простых по одной таблице и один с применением всех трех таблиц.

%retrieve
launch :- consult( '/Users/bodah/dev/Prolog/db.pl'),
% erase
retractall(order/3), retractall(customer/2), retractall(manager/2), 
menu.

menu:- repeat,
	nl,write("==== Orders DataBase ===="),nl,nl,
	write(' Нажми '), nl,
	write('O - Таблица заказов'),nl,
	write('C - Таблица клиентов'),nl,
	write('M - Таблица менеджеров'),nl,
	write('Q -  Выход'),nl,

	read(Key),
	execute(Key).
	
execute(o) :- ordersMenu.
execute(c) :- customersMenu.
execute(m) :- managersMenu.
execute(q) :- halt.


ordersMenu:-repeat,
nl,write(' ^^ ^^ ^^ ^^ ^^ ^^ Данные о заказах ^^ ^^ ^^ ^^ ^^ ^^ '),nl,nl,
	write('v - Посмотреть Заказы'),nl,
	write('d - Добавить данные в таблицу'),nl,
	write('r - Удалить данные из таблицы'),nl,
	write('s - Сохранить базу в файл'),nl,nl,
	write('b - назад в меню'), nl,
	read(K),
	openOrders(K).
	
customersMenu:-repeat,
nl,write(' ^^ ^^ ^^ ^^ ^^ ^^ Данные о клиентах ^^ ^^ ^^ ^^ ^^ ^^ '),nl,nl,
	write('v - Посмотреть Клиентов'),nl,
	write('d - Добавить данные в таблицу'),nl,
	write('r - Удалить данные из таблицы'),nl,
	write('s - Сохранить базу в файл'),nl,nl,
	write('b - назад в меню'), nl,
	read(K),
	openCustomers(K).
	
managersMenu:-repeat,
nl,write(' ^^ ^^ ^^ ^^ ^^ ^^ Данные о менеджерах ^^ ^^ ^^ ^^ ^^ ^^ '),nl,nl,
	write('v - Посмотреть менеджеров'),nl,
	write('d - Добавить данные в таблицу'),nl,
	write('r - Удалить данные из таблицы'),nl,
	write('s - Сохранить базу в файл'),nl,nl,
	write('b - назад в меню'), nl,
	read(K),
	openManagers(K).
	
% orders table actions
openOrders(v) :- viewOrders.
openOrders(d) :- addOrder.
openOrders(r) :- deleteOrder.
openOrders(s) :- saveDataBase.
openOrders(b) :- menu.


% customers table actions
openCustomers(v) :- viewCustomers.
openCustomers(d) :- addCustomer.
openCustomers(r) :- deleteCustomer.
openCustomers(s) :- saveDataBase.
openCustomers(b) :- menu.


% managers table actions
openManagers(v) :- viewManagers.
openManagers(d) :- addManager.
openManagers(r) :- deleteManager.
openManagers(s) :- saveDataBase.
openManagers(b) :- menu.


%VIEW
viewOrders:- write('++++++++ Таблица заказов ++++++++'),nl,nl,
	customer(CustId,CustName), manager(ManagId, ManagName), order(Desc,CustId,ManagId),
	write('Описание: '), write(Desc), nl,
	write('Клиент: '), write(CustName), nl,
	write('Менеджер: '), write(ManagName), nl,

	write('...........................'),nl, fail.
	
	
viewCustomers:- write('++++++++ Таблица клиентов ++++++++'),nl,nl,
	customer(_,X),
	write('Имя: '), write(X), nl,
	write('...........................'),nl,fail.
		
viewManagers:- write('++++++++ Таблица менеджеров ++++++++'),nl,nl,
	manager(_,X),
	write('Имя: '), write(X), nl,
	write('...........................'),nl,fail.
	
%ADD
%	customer
addCustomer:- write('++++++++ Добавить клиента ++++++++'), nl,nl,
	write('Введите имя: '),
	read(Name),
	write('Введите id '), read(ID),
	
	( customer(ID,_), write('ID не уникален'); 
	assertz(customer(ID,Name)) ), 
	customersMenu.
	
%isCustomerIdUnique(ID, NewID) :- not(customer(ID,_)), NewID is 0; NewID is 1; NewID is 2, NewID is 3.

%	%manager
addManager:- write('++++++++ Добавить менеджера ++++++++'), nl,nl,
	write('Введите имя: '),
	read(Name),
	write('Введите id '), read(ID),
	
	( manager(ID,_), write('ID не уникален');
	assertz(manager(ID,Name)) ),
	managersMenu.


	% order
addOrder:- write('++++++++ Добавить заказ ++++++++'), nl,nl,
	write('Введи описание: '),
	read(Desc),
	write('Введите имя клиента'), read(ClientName),
%	check
	(not(customer(_,ClientName)), write('Что-то пошло не так, такого клиента не существует!');
	write('Введите имя менеджера'), read(ManagerName),
	(not(manager(_, ManagerName)), write('Что-то пошло не так, такого клиента/менеджера не существует!');
%	add
	customer(CID,ClientName), manager(MID,ManagerName), assertz(order(Desc, CID, MID)) )), ordersMenu.
	
%??checkTies(ClientName, ManagerName, NewID) :-  client(),!, NewID is 0; NewID is 1;  NewID is 2;


%REMOVE •
%	customers
deleteCustomer:- write('++++++++ Удалить клиента ++++++++'),nl,nl,
	write('Введи имя клиента: '),
	read(Name),
	retract(customer(ID,Name)), % deleting customer
	retract(order(_,ID,_)), % also deleting all th his orders
	write('Клиент удален!'),nl,nl,
	tell('/Users/bodah/dev/Prolog/db.pl'), 
	listing(manager), listing(customer), listing(order),
	told, write('Таблица обновлена успешно!'),nl, customersMenu.
	
% managers
deleteManager:- write('++++++++ Удалить менеджера ++++++++'),nl,nl,
	write('Введи имя менеджера: '),
	read(Name),
	retract(manager(ManagerID,Name)), % deleting manager
	retract(order(_,_,ManagerID)), % also deleting all th his orders
	write('Клиент удален!'),nl,nl,
	tell('/Users/bodah/dev/Prolog/db.pl'), 
	listing(manager), listing(customer), listing(order),
	told, write('Таблица обновлена успешно!'),nl, managersMenu.
	
% orders
deleteOrder:- write('++++++++ Удалить заказ ++++++++'),nl,nl,
	write('Найти заказ по описанию: '),
	read(Desc),
	retract(order(Desc,_,_)), % deleting the order
	write('Заказ удален успешно!'),nl,nl,
	tell('/Users/bodah/dev/Prolog/db.pl'), 
	listing(customer), listing(manager), listing(order),
	told, write('Таблица обновлена успешно!'),nl, ordersMenu.

%SAVE •
saveDataBase:- tell('/Users/bodah/dev/Prolog/db.pl'), 
	listing(manager), listing(customer), listing(order),
	told, write('Сохранено Успешно!'), nl, fail.