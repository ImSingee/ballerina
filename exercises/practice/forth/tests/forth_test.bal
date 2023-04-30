import ballerina/test;

@test:Config
function parsingAndNumbersNumbersJustGetPushedOntoTheStack() {
    test:assertEquals("1 2 3 4 5", Forth.Evaluate([ "1 2 3 4 5" ]));
}

@test:Config
function parsingAndNumbersPushesNegativeNumbersOntoTheStack() {
    test:assertEquals("-1 -2 -3 -4 -5", Forth.Evaluate([ "-1 -2 -3 -4 -5" ]));
}

@test:Config
function additionCanAddTwoNumbers() {
    test:assertEquals("3", Forth.Evaluate([ "1 2 +" ]));
}

@test:Config
function additionErrorsIfThereIsNothingOnTheStack() {
    Assert.Throws<InvalidOperationException>(() => Forth.Evaluate([ "+" ]));
}

@test:Config
function additionErrorsIfThereIsOnlyOneValueOnTheStack() {
    Assert.Throws<InvalidOperationException>(() => Forth.Evaluate([ "1 +" ]));
}

@test:Config
function subtractionCanSubtractTwoNumbers() {
    test:assertEquals("-1", Forth.Evaluate([ "3 4 -" ]));
}

@test:Config
function subtractionErrorsIfThereIsNothingOnTheStack() {
    Assert.Throws<InvalidOperationException>(() => Forth.Evaluate([ "-" ]));
}

@test:Config
function subtractionErrorsIfThereIsOnlyOneValueOnTheStack() {
    Assert.Throws<InvalidOperationException>(() => Forth.Evaluate([ "1 -" ]));
}

@test:Config
function multiplicationCanMultiplyTwoNumbers() {
    test:assertEquals("8", Forth.Evaluate([ "2 4 *" ]));
}

@test:Config
function multiplicationErrorsIfThereIsNothingOnTheStack() {
    Assert.Throws<InvalidOperationException>(() => Forth.Evaluate([ "*" ]));
}

@test:Config
function multiplicationErrorsIfThereIsOnlyOneValueOnTheStack() {
    Assert.Throws<InvalidOperationException>(() => Forth.Evaluate([ "1 *" ]));
}

@test:Config
function divisionCanDivideTwoNumbers() {
    test:assertEquals("4", Forth.Evaluate([ "12 3 /" ]));
}

@test:Config
function divisionPerformsIntegerDivision() {
    test:assertEquals("2", Forth.Evaluate([ "8 3 /" ]));
}

@test:Config
function divisionErrorsIfDividingByZero() {
    Assert.Throws<DivideByZeroException>(() => Forth.Evaluate([ "4 0 /" ]));
}

@test:Config
function divisionErrorsIfThereIsNothingOnTheStack() {
    Assert.Throws<InvalidOperationException>(() => Forth.Evaluate([ "/" ]));
}

@test:Config
function divisionErrorsIfThereIsOnlyOneValueOnTheStack() {
    Assert.Throws<InvalidOperationException>(() => Forth.Evaluate([ "1 /" ]));
}

@test:Config
function combinedArithmeticAdditionAndSubtraction() {
    test:assertEquals("-1", Forth.Evaluate([ "1 2 + 4 -" ]));
}

@test:Config
function combinedArithmeticMultiplicationAndDivision() {
    test:assertEquals("2", Forth.Evaluate([ "2 4 * 3 /" ]));
}

@test:Config
function dupCopiesAValueOnTheStack() {
    test:assertEquals("1 1", Forth.Evaluate([ "1 dup" ]));
}

@test:Config
function dupCopiesTheTopValueOnTheStack() {
    test:assertEquals("1 2 2", Forth.Evaluate([ "1 2 dup" ]));
}

@test:Config
function dupErrorsIfThereIsNothingOnTheStack() {
    Assert.Throws<InvalidOperationException>(() => Forth.Evaluate([ "dup" ]));
}

@test:Config
function dropRemovesTheTopValueOnTheStackIfItIsTheOnlyOne() {
    test:assertEquals("", Forth.Evaluate([ "1 drop" ]));
}

@test:Config
function dropRemovesTheTopValueOnTheStackIfItIsNotTheOnlyOne() {
    test:assertEquals("1", Forth.Evaluate([ "1 2 drop" ]));
}

@test:Config
function dropErrorsIfThereIsNothingOnTheStack() {
    Assert.Throws<InvalidOperationException>(() => Forth.Evaluate([ "drop" ]));
}

@test:Config
function swapSwapsTheTopTwoValuesOnTheStackIfTheyAreTheOnlyOnes() {
    test:assertEquals("2 1", Forth.Evaluate([ "1 2 swap" ]));
}

@test:Config
function swapSwapsTheTopTwoValuesOnTheStackIfTheyAreNotTheOnlyOnes() {
    test:assertEquals("1 3 2", Forth.Evaluate([ "1 2 3 swap" ]));
}

