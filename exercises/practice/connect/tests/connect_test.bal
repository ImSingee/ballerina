import ballerina/test;

@test:Config
function anEmptyBoardHasNoWinner() {
    var board = new[]
    {
        ". . . . .",
        " . . . . .",
        "  . . . . .",
        "   . . . . .",
        "    . . . . ."
    };
    var sut = new Connect(board);
    test:assertEquals(ConnectWinner.None, sut.Result());
}

@test:Config
function xCanWinOnA_1x1Board() {
    var board = new[]
    {
        "X"
    };
    var sut = new Connect(board);
    test:assertEquals(ConnectWinner.Black, sut.Result());
}

@test:Config
function oCanWinOnA_1x1Board() {
    var board = new[]
    {
        "O"
    };
    var sut = new Connect(board);
    test:assertEquals(ConnectWinner.White, sut.Result());
}

@test:Config
function onlyEdgesDoesNotMakeAWinner() {
    var board = new[]
    {
        "O O O X",
        " X . . X",
        "  X . . X",
        "   X O O O"
    };
    var sut = new Connect(board);
    test:assertEquals(ConnectWinner.None, sut.Result());
}

@test:Config
function illegalDiagonalDoesNotMakeAWinner() {
    var board = new[]
    {
        "X O . .",
        " O X X X",
        "  O X O .",
        "   . O X .",
        "    X X O O"
    };
    var sut = new Connect(board);
    test:assertEquals(ConnectWinner.None, sut.Result());
}

@test:Config
function nobodyWinsCrossingAdjacentAngles() {
    var board = new[]
    {
        "X . . .",
        " . X O .",
        "  O . X O",
        "   . O . X",
        "    . . O ."
    };
    var sut = new Connect(board);
    test:assertEquals(ConnectWinner.None, sut.Result());
}

@test:Config
function xWinsCrossingFromLeftToRight() {
    var board = new[]
    {
        ". O . .",
        " O X X X",
        "  O X O .",
        "   X X O X",
        "    . O X ."
    };
    var sut = new Connect(board);
    test:assertEquals(ConnectWinner.Black, sut.Result());
}

@test:Config
function oWinsCrossingFromTopToBottom() {
    var board = new[]
    {
        ". O . .",
        " O X X X",
        "  O O O .",
        "   X X O X",
        "    . O X ."
    };
    var sut = new Connect(board);
    test:assertEquals(ConnectWinner.White, sut.Result());
}

@test:Config
function xWinsUsingAConvolutedPath() {
    var board = new[]
    {
        ". X X . .",
        " X . X . X",
        "  . X . X .",
        "   . X X . .",
        "    O O O O O"
    };
    var sut = new Connect(board);
    test:assertEquals(ConnectWinner.Black, sut.Result());
}

@test:Config
function xWinsUsingASpiralPath() {
    var board = new[]
    {
        "O X X X X X X X X",
        " O X O O O O O O O",
        "  O X O X X X X X O",
        "   O X O X O O O X O",
        "    O X O X X X O X O",
        "     O X O O O X O X O",
        "      O X X X X X O X O",
        "       O O O O O O O X O",
        "        X X X X X X X X O"
    };
    var sut = new Connect(board);
    test:assertEquals(ConnectWinner.Black, sut.Result());
}