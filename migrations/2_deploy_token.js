var RidToken = artifacts.require("./RidToken.sol");

module.exports = function(deployer) {
    const name = "Rid Token";
    const symbol = "RDN";
    const decimals = 18;
    const totalSupply = 10000;

    deployer.deploy(RidToken, name, symbol, decimals, totalSupply);
};
