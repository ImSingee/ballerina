import ballerina/test;

@test:Config
function binary_0IsDecimal_0() {
    test:assertEquals(0, Binary.ToDecimal("0"));
}

@test:Config
function binary_1IsDecimal_1() {
    test:assertEquals(1, Binary.ToDecimal("1"));
}

@test:Config
function binary_10IsDecimal_2() {
    test:assertEquals(2, Binary.ToDecimal("10"));
}

@test:Config
function binary_11IsDecimal_3() {
    test:assertEquals(3, Binary.ToDecimal("11"));
}

@test:Config
function binary_100IsDecimal_4() {
    test:assertEquals(4, Binary.ToDecimal("100"));
}

@test:Config
function binary_1001IsDecimal_9() {
    test:assertEquals(9, Binary.ToDecimal("1001"));
}

@test:Config
function binary_11010IsDecimal_26() {
    test:assertEquals(26, Binary.ToDecimal("11010"));
}

@test:Config
function binary_10001101000IsDecimal_1128() {
    test:assertEquals(1128, Binary.ToDecimal("10001101000"));
}

@test:Config
function binaryIgnoresLeadingZeros() {
    test:assertEquals(31, Binary.ToDecimal("000011111"));
}

@test:Config
function invalidBinary_2ConvertsToDecimal_0() {
    test:assertEquals(0, Binary.ToDecimal("2"));
}

@test:Config
function aNumberContainingANonBinaryDigitIsInvalid() {
    test:assertEquals(0, Binary.ToDecimal("01201"));
}

@test:Config
function aNumberWithTrailingNonBinaryCharactersIsInvalid() {
    test:assertEquals(0, Binary.ToDecimal("10nope"));
}

@test:Config
function aNumberWithLeadingNonBinaryCharactersIsInvalid() {
    test:assertEquals(0, Binary.ToDecimal("nope10"));
}

@test:Config
function aNumberWithInternalNonBinaryCharactersIsInvalid() {
    test:assertEquals(0, Binary.ToDecimal("10nope10"));
}

@test:Config
function aNumberAndAWordWhitespaceSeparatedIsInvalid() {
    test:assertEquals(0, Binary.ToDecimal("001 nope"));
}
