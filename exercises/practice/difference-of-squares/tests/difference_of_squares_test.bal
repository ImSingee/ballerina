import ballerina/test;

@test:Config
function squareOfSum_1() {
    test:assertEquals(1, DifferenceOfSquares.CalculateSquareOfSum(1));
}

@test:Config
function squareOfSum_5() {
    test:assertEquals(225, DifferenceOfSquares.CalculateSquareOfSum(5));
}

@test:Config
function squareOfSum_100() {
    test:assertEquals(25502500, DifferenceOfSquares.CalculateSquareOfSum(100));
}

@test:Config
function sumOfSquares_1() {
    test:assertEquals(1, DifferenceOfSquares.CalculateSumOfSquares(1));
}

@test:Config
function sumOfSquares_5() {
    test:assertEquals(55, DifferenceOfSquares.CalculateSumOfSquares(5));
}

@test:Config
function sumOfSquares_100() {
    test:assertEquals(338350, DifferenceOfSquares.CalculateSumOfSquares(100));
}

@test:Config
function differenceOfSquares_1() {
    test:assertEquals(0, DifferenceOfSquares.CalculateDifferenceOfSquares(1));
}

@test:Config
function differenceOfSquares_5() {
    test:assertEquals(170, DifferenceOfSquares.CalculateDifferenceOfSquares(5));
}

@test:Config
function differenceOfSquares_100() {
    test:assertEquals(25164150, DifferenceOfSquares.CalculateDifferenceOfSquares(100));
}
