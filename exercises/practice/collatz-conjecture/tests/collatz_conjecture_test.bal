import ballerina/test;

@test:Config
function zeroStepsForOne() {
    test:assertEquals(0, CollatzConjecture.Steps(1));
}

@test:Config
function divideIfEven() {
    test:assertEquals(4, CollatzConjecture.Steps(16));
}

@test:Config
function evenAndOddSteps() {
    test:assertEquals(9, CollatzConjecture.Steps(12));
}

@test:Config
function largeNumberOfEvenAndOddSteps() {
    test:assertEquals(152, CollatzConjecture.Steps(1000000));
}

@test:Config
function zeroIsAnError() {
    Assert.Throws<ArgumentOutOfRangeException>(() => CollatzConjecture.Steps(0));
}

@test:Config
function negativeValueIsAnError() {
    Assert.Throws<ArgumentOutOfRangeException>(() => CollatzConjecture.Steps(-15));
}
