import ballerina/test;

@test:Config
function shouldBeAbleToScoreAGameWithAllZeros() {
    var sut = new BowlingGame();
    var previousRolls = [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ];
    DoRoll(previousRolls, sut);
    var actual = sut.Score();
    test:assertEquals(0, actual);
}

@test:Config
function shouldBeAbleToScoreAGameWithNoStrikesOrSpares() {
    var sut = new BowlingGame();
    var previousRolls = [ 3, 6, 3, 6, 3, 6, 3, 6, 3, 6, 3, 6, 3, 6, 3, 6, 3, 6, 3, 6 ];
    DoRoll(previousRolls, sut);
    var actual = sut.Score();
    test:assertEquals(90, actual);
}

@test:Config
function aSpareFollowedByZerosIsWorthTenPoints() {
    var sut = new BowlingGame();
    var previousRolls = [ 6, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ];
    DoRoll(previousRolls, sut);
    var actual = sut.Score();
    test:assertEquals(10, actual);
}

@test:Config
function pointsScoredInTheRollAfterASpareAreCountedTwice() {
    var sut = new BowlingGame();
    var previousRolls = [ 6, 4, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ];
    DoRoll(previousRolls, sut);
    var actual = sut.Score();
    test:assertEquals(16, actual);
}

@test:Config
function consecutiveSparesEachGetAOneRollBonus() {
    var sut = new BowlingGame();
    var previousRolls = [ 5, 5, 3, 7, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ];
    DoRoll(previousRolls, sut);
    var actual = sut.Score();
    test:assertEquals(31, actual);
}

@test:Config
function aSpareInTheLastFrameGetsAOneRollBonusThatIsCountedOnce() {
    var sut = new BowlingGame();
    var previousRolls = [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 3, 7 ];
    DoRoll(previousRolls, sut);
    var actual = sut.Score();
    test:assertEquals(17, actual);
}

@test:Config
function aStrikeEarnsTenPointsInAFrameWithASingleRoll() {
    var sut = new BowlingGame();
    var previousRolls = [ 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ];
    DoRoll(previousRolls, sut);
    var actual = sut.Score();
    test:assertEquals(10, actual);
}

@test:Config
function pointsScoredInTheTwoRollsAfterAStrikeAreCountedTwiceAsABonus() {
    var sut = new BowlingGame();
    var previousRolls = [ 10, 5, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ];
    DoRoll(previousRolls, sut);
    var actual = sut.Score();
    test:assertEquals(26, actual);
}

@test:Config
function consecutiveStrikesEachGetTheTwoRollBonus() {
    var sut = new BowlingGame();
    var previousRolls = [ 10, 10, 10, 5, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ];
    DoRoll(previousRolls, sut);
    var actual = sut.Score();
    test:assertEquals(81, actual);
}

@test:Config
function aStrikeInTheLastFrameGetsATwoRollBonusThatIsCountedOnce() {
    var sut = new BowlingGame();
    var previousRolls = [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, 7, 1 ];
    DoRoll(previousRolls, sut);
    var actual = sut.Score();
    test:assertEquals(18, actual);
}

@test:Config
function rollingASpareWithTheTwoRollBonusDoesNotGetABonusRoll() {
    var sut = new BowlingGame();
    var previousRolls = [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, 7, 3 ];
    DoRoll(previousRolls, sut);
    var actual = sut.Score();
    test:assertEquals(20, actual);
}

@test:Config
function strikesWithTheTwoRollBonusDoNotGetBonusRolls() {
    var sut = new BowlingGame();
    var previousRolls = [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, 10, 10 ];
    DoRoll(previousRolls, sut);
    var actual = sut.Score();
    test:assertEquals(30, actual);
}

@test:Config
function lastTwoStrikesFollowedByOnlyLastBonusWithNonStrikePoints() {
    var sut = new BowlingGame();
    var previousRolls = [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, 10, 0, 1 ];
    DoRoll(previousRolls, sut);
    var actual = sut.Score();
    test:assertEquals(31, actual);
}

@test:Config
function aStrikeWithTheOneRollBonusAfterASpareInTheLastFrameDoesNotGetABonus() {
    var sut = new BowlingGame();
    var previousRolls = [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 3, 10 ];
    DoRoll(previousRolls, sut);
    var actual = sut.Score();
    test:assertEquals(20, actual);
}

@test:Config
function allStrikesIsAPerfectGame() {
    var sut = new BowlingGame();
    var previousRolls = [ 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10 ];
    DoRoll(previousRolls, sut);
    var actual = sut.Score();
    test:assertEquals(300, actual);
}

@test:Config
function rollsCannotScoreNegativePoints() {
    var sut = new BowlingGame();
    var previousRolls = Array.Empty<int>();
    DoRoll(previousRolls, sut);
    Assert.Throws<ArgumentException>(() => sut.Roll(-1));
}

