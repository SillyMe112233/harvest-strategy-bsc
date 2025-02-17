//SPDX-License-Identifier: Unlicense

pragma solidity 0.6.12;

import "../../base/pancake-base/PancakeMasterChefStrategy.sol";

contract PancakeStrategyMainnet_MNFLX_UST is PancakeMasterChefStrategy {

  address public mnflx_ust_unused; // just a differentiator for the bytecode

  constructor() public {}

  function initializeStrategy(
    address _storage,
    address _vault
  ) public initializer {
    address underlying = address(0xF609ade3846981825776068a8eD7746470029D1f);
    address mnflx = address(0xa04F060077D90Fe2647B61e4dA4aD1F97d6649dc);
    address ust = address(0x23396cF899Ca06c4472205fC903bDB4de249D6fC);
    address cake = address(0x0E09FaBB73Bd3Ade0a17ECC321fD13a19e81cE82);
    address wbnb = address(0xbb4CdB9CBd36B01bD1cBaEBF2De08d9173bc095c);
    address busd = address(0xe9e7CEA3DedcA5984780Bafc599bD69ADd087D56);
    PancakeMasterChefStrategy.initializeStrategy(
      _storage,
      underlying,
      _vault,
      address(0x73feaa1eE314F8c655E354234017bE2193C9E24E), // master chef contract
      cake,
      60,  // Pool id
      true // is LP asset
    );
    pancakeswapRoutes[mnflx] = [cake, wbnb, busd, ust, mnflx];
    pancakeswapRoutes[ust] = [cake, wbnb, busd, ust];
  }
}
