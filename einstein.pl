member(X, [X | _]).
member(X, [_ | Rest]) :- member(X, Rest).

nth1(1, [Elem | _], Elem).
nth1(N, [_ | Rest], Elem) :- N > 1, K is N-1, nth1(K, Rest, Elem).

nextto(L, R, [L, R | _]).
nextto(L, R, [_ | Rest]) :- nextto(L, R, Rest).


einstein :-
   /* 0. Всего 5 домов */
    Houses = [_,_,_,_,_],
   /* 1. Норвежец живёт в первом доме. */
    nth1(1, Houses, [norwegian,_,_,_,_]),
   /* 2. Англичанин живёт в красном доме. */
    member([englishman,_,_,_,red], Houses),
   /* 3. Зелёный дом находится слева от белого, рядом с ним. */
    nextto([_,_,_,_,green], [_,_,_,_,white], Houses),
   /* 4. Датчанин пьёт чай. */
    member([dane,_,_,tea,_], Houses),
   /* 5. Тот, кто курит Marlboro, живёт рядом с тем, кто выращивает кошек. */
    neighbors([_,_,marlboro,_,_], [_,cat,_,_,_], Houses),
   /* 6. Тот, кто живёт в жёлтом доме, курит Dunhill. */
    member([_,_,dunhill,_,yellow], Houses),
   /* 7. Немец курит Rothmans. */
    member([german,_,rothmans,_,_], Houses),
   /* 8. Тот, кто живёт в центре, пьёт молоко. */
    nth1(3, Houses, [_,_,_,milk,_]),
   /* 9. Сосед того, кто курит Marlboro, пьёт воду. */
    neighbors([_,_,marlboro,_,_], [_,_,_,water,_], Houses),
   /* 10. Тот, кто курит Pall Mall, выращивает птиц. */
    member([_,bird,pallmall,_,_], Houses),
   /* 11. Швед выращивает собак. */
    member([swede,dog,_,_,_], Houses),
   /* 12. Норвежец живёт рядом с синим домом. */
    neighbors([norwegian,_,_,_,_], [_,_,_,_,blue], Houses),
   /* 13. Тот, кто выращивает лошадей, живёт в синем доме. */
    member([_,horse,_,_,blue], Houses),
   /* 14. Тот, кто курит Winfield, пьет пиво. */
    member([_,_,winfield,beer,_], Houses),

   /* 15. В зелёном доме пьют кофе. */
    member([_,_,_,coffee,green], Houses),

        print('----------'),

   /* Внимание, вопрос: у кого рыба? */
    member([Owner,fish,_,_,_], Houses),

    /* Печатаем решение */
    print('Owner of the fish: '), print(Owner), nl,
    /*print('Full Solution: '), */print(Houses), nl.
