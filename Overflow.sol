// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.0;

// Since Solidity 0.8.0, arithmetic operations automatically revert on overflow/underflow
contract Overflow {
    uint immutable x;
    uint immutable y;

    function add(uint x_, uint y_) internal pure returns (uint) {
        return x_ + y_;
    }

    constructor(uint x_, uint y_) {
        (x, y) = (x_, y_);
    }

    function stateAdd() public view returns (uint) {
        require(x < type(uint128).max);
        require(y < type(uint128).max);
        return add(x, y);
    }
}
