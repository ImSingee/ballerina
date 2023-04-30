import ballerina/test;

@test:Config
function zeroIsAnArmstrongNumber() {
    test:assertTrue(ArmstrongNumbers.IsArmstrongNumber(0));
}

@test:Config
function singleDigitNumbersAreArmstrongNumbers() {
    test:assertTrue(ArmstrongNumbers.IsArmstrongNumber(5));
}

@test:Config
function thereAreNoTwoDigitArmstrongNumbers() {
    test:assertFalse(ArmstrongNumbers.IsArmstrongNumber(10));
}

@test:Config
function threeDigitNumberThatIsAnArmstrongNumber() {
    test:assertTrue(ArmstrongNumbers.IsArmstrongNumber(153));
}

@test:Config
function threeDigitNumberThatIsNotAnArmstrongNumber() {
    test:assertFalse(ArmstrongNumbers.IsArmstrongNumber(100));
}

@test:Config
function fourDigitNumberThatIsAnArmstrongNumber() {
    test:assertTrue(ArmstrongNumbers.IsArmstrongNumber(9474));
}

@test:Config
function fourDigitNumberThatIsNotAnArmstrongNumber() {
    test:assertFalse(ArmstrongNumbers.IsArmstrongNumber(9475));
}

@test:Config
function sevenDigitNumberThatIsAnArmstrongNumber() {
    test:assertTrue(ArmstrongNumbers.IsArmstrongNumber(9926315));
}

@test:Config
function sevenDigitNumberThatIsNotAnArmstrongNumber() {
    test:assertFalse(ArmstrongNumbers.IsArmstrongNumber(9926314));
}
