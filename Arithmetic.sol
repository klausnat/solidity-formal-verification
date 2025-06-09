// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.0;

// Since Solidity 0.8.0, arithmetic operations automatically revert on overflow/underflow
contract Overflow {
    uint immutable x;
    uint immutable y;

    modifier req() {
        require(x >= 0);
        require(y >= 0);
        require(x < type(uint128).max); // comment to detect overflow error
        require(y < type(uint128).max); // comment to detect overflow error
        _;
    }

    function add(uint x_, uint y_) internal view req returns (uint) {
        return x_ + y_;
    }

    function mul(uint x_, uint y_) internal view req returns (uint) {
        return x_ * y_;
        // return x_+ y_; // uncomment to detect unrecheable code error
    }

    constructor(uint x_, uint y_) {
        (x, y) = (x_, y_);
    }

    function stateAdd() public view {
        uint res_add = add(x, y);
        assert(x <= res_add && y <= res_add);
    }

    function stateMul() public view {
        require (x != 0); // comment to detect assertion violation
        require (y != 0); // comment to detect assertion violation

        uint res_mul = mul(x, y);
        assert(x <= res_mul && y <= res_mul);
    }
}
