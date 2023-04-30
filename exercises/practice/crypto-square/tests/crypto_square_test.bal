import ballerina/test;

@test:Config
function emptyPlaintextResultsInAnEmptyCiphertext() {
    var plaintext = "";
    var expected = "";
    test:assertEquals(expected, CryptoSquare.Ciphertext(plaintext));
}

@test:Config
function lowercase() {
    var plaintext = "A";
    var expected = "a";
    test:assertEquals(expected, CryptoSquare.Ciphertext(plaintext));
}

@test:Config
function removeSpaces() {
    var plaintext = "  b ";
    var expected = "b";
    test:assertEquals(expected, CryptoSquare.Ciphertext(plaintext));
}

@test:Config
function removePunctuation() {
    var plaintext = "@1,%!";
    var expected = "1";
    test:assertEquals(expected, CryptoSquare.Ciphertext(plaintext));
}

@test:Config
function number_9CharacterPlaintextResultsIn_3ChunksOf_3Characters() {
    var plaintext = "This is fun!";
    var expected = "tsf hiu isn";
    test:assertEquals(expected, CryptoSquare.Ciphertext(plaintext));
}

@test:Config
function number_8CharacterPlaintextResultsIn_3ChunksTheLastOneWithATrailingSpace() {
    var plaintext = "Chill out.";
    var expected = "clu hlt io ";
    test:assertEquals(expected, CryptoSquare.Ciphertext(plaintext));
}

@test:Config
function number_54CharacterPlaintextResultsIn_7ChunksTheLastTwoWithTrailingSpaces() {
    var plaintext = "If man was meant to stay on the ground, god would have given us roots.";
    var expected = "imtgdvs fearwer mayoogo anouuio ntnnlvt wttddes aohghn  sseoau ";
    test:assertEquals(expected, CryptoSquare.Ciphertext(plaintext));
}
