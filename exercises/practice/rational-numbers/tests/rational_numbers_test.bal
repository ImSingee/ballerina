import ballerina/test;

@test:Config
function addTwoPositiveRationalNumbers() {
    test:assertEquals(new RationalNumber(7, 6), new RationalNumber(1, 2) + (new RationalNumber(2, 3)));
}

@test:Config
function addAPositiveRationalNumberAndANegativeRationalNumber() {
    test:assertEquals(new RationalNumber(-1, 6), new RationalNumber(1, 2) + (new RationalNumber(-2, 3)));
}

@test:Config
function addTwoNegativeRationalNumbers() {
    test:assertEquals(new RationalNumber(-7, 6), new RationalNumber(-1, 2) + (new RationalNumber(-2, 3)));
}

@test:Config
function addARationalNumberToItsAdditiveInverse() {
    test:assertEquals(new RationalNumber(0, 1), new RationalNumber(1, 2) + (new RationalNumber(-1, 2)));
}

@test:Config
function subtractTwoPositiveRationalNumbers() {
    test:assertEquals(new RationalNumber(-1, 6), new RationalNumber(1, 2) - (new RationalNumber(2, 3)));
}

@test:Config
function subtractAPositiveRationalNumberAndANegativeRationalNumber() {
    test:assertEquals(new RationalNumber(7, 6), new RationalNumber(1, 2) - (new RationalNumber(-2, 3)));
}

@test:Config
function subtractTwoNegativeRationalNumbers() {
    test:assertEquals(new RationalNumber(1, 6), new RationalNumber(-1, 2) - (new RationalNumber(-2, 3)));
}

@test:Config
function subtractARationalNumberFromItself() {
    test:assertEquals(new RationalNumber(0, 1), new RationalNumber(1, 2) - (new RationalNumber(1, 2)));
}

@test:Config
function multiplyTwoPositiveRationalNumbers() {
    test:assertEquals(new RationalNumber(1, 3), new RationalNumber(1, 2) * (new RationalNumber(2, 3)));
}

@test:Config
function multiplyANegativeRationalNumberByAPositiveRationalNumber() {
    test:assertEquals(new RationalNumber(-1, 3), new RationalNumber(-1, 2) * (new RationalNumber(2, 3)));
}

@test:Config
function multiplyTwoNegativeRationalNumbers() {
    test:assertEquals(new RationalNumber(1, 3), new RationalNumber(-1, 2) * (new RationalNumber(-2, 3)));
}

@test:Config
function multiplyARationalNumberByItsReciprocal() {
    test:assertEquals(new RationalNumber(1, 1), new RationalNumber(1, 2) * (new RationalNumber(2, 1)));
}

@test:Config
function multiplyARationalNumberBy_1() {
    test:assertEquals(new RationalNumber(1, 2), new RationalNumber(1, 2) * (new RationalNumber(1, 1)));
}

@test:Config
function multiplyARationalNumberBy_0() {
    test:assertEquals(new RationalNumber(0, 1), new RationalNumber(1, 2) * (new RationalNumber(0, 1)));
}

@test:Config
function divideTwoPositiveRationalNumbers() {
    test:assertEquals(new RationalNumber(3, 4), new RationalNumber(1, 2) / (new RationalNumber(2, 3)));
}

@test:Config
function divideAPositiveRationalNumberByANegativeRationalNumber() {
    test:assertEquals(new RationalNumber(-3, 4), new RationalNumber(1, 2) / (new RationalNumber(-2, 3)));
}

@test:Config
function divideTwoNegativeRationalNumbers() {
    test:assertEquals(new RationalNumber(3, 4), new RationalNumber(-1, 2) / (new RationalNumber(-2, 3)));
}

@test:Config
function divideARationalNumberBy_1() {
    test:assertEquals(new RationalNumber(1, 2), new RationalNumber(1, 2) / (new RationalNumber(1, 1)));
}

@test:Config
function absoluteValueOfAPositiveRationalNumber() {
    test:assertEquals(new RationalNumber(1, 2), new RationalNumber(1, 2).Abs());
}

@test:Config
function absoluteValueOfAPositiveRationalNumberWithNegativeNumeratorAndDenominator() {
    test:assertEquals(new RationalNumber(1, 2), new RationalNumber(-1, -2).Abs());
}

