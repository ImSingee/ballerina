import ballerina/test;

@test:Config
function runLengthEncodeAStringEmptyString() {
    test:assertEquals("", RunLengthEncoding.Encode(""));
}

@test:Config
function runLengthEncodeAStringSingleCharactersOnlyAreEncodedWithoutCount() {
    test:assertEquals("XYZ", RunLengthEncoding.Encode("XYZ"));
}

@test:Config
function runLengthEncodeAStringStringWithNoSingleCharacters() {
    test:assertEquals("2A3B4C", RunLengthEncoding.Encode("AABBBCCCC"));
}

@test:Config
function runLengthEncodeAStringSingleCharactersMixedWithRepeatedCharacters() {
    test:assertEquals("12WB12W3B24WB", RunLengthEncoding.Encode("WWWWWWWWWWWWBWWWWWWWWWWWWBBBWWWWWWWWWWWWWWWWWWWWWWWWB"));
}

@test:Config
function runLengthEncodeAStringMultipleWhitespaceMixedInString() {
    test:assertEquals("2 hs2q q2w2 ", RunLengthEncoding.Encode("  hsqq qww  "));
}

@test:Config
function runLengthEncodeAStringLowercaseCharacters() {
    test:assertEquals("2a3b4c", RunLengthEncoding.Encode("aabbbcccc"));
}

@test:Config
function runLengthDecodeAStringEmptyString() {
    test:assertEquals("", RunLengthEncoding.Decode(""));
}

@test:Config
function runLengthDecodeAStringSingleCharactersOnly() {
    test:assertEquals("XYZ", RunLengthEncoding.Decode("XYZ"));
}

@test:Config
function runLengthDecodeAStringStringWithNoSingleCharacters() {
    test:assertEquals("AABBBCCCC", RunLengthEncoding.Decode("2A3B4C"));
}

@test:Config
function runLengthDecodeAStringSingleCharactersWithRepeatedCharacters() {
    test:assertEquals("WWWWWWWWWWWWBWWWWWWWWWWWWBBBWWWWWWWWWWWWWWWWWWWWWWWWB", RunLengthEncoding.Decode("12WB12W3B24WB"));
}

@test:Config
function runLengthDecodeAStringMultipleWhitespaceMixedInString() {
    test:assertEquals("  hsqq qww  ", RunLengthEncoding.Decode("2 hs2q q2w2 "));
}

@test:Config
function runLengthDecodeAStringLowercaseString() {
    test:assertEquals("aabbbcccc", RunLengthEncoding.Decode("2a3b4c"));
}

@test:Config
function encodeAndThenDecodeEncodeFollowedByDecodeGivesOriginalString() {
    test:assertEquals("zzz ZZ  zZ", RunLengthEncoding.Decode(RunLengthEncoding.Encode("zzz ZZ  zZ")));
}
