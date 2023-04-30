import ballerina/test;

@test:Config
function emptyString() {
    test:assertTrue(isIsogram(""));
}

@test:Config
function isogramWithOnlyLowerCaseCharacters() {
    test:assertTrue(isIsogram("isogram"));
}

@test:Config
function wordWithOneDuplicatedCharacter() {
    test:assertFalse(isIsogram("eleven"));
}

@test:Config
function wordWithOneDuplicatedCharacterFromTheEndOfTheAlphabet() {
    test:assertFalse(isIsogram("zzyzx"));
}

@test:Config
function longestReportedEnglishIsogram() {
    test:assertTrue(isIsogram("subdermatoglyphic"));
}

@test:Config
function wordWithDuplicatedCharacterInMixedCase() {
    test:assertFalse(isIsogram("Alphabet"));
}

@test:Config
function wordWithDuplicatedCharacterInMixedCaseLowercaseFirst() {
    test:assertFalse(isIsogram("alphAbet"));
}

@test:Config
function hypotheticalIsogrammicWordWithHyphen() {
    test:assertTrue(isIsogram("thumbscrew-japingly"));
}

@test:Config
function hypotheticalWordWithDuplicatedCharacterFollowingHyphen() {
    test:assertFalse(isIsogram("thumbscrew-jappingly"));
}

@test:Config
function isogramWithDuplicatedHyphen() {
    test:assertTrue(isIsogram("six-year-old"));
}

@test:Config
function madeUpNameThatIsAnIsogram() {
    test:assertTrue(isIsogram("Emily Jung Schwartzkopf"));
}

@test:Config
function duplicatedCharacterInTheMiddle() {
    test:assertFalse(isIsogram("accentor"));
}

@test:Config
function sameFirstAndLastCharacters() {
    test:assertFalse(isIsogram("angola"));
}

@test:Config
function wordWithDuplicatedCharacterAndWithTwoHyphens() {
    test:assertFalse(isIsogram("up-to-date"));
}
