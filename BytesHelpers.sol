pragma solidity ^0.4.15;

library BytesHelpers {

  /** @dev takes an arbitrary length byte string _data and returns a byte32 chunk based on offset
   *  @param _data Bytes
   *  @param offset number of bytes from the start where 32 bytes should be taken from
   *  @return uint representation of the 32 byte segment
   */
  function bytes_to_uint(bytes _data, uint offset) public constant returns(uint) {
      bytes32 chunk;
      for (uint i = 0; i < 32; i++) {
          chunk ^= bytes32(_data[offset + i]) >> (i * 8); // copy byte from _data into bytes32
      }

      return uint(chunk); // cast to int
  }

  /** @dev takes a uint and returns a byte string representation of it
   *  @param number integer to convert
   *  @return data bytes representation of input
   */
  function uint_to_bytes(uint number) public constant returns(bytes data) {
     data = new bytes(32);
     for (uint i = 0; i < 32; i++) {
        data[i] = byte(uint8(number / (2**(8*(31 - i)))));
     }

     return data;
  }
}
