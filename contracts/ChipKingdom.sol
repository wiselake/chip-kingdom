// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

/**
 * @title ChipKingdom (최소 버전)
 * @dev 배포 최적화된 BEP-20 토큰
 */
contract ChipKingdom is ERC20, Ownable {
    uint256 private constant TOTAL_SUPPLY = 10_000_000_000 * 10 ** 18;

    constructor() ERC20("ChipKingdom", "CHIP") Ownable(msg.sender) {
        _mint(msg.sender, TOTAL_SUPPLY);
    }

    // 필수 기능만 포함 - 나머지는 배포 후 업그레이드 가능
}
