import ballerina/test;

@test:Config
function black() {
    test:assertEquals(0, ResistorColor.ColorCode("black"));
}

@test:Config
function white() {
    test:assertEquals(9, ResistorColor.ColorCode("white"));
}

@test:Config
function orange() {
    test:assertEquals(3, ResistorColor.ColorCode("orange"));
}

@test:Config
function colors() {
    test:assertEquals([ "black", "brown", "red", "orange", "yellow", "green", "blue", "violet", "grey", "white" ], ResistorColor.Colors());
}
