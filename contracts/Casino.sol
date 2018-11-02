pragma solidity ^0.4.23;

contract Casino {
    uint8 reward = 80; // 80 times bigger, as the changes of winning 1/3 * 1/3 = > 0.111 => 11%

    event GameResult(uint8 tape1, uint8 tape2, uint8 tape3, uint256 reward);

    constructor() public {
    }

    function play() payable public {
        uint8 _number1 = generateRandomNumber1(msg.sender);
        uint8 _number2 = generateRandomNumber2(msg.sender);
        uint8 _number3 = generateRandomNumber3(msg.sender);

        uint256 _reward = 0;
        if (_number1 == _number2 && _number2 == _number3) {
            // send a reward
            _reward = msg.value * reward;
            msg.sender.transfer(_reward);
        }

        emit GameResult(_number1, _number2, _number3, _reward);
    }

    function generateRandomNumber1(address sender) view private returns (uint8) {
        return uint8(uint256(keccak256(abi.encodePacked(block.timestamp, block.difficulty, sender))) % 3);
    }

    function generateRandomNumber2(address sender) view private returns (uint8) {
        return uint8(uint256(keccak256(abi.encodePacked(block.difficulty, block.timestamp, sender))) % 3);
    }

    function generateRandomNumber3(address sender) view private returns (uint8) {
        return uint8(uint256(keccak256(abi.encodePacked(sender, block.timestamp, block.difficulty))) % 3);
    }
}
