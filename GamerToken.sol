// SPDX-License-Identifier: MIT
pragma solidity 0.8.18;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract GamerToken is ERC20, ERC20Burnable, Ownable{
     string[] public MyGame;
    constructor() ERC20("GamerToken","GT"){ MyGame = new string[](4);
        MyGame[0] = "Pubg";
        MyGame[1] = "subwaysufer";
        MyGame[2] = "Ludo";
        MyGame[3] = "Suduko";}

    function mint(address reciver, uint256 amount) external onlyOwner{
        _mint(reciver,amount);
    }

    function transfer(address reciver,uint256 amount) public override returns (bool){
        require(amount > 0,"Amount must be greater than zero.");
        _transfer(_msgSender(),reciver,amount);
        return true;
    }

    function redeem(uint256 _myGamesId,uint256 amount) public payable  {
          require(
            bytes(MyGame[_myGamesId]).length > 0,
            "Game is not in the list"
        );

        require(
            balanceOf(msg.sender) > 0,
            "Insufficient Balance"
        );
        _burn(_msgSender(),amount);
    }

    function _mycheckBalance(address account) external view returns (uint256){
        return balanceOf(account);
    }
}
