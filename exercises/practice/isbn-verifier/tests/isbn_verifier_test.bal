import ballerina/test;

@test:Config
function validIsbn() {
    test:assertTrue(IsbnVerifier.IsValid("3-598-21508-8"));
}

@test:Config
function invalidIsbnCheckDigit() {
    test:assertFalse(IsbnVerifier.IsValid("3-598-21508-9"));
}

@test:Config
function validIsbnWithACheckDigitOf_10() {
    test:assertTrue(IsbnVerifier.IsValid("3-598-21507-X"));
}

@test:Config
function checkDigitIsACharacterOtherThanX() {
    test:assertFalse(IsbnVerifier.IsValid("3-598-21507-A"));
}

@test:Config
function invalidCheckDigitInIsbnIsNotTreatedAsZero() {
    test:assertFalse(IsbnVerifier.IsValid("4-598-21507-B"));
}

@test:Config
function invalidCharacterInIsbnIsNotTreatedAsZero() {
    test:assertFalse(IsbnVerifier.IsValid("3-598-P1581-X"));
}

@test:Config
function xIsOnlyValidAsACheckDigit() {
    test:assertFalse(IsbnVerifier.IsValid("3-598-2X507-9"));
}

@test:Config
function validIsbnWithoutSeparatingDashes() {
    test:assertTrue(IsbnVerifier.IsValid("3598215088"));
}

@test:Config
function isbnWithoutSeparatingDashesAndXAsCheckDigit() {
    test:assertTrue(IsbnVerifier.IsValid("359821507X"));
}

@test:Config
function isbnWithoutCheckDigitAndDashes() {
    test:assertFalse(IsbnVerifier.IsValid("359821507"));
}

@test:Config
function tooLongIsbnAndNoDashes() {
    test:assertFalse(IsbnVerifier.IsValid("3598215078X"));
}

@test:Config
function tooShortIsbn() {
    test:assertFalse(IsbnVerifier.IsValid("00"));
}

@test:Config
function isbnWithoutCheckDigit() {
    test:assertFalse(IsbnVerifier.IsValid("3-598-21507"));
}

@test:Config
function checkDigitOfXShouldNotBeUsedFor_0() {
    test:assertFalse(IsbnVerifier.IsValid("3-598-21515-X"));
}

@test:Config
function emptyIsbn() {
    test:assertFalse(IsbnVerifier.IsValid(""));
}

@test:Config
function inputIs_9Characters() {
    test:assertFalse(IsbnVerifier.IsValid("134456729"));
}

@test:Config
function invalidCharactersAreNotIgnoredAfterCheckingLength() {
    test:assertFalse(IsbnVerifier.IsValid("3132P34035"));
}

@test:Config
function invalidCharactersAreNotIgnoredBeforeCheckingLength() {
    test:assertFalse(IsbnVerifier.IsValid("3598P215088"));
}

@test:Config
function inputIsTooLongButContainsAValidIsbn() {
    test:assertFalse(IsbnVerifier.IsValid("98245726788"));
}
