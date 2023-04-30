import ballerina/test;

@test:Config
function emptyInputEmptyOutput() {
    var dominoes = Array.Empty<(int, int)>();
    test:assertTrue(Dominoes.CanChain(dominoes));
}

@test:Config
function singletonInputSingletonOutput() {
    var dominoes = [ (1, 1) ];
    test:assertTrue(Dominoes.CanChain(dominoes));
}

@test:Config
function singletonThatCantBeChained() {
    var dominoes = [ (1, 2) ];
    test:assertFalse(Dominoes.CanChain(dominoes));
}

@test:Config
function threeElements() {
    var dominoes = [ (1, 2), (3, 1), (2, 3) ];
    test:assertTrue(Dominoes.CanChain(dominoes));
}

@test:Config
function canReverseDominoes() {
    var dominoes = [ (1, 2), (1, 3), (2, 3) ];
    test:assertTrue(Dominoes.CanChain(dominoes));
}

@test:Config
function cantBeChained() {
    var dominoes = [ (1, 2), (4, 1), (2, 3) ];
    test:assertFalse(Dominoes.CanChain(dominoes));
}

@test:Config
function disconnectedSimple() {
    var dominoes = [ (1, 1), (2, 2) ];
    test:assertFalse(Dominoes.CanChain(dominoes));
}

@test:Config
function disconnectedDoubleLoop() {
    var dominoes = [ (1, 2), (2, 1), (3, 4), (4, 3) ];
    test:assertFalse(Dominoes.CanChain(dominoes));
}

@test:Config
function disconnectedSingleIsolated() {
    var dominoes = [ (1, 2), (2, 3), (3, 1), (4, 4) ];
    test:assertFalse(Dominoes.CanChain(dominoes));
}

@test:Config
function needBacktrack() {
    var dominoes = [ (1, 2), (2, 3), (3, 1), (2, 4), (2, 4) ];
    test:assertTrue(Dominoes.CanChain(dominoes));
}

@test:Config
function separateLoops() {
    var dominoes = [ (1, 2), (2, 3), (3, 1), (1, 1), (2, 2), (3, 3) ];
    test:assertTrue(Dominoes.CanChain(dominoes));
}

@test:Config
function nineElements() {
    var dominoes = [ (1, 2), (5, 3), (3, 1), (1, 2), (2, 4), (1, 6), (2, 3), (3, 4), (5, 6) ];
    test:assertTrue(Dominoes.CanChain(dominoes));
}

@test:Config
function separateThreeDominoLoops() {
    var dominoes = [ (1, 2), (2, 3), (3, 1), (4, 5), (5, 6), (6, 4) ];
    test:assertFalse(Dominoes.CanChain(dominoes));
}