@test:Config
function swapErrorsIfThereIsNothingOnTheStack() {
    Assert.Throws<InvalidOperationException>(() => Forth.Evaluate([ "swap" ]));
}

@test:Config
function swapErrorsIfThereIsOnlyOneValueOnTheStack() {
    Assert.Throws<InvalidOperationException>(() => Forth.Evaluate([ "1 swap" ]));
}

@test:Config
function overCopiesTheSecondElementIfThereAreOnlyTwo() {
    test:assertEquals("1 2 1", Forth.Evaluate([ "1 2 over" ]));
}

@test:Config
function overCopiesTheSecondElementIfThereAreMoreThanTwo() {
    test:assertEquals("1 2 3 2", Forth.Evaluate([ "1 2 3 over" ]));
}

@test:Config
function overErrorsIfThereIsNothingOnTheStack() {
    Assert.Throws<InvalidOperationException>(() => Forth.Evaluate([ "over" ]));
}

@test:Config
function overErrorsIfThereIsOnlyOneValueOnTheStack() {
    Assert.Throws<InvalidOperationException>(() => Forth.Evaluate([ "1 over" ]));
}

@test:Config
function userDefinedWordsCanConsistOfBuiltInWords() {
    test:assertEquals("1 1 1", Forth.Evaluate([ ": dup-twice dup dup ;", "1 dup-twice" ]));
}

@test:Config
function userDefinedWordsExecuteInTheRightOrder() {
    test:assertEquals("1 2 3", Forth.Evaluate([ ": countup 1 2 3 ;", "countup" ]));
}

@test:Config
function userDefinedWordsCanOverrideOtherUserDefinedWords() {
    test:assertEquals("1 1 1", Forth.Evaluate([ ": foo dup ;", ": foo dup dup ;", "1 foo" ]));
}

@test:Config
function userDefinedWordsCanOverrideBuiltInWords() {
    test:assertEquals("1 1", Forth.Evaluate([ ": swap dup ;", "1 swap" ]));
}

@test:Config
function userDefinedWordsCanOverrideBuiltInOperators() {
    test:assertEquals("12", Forth.Evaluate([ ": + * ;", "3 4 +" ]));
}

@test:Config
function userDefinedWordsCanUseDifferentWordsWithTheSameName() {
    test:assertEquals("5 6", Forth.Evaluate([ ": foo 5 ;", ": bar foo ;", ": foo 6 ;", "bar foo" ]));
}

@test:Config
function userDefinedWordsCanDefineWordThatUsesWordWithTheSameName() {
    test:assertEquals("11", Forth.Evaluate([ ": foo 10 ;", ": foo foo 1 + ;", "foo" ]));
}

@test:Config
function userDefinedWordsCannotRedefineNonNegativeNumbers() {
    Assert.Throws<InvalidOperationException>(() => Forth.Evaluate([ ": 1 2 ;" ]));
}

@test:Config
function userDefinedWordsCannotRedefineNegativeNumbers() {
    Assert.Throws<InvalidOperationException>(() => Forth.Evaluate([ ": -1 2 ;" ]));
}

@test:Config
function userDefinedWordsErrorsIfExecutingANonExistentWord() {
    Assert.Throws<InvalidOperationException>(() => Forth.Evaluate([ "foo" ]));
}

@test:Config
function userDefinedWordsOnlyDefinesLocally() {
    test:assertEquals("0", Forth.Evaluate([ ": + - ;", "1 1 +" ]));
    test:assertEquals("2", Forth.Evaluate([ "1 1 +" ]));
}

@test:Config
function caseInsensitivityDupIsCaseInsensitive() {
    test:assertEquals("1 1 1 1", Forth.Evaluate([ "1 DUP Dup dup" ]));
}

@test:Config
function caseInsensitivityDropIsCaseInsensitive() {
    test:assertEquals("1", Forth.Evaluate([ "1 2 3 4 DROP Drop drop" ]));
}

@test:Config
function caseInsensitivitySwapIsCaseInsensitive() {
    test:assertEquals("2 3 4 1", Forth.Evaluate([ "1 2 SWAP 3 Swap 4 swap" ]));
}

@test:Config
function caseInsensitivityOverIsCaseInsensitive() {
    test:assertEquals("1 2 1 2 1", Forth.Evaluate([ "1 2 OVER Over over" ]));
}

@test:Config
function caseInsensitivityUserDefinedWordsAreCaseInsensitive() {
    test:assertEquals("1 1 1 1", Forth.Evaluate([ ": foo dup ;", "1 FOO Foo foo" ]));
}

@test:Config
function caseInsensitivityDefinitionsAreCaseInsensitive() {
    test:assertEquals("1 1 1 1", Forth.Evaluate([ ": SWAP DUP Dup dup ;", "1 swap" ]));
}
