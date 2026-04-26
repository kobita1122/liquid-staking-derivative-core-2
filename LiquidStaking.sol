// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "./StakedToken.sol";
import "@openzeppelin/contracts/utils/ReentrancyGuard.sol";

contract LiquidStaking is ReentrancyGuard {
    StakedToken public immutable stToken;
    uint256 public totalStaked;
    
    event Staked(address indexed user, uint256 amount, uint256 shares);
    event RewardsAdded(uint256 amount);

    constructor(string memory _name, string memory _symbol) {
        stToken = new StakedToken(_name, _symbol);
    }

    // Deposits native ETH and mints stToken
    function stake() external payable nonReentrant {
        require(msg.value > 0, "Cannot stake 0");
        
        uint256 shares = getSharesByPooledEth(msg.value);
        totalStaked += msg.value;
        
        stToken.mint(msg.sender, shares);
        emit Staked(msg.sender, msg.value, shares);
    }

    // Simple 1:1 exchange rate logic for demonstration
    // In production, this includes rewards/slashing adjustments
    function getSharesByPooledEth(uint256 _amount) public view returns (uint256) {
        uint256 totalETH = address(this).balance;
        if (totalETH == 0 || stToken.totalSupply() == 0) return _amount;
        return (_amount * stToken.totalSupply()) / totalETH;
    }

    function distributeRewards() external payable {
        // Mock function to simulate consensus layer rewards
        emit RewardsAdded(msg.value);
    }

    receive() external payable {}
}
