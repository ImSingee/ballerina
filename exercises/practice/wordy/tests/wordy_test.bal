import ballerina/test;

@test:Config
function justANumber() {
    test:assertEquals(5, Wordy.Answer("What is 5?"));
}

@test:Config
function addition() {
    test:assertEquals(2, Wordy.Answer("What is 1 plus 1?"));
}

@test:Config
function moreAddition() {
    test:assertEquals(55, Wordy.Answer("What is 53 plus 2?"));
}

@test:Config
function additionWithNegativeNumbers() {
    test:assertEquals(-11, Wordy.Answer("What is -1 plus -10?"));
}

@test:Config
function largeAddition() {
    test:assertEquals(45801, Wordy.Answer("What is 123 plus 45678?"));
}

@test:Config
function subtraction() {
    test:assertEquals(16, Wordy.Answer("What is 4 minus -12?"));
}

@test:Config
function multiplication() {
    test:assertEquals(-75, Wordy.Answer("What is -3 multiplied by 25?"));
}

@test:Config
function division() {
    test:assertEquals(-11, Wordy.Answer("What is 33 divided by -3?"));
}

@test:Config
function multipleAdditions() {
    test:assertEquals(3, Wordy.Answer("What is 1 plus 1 plus 1?"));
}

@test:Config
function additionAndSubtraction() {
    test:assertEquals(8, Wordy.Answer("What is 1 plus 5 minus -2?"));
}

@test:Config
function multipleSubtraction() {
    test:assertEquals(3, Wordy.Answer("What is 20 minus 4 minus 13?"));
}

@test:Config
function subtractionThenAddition() {
    test:assertEquals(14, Wordy.Answer("What is 17 minus 6 plus 3?"));
}

@test:Config
function multipleMultiplication() {
    test:assertEquals(-12, Wordy.Answer("What is 2 multiplied by -2 multiplied by 3?"));
}

@test:Config
function additionAndMultiplication() {
    test:assertEquals(-8, Wordy.Answer("What is -3 plus 7 multiplied by -2?"));
}

@test:Config
function multipleDivision() {
    test:assertEquals(2, Wordy.Answer("What is -12 divided by 2 divided by -3?"));
}

@test:Config
function unknownOperation() {
    Assert.Throws<ArgumentException>(() => Wordy.Answer("What is 52 cubed?"));
}

@test:Config
function nonMathQuestion() {
    Assert.Throws<ArgumentException>(() => Wordy.Answer("Who is the President of the United States?"));
}

@test:Config
function rejectProblemMissingAnOperand() {
    Assert.Throws<ArgumentException>(() => Wordy.Answer("What is 1 plus?"));
}

@test:Config
function rejectProblemWithNoOperandsOrOperators() {
    Assert.Throws<ArgumentException>(() => Wordy.Answer("What is?"));
}

@test:Config
function rejectTwoOperationsInARow() {
    Assert.Throws<ArgumentException>(() => Wordy.Answer("What is 1 plus plus 2?"));
}

@test:Config
function rejectTwoNumbersInARow() {
    Assert.Throws<ArgumentException>(() => Wordy.Answer("What is 1 plus 2 1?"));
}

@test:Config
function rejectPostfixNotation() {
    Assert.Throws<ArgumentException>(() => Wordy.Answer("What is 1 2 plus?"));
}

@test:Config
function rejectPrefixNotation() {
    Assert.Throws<ArgumentException>(() => Wordy.Answer("What is plus 1 2?"));
}
