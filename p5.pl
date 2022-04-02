%
% CS 430 P5 (Prolog 1)
%
% Name: James Schader
% Date: 20220401
%

parent(Person,Parent) :-
    parents(Person,Parent,_);
    parents(Person,_,Parent).

step_parent(Person,StepParent) :-
    \+parent(Person, StepParent),
    spouse(StepParent, X),
    parent(Person, X).

sibling(Person, Sibling) :-
    parent(Person, X),
    parent(Sibling, X).

aunt_uncle(Person, AuntUncle) :-
    parent(Person, X),
    sibling(X, AuntUncle).

grandparent(Person, Grandparent) :-
    parent(Person, X),
    parent(X, Grandparent).

ancestor(Person, Ancestor) :-
    parent(Person, Ancestor);
    (
        parent(Person, X),
        ancestor(X, Ancestor)
    ).

relative(Person, Relative) :-
    ancestor(Person, Relative);
    ancestor(Relative, Person);
    (
        Person \= Relative,
        ancestor(Person, X),
        ancestor(Relative, X)
    ).

in_law(Person, InLaw) :-
    \+relative(Person, InLaw),
    spouse(Person, X),
    relative(InLaw, X).
