// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";
import "@openzeppelin/contracts/utils/Pausable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

/**
 * @title ChipKingdom
 * @dev BEP-20 호환 토큰 구현
 * 
 * 토큰 정보:
 * - 이름: ChipKingdom
 * - 심볼: CHIP
 * - 총 공급량: 10,000,000,000 (100억개)
 * - 소수점: 18자리
 */
contract ChipKingdom is ERC20, ERC20Burnable, Pausable, Ownable {
    
    // 총 공급량: 100억개 (10^10 * 10^18)
    uint256 private constant TOTAL_SUPPLY = 10_000_000_000 * 10**18;
    
    /**
     * @dev 컨트랙트 배포 시 생성자
     * 배포자에게 모든 토큰을 발행함
     */
    constructor() ERC20("ChipKingdom", "CHIP") Ownable(msg.sender) {
        _mint(msg.sender, TOTAL_SUPPLY);
    }

    /**
     * @dev 컨트랙트 일시정지 기능 (오너만 사용 가능)
     */
    function pause() public onlyOwner {
        _pause();
    }

    /**
     * @dev 컨트랙트 일시정지 해제 기능 (오너만 사용 가능)
     */
    function unpause() public onlyOwner {
        _unpause();
    }

    /**
     * @dev 토큰 전송을 일시정지 상태에서 제한하는 함수
     * OpenZeppelin v5에서는 _update 함수를 오버라이드함
     */
    function _update(address from, address to, uint256 value)
        internal
        override
        whenNotPaused
    {
        super._update(from, to, value);
    }

    /**
     * @dev BEP-20 표준 함수들은 ERC20에서 상속받아 자동으로 구현됨:
     * 
     * 읽기 함수들:
     * - totalSupply(): 총 발행량 조회
     * - balanceOf(address account): 계정 잔액 조회  
     * - allowance(address owner, address spender): 승인된 금액 조회
     * 
     * 쓰기 함수들:
     * - transfer(address to, uint256 amount): 토큰 전송
     * - transferFrom(address from, address to, uint256 amount): 대리 전송
     * - approve(address spender, uint256 amount): 승인 설정
     * 
     * 이벤트들:
     * - Transfer(address indexed from, address indexed to, uint256 value)
     * - Approval(address indexed owner, address indexed spender, uint256 value)
     */

    /**
     * @dev 토큰 정보 조회를 위한 추가 함수들
     */
    function getTokenInfo() public pure returns (
        string memory name,
        string memory symbol,
        uint8 decimals,
        uint256 totalSupply
    ) {
        return ("ChipKingdom", "CHIP", 18, TOTAL_SUPPLY);
    }

    /**
     * @dev 오너가 특정 주소에 토큰을 추가 발행할 수 있는 함수 (선택사항)
     * 필요하지 않다면 제거 가능
     */
    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }

    /**
     * @dev 컨트랙트에서 실수로 받은 다른 토큰들을 복구하는 함수
     */
    function recoverERC20(address tokenAddress, uint256 tokenAmount) public onlyOwner {
        IERC20(tokenAddress).transfer(owner(), tokenAmount);
    }

    /**
     * @dev 컨트랙트에서 실수로 받은 BNB를 복구하는 함수  
     */
    function recoverBNB() public onlyOwner {
        payable(owner()).transfer(address(this).balance);
    }
}