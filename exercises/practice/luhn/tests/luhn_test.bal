import ballerina/test;

@test:Config
function singleDigitStringsCanNotBeValid() {
    test:assertFalse(Luhn.IsValid("1"));
}

@test:Config
function aSingleZeroIsInvalid() {
    test:assertFalse(Luhn.IsValid("0"));
}

@test:Config
function aSimpleValidSinThatRemainsValidIfReversed() {
    test:assertTrue(Luhn.IsValid("059"));
}

@test:Config
function aSimpleValidSinThatBecomesInvalidIfReversed() {
    test:assertTrue(Luhn.IsValid("59"));
}

@test:Config
function aValidCanadianSin() {
    test:assertTrue(Luhn.IsValid("055 444 285"));
}

@test:Config
function invalidCanadianSin() {
    test:assertFalse(Luhn.IsValid("055 444 286"));
}

@test:Config
function invalidCreditCard() {
    test:assertFalse(Luhn.IsValid("8273 1232 7352 0569"));
}

@test:Config
function invalidLongNumberWithAnEvenRemainder() {
    test:assertFalse(Luhn.IsValid("1 2345 6789 1234 5678 9012"));
}

@test:Config
function invalidLongNumberWithARemainderDivisibleBy_5() {
    test:assertFalse(Luhn.IsValid("1 2345 6789 1234 5678 9013"));
}

@test:Config
function validNumberWithAnEvenNumberOfDigits() {
    test:assertTrue(Luhn.IsValid("095 245 88"));
}

@test:Config
function validNumberWithAnOddNumberOfSpaces() {
    test:assertTrue(Luhn.IsValid("234 567 891 234"));
}

@test:Config
function validStringsWithANonDigitAddedAtTheEndBecomeInvalid() {
    test:assertFalse(Luhn.IsValid("059a"));
}

@test:Config
function validStringsWithPunctuationIncludedBecomeInvalid() {
    test:assertFalse(Luhn.IsValid("055-444-285"));
}

@test:Config
function validStringsWithSymbolsIncludedBecomeInvalid() {
    test:assertFalse(Luhn.IsValid("055# 444$ 285"));
}

@test:Config
function singleZeroWithSpaceIsInvalid() {
    test:assertFalse(Luhn.IsValid(" 0"));
}

@test:Config
function moreThanASingleZeroIsValid() {
    test:assertTrue(Luhn.IsValid("0000 0"));
}

@test:Config
function inputDigit_9IsCorrectlyConvertedToOutputDigit_9() {
    test:assertTrue(Luhn.IsValid("091"));
}

@test:Config
function veryLongInputIsValid() {
    test:assertTrue(Luhn.IsValid("9999999999 9999999999 9999999999 9999999999"));
}

@test:Config
function validLuhnWithAnOddNumberOfDigitsAndNonZeroFirstDigit() {
    test:assertTrue(Luhn.IsValid("109"));
}

@test:Config
function usingAsciiValueForNonDoubledNonDigitIsntAllowed() {
    test:assertFalse(Luhn.IsValid("055b 444 285"));
}

@test:Config
function usingAsciiValueForDoubledNonDigitIsntAllowed() {
    test:assertFalse(Luhn.IsValid(":9"));
}

@test:Config
function nonNumericNonSpaceCharInTheMiddleWithASumThatsDivisibleBy_10IsntAllowed() {
    test:assertFalse(Luhn.IsValid("59%59"));
}
