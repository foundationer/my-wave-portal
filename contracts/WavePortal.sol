// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.0;

import "hardhat/console.sol";

contract WavePortal {
    uint256 totalWaves;
    address[] hallOfFame;

    constructor() {
        hallOfFame = new address[](0);
        console.log("Hey you, I am a contract and I am smart");
    }

    function wave() public {
        totalWaves += 1;
        console.log("%s has waved!", msg.sender);
        updateHallOfFame(msg.sender);
    }

    function getTotalWaves() public view returns (uint256) {
        console.log("We have %d total waves!", totalWaves);
        showHallOfFame();
        return totalWaves;
    }

    function updateHallOfFame(address waver) private {
      uint256 i = 0;
      while(i < hallOfFame.length && hallOfFame[i] != waver) {
        i++;
      }
      if(i == hallOfFame.length) {
        hallOfFame.push(waver);
      }
    }

    function showHallOfFame() private view {
      uint256 i = 0;
      console.log("HALL OF FAME:");
      for(i=0; i < hallOfFame.length; i++) {
        uint256 j = i + 1;
        if(hallOfFame[i] != 0x0000000000000000000000000000000000000000) {
          console.log("%d. %s", j, hallOfFame[i]);
        }
      }
    }
}
