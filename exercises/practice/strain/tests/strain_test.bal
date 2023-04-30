import ballerina/test;

@test:Config
function emptyKeep() {
    test:assertEquals(new LinkedList<int>(), new LinkedList<int>().Keep(x => x < 10));
}

@test:Config
function keepEverything() {
    test:assertEquals(new HashSet<int> { 1, 2, 3 }, new HashSet<int> { 1, 2, 3 }.Keep(x => x < 10));
}

@test:Config
function keepFirstAndLast() {
    test:assertEquals([ 1, 3 ], [ 1, 2, 3 ].Keep(x => x % 2 != 0));
}

@test:Config
function keepNeitherFirstNorLast() {
    test:assertEquals([ 2, 4 ], [ 1, 2, 3, 4, 5 ].Keep(x => x % 2 == 0));
}

@test:Config
function keepStrings() {
    var words = "apple zebra banana zombies cherimoya zelot".Split(' ');
    test:assertEquals("zebra zombies zelot".Split(' '), words.Keep(x => x.StartsWith("z")));
}

@test:Config
function keepArrays() {
    var actual = new[]
        {
            [ 1, 2, 3 ],
            [ 5, 5, 5 ],
            [ 5, 1, 2 ],
            [ 2, 1, 2 ],
            [ 1, 5, 2 ],
            [ 2, 2, 1 ],
            [ 1, 2, 5 ]
        };
    var expected = [ new[] { 5, 5, 5 ], [ 5, 1, 2 ], [ 1, 5, 2 ], [ 1, 2, 5 ] };
    test:assertEquals(expected, actual.Keep(x => x.Contains(5)));
}

@test:Config
function emptyDiscard() {
    test:assertEquals(new LinkedList<int>(), new LinkedList<int>().Discard(x => x < 10));
}

@test:Config
function discardNothing() {
    test:assertEquals(new HashSet<int> { 1, 2, 3 }, new HashSet<int> { 1, 2, 3 }.Discard(x => x > 10));
}

@test:Config
function discardFirstAndLast() {
    test:assertEquals([ 2 ], [ 1, 2, 3 ].Discard(x => x % 2 != 0));
}

@test:Config
function discardNeitherFirstNorLast() {
    test:assertEquals([ 1, 3, 5 ], [ 1, 2, 3, 4, 5 ].Discard(x => x % 2 == 0));
}

@test:Config
function discardStrings() {
    var words = "apple zebra banana zombies cherimoya zelot".Split(' ');
    test:assertEquals("apple banana cherimoya".Split(' '), words.Discard(x => x.StartsWith("z")));
}

@test:Config
function discardArrays() {
    var actual = new[]
        {
            [ 1, 2, 3 ],
            [ 5, 5, 5 ],
            [ 5, 1, 2 ],
            [ 2, 1, 2 ],
            [ 1, 5, 2 ],
            [ 2, 2, 1 ],
            [ 1, 2, 5 ]
        };
    var expected = [ new[] { 1, 2, 3 ], [ 2, 1, 2 ], [ 2, 2, 1 ] };
    test:assertEquals(expected, actual.Discard(x => x.Contains(5)));
}
