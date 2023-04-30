import ballerina/test;

@test:Config
function zero() {
    var integers = [ 0x0u ];
    var expected = [ 0x0u ];
    test:assertEquals(expected, VariableLengthQuantity.Encode(integers));
}

@test:Config
function arbitrarySingleByte() {
    var integers = [ 0x40u ];
    var expected = [ 0x40u ];
    test:assertEquals(expected, VariableLengthQuantity.Encode(integers));
}

@test:Config
function largestSingleByte() {
    var integers = [ 0x7Fu ];
    var expected = [ 0x7Fu ];
    test:assertEquals(expected, VariableLengthQuantity.Encode(integers));
}

@test:Config
function smallestDoubleByte() {
    var integers = [ 0x80u ];
    var expected = [ 0x81u, 0x0u ];
    test:assertEquals(expected, VariableLengthQuantity.Encode(integers));
}

@test:Config
function arbitraryDoubleByte() {
    var integers = [ 0x2000u ];
    var expected = [ 0xC0u, 0x0u ];
    test:assertEquals(expected, VariableLengthQuantity.Encode(integers));
}

@test:Config
function largestDoubleByte() {
    var integers = [ 0x3FFFu ];
    var expected = [ 0xFFu, 0x7Fu ];
    test:assertEquals(expected, VariableLengthQuantity.Encode(integers));
}

@test:Config
function smallestTripleByte() {
    var integers = [ 0x4000u ];
    var expected = [ 0x81u, 0x80u, 0x0u ];
    test:assertEquals(expected, VariableLengthQuantity.Encode(integers));
}

@test:Config
function arbitraryTripleByte() {
    var integers = [ 0x100000u ];
    var expected = [ 0xC0u, 0x80u, 0x0u ];
    test:assertEquals(expected, VariableLengthQuantity.Encode(integers));
}

@test:Config
function largestTripleByte() {
    var integers = [ 0x1FFFFFu ];
    var expected = [ 0xFFu, 0xFFu, 0x7Fu ];
    test:assertEquals(expected, VariableLengthQuantity.Encode(integers));
}

@test:Config
function smallestQuadrupleByte() {
    var integers = [ 0x200000u ];
    var expected = [ 0x81u, 0x80u, 0x80u, 0x0u ];
    test:assertEquals(expected, VariableLengthQuantity.Encode(integers));
}

@test:Config
function arbitraryQuadrupleByte() {
    var integers = [ 0x8000000u ];
    var expected = [ 0xC0u, 0x80u, 0x80u, 0x0u ];
    test:assertEquals(expected, VariableLengthQuantity.Encode(integers));
}

@test:Config
function largestQuadrupleByte() {
    var integers = [ 0xFFFFFFFu ];
    var expected = [ 0xFFu, 0xFFu, 0xFFu, 0x7Fu ];
    test:assertEquals(expected, VariableLengthQuantity.Encode(integers));
}

@test:Config
function smallestQuintupleByte() {
    var integers = [ 0x10000000u ];
    var expected = [ 0x81u, 0x80u, 0x80u, 0x80u, 0x0u ];
    test:assertEquals(expected, VariableLengthQuantity.Encode(integers));
}

@test:Config
function arbitraryQuintupleByte() {
    var integers = [ 0xFF000000u ];
    var expected = [ 0x8Fu, 0xF8u, 0x80u, 0x80u, 0x0u ];
    test:assertEquals(expected, VariableLengthQuantity.Encode(integers));
}

@test:Config
function maximum_32BitIntegerInput() {
    var integers = [ 0xFFFFFFFFu ];
    var expected = [ 0x8Fu, 0xFFu, 0xFFu, 0xFFu, 0x7Fu ];
    test:assertEquals(expected, VariableLengthQuantity.Encode(integers));
}

@test:Config
function twoSingleByteValues() {
    var integers = [ 0x40u, 0x7Fu ];
    var expected = [ 0x40u, 0x7Fu ];
    test:assertEquals(expected, VariableLengthQuantity.Encode(integers));
}

@test:Config
function twoMultiByteValues() {
    var integers = [ 0x4000u, 0x123456u ];
    var expected = [ 0x81u, 0x80u, 0x0u, 0xC8u, 0xE8u, 0x56u ];
    test:assertEquals(expected, VariableLengthQuantity.Encode(integers));
}

@test:Config
function manyMultiByteValues() {
    var integers = [ 0x2000u, 0x123456u, 0xFFFFFFFu, 0x0u, 0x3FFFu, 0x4000u ];
    var expected = [ 0xC0u, 0x0u, 0xC8u, 0xE8u, 0x56u, 0xFFu, 0xFFu, 0xFFu, 0x7Fu, 0x0u, 0xFFu, 0x7Fu, 0x81u, 0x80u, 0x0u ];
    test:assertEquals(expected, VariableLengthQuantity.Encode(integers));
}

@test:Config
function oneByte() {
    var integers = [ 0x7Fu ];
    var expected = [ 0x7Fu ];
    test:assertEquals(expected, VariableLengthQuantity.Decode(integers));
}

@test:Config
function twoBytes() {
    var integers = [ 0xC0u, 0x0u ];
    var expected = [ 0x2000u ];
    test:assertEquals(expected, VariableLengthQuantity.Decode(integers));
}

@test:Config
function threeBytes() {
    var integers = [ 0xFFu, 0xFFu, 0x7Fu ];
    var expected = [ 0x1FFFFFu ];
    test:assertEquals(expected, VariableLengthQuantity.Decode(integers));
}

@test:Config
function fourBytes() {
    var integers = [ 0x81u, 0x80u, 0x80u, 0x0u ];
    var expected = [ 0x200000u ];
    test:assertEquals(expected, VariableLengthQuantity.Decode(integers));
}

@test:Config
function maximum_32BitInteger() {
    var integers = [ 0x8Fu, 0xFFu, 0xFFu, 0xFFu, 0x7Fu ];
    var expected = [ 0xFFFFFFFFu ];
    test:assertEquals(expected, VariableLengthQuantity.Decode(integers));
}

@test:Config
function incompleteSequenceCausesError() {
    var integers = [ 0xFFu ];
    Assert.Throws<InvalidOperationException>(() => VariableLengthQuantity.Decode(integers));
}

@test:Config
function incompleteSequenceCausesErrorEvenIfValueIsZero() {
    var integers = [ 0x80u ];
    Assert.Throws<InvalidOperationException>(() => VariableLengthQuantity.Decode(integers));
}

@test:Config
function multipleValues() {
    var integers = [ 0xC0u, 0x0u, 0xC8u, 0xE8u, 0x56u, 0xFFu, 0xFFu, 0xFFu, 0x7Fu, 0x0u, 0xFFu, 0x7Fu, 0x81u, 0x80u, 0x0u ];
    var expected = [ 0x2000u, 0x123456u, 0xFFFFFFFu, 0x0u, 0x3FFFu, 0x4000u ];
    test:assertEquals(expected, VariableLengthQuantity.Decode(integers));
}
