import ballerina/test;

@test:Config
function listOfScores() {
    var sut = new HighScores([ 30, 50, 20, 70 ]);
    test:assertEquals([ 30, 50, 20, 70 ], sut.Scores());
}

@test:Config
function latestScore() {
    var sut = new HighScores([ 100, 0, 90, 30 ]);
    test:assertEquals(30, sut.Latest());
}

@test:Config
function personalBest() {
    var sut = new HighScores([ 40, 100, 70 ]);
    test:assertEquals(100, sut.PersonalBest());
}

@test:Config
function personalTopThreeFromAListOfScores() {
    var sut = new HighScores([ 10, 30, 90, 30, 100, 20, 10, 0, 30, 40, 40, 70, 70 ]);
    test:assertEquals([ 100, 90, 70 ], sut.PersonalTopThree());
}

@test:Config
function personalTopHighestToLowest() {
    var sut = new HighScores([ 20, 10, 30 ]);
    test:assertEquals([ 30, 20, 10 ], sut.PersonalTopThree());
}

@test:Config
function personalTopWhenThereIsATie() {
    var sut = new HighScores([ 40, 20, 40, 30 ]);
    test:assertEquals([ 40, 40, 30 ], sut.PersonalTopThree());
}

@test:Config
function personalTopWhenThereAreLessThan_3() {
    var sut = new HighScores([ 30, 70 ]);
    test:assertEquals([ 70, 30 ], sut.PersonalTopThree());
}

@test:Config
function personalTopWhenThereIsOnlyOne() {
    var sut = new HighScores([ 40 ]);
    test:assertEquals([ 40 ], sut.PersonalTopThree());
}

@test:Config
function latestScoreAfterPersonalTopScores() {
    var sut = new HighScores([ 70, 50, 20, 30 ]);
    var _ = sut.PersonalTopThree();
    test:assertEquals(30, sut.Latest());
}

@test:Config
function scoresAfterPersonalTopScores() {
    var sut = new HighScores([ 30, 50, 20, 70 ]);
    var _ = sut.PersonalTopThree();
    test:assertEquals([ 30, 50, 20, 70 ], sut.Scores());
}

@test:Config
function latestScoreAfterPersonalBest() {
    var sut = new HighScores([ 20, 70, 15, 25, 30 ]);
    var _ = sut.PersonalBest();
    test:assertEquals(30, sut.Latest());
}

@test:Config
function scoresAfterPersonalBest() {
    var sut = new HighScores([ 20, 70, 15, 25, 30 ]);
    var _ = sut.PersonalBest();
    test:assertEquals([ 20, 70, 15, 25, 30 ], sut.Scores());
}
