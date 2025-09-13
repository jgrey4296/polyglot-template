#!/usr/bin/env swipl
% %-- rules

getPairedPerson(X, Y) :- person(X),
                         place(Y),
                         food(Z),
                         likes(X, Z),
                         lives_in(X, Y).
