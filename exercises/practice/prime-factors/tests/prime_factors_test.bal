import ballerina/test;

@test:Config
function noFactors() {
    Assert.Empty(PrimeFactors.Factors(1L));
}

@test:Config
function primeNumber() {
    test:assertEquals([ 2L ], PrimeFactors.Factors(2L));
}

@test:Config
function anotherPrimeNumber() {
    test:assertEquals([ 3L ], PrimeFactors.Factors(3L));
}

@test:Config
function squareOfAPrime() {
    test:assertEquals([ 3L, 3L ], PrimeFactors.Factors(9L));
}

@test:Config
function productOfFirstPrime() {
    test:assertEquals([ 2L, 2L ], PrimeFactors.Factors(4L));
}

@test:Config
function cubeOfAPrime() {
    test:assertEquals([ 2L, 2L, 2L ], PrimeFactors.Factors(8L));
}

@test:Config
function productOfSecondPrime() {
    test:assertEquals([ 3L, 3L, 3L ], PrimeFactors.Factors(27L));
}

@test:Config
function productOfThirdPrime() {
    test:assertEquals([ 5L, 5L, 5L, 5L ], PrimeFactors.Factors(625L));
}

@test:Config
function productOfFirstAndSecondPrime() {
    test:assertEquals([ 2L, 3L ], PrimeFactors.Factors(6L));
}

@test:Config
function productOfPrimesAndNonPrimes() {
    test:assertEquals([ 2L, 2L, 3L ], PrimeFactors.Factors(12L));
}

@test:Config
function productOfPrimes() {
    test:assertEquals([ 5L, 17L, 23L, 461L ], PrimeFactors.Factors(901255L));
}

@test:Config
function factorsIncludeALargePrime() {
    test:assertEquals([ 11L, 9539L, 894119L ], PrimeFactors.Factors(93819012551L));
}
