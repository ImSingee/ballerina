import ballerina/test;

@test:Config
function onTheHour() {
    var sut = new Clock(8, 0);
    test:assertEquals("08:00", sut.ToString());
}

@test:Config
function pastTheHour() {
    var sut = new Clock(11, 9);
    test:assertEquals("11:09", sut.ToString());
}

@test:Config
function midnightIsZeroHours() {
    var sut = new Clock(24, 0);
    test:assertEquals("00:00", sut.ToString());
}

@test:Config
function hourRollsOver() {
    var sut = new Clock(25, 0);
    test:assertEquals("01:00", sut.ToString());
}

@test:Config
function hourRollsOverContinuously() {
    var sut = new Clock(100, 0);
    test:assertEquals("04:00", sut.ToString());
}

@test:Config
function sixtyMinutesIsNextHour() {
    var sut = new Clock(1, 60);
    test:assertEquals("02:00", sut.ToString());
}

@test:Config
function minutesRollOver() {
    var sut = new Clock(0, 160);
    test:assertEquals("02:40", sut.ToString());
}

@test:Config
function minutesRollOverContinuously() {
    var sut = new Clock(0, 1723);
    test:assertEquals("04:43", sut.ToString());
}

@test:Config
function hourAndMinutesRollOver() {
    var sut = new Clock(25, 160);
    test:assertEquals("03:40", sut.ToString());
}

@test:Config
function hourAndMinutesRollOverContinuously() {
    var sut = new Clock(201, 3001);
    test:assertEquals("11:01", sut.ToString());
}

@test:Config
function hourAndMinutesRollOverToExactlyMidnight() {
    var sut = new Clock(72, 8640);
    test:assertEquals("00:00", sut.ToString());
}

@test:Config
function negativeHour() {
    var sut = new Clock(-1, 15);
    test:assertEquals("23:15", sut.ToString());
}

@test:Config
function negativeHourRollsOver() {
    var sut = new Clock(-25, 0);
    test:assertEquals("23:00", sut.ToString());
}

@test:Config
function negativeHourRollsOverContinuously() {
    var sut = new Clock(-91, 0);
    test:assertEquals("05:00", sut.ToString());
}

@test:Config
function negativeMinutes() {
    var sut = new Clock(1, -40);
    test:assertEquals("00:20", sut.ToString());
}

@test:Config
function negativeMinutesRollOver() {
    var sut = new Clock(1, -160);
    test:assertEquals("22:20", sut.ToString());
}

@test:Config
function negativeMinutesRollOverContinuously() {
    var sut = new Clock(1, -4820);
    test:assertEquals("16:40", sut.ToString());
}

@test:Config
function negativeSixtyMinutesIsPreviousHour() {
    var sut = new Clock(2, -60);
    test:assertEquals("01:00", sut.ToString());
}

@test:Config
function negativeHourAndMinutesBothRollOver() {
    var sut = new Clock(-25, -160);
    test:assertEquals("20:20", sut.ToString());
}

@test:Config
function negativeHourAndMinutesBothRollOverContinuously() {
    var sut = new Clock(-121, -5810);
    test:assertEquals("22:10", sut.ToString());
}

@test:Config
function addMinutes() {
    var sut = new Clock(10, 0);
    test:assertEquals("10:03", sut.Add(3).ToString());
}

@test:Config
function addNoMinutes() {
    var sut = new Clock(6, 41);
    test:assertEquals("06:41", sut.Add(0).ToString());
}

@test:Config
function addToNextHour() {
    var sut = new Clock(0, 45);
    test:assertEquals("01:25", sut.Add(40).ToString());
}

@test:Config
function addMoreThanOneHour() {
    var sut = new Clock(10, 0);
    test:assertEquals("11:01", sut.Add(61).ToString());
}

@test:Config
function addMoreThanTwoHoursWithCarry() {
    var sut = new Clock(0, 45);
    test:assertEquals("03:25", sut.Add(160).ToString());
}

@test:Config
function addAcrossMidnight() {
    var sut = new Clock(23, 59);
    test:assertEquals("00:01", sut.Add(2).ToString());
}

@test:Config
function addMoreThanOneDay_1500Min_25Hrs_() {
    var sut = new Clock(5, 32);
    test:assertEquals("06:32", sut.Add(1500).ToString());
}

@test:Config
function addMoreThanTwoDays() {
    var sut = new Clock(1, 1);
    test:assertEquals("11:21", sut.Add(3500).ToString());
}

