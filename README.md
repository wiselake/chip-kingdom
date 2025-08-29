# ChipKingdom Token (CHIP)

## 개요

ChipKingdom은 ERC-20/BEP-20 표준을 준수하는 블록체인 토큰입니다.

## 테스트 넷 정보

- **네트워크 이름**: BNB Smart Chain Testnet
- **새 RPC URL**: https://data-seed-prebsc-1-s1.binance.org:8545/
- **체인 ID**: 97
- **통화 기호**: tBNB
- **블록 탐색기 URL**: https://testnet.bscscan.com
- **토큰 계약주소**: 0xe977F1BF1A3C1A52aF223207419b5291BC98bA29

## 메인 넷 정보

- **네트워크 이름**: Binance Smart Chain
- **새 RPC URL**: https://bsc-mainnet.infura.io/ (만일 연결이 안된다면 https://bsc-dataseed.binance.org/)
- **체인 ID**: 56
- **통화 기호**: BNB
- **블록 탐색기 URL**: https://bscscan.com
- **토큰 계약주소**: 0xe977f1bf1a3c1a52af223207419b5291bc98ba29

## 토큰 정보

- **이름**: ChipKingdom
- **심볼**: CHIP
- **총 공급량**: 10,000,000,000 CHIP (100억개)
- **소수점**: 18자리
- **표준**: ERC-20/BEP-20 호환
- **토큰 계약주소**: 0xe977f1bf1a3c1a52af223207419b5291bc98ba29

## 주요 기능

### 기본 토큰 기능

- **전송**: 토큰 보내기 및 받기
- **승인**: 다른 주소가 토큰을 대신 사용할 수 있도록 허가
- **소각**: 토큰을 영구적으로 제거하여 총 공급량 감소

### 관리자 기능

- **일시정지/재개**: 모든 토큰 전송을 일시적으로 중단하거나 재개
- **추가 발행**: 오너가 새로운 토큰을 발행
- **토큰 복구**: 실수로 컨트랙트에 전송된 다른 토큰들을 회수
- **BNB 복구**: 실수로 컨트랙트에 전송된 BNB를 회수

### 보안 기능

- **소유권 관리**: Ownable 패턴을 통한 관리자 권한 제어
- **일시정지**: 비상시 모든 토큰 거래를 중단할 수 있는 기능

## 기술적 구현

### 상속된 컨트랙트

- `ERC20`: 표준 토큰 기능
- `ERC20Burnable`: 토큰 소각 기능
- `Pausable`: 일시정지 기능
- `Ownable`: 소유권 관리 기능

### 주요 함수

#### 읽기 함수

- `totalSupply()`: 총 공급량 조회
- `balanceOf(address)`: 계정 잔액 조회
- `allowance(address, address)`: 승인된 금액 조회
- `getTokenInfo()`: 토큰 기본 정보 일괄 조회

#### 쓰기 함수 (사용자)

- `transfer(address, uint256)`: 토큰 전송
- `approve(address, uint256)`: 사용 승인
- `transferFrom(address, address, uint256)`: 대리 전송
- `burn(uint256)`: 토큰 소각

#### 관리자 함수 (onlyOwner)

- `pause()`: 컨트랙트 일시정지
- `unpause()`: 컨트랙트 재개
- `mint(address, uint256)`: 토큰 추가 발행
- `recoverERC20(address, uint256)`: ERC-20 토큰 복구
- `recoverBNB()`: BNB 복구

## 배포 정보

- **Solidity 버전**: ^0.8.24
- **라이선스**: MIT
- **초기 배포**: 모든 토큰이 배포자에게 발행됨

## 이벤트

- `Transfer`: 토큰 전송 시 발생
- `Approval`: 토큰 승인 시 발생
- `Paused`: 컨트랙트 일시정지 시 발생
- `Unpaused`: 컨트랙트 재개 시 발생
