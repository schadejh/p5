%
% CS 430 P5 (Prolog 1)
%

% public tests

test_parent :-
    parent(tina, chuck),
    parent(tina, ethel),
    \+parent(ethel, chuck),
    \+parent(mary, edward),
    parent(tricia,tina),
    \+parent(tina,tricia),
    !.

test_step_parent :-
    step_parent(kelly,edward),
    \+step_parent(edward,kelly),
    !.

test_sibling :-
    sibling(tricia,travis),
    \+sibling(tricia,tina),
    !.

test_aunt_uncle :-
    aunt_uncle(tina,gail),
    \+aunt_uncle(tina,edward),
    !.

test_grandparent :-
    grandparent(travis,ethel),
    \+grandparent(travis,tina),
    !.

test_ancestor :-
    ancestor(tricia,ethel),
    \+ancestor(tricia,phil),
    !.

test_relative :-
    \+relative(tricia, tricia),
    relative(ethel, tricia),
    relative(tricia,ethel),
    \+relative(tricia,phil),
    !.

test_in_law :-
    in_law(tom,gail),
    \+in_law(tom,grace),
    !.

testall :-
    test_parent,
    test_step_parent,
    test_sibling,
    test_aunt_uncle,
    test_grandparent,
    test_ancestor,
    test_relative,
    test_in_law,
    !.