@test:Config
function subtractMinutes() {
    var sut = new Clock(10, 3);
    test:assertEquals("10:00", sut.Subtract(3).ToString());
}

@test:Config
function subtractToPreviousHour() {
    var sut = new Clock(10, 3);
    test:assertEquals("09:33", sut.Subtract(30).ToString());
}

@test:Config
function subtractMoreThanAnHour() {
    var sut = new Clock(10, 3);
    test:assertEquals("08:53", sut.Subtract(70).ToString());
}

@test:Config
function subtractAcrossMidnight() {
    var sut = new Clock(0, 3);
    test:assertEquals("23:59", sut.Subtract(4).ToString());
}

@test:Config
function subtractMoreThanTwoHours() {
    var sut = new Clock(0, 0);
    test:assertEquals("21:20", sut.Subtract(160).ToString());
}

@test:Config
function subtractMoreThanTwoHoursWithBorrow() {
    var sut = new Clock(6, 15);
    test:assertEquals("03:35", sut.Subtract(160).ToString());
}

@test:Config
function subtractMoreThanOneDay_1500Min_25Hrs_() {
    var sut = new Clock(5, 32);
    test:assertEquals("04:32", sut.Subtract(1500).ToString());
}

@test:Config
function subtractMoreThanTwoDays() {
    var sut = new Clock(2, 20);
    test:assertEquals("00:20", sut.Subtract(3000).ToString());
}

@test:Config
function clocksWithSameTime() {
    var sut = new Clock(15, 37);
    test:assertEquals(new Clock(15, 37), sut);
}

@test:Config
function clocksAMinuteApart() {
    var sut = new Clock(15, 37);
    Assert.NotEqual(new Clock(15, 36), sut);
}

@test:Config
function clocksAnHourApart() {
    var sut = new Clock(15, 37);
    Assert.NotEqual(new Clock(14, 37), sut);
}

@test:Config
function clocksWithHourOverflow() {
    var sut = new Clock(34, 37);
    test:assertEquals(new Clock(10, 37), sut);
}

@test:Config
function clocksWithHourOverflowBySeveralDays() {
    var sut = new Clock(99, 11);
    test:assertEquals(new Clock(3, 11), sut);
}

@test:Config
function clocksWithNegativeHour() {
    var sut = new Clock(-2, 40);
    test:assertEquals(new Clock(22, 40), sut);
}

@test:Config
function clocksWithNegativeHourThatWraps() {
    var sut = new Clock(-31, 3);
    test:assertEquals(new Clock(17, 3), sut);
}

@test:Config
function clocksWithNegativeHourThatWrapsMultipleTimes() {
    var sut = new Clock(-83, 49);
    test:assertEquals(new Clock(13, 49), sut);
}

@test:Config
function clocksWithMinuteOverflow() {
    var sut = new Clock(0, 1441);
    test:assertEquals(new Clock(0, 1), sut);
}

@test:Config
function clocksWithMinuteOverflowBySeveralDays() {
    var sut = new Clock(2, 4322);
    test:assertEquals(new Clock(2, 2), sut);
}

@test:Config
function clocksWithNegativeMinute() {
    var sut = new Clock(3, -20);
    test:assertEquals(new Clock(2, 40), sut);
}

@test:Config
function clocksWithNegativeMinuteThatWraps() {
    var sut = new Clock(5, -1490);
    test:assertEquals(new Clock(4, 10), sut);
}

@test:Config
function clocksWithNegativeMinuteThatWrapsMultipleTimes() {
    var sut = new Clock(6, -4305);
    test:assertEquals(new Clock(6, 15), sut);
}

@test:Config
function clocksWithNegativeHoursAndMinutes() {
    var sut = new Clock(-12, -268);
    test:assertEquals(new Clock(7, 32), sut);
}

@test:Config
function clocksWithNegativeHoursAndMinutesThatWrap() {
    var sut = new Clock(-54, -11513);
    test:assertEquals(new Clock(18, 7), sut);
}

@test:Config
function fullClockAndZeroedClock() {
    var sut = new Clock(0, 0);
    test:assertEquals(new Clock(24, 0), sut);
}

@test:Config
function clocksAreImmutable() {
    var sut = new Clock(0, 0);
    var sutPlus1 = sut.Add(1);
    Assert.NotEqual(sutPlus1, sut);
}