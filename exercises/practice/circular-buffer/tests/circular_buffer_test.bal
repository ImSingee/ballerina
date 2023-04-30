import ballerina/test;

@test:Config
function readingEmptyBufferShouldFail() {
    var buffer = new CircularBuffer<int>(capacity: 1);
    Assert.Throws<InvalidOperationException>(() => buffer.Read());
}

@test:Config
function canReadAnItemJustWritten() {
    var buffer = new CircularBuffer<int>(capacity: 1);
    buffer.Write(1);
    test:assertEquals(1, buffer.Read());
}

@test:Config
function eachItemMayOnlyBeReadOnce() {
    var buffer = new CircularBuffer<int>(capacity: 1);
    buffer.Write(1);
    test:assertEquals(1, buffer.Read());
    Assert.Throws<InvalidOperationException>(() => buffer.Read());
}

@test:Config
function itemsAreReadInTheOrderTheyAreWritten() {
    var buffer = new CircularBuffer<int>(capacity: 2);
    buffer.Write(1);
    buffer.Write(2);
    test:assertEquals(1, buffer.Read());
    test:assertEquals(2, buffer.Read());
}

@test:Config
function fullBufferCantBeWrittenTo() {
    var buffer = new CircularBuffer<int>(capacity: 1);
    buffer.Write(1);
    Assert.Throws<InvalidOperationException>(() => buffer.Write(2));
}

@test:Config
function aReadFreesUpCapacityForAnotherWrite() {
    var buffer = new CircularBuffer<int>(capacity: 1);
    buffer.Write(1);
    test:assertEquals(1, buffer.Read());
    buffer.Write(2);
    test:assertEquals(2, buffer.Read());
}

@test:Config
function readPositionIsMaintainedEvenAcrossMultipleWrites() {
    var buffer = new CircularBuffer<int>(capacity: 3);
    buffer.Write(1);
    buffer.Write(2);
    test:assertEquals(1, buffer.Read());
    buffer.Write(3);
    test:assertEquals(2, buffer.Read());
    test:assertEquals(3, buffer.Read());
}

@test:Config
function itemsClearedOutOfBufferCantBeRead() {
    var buffer = new CircularBuffer<int>(capacity: 1);
    buffer.Write(1);
    buffer.Clear();
    Assert.Throws<InvalidOperationException>(() => buffer.Read());
}

@test:Config
function clearFreesUpCapacityForAnotherWrite() {
    var buffer = new CircularBuffer<int>(capacity: 1);
    buffer.Write(1);
    buffer.Clear();
    buffer.Write(2);
    test:assertEquals(2, buffer.Read());
}

@test:Config
function clearDoesNothingOnEmptyBuffer() {
    var buffer = new CircularBuffer<int>(capacity: 1);
    buffer.Clear();
    buffer.Write(1);
    test:assertEquals(1, buffer.Read());
}

@test:Config
function overwriteActsLikeWriteOnNonFullBuffer() {
    var buffer = new CircularBuffer<int>(capacity: 2);
    buffer.Write(1);
    buffer.Overwrite(2);
    test:assertEquals(1, buffer.Read());
    test:assertEquals(2, buffer.Read());
}

@test:Config
function overwriteReplacesTheOldestItemOnFullBuffer() {
    var buffer = new CircularBuffer<int>(capacity: 2);
    buffer.Write(1);
    buffer.Write(2);
    buffer.Overwrite(3);
    test:assertEquals(2, buffer.Read());
    test:assertEquals(3, buffer.Read());
}

@test:Config
function overwriteReplacesTheOldestItemRemainingInBufferFollowingARead() {
    var buffer = new CircularBuffer<int>(capacity: 3);
    buffer.Write(1);
    buffer.Write(2);
    buffer.Write(3);
    test:assertEquals(1, buffer.Read());
    buffer.Write(4);
    buffer.Overwrite(5);
    test:assertEquals(3, buffer.Read());
    test:assertEquals(4, buffer.Read());
    test:assertEquals(5, buffer.Read());
}

@test:Config
function initialClearDoesNotAffectWrappingAround() {
    var buffer = new CircularBuffer<int>(capacity: 2);
    buffer.Clear();
    buffer.Write(1);
    buffer.Write(2);
    buffer.Overwrite(3);
    buffer.Overwrite(4);
    test:assertEquals(3, buffer.Read());
    test:assertEquals(4, buffer.Read());
    Assert.Throws<InvalidOperationException>(() => buffer.Read());
}
