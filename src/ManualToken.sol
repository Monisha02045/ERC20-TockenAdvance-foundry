// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract ManualTocken {

    // toget the balence of the owner we using mapping
       mapping(address => uint256) private s_balances;

       function name() public pure returns(string memory){
        return "Manual Tocken";
       } 
       // this tocken is 100 ether big
       function totalSupply() public pure returns(uint256){
        return 100 ether; // 1000000000000000000
       }
       // this tocken have 18 decimals
       function decimal() public pure returns(uint8){
        return 18;

       }
       function balanceof(address _owner) public view returns(uint256){
            return s_balances[_owner];
       }
      function transfer(address _to, uint256 _amount) public{
        uint256 previousBalances = balanceof(msg.sender) + balanceof(_to);
        s_balances[msg.sender] -= _amount;
        s_balances[_to] += _amount;
        require(balanceof(msg.sender) + balanceof(_to) == 
        previousBalances);
    }
}