// SPDX-License-Identifier: MIT
pragma solidity >=0.5.0;
//0xC31B916E0004295848b2d8B9F5e2Ea09b0B1c7e3 - SC pair 
//0xd99d1c33f9fc3444f8101754abc46c52416550d1 - SC router 
//0x6725F303b657a9451d8BA641348b6761A6CC7a17 - SC factory
//0xae13d989daC2f0dEbFf460aC112a837C89BAa7cd - SC WBNB
//0x277bf3B4aeA25936855b511efaAf3B2Db4c8DBDC - SC FSPS Token 

contract sample{

// returns sorted token addresses, used to handle return values from pairs sorted in this order
    function sortTokens(address tokenA, address tokenB) internal pure returns (address token0, address token1) {
        require(tokenA != tokenB, 'PancakeLibrary: IDENTICAL_ADDRESSES');
        (token0, token1) = tokenA < tokenB ? (tokenA, tokenB) : (tokenB, tokenA);
        require(token0 != address(0), 'PancakeLibrary: ZERO_ADDRESS');
    }

    // calculates the CREATE2 address for a pair without making any external calls
    function pairFor(address factory, address tokenA, address tokenB) external pure returns (address pair) {
        (address token0, address token1) = sortTokens(tokenA, tokenB);
        pair = address(uint(keccak256(abi.encodePacked(
                hex'ff',
                factory,
                keccak256(abi.encodePacked(token0, token1)),
                hex'd0d4c4cd0848c93cb4fd1f498d7013ee6bfb25783ea21593d5834f5d250ece66' // init code hash
            ))));
    }
}
