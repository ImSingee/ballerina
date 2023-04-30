import ballerina/test;

@test:Config
function smallestPerfectNumberIsClassifiedCorrectly() {
    test:assertEquals(Classification.Perfect, PerfectNumbers.Classify(6));
}

@test:Config
function mediumPerfectNumberIsClassifiedCorrectly() {
    test:assertEquals(Classification.Perfect, PerfectNumbers.Classify(28));
}

@test:Config
function largePerfectNumberIsClassifiedCorrectly() {
    test:assertEquals(Classification.Perfect, PerfectNumbers.Classify(33550336));
}

@test:Config
function smallestAbundantNumberIsClassifiedCorrectly() {
    test:assertEquals(Classification.Abundant, PerfectNumbers.Classify(12));
}

@test:Config
function mediumAbundantNumberIsClassifiedCorrectly() {
    test:assertEquals(Classification.Abundant, PerfectNumbers.Classify(30));
}

@test:Config
function largeAbundantNumberIsClassifiedCorrectly() {
    test:assertEquals(Classification.Abundant, PerfectNumbers.Classify(33550335));
}

@test:Config
function smallestPrimeDeficientNumberIsClassifiedCorrectly() {
    test:assertEquals(Classification.Deficient, PerfectNumbers.Classify(2));
}

@test:Config
function smallestNonPrimeDeficientNumberIsClassifiedCorrectly() {
    test:assertEquals(Classification.Deficient, PerfectNumbers.Classify(4));
}

@test:Config
function mediumDeficientNumberIsClassifiedCorrectly() {
    test:assertEquals(Classification.Deficient, PerfectNumbers.Classify(32));
}

@test:Config
function largeDeficientNumberIsClassifiedCorrectly() {
    test:assertEquals(Classification.Deficient, PerfectNumbers.Classify(33550337));
}

@test:Config
function edgeCaseNoFactorsOtherThanItselfIsClassifiedCorrectly() {
    test:assertEquals(Classification.Deficient, PerfectNumbers.Classify(1));
}

@test:Config
function zeroIsRejectedAsItIsNotAPositiveInteger_() {
    Assert.Throws<ArgumentOutOfRangeException>(() => PerfectNumbers.Classify(0));
}

@test:Config
function negativeIntegerIsRejectedAsItIsNotAPositiveInteger_() {
    Assert.Throws<ArgumentOutOfRangeException>(() => PerfectNumbers.Classify(-1));
}
