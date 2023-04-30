import ballerina/test;

@test:Config
function zero() {
    test:assertEquals("zero", Say.InEnglish(0L));
}

@test:Config
function one() {
    test:assertEquals("one", Say.InEnglish(1L));
}

@test:Config
function fourteen() {
    test:assertEquals("fourteen", Say.InEnglish(14L));
}

@test:Config
function twenty() {
    test:assertEquals("twenty", Say.InEnglish(20L));
}

@test:Config
function twentyTwo() {
    test:assertEquals("twenty-two", Say.InEnglish(22L));
}

@test:Config
function thirty() {
    test:assertEquals("thirty", Say.InEnglish(30L));
}

@test:Config
function ninetyNine() {
    test:assertEquals("ninety-nine", Say.InEnglish(99L));
}

@test:Config
function oneHundred() {
    test:assertEquals("one hundred", Say.InEnglish(100L));
}

@test:Config
function oneHundredTwentyThree() {
    test:assertEquals("one hundred twenty-three", Say.InEnglish(123L));
}

@test:Config
function twoHundred() {
    test:assertEquals("two hundred", Say.InEnglish(200L));
}

@test:Config
function nineHundredNinetyNine() {
    test:assertEquals("nine hundred ninety-nine", Say.InEnglish(999L));
}

@test:Config
function oneThousand() {
    test:assertEquals("one thousand", Say.InEnglish(1000L));
}

@test:Config
function oneThousandTwoHundredThirtyFour() {
    test:assertEquals("one thousand two hundred thirty-four", Say.InEnglish(1234L));
}

@test:Config
function oneMillion() {
    test:assertEquals("one million", Say.InEnglish(1000000L));
}

@test:Config
function oneMillionTwoThousandThreeHundredFortyFive() {
    test:assertEquals("one million two thousand three hundred forty-five", Say.InEnglish(1002345L));
}

@test:Config
function oneBillion() {
    test:assertEquals("one billion", Say.InEnglish(1000000000L));
}

@test:Config
function aBigNumber() {
    test:assertEquals("nine hundred eighty-seven billion six hundred fifty-four million three hundred twenty-one thousand one hundred twenty-three", Say.InEnglish(987654321123L));
}

@test:Config
function numbersBelowZeroAreOutOfRange() {
    Assert.Throws<ArgumentOutOfRangeException>(() => Say.InEnglish(-1L));
}

@test:Config
function numbersAbove_999_999_999_999AreOutOfRange() {
    Assert.Throws<ArgumentOutOfRangeException>(() => Say.InEnglish(1000000000000L));
}
