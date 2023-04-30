import ballerina/test;

@test:Config
function noMultiplesWithinLimit() {
    test:assertEquals(0, SumOfMultiples.Sum([ 3, 5 ], 1));
}

@test:Config
function oneFactorHasMultiplesWithinLimit() {
    test:assertEquals(3, SumOfMultiples.Sum([ 3, 5 ], 4));
}

@test:Config
function moreThanOneMultipleWithinLimit() {
    test:assertEquals(9, SumOfMultiples.Sum([ 3 ], 7));
}

@test:Config
function moreThanOneFactorWithMultiplesWithinLimit() {
    test:assertEquals(23, SumOfMultiples.Sum([ 3, 5 ], 10));
}

@test:Config
function eachMultipleIsOnlyCountedOnce() {
    test:assertEquals(2318, SumOfMultiples.Sum([ 3, 5 ], 100));
}

@test:Config
function aMuchLargerLimit() {
    test:assertEquals(233168, SumOfMultiples.Sum([ 3, 5 ], 1000));
}

@test:Config
function threeFactors() {
    test:assertEquals(51, SumOfMultiples.Sum([ 7, 13, 17 ], 20));
}

@test:Config
function factorsNotRelativelyPrime() {
    test:assertEquals(30, SumOfMultiples.Sum([ 4, 6 ], 15));
}

@test:Config
function somePairsOfFactorsRelativelyPrimeAndSomeNot() {
    test:assertEquals(4419, SumOfMultiples.Sum([ 5, 6, 8 ], 150));
}

@test:Config
function oneFactorIsAMultipleOfAnother() {
    test:assertEquals(275, SumOfMultiples.Sum([ 5, 25 ], 51));
}

@test:Config
function muchLargerFactors() {
    test:assertEquals(2203160, SumOfMultiples.Sum([ 43, 47 ], 10000));
}

@test:Config
function allNumbersAreMultiplesOf_1() {
    test:assertEquals(4950, SumOfMultiples.Sum([ 1 ], 100));
}

@test:Config
function noFactorsMeansAnEmptySum() {
    test:assertEquals(0, SumOfMultiples.Sum(Array.Empty<int>(), 10000));
}

@test:Config
function theOnlyMultipleOf_0Is_0() {
    test:assertEquals(0, SumOfMultiples.Sum([ 0 ], 1));
}

@test:Config
function theFactor_0DoesNotAffectTheSumOfMultiplesOfOtherFactors() {
    test:assertEquals(3, SumOfMultiples.Sum([ 3, 0 ], 4));
}

@test:Config
function solutionsUsingIncludeExcludeMustExtendToCardinalityGreaterThan_3() {
    test:assertEquals(39614537, SumOfMultiples.Sum([ 2, 3, 5, 7, 11 ], 10000));
}