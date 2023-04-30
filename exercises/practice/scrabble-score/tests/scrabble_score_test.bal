import ballerina/test;

@test:Config
function lowercaseLetter() {
    test:assertEquals(1, ScrabbleScore.Score("a"));
}

@test:Config
function uppercaseLetter() {
    test:assertEquals(1, ScrabbleScore.Score("A"));
}

@test:Config
function valuableLetter() {
    test:assertEquals(4, ScrabbleScore.Score("f"));
}

@test:Config
function shortWord() {
    test:assertEquals(2, ScrabbleScore.Score("at"));
}

@test:Config
function shortValuableWord() {
    test:assertEquals(12, ScrabbleScore.Score("zoo"));
}

@test:Config
function mediumWord() {
    test:assertEquals(6, ScrabbleScore.Score("street"));
}

@test:Config
function mediumValuableWord() {
    test:assertEquals(22, ScrabbleScore.Score("quirky"));
}

@test:Config
function longMixedCaseWord() {
    test:assertEquals(41, ScrabbleScore.Score("OxyphenButazone"));
}

@test:Config
function englishLikeWord() {
    test:assertEquals(8, ScrabbleScore.Score("pinata"));
}

@test:Config
function emptyInput() {
    test:assertEquals(0, ScrabbleScore.Score(""));
}

@test:Config
function entireAlphabetAvailable() {
    test:assertEquals(87, ScrabbleScore.Score("abcdefghijklmnopqrstuvwxyz"));
}
