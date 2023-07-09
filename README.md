# Predict-smart-contract-address
Solidity code for create and create2 opcodes

If you think that this function from chatGPT will help, you are wrong)) 

It's all because they use Recursive Length Prefix (RLP) serialization for calculate address in create. 


        function predictAddress(address sender, uint256 nonce) public pure returns (address) {

        bytes32 inputHash = keccak256(abi.encodePacked(sender, nonce));
        
        return address(uint160(uint256(inputHash)));
        
    }

I honestly took the right piece of code from those guys: https://github.com/foundry-rs/forge-std/blob/master/src/StdUtils.sol#L99


