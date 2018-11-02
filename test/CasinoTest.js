const Casino = artifacts.require("Casino");


contract("RiddleRound", accounts => {
  const [ firstAccount ] = accounts;

  it("a participant can play and receive the event", () => {
    return Casino.deployed().then(instance => {
      meta = instance;
      return instance.play({from: firstAccount, value: 2});
    })
      .then(result => {
        const gameResult = result.logs.filter(log => log.event === 'GameResult');
        assert.equal(gameResult.length, 1);
      });
  });
});