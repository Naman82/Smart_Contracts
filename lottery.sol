//SPDX-License-Identifier:MIT
pragma solidity ^0.8;

contract Lottery{
    //manager
    //players
    //players pay some fee
    //randomily a player is chosen 
    //and all amount paid to winner 

    address public host;
    constructor(){
        host=msg.sender;
    }

    address payable[] public players;

    function alreadyEntered()private view returns(bool){
        for(uint i=0; i<players.length; i++){
            if(players[i]==msg.sender){
                return true;
            }
        }
        return false;
    }


    function participate() public payable{
       require(msg.sender!=host,"Host cannot participate");
       require(alreadyEntered() == false, "Player already participated");
       require(msg.value >= 1 ether ,"Minimum amount to participate in contest is 1 Ether");

       players.push(payable(msg.sender));
    }


    function checkContractBalance() public view returns(uint){
        return address(this).balance;
    }

    function random() private view returns(uint){
        return uint(sha256(abi.encodePacked(block.difficulty,block.number,players)));
    }

    function Start() public payable {
        require(msg.sender == host,"Host will be able to use this function call");
        uint index = random() % players.length;
        uint priceTotal = address(this).balance;
        players[index].transfer(priceTotal);
    }



}