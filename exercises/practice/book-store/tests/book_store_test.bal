import ballerina/test;

@test:Config
function onlyASingleBook() {
    var basket = [ 1 ];
    test:assertEquals(8m, BookStore.Total(basket));
}

@test:Config
function twoOfTheSameBook() {
    var basket = [ 2, 2 ];
    test:assertEquals(16m, BookStore.Total(basket));
}

@test:Config
function emptyBasket() {
    var basket = Array.Empty<int>();
    test:assertEquals(0m, BookStore.Total(basket));
}

@test:Config
function twoDifferentBooks() {
    var basket = [ 1, 2 ];
    test:assertEquals(15.2m, BookStore.Total(basket));
}

@test:Config
function threeDifferentBooks() {
    var basket = [ 1, 2, 3 ];
    test:assertEquals(21.6m, BookStore.Total(basket));
}

@test:Config
function fourDifferentBooks() {
    var basket = [ 1, 2, 3, 4 ];
    test:assertEquals(25.6m, BookStore.Total(basket));
}

@test:Config
function fiveDifferentBooks() {
    var basket = [ 1, 2, 3, 4, 5 ];
    test:assertEquals(30m, BookStore.Total(basket));
}

@test:Config
function twoGroupsOfFourIsCheaperThanGroupOfFivePlusGroupOfThree() {
    var basket = [ 1, 1, 2, 2, 3, 3, 4, 5 ];
    test:assertEquals(51.2m, BookStore.Total(basket));
}

@test:Config
function twoGroupsOfFourIsCheaperThanGroupsOfFiveAndThree() {
    var basket = [ 1, 1, 2, 3, 4, 4, 5, 5 ];
    test:assertEquals(51.2m, BookStore.Total(basket));
}

@test:Config
function groupOfFourPlusGroupOfTwoIsCheaperThanTwoGroupsOfThree() {
    var basket = [ 1, 1, 2, 2, 3, 4 ];
    test:assertEquals(40.8m, BookStore.Total(basket));
}

@test:Config
function twoEachOfFirstFourBooksAndOneCopyEachOfRest() {
    var basket = [ 1, 1, 2, 2, 3, 3, 4, 4, 5 ];
    test:assertEquals(55.6m, BookStore.Total(basket));
}

@test:Config
function twoCopiesOfEachBook() {
    var basket = [ 1, 1, 2, 2, 3, 3, 4, 4, 5, 5 ];
    test:assertEquals(60m, BookStore.Total(basket));
}

@test:Config
function threeCopiesOfFirstBookAndTwoEachOfRemaining() {
    var basket = [ 1, 1, 2, 2, 3, 3, 4, 4, 5, 5, 1 ];
    test:assertEquals(68m, BookStore.Total(basket));
}

@test:Config
function threeEachOfFirstTwoBooksAndTwoEachOfRemainingBooks() {
    var basket = [ 1, 1, 2, 2, 3, 3, 4, 4, 5, 5, 1, 2 ];
    test:assertEquals(75.2m, BookStore.Total(basket));
}

@test:Config
function fourGroupsOfFourAreCheaperThanTwoGroupsEachOfFiveAndThree() {
    var basket = [ 1, 1, 2, 2, 3, 3, 4, 5, 1, 1, 2, 2, 3, 3, 4, 5 ];
    test:assertEquals(102.4m, BookStore.Total(basket));
}

@test:Config
function checkThatGroupsOfFourAreCreatedProperlyEvenWhenThereAreMoreGroupsOfThreeThanGroupsOfFive() {
    var basket = [ 1, 1, 1, 1, 1, 1, 2, 2, 2, 2, 2, 2, 3, 3, 3, 3, 3, 3, 4, 4, 5, 5 ];
    test:assertEquals(145.6m, BookStore.Total(basket));
}

@test:Config
function oneGroupOfOneAndFourIsCheaperThanOneGroupOfTwoAndThree() {
    var basket = [ 1, 1, 2, 3, 4 ];
    test:assertEquals(33.6m, BookStore.Total(basket));
}

@test:Config
function oneGroupOfOneAndTwoPlusThreeGroupsOfFourIsCheaperThanOneGroupOfEachSize() {
    var basket = [ 1, 2, 2, 3, 3, 3, 4, 4, 4, 4, 5, 5, 5, 5, 5 ];
    test:assertEquals(100m, BookStore.Total(basket));
}
