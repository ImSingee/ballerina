import ballerina/test;

@test:Config
function emptySentence() {
    test:assertFalse(Pangram.IsPangram(""));
}

@test:Config
function perfectLowerCase() {
    test:assertTrue(Pangram.IsPangram("abcdefghijklmnopqrstuvwxyz"));
}

@test:Config
function onlyLowerCase() {
    test:assertTrue(Pangram.IsPangram("the quick brown fox jumps over the lazy dog"));
}

@test:Config
function missingTheLetterX() {
    test:assertFalse(Pangram.IsPangram("a quick movement of the enemy will jeopardize five gunboats"));
}

@test:Config
function missingTheLetterH() {
    test:assertFalse(Pangram.IsPangram("five boxing wizards jump quickly at it"));
}

@test:Config
function withUnderscores() {
    test:assertTrue(Pangram.IsPangram("theQuickBrownFoxJumpsOverTheLazyDog"));
}

@test:Config
function withNumbers() {
    test:assertTrue(Pangram.IsPangram("the 1 quick brown fox jumps over the 2 lazy dogs"));
}

@test:Config
function missingLettersReplacedByNumbers() {
    test:assertFalse(Pangram.IsPangram("7h3 qu1ck brown fox jumps ov3r 7h3 lazy dog"));
}

@test:Config
function mixedCaseAndPunctuation() {
    test:assertTrue(Pangram.IsPangram("\"Five quacking Zephyrs jolt my wax bed.\""));
}

@test:Config
function aMAndAMAre_26DifferentCharactersButNotAPangram() {
    test:assertFalse(Pangram.IsPangram("abcdefghijklm ABCDEFGHIJKLM"));
}
