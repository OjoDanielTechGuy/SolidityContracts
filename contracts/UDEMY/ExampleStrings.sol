//SPDX-License-Identifier: MIT

/* Strings are actually Arrays, very similar to a bytes-array.
- Natively, there are no String manipulation functions.
- No even string comparison is natively possible
- Strings are expensive to store and work with in Solidity
- Natively, there are no String manipulation functions.
- As a rule of thumb: try to avoid storing Strings, use Events instead
*
*/

pragma solidity 0.8.15;


contract ExampleStrings {

    string public myString = "Hello World";

    //Storing a string and retrieving it again
    function setString(string memory _setString) public {
        myString = _setString;
    }

    /**Comparing two strings
    *There are no native string comparison functions in Solidity. 
    There is still a way to compare two strings: by comparing their **keccak256** hashes.
    */

    function compareTwoStrings(string memory _myString) public view returns (bool) {
        /**return myString == _myString; :TypeError: Operator == not compatible 
        with types string storage ref and string memory*/

        return keccak256(abi.encodePacked(myString)) == keccak256(abi.encodePacked(_myString));
    }

    /**STRINGS VS BYTES
    * Strings are actually arbitrary long bytes in UTF-8 representation. 
    * Strings do not have a length property, bytes do have that
    */
    bytes public myBytes = unicode"Hello Wörld";

    function getBytesLength() public view returns(uint) {
        return myBytes.length;

        /*If you run this, you get a length of 12, 
        * although its just 11 characters. The character "ö" needs 2 bytes.
        - The content is "0x48656c6c6f2057c3b6726c64". If you run it through 
        "web3.utils.toAscii('0x48656c6c6f2057c3b6726c64') on terminal" 
        - you get back the Ascii representation.*/
    }
    

}