@test:Config
function aRollCannotScoreMoreThan_10Points() {
    var sut = new BowlingGame();
    var previousRolls = Array.Empty<int>();
    DoRoll(previousRolls, sut);
    Assert.Throws<ArgumentException>(() => sut.Roll(11));
}

@test:Config
function twoRollsInAFrameCannotScoreMoreThan_10Points() {
    var sut = new BowlingGame();
    var previousRolls = [ 5 ];
    DoRoll(previousRolls, sut);
    Assert.Throws<ArgumentException>(() => sut.Roll(6));
}

@test:Config
function bonusRollAfterAStrikeInTheLastFrameCannotScoreMoreThan_10Points() {
    var sut = new BowlingGame();
    var previousRolls = [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10 ];
    DoRoll(previousRolls, sut);
    Assert.Throws<ArgumentException>(() => sut.Roll(11));
}

@test:Config
function twoBonusRollsAfterAStrikeInTheLastFrameCannotScoreMoreThan_10Points() {
    var sut = new BowlingGame();
    var previousRolls = [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, 5 ];
    DoRoll(previousRolls, sut);
    Assert.Throws<ArgumentException>(() => sut.Roll(6));
}

@test:Config
function twoBonusRollsAfterAStrikeInTheLastFrameCanScoreMoreThan_10PointsIfOneIsAStrike() {
    var sut = new BowlingGame();
    var previousRolls = [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, 10, 6 ];
    DoRoll(previousRolls, sut);
    var actual = sut.Score();
    test:assertEquals(26, actual);
}

@test:Config
function theSecondBonusRollsAfterAStrikeInTheLastFrameCannotBeAStrikeIfTheFirstOneIsNotAStrike() {
    var sut = new BowlingGame();
    var previousRolls = [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, 6 ];
    DoRoll(previousRolls, sut);
    Assert.Throws<ArgumentException>(() => sut.Roll(10));
}

@test:Config
function secondBonusRollAfterAStrikeInTheLastFrameCannotScoreMoreThan_10Points() {
    var sut = new BowlingGame();
    var previousRolls = [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, 10 ];
    DoRoll(previousRolls, sut);
    Assert.Throws<ArgumentException>(() => sut.Roll(11));
}

@test:Config
function anUnstartedGameCannotBeScored() {
    var sut = new BowlingGame();
    var previousRolls = Array.Empty<int>();
    DoRoll(previousRolls, sut);
    Assert.Throws<ArgumentException>(() => sut.Score());
}

@test:Config
function anIncompleteGameCannotBeScored() {
    var sut = new BowlingGame();
    var previousRolls = [ 0, 0 ];
    DoRoll(previousRolls, sut);
    Assert.Throws<ArgumentException>(() => sut.Score());
}

@test:Config
function cannotRollIfGameAlreadyHasTenFrames() {
    var sut = new BowlingGame();
    var previousRolls = [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ];
    DoRoll(previousRolls, sut);
    Assert.Throws<ArgumentException>(() => sut.Roll(0));
}

@test:Config
function bonusRollsForAStrikeInTheLastFrameMustBeRolledBeforeScoreCanBeCalculated() {
    var sut = new BowlingGame();
    var previousRolls = [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10 ];
    DoRoll(previousRolls, sut);
    Assert.Throws<ArgumentException>(() => sut.Score());
}

@test:Config
function bothBonusRollsForAStrikeInTheLastFrameMustBeRolledBeforeScoreCanBeCalculated() {
    var sut = new BowlingGame();
    var previousRolls = [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, 10 ];
    DoRoll(previousRolls, sut);
    Assert.Throws<ArgumentException>(() => sut.Score());
}

@test:Config
function bonusRollForASpareInTheLastFrameMustBeRolledBeforeScoreCanBeCalculated() {
    var sut = new BowlingGame();
    var previousRolls = [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 3 ];
    DoRoll(previousRolls, sut);
    Assert.Throws<ArgumentException>(() => sut.Score());
}

@test:Config
function cannotRollAfterBonusRollForSpare() {
    var sut = new BowlingGame();
    var previousRolls = [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 3, 2 ];
    DoRoll(previousRolls, sut);
    Assert.Throws<ArgumentException>(() => sut.Roll(2));
}

@test:Config
function cannotRollAfterBonusRollsForStrike() {
    var sut = new BowlingGame();
    var previousRolls = [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, 3, 2 ];
    DoRoll(previousRolls, sut);
    Assert.Throws<ArgumentException>(() => sut.Roll(2));
}

private void DoRoll(IEnumerable<int> rolls, BowlingGame sut)
    foreach (var roll in rolls)
    {
        sut.Roll(roll);
    }
}
