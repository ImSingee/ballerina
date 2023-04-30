import ballerina/test;

@test:Config
function emptyLists() {
    test:assertEquals(SublistType.Equal, Sublist.Classify(new List<int>(), new List<int>()));
}

@test:Config
function emptyListWithinNonEmptyList() {
    test:assertEquals(SublistType.Sublist, Sublist.Classify(new List<int>(), [ 1, 2, 3 ]));
}

@test:Config
function nonEmptyListContainsEmptyList() {
    test:assertEquals(SublistType.Superlist, Sublist.Classify([ 1, 2, 3 ], new List<int>()));
}

@test:Config
function listEqualsItself() {
    test:assertEquals(SublistType.Equal, Sublist.Classify([ 1, 2, 3 ], [ 1, 2, 3 ]));
}

@test:Config
function differentLists() {
    test:assertEquals(SublistType.Unequal, Sublist.Classify([ 1, 2, 3 ], [ 2, 3, 4 ]));
}

@test:Config
function falseStart() {
    test:assertEquals(SublistType.Sublist, Sublist.Classify([ 1, 2, 5 ], [ 0, 1, 2, 3, 1, 2, 5, 6 ]));
}

@test:Config
function consecutive() {
    test:assertEquals(SublistType.Sublist, Sublist.Classify([ 1, 1, 2 ], [ 0, 1, 1, 1, 2, 1, 2 ]));
}

@test:Config
function sublistAtStart() {
    test:assertEquals(SublistType.Sublist, Sublist.Classify([ 0, 1, 2 ], [ 0, 1, 2, 3, 4, 5 ]));
}

@test:Config
function sublistInMiddle() {
    test:assertEquals(SublistType.Sublist, Sublist.Classify([ 2, 3, 4 ], [ 0, 1, 2, 3, 4, 5 ]));
}

@test:Config
function sublistAtEnd() {
    test:assertEquals(SublistType.Sublist, Sublist.Classify([ 3, 4, 5 ], [ 0, 1, 2, 3, 4, 5 ]));
}

@test:Config
function atStartOfSuperlist() {
    test:assertEquals(SublistType.Superlist, Sublist.Classify([ 0, 1, 2, 3, 4, 5 ], [ 0, 1, 2 ]));
}

@test:Config
function inMiddleOfSuperlist() {
    test:assertEquals(SublistType.Superlist, Sublist.Classify([ 0, 1, 2, 3, 4, 5 ], [ 2, 3 ]));
}

@test:Config
function atEndOfSuperlist() {
    test:assertEquals(SublistType.Superlist, Sublist.Classify([ 0, 1, 2, 3, 4, 5 ], [ 3, 4, 5 ]));
}

@test:Config
function firstListMissingElementFromSecondList() {
    test:assertEquals(SublistType.Unequal, Sublist.Classify([ 1, 3 ], [ 1, 2, 3 ]));
}

@test:Config
function secondListMissingElementFromFirstList() {
    test:assertEquals(SublistType.Unequal, Sublist.Classify([ 1, 2, 3 ], [ 1, 3 ]));
}

@test:Config
function firstListMissingAdditionalDigitsFromSecondList() {
    test:assertEquals(SublistType.Unequal, Sublist.Classify([ 1, 2 ], [ 1, 22 ]));
}

@test:Config
function orderMattersToAList() {
    test:assertEquals(SublistType.Unequal, Sublist.Classify([ 1, 2, 3 ], [ 3, 2, 1 ]));
}

@test:Config
function sameDigitsButDifferentNumbers() {
    test:assertEquals(SublistType.Unequal, Sublist.Classify([ 1, 0, 1 ], [ 10, 1 ]));
}
