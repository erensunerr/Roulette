pragma solidity >= 0.5.0 < 0.6.0;
import "./generateRandom.sol";

contract Roulette {
    uint safe;
    address payable owner;

    constructor() public {
        owner = msg.sender;
    }

    event Won();
    event Lost();

    function play(uint8 number, uint4 color) public payable {
        uint amount = msg.value;
        address payable sender = msg.sender;
        if (number <= 36 && number >= 0) {
            if (number == generateRandomNum()) {
                sender.transfer(amount*30);
                emit Won();
            }
        } else if (color == 0 || color == 1) {
            if (color == generateRandomColor()) {
                sender.transfer(amount*1.8);
                emit Won();
            }
        }
    }

    function deposit(uint amount) public {

    }
}
