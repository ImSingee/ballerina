import ballerina/test;

@test:Config
function wordBeginningWithA() {
    test:assertEquals("appleay", PigLatin.Translate("apple"));
}

@test:Config
function wordBeginningWithE() {
    test:assertEquals("earay", PigLatin.Translate("ear"));
}

@test:Config
function wordBeginningWithI() {
    test:assertEquals("iglooay", PigLatin.Translate("igloo"));
}

@test:Config
function wordBeginningWithO() {
    test:assertEquals("objectay", PigLatin.Translate("object"));
}

@test:Config
function wordBeginningWithU() {
    test:assertEquals("underay", PigLatin.Translate("under"));
}

@test:Config
function wordBeginningWithAVowelAndFollowedByAQu() {
    test:assertEquals("equalay", PigLatin.Translate("equal"));
}

@test:Config
function wordBeginningWithP() {
    test:assertEquals("igpay", PigLatin.Translate("pig"));
}

@test:Config
function wordBeginningWithK() {
    test:assertEquals("oalakay", PigLatin.Translate("koala"));
}

@test:Config
function wordBeginningWithX() {
    test:assertEquals("enonxay", PigLatin.Translate("xenon"));
}

@test:Config
function wordBeginningWithQWithoutAFollowingU() {
    test:assertEquals("atqay", PigLatin.Translate("qat"));
}

@test:Config
function wordBeginningWithCh() {
    test:assertEquals("airchay", PigLatin.Translate("chair"));
}

@test:Config
function wordBeginningWithQu() {
    test:assertEquals("eenquay", PigLatin.Translate("queen"));
}

@test:Config
function wordBeginningWithQuAndAPrecedingConsonant() {
    test:assertEquals("aresquay", PigLatin.Translate("square"));
}

@test:Config
function wordBeginningWithTh() {
    test:assertEquals("erapythay", PigLatin.Translate("therapy"));
}

@test:Config
function wordBeginningWithThr() {
    test:assertEquals("ushthray", PigLatin.Translate("thrush"));
}

@test:Config
function wordBeginningWithSch() {
    test:assertEquals("oolschay", PigLatin.Translate("school"));
}

@test:Config
function wordBeginningWithYt() {
    test:assertEquals("yttriaay", PigLatin.Translate("yttria"));
}

@test:Config
function wordBeginningWithXr() {
    test:assertEquals("xrayay", PigLatin.Translate("xray"));
}

@test:Config
function yIsTreatedLikeAConsonantAtTheBeginningOfAWord() {
    test:assertEquals("ellowyay", PigLatin.Translate("yellow"));
}

@test:Config
function yIsTreatedLikeAVowelAtTheEndOfAConsonantCluster() {
    test:assertEquals("ythmrhay", PigLatin.Translate("rhythm"));
}

@test:Config
function yAsSecondLetterInTwoLetterWord() {
    test:assertEquals("ymay", PigLatin.Translate("my"));
}

@test:Config
function aWholePhrase() {
    test:assertEquals("ickquay astfay unray", PigLatin.Translate("quick fast run"));
}
