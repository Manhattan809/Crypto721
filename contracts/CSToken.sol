pragma solidity ^0.4.4;

import "./StandardToken.sol";

contract CSToken is StandardToken {

    function () {
        //if ether/USD is sent to this address, send it back.
        throw;
    }

    /* Public variables of the token */

    /*
    Optional
    */
    string public name;                   
    uint8 public decimals;                
    string public symbol;                 
    string public version = '0.1';        

    function CSToken(
        uint256 _initialAmount,
        string _tokenName,
        uint8 _decimalUnits,
        string _tokenSymbol
        ) {
        balances[msg.sender] = 2100000000;                   // Give the creator all initial tokens
        totalSupply = 2100000000;                            // Update total supply
        name = _tokenName;                                   // Need actual name from owner
        decimals = _decimalUnits;                            // Decimal Amounts
        symbol = _tokenSymbol;                               // Need actual symbol from owner
    }

    /* Approval */
    function approveAndCall(address _spender, uint256 _value, bytes _extraData) returns (bool success) {
        allowed[msg.sender][_spender] = _value;
        Approval(msg.sender, _spender, _value);

      
        if(!_spender.call(bytes4(bytes32(sha3("receiveApproval(address,uint256,address,bytes)"))), msg.sender, _value, this, _extraData)) { throw; }
        return true;
    }
}
