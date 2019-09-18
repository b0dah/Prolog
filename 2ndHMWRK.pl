%fact
fact(1, 1).
fact(X, Y):- X1 is X-1,fact(X1, Y1),Y is Y1*X.

%c n k

combination(N, K, Res) :- fact(N, Num), fact(K, Den_first), fact(N-K, Den_second), Res is Num / (Den_first * Den_second). 

