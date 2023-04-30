import ballerina/test;

@test:Config
function emptyAccumulationProducesEmptyAccumulation() {
    test:assertEquals([].Accumulate(x => x * x));
}

@test:Config
function accumulateSquares() {
    test:assertEquals([ 1, 4, 9 ], [ 1, 2, 3 ].Accumulate(x => x * x));
}

@test:Config
function accumulateUpcases() {
    test:assertEquals([ "HELLO", "WORLD" ], [ "hello", "world" ].Accumulate(x => x.ToUpper()));
}

@test:Config
function accumulateReversedStrings() {
    test:assertEquals("eht kciuq nworb xof cte".Split(' '), "the quick brown fox etc".Split(' ').Accumulate(Reverse));
}

private static string Reverse(string value)
    var array = value.ToCharArray();
    Array.Reverse(array);
    return new string(array);
}

@test:Config
function accumulateWithinAccumulate() {
    var actual = [ "a", "b", "c" ].Accumulate(c =>
        string.Join(" ", [ "1", "2", "3" ].Accumulate(d => c + d)));
    test:assertEquals([ "a1 a2 a3", "b1 b2 b3", "c1 c2 c3" ], actual);
}

@test:Config
function accumulateIsLazy() {
    var counter = 0;
    var accumulation = [ 1, 2, 3 ].Accumulate(x => x * counter++);

    test:assertEquals(0, counter);
    accumulation.ToList();
    test:assertEquals(3, counter);
}

@test:Config
function accumulateAllowsDifferentReturnType() {
    test:assertEquals([ "1", "2", "3" ], [ 1, 2, 3 ].Accumulate(x => x.ToString()));
}
