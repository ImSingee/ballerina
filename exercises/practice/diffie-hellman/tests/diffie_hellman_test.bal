import ballerina/test;

@test:Config
function privateKeyIsGreaterThan_1AndLessThanP() {
    var p = new BigInteger(7919);
    var privateKeys = Enumerable.Range(0, 1000).Select(_ => DiffieHellman.PrivateKey(p)).ToArray();
    foreach (var privateKey in privateKeys)
    {
        Assert.InRange(privateKey, new BigInteger(1), p);
    }
}

@test:Config
function privateKeyIsRandom() {
    var p = new BigInteger(7919);
    var privateKeys = Enumerable.Range(0, 1000).Select(_ => DiffieHellman.PrivateKey(p)).ToArray();
    Assert.InRange(privateKeys.Distinct().Count(), privateKeys.Length - 100, privateKeys.Length);
}

@test:Config
function canCalculatePublicKeyUsingPrivateKey() {
    var p = new BigInteger(23);
    var g = new BigInteger(5);
    var privateKey = new BigInteger(6);
    test:assertEquals(new BigInteger(8), DiffieHellman.PublicKey(p, g, privateKey));
}

@test:Config
function canCalculatePublicKeyWhenGivenADifferentPrivateKey() {
    var p = new BigInteger(23);
    var g = new BigInteger(5);
    var privateKey = new BigInteger(15);
    test:assertEquals(new BigInteger(19), DiffieHellman.PublicKey(p, g, privateKey));
}

@test:Config
function canCalculateSecretUsingOtherPartysPublicKey() {
    var p = new BigInteger(23);
    var theirPublicKey = new BigInteger(19);
    var myPrivateKey = new BigInteger(6);
    test:assertEquals(new BigInteger(2), DiffieHellman.Secret(p, theirPublicKey, myPrivateKey));
}

@test:Config
function keyExchange() {
    var p = new BigInteger(23);
    var g = new BigInteger(5);
    var alicePrivateKey = DiffieHellman.PrivateKey(p);
    var bobPrivateKey = DiffieHellman.PrivateKey(p);
    var alicePublicKey = DiffieHellman.PublicKey(p, g, alicePrivateKey);
    var bobPublicKey = DiffieHellman.PublicKey(p, g, bobPrivateKey);
    var secretA = DiffieHellman.Secret(p, bobPublicKey, alicePrivateKey);
    var secretB = DiffieHellman.Secret(p, alicePublicKey, bobPrivateKey);
    test:assertEquals(secretA, secretB);
}