@test:Config
function absoluteValueOfANegativeRationalNumber() {
    test:assertEquals(new RationalNumber(1, 2), new RationalNumber(-1, 2).Abs());
}

@test:Config
function absoluteValueOfANegativeRationalNumberWithNegativeDenominator() {
    test:assertEquals(new RationalNumber(1, 2), new RationalNumber(1, -2).Abs());
}

@test:Config
function absoluteValueOfZero() {
    test:assertEquals(new RationalNumber(0, 1), new RationalNumber(0, 1).Abs());
}

@test:Config
function absoluteValueOfARationalNumberIsReducedToLowestTerms() {
    test:assertEquals(new RationalNumber(1, 2), new RationalNumber(2, 4).Abs());
}

@test:Config
function raiseAPositiveRationalNumberToAPositiveIntegerPower() {
    test:assertEquals(new RationalNumber(1, 8), new RationalNumber(1, 2).Exprational(3));
}

@test:Config
function raiseANegativeRationalNumberToAPositiveIntegerPower() {
    test:assertEquals(new RationalNumber(-1, 8), new RationalNumber(-1, 2).Exprational(3));
}

@test:Config
function raiseAPositiveRationalNumberToANegativeIntegerPower() {
    test:assertEquals(new RationalNumber(25, 9), new RationalNumber(3, 5).Exprational(-2));
}

@test:Config
function raiseANegativeRationalNumberToAnEvenNegativeIntegerPower() {
    test:assertEquals(new RationalNumber(25, 9), new RationalNumber(-3, 5).Exprational(-2));
}

@test:Config
function raiseANegativeRationalNumberToAnOddNegativeIntegerPower() {
    test:assertEquals(new RationalNumber(-125, 27), new RationalNumber(-3, 5).Exprational(-3));
}

@test:Config
function raiseZeroToAnIntegerPower() {
    test:assertEquals(new RationalNumber(0, 1), new RationalNumber(0, 1).Exprational(5));
}

@test:Config
function raiseOneToAnIntegerPower() {
    test:assertEquals(new RationalNumber(1, 1), new RationalNumber(1, 1).Exprational(4));
}

@test:Config
function raiseAPositiveRationalNumberToThePowerOfZero() {
    test:assertEquals(new RationalNumber(1, 1), new RationalNumber(1, 2).Exprational(0));
}

@test:Config
function raiseANegativeRationalNumberToThePowerOfZero() {
    test:assertEquals(new RationalNumber(1, 1), new RationalNumber(-1, 2).Exprational(0));
}

@test:Config
function raiseARealNumberToAPositiveRationalNumber() {
    test:assertEquals(16, 8.Expreal(new RationalNumber(4, 3)), precision: 7);
}

@test:Config
function raiseARealNumberToANegativeRationalNumber() {
    test:assertEquals(0.33333334, 9.Expreal(new RationalNumber(-1, 2)), precision: 7);
}

@test:Config
function raiseARealNumberToAZeroRationalNumber() {
    test:assertEquals(1, 2.Expreal(new RationalNumber(0, 1)), precision: 7);
}

@test:Config
function reduceAPositiveRationalNumberToLowestTerms() {
    test:assertEquals(new RationalNumber(1, 2), new RationalNumber(2, 4).Reduce());
}

@test:Config
function reducePlacesTheMinusSignOnTheNumerator() {
    test:assertEquals(new RationalNumber(-3, 4), new RationalNumber(3, -4).Reduce());
}

@test:Config
function reduceANegativeRationalNumberToLowestTerms() {
    test:assertEquals(new RationalNumber(-2, 3), new RationalNumber(-4, 6).Reduce());
}

@test:Config
function reduceARationalNumberWithANegativeDenominatorToLowestTerms() {
    test:assertEquals(new RationalNumber(-1, 3), new RationalNumber(3, -9).Reduce());
}

@test:Config
function reduceZeroToLowestTerms() {
    test:assertEquals(new RationalNumber(0, 1), new RationalNumber(0, 6).Reduce());
}

@test:Config
function reduceAnIntegerToLowestTerms() {
    test:assertEquals(new RationalNumber(-2, 1), new RationalNumber(-14, 7).Reduce());
}

@test:Config
function reduceOneToLowestTerms() {
    test:assertEquals(new RationalNumber(1, 1), new RationalNumber(13, 13).Reduce());
}
