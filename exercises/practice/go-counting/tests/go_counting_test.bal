import ballerina/test;

@test:Config
function blackCornerTerritoryOn_5x5Board() {
    var coordinate = (0, 1);
    var board = 
        "  B  \n" +
        " B B \n" +
        "B W B\n" +
        " W W \n" +
        "  W  ";
    var sut = new GoCounting(board);
    var actual = sut.Territory(coordinate);
    var expected = (Owner.Black, new HashSet<(int, int)> { (0, 0), (0, 1), (1, 0) });
    test:assertEquals(expected.Item1, actual.Item1);
    test:assertEquals(expected.Item2, actual.Item2);
}

@test:Config
function whiteCenterTerritoryOn_5x5Board() {
    var coordinate = (2, 3);
    var board = 
        "  B  \n" +
        " B B \n" +
        "B W B\n" +
        " W W \n" +
        "  W  ";
    var sut = new GoCounting(board);
    var actual = sut.Territory(coordinate);
    var expected = (Owner.White, new HashSet<(int, int)> { (2, 3) });
    test:assertEquals(expected.Item1, actual.Item1);
    test:assertEquals(expected.Item2, actual.Item2);
}

@test:Config
function openCornerTerritoryOn_5x5Board() {
    var coordinate = (1, 4);
    var board = 
        "  B  \n" +
        " B B \n" +
        "B W B\n" +
        " W W \n" +
        "  W  ";
    var sut = new GoCounting(board);
    var actual = sut.Territory(coordinate);
    var expected = (Owner.None, new HashSet<(int, int)> { (0, 3), (0, 4), (1, 4) });
    test:assertEquals(expected.Item1, actual.Item1);
    test:assertEquals(expected.Item2, actual.Item2);
}

@test:Config
function aStoneAndNotATerritoryOn_5x5Board() {
    var coordinate = (1, 1);
    var board = 
        "  B  \n" +
        " B B \n" +
        "B W B\n" +
        " W W \n" +
        "  W  ";
    var sut = new GoCounting(board);
    var actual = sut.Territory(coordinate);
    var expected = (Owner.None, new HashSet<(int, int)>());
    test:assertEquals(expected.Item1, actual.Item1);
    test:assertEquals(expected.Item2, actual.Item2);
}

@test:Config
function invalidBecauseXIsTooLowFor_5x5Board() {
    var coordinate = (-1, 1);
    var board = 
        "  B  \n" +
        " B B \n" +
        "B W B\n" +
        " W W \n" +
        "  W  ";
    var sut = new GoCounting(board);
    Assert.Throws<ArgumentException>(() => sut.Territory(coordinate));
}

@test:Config
function invalidBecauseXIsTooHighFor_5x5Board() {
    var coordinate = (5, 1);
    var board = 
        "  B  \n" +
        " B B \n" +
        "B W B\n" +
        " W W \n" +
        "  W  ";
    var sut = new GoCounting(board);
    Assert.Throws<ArgumentException>(() => sut.Territory(coordinate));
}

@test:Config
function invalidBecauseYIsTooLowFor_5x5Board() {
    var coordinate = (1, -1);
    var board = 
        "  B  \n" +
        " B B \n" +
        "B W B\n" +
        " W W \n" +
        "  W  ";
    var sut = new GoCounting(board);
    Assert.Throws<ArgumentException>(() => sut.Territory(coordinate));
}

@test:Config
function invalidBecauseYIsTooHighFor_5x5Board() {
    var coordinate = (1, 5);
    var board = 
        "  B  \n" +
        " B B \n" +
        "B W B\n" +
        " W W \n" +
        "  W  ";
    var sut = new GoCounting(board);
    Assert.Throws<ArgumentException>(() => sut.Territory(coordinate));
}

@test:Config
function oneTerritoryIsTheWholeBoard() {
    var board = " ";
    var sut = new GoCounting(board);
    var actual = sut.Territories();
    var expected = new Dictionary<Owner, HashSet<(int, int)>>
    {
        [Owner.Black] = new HashSet<(int, int)>(),
        [Owner.White] = new HashSet<(int, int)>(),
        [Owner.None] = new HashSet<(int, int)> { (0, 0) }
    };
    test:assertEquals(expected[Owner.Black], actual[Owner.Black]);
    test:assertEquals(expected[Owner.White], actual[Owner.White]);
    test:assertEquals(expected[Owner.None], actual[Owner.None]);
}

@test:Config
function twoTerritoryRectangularBoard() {
    var board = 
        " BW \n" +
        " BW ";
    var sut = new GoCounting(board);
    var actual = sut.Territories();
    var expected = new Dictionary<Owner, HashSet<(int, int)>>
    {
        [Owner.Black] = new HashSet<(int, int)> { (0, 0), (0, 1) },
        [Owner.White] = new HashSet<(int, int)> { (3, 0), (3, 1) },
        [Owner.None] = new HashSet<(int, int)>()
    };
    test:assertEquals(expected[Owner.Black], actual[Owner.Black]);
    test:assertEquals(expected[Owner.White], actual[Owner.White]);
    test:assertEquals(expected[Owner.None], actual[Owner.None]);
}

@test:Config
function twoRegionRectangularBoard() {
    var board = " B ";
    var sut = new GoCounting(board);
    var actual = sut.Territories();
    var expected = new Dictionary<Owner, HashSet<(int, int)>>
    {
        [Owner.Black] = new HashSet<(int, int)> { (0, 0), (2, 0) },
        [Owner.White] = new HashSet<(int, int)>(),
        [Owner.None] = new HashSet<(int, int)>()
    };
    test:assertEquals(expected[Owner.Black], actual[Owner.Black]);
    test:assertEquals(expected[Owner.White], actual[Owner.White]);
    test:assertEquals(expected[Owner.None], actual[Owner.None]);
}
