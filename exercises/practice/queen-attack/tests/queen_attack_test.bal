import ballerina/test;

@test:Config
function queenWithAValidPosition() {
    var actual = QueenAttack.Create(2, 2);
}

@test:Config
function queenMustHavePositiveRow() {
    Assert.Throws<ArgumentOutOfRangeException>(() => QueenAttack.Create(-2, 2));
}

@test:Config
function queenMustHaveRowOnBoard() {
    Assert.Throws<ArgumentOutOfRangeException>(() => QueenAttack.Create(8, 4));
}

@test:Config
function queenMustHavePositiveColumn() {
    Assert.Throws<ArgumentOutOfRangeException>(() => QueenAttack.Create(2, -2));
}

@test:Config
function queenMustHaveColumnOnBoard() {
    Assert.Throws<ArgumentOutOfRangeException>(() => QueenAttack.Create(4, 8));
}

@test:Config
function cannotAttack() {
    var whiteQueen = QueenAttack.Create(2,4);
    var blackQueen = QueenAttack.Create(6,6);
    test:assertFalse(QueenAttack.CanAttack(whiteQueen, blackQueen));
}

@test:Config
function canAttackOnSameRow() {
    var whiteQueen = QueenAttack.Create(2,4);
    var blackQueen = QueenAttack.Create(2,6);
    test:assertTrue(QueenAttack.CanAttack(whiteQueen, blackQueen));
}

@test:Config
function canAttackOnSameColumn() {
    var whiteQueen = QueenAttack.Create(4,5);
    var blackQueen = QueenAttack.Create(2,5);
    test:assertTrue(QueenAttack.CanAttack(whiteQueen, blackQueen));
}

@test:Config
function canAttackOnFirstDiagonal() {
    var whiteQueen = QueenAttack.Create(2,2);
    var blackQueen = QueenAttack.Create(0,4);
    test:assertTrue(QueenAttack.CanAttack(whiteQueen, blackQueen));
}

@test:Config
function canAttackOnSecondDiagonal() {
    var whiteQueen = QueenAttack.Create(2,2);
    var blackQueen = QueenAttack.Create(3,1);
    test:assertTrue(QueenAttack.CanAttack(whiteQueen, blackQueen));
}

@test:Config
function canAttackOnThirdDiagonal() {
    var whiteQueen = QueenAttack.Create(2,2);
    var blackQueen = QueenAttack.Create(1,1);
    test:assertTrue(QueenAttack.CanAttack(whiteQueen, blackQueen));
}

@test:Config
function canAttackOnFourthDiagonal() {
    var whiteQueen = QueenAttack.Create(1,7);
    var blackQueen = QueenAttack.Create(0,6);
    test:assertTrue(QueenAttack.CanAttack(whiteQueen, blackQueen));
}

@test:Config
function cannotAttackIfFallingDiagonalsAreOnlyTheSameWhenReflectedAcrossTheLongestFallingDiagonal() {
    var whiteQueen = QueenAttack.Create(4,1);
    var blackQueen = QueenAttack.Create(2,5);
    test:assertFalse(QueenAttack.CanAttack(whiteQueen, blackQueen));
}
