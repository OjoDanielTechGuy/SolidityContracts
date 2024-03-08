// SPDX-License-Identifier: MIT
pragma solidity >= 0.7.0 <= 0.9.0;

contract etherUnits {
    //ether units
    //Ethereum is the blockchain and Ether is the currency

    function testUint() public pure {
        
        //wei is the smallest denomination of ether
        assert(1000000000000000000 wei == 1 ether); // 10^18 wei = 1 eth
        assert(1 wei == 1); //1 wei == 1

        assert(1 ether == 1e18);
        //1 ether == 1e18
        //create an assertion for 2eths to be equivalent to weis
        assert(2 ether == 2e18);
    }

    //Similar to currency, Solidity has time units where lowest uint is second and we can use seconds,
    //minutes, hours, days and weeks as suffix to donate time

    //Exercise: Create the following assertions in a function called testTime:
    //Assert equivalencies for minutes to seconds, hours to minutes, days to hours, and weeks to days

    function testTime() public {

        assert(2 minutes == 120 seconds);
        assert (1 hours == 60 minutes);
        assert (1 days == 24 hours);
        assert (1 weeks == 7 days);
    }

}
