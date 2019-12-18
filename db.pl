:- dynamic manager/2.

manager(1, manager1).
manager(3, manager3).

:- dynamic customer/2.

customer(100, vanya).
customer(18, vova).

:- dynamic order/3.

order(order12, 18, 1).
order(order2, 18, 3).
order(order100, 100, 1).

