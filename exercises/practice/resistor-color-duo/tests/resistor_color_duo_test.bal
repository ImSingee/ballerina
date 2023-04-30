import ballerina/test;

@test:Config
function brownAndBlack() {
    test:assertEquals(10, ResistorColorDuo.Value([ "brown", "black" ]));
}

@test:Config
function blueAndGrey() {
    test:assertEquals(68, ResistorColorDuo.Value([ "blue", "grey" ]));
}

@test:Config
function yellowAndViolet() {
    test:assertEquals(47, ResistorColorDuo.Value([ "yellow", "violet" ]));
}

@test:Config
function whiteAndRed() {
    test:assertEquals(92, ResistorColorDuo.Value([ "white", "red" ]));
}

@test:Config
function orangeAndOrange() {
    test:assertEquals(33, ResistorColorDuo.Value([ "orange", "orange" ]));
}

@test:Config
function ignoreAdditionalColors() {
    test:assertEquals(51, ResistorColorDuo.Value([ "green", "brown", "orange" ]));
}

@test:Config
function blackAndBrownOneDigit() {
    test:assertEquals(1, ResistorColorDuo.Value([ "black", "brown" ]));
}
