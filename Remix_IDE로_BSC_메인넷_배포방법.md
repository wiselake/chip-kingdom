# 🚀 Remix IDE로 BSC 메인넷 배포하기

## 🔧 **사전 준비사항**

### **1. MetaMask 메인넷 설정**

```
네트워크 이름: Smart Chain
새 RPC URL: https://bsc-dataseed.binance.org/
체인 ID: 56
통화 기호: BNB
블록 탐색기 URL: https://bscscan.com
```

### **2. 충분한 BNB 준비**

- **최소 필요량**: 0.05 BNB
- **권장량**: 0.1 BNB (배포 + 검증 + 여유분)
- **가스비 예상**: 0.01-0.03 BNB

---

## 📋 **Step 1: Remix IDE 접속 및 준비**

### **1.1 Remix 접속**

1. 브라우저에서 https://remix.ethereum.org 열기
2. **"File Explorer"** 탭에서 새 파일 생성
3. 파일명: `ChipKingdom.sol`

### **1.2 컨트랙트 코드 붙여넣기**

```solidity
// 이전에 테스트한 ChipKingdom.sol 코드 전체 복사
// (테스트넷에서 검증된 동일한 코드 사용)
```

### **1.3 Import 확인**

```solidity
// 다음 import들이 모두 포함되어 있는지 확인
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";
import "@openzeppelin/contracts/utils/Pausable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
```

---

## ⚙️ **Step 2: 컴파일 설정**

### **2.1 Solidity Compiler 설정**

1. 좌측 메뉴에서 **"Solidity Compiler"** (📁) 클릭
2. **Compiler 설정**:
   ```
   Compiler: 0.8.19+commit.7dd6d404
   Language: Solidity
   EVM Version: default
   ```

### **2.2 최적화 설정**

```
Advanced Configurations:
☑️ Enable optimization
Runs: 200
```

### **2.3 컴파일 실행**

1. **"Compile ChipKingdom.sol"** 버튼 클릭
2. ✅ **초록색 체크마크** 확인 (컴파일 성공)
3. ❌ 오류 발생 시 코드 검토 후 재컴파일

---

## 🌐 **Step 3: MetaMask 연결**

### **3.1 네트워크 전환**

1. MetaMask에서 **"Smart Chain"** (BSC 메인넷) 선택
2. 현재 계정에 충분한 BNB 잔액 확인

### **3.2 계정 선택**

```
⚠️ 중요: 메인넷 전용 계정 사용
- 테스트넷 계정과 분리
- 충분한 BNB 보유
- 개인키 안전 백업 완료
```

---

## 🚀 **Step 4: 배포 실행**

### **4.1 Deploy & Run Transactions 설정**

1. 좌측 메뉴에서 **"Deploy & Run Transactions"** (🚀) 클릭

### **4.2 Environment 설정**

```
Environment: Injected Provider - MetaMask
Account: [메인넷 계정 주소 표시]
Gas Limit: 3000000 (권장)
Value: 0 ETH
```

### **4.3 Contract 선택**

```
Contract: CHIPKINGDOM - contracts/ChipKingdom.sol
```

### **4.4 생성자 매개변수 확인**

```
Constructor Parameters: (없음)
ChipKingdom 컨트랙트는 생성자 매개변수가 없음
```

---

## 💫 **Step 5: 배포 실행**

### **5.1 최종 확인**

배포 전 다시 한 번 확인:

- ✅ BSC 메인넷 연결됨
- ✅ 충분한 BNB 잔액
- ✅ 컴파일 성공
- ✅ 올바른 컨트랙트 선택

### **5.2 Deploy 버튼 클릭**

1. **"Deploy"** 버튼 클릭
2. MetaMask 팝업창 자동 표시

### **5.3 MetaMask 트랜잭션 승인**

**가스비 확인:**

```
Gas Limit: 2,000,000 - 3,000,000
Gas Price: 자동 설정 (5 Gwei 내외)
Total Cost: 0.01-0.03 BNB 예상
```

**승인 과정:**

1. 가스비 확인 후 **"확인"** 클릭
2. 트랜잭션 전송 완료
3. **"View on BscScan"** 링크 클릭 (선택)

---

## ⏳ **Step 6: 배포 완료 확인**

### **6.1 Remix 콘솔 확인**

```
✅ 성공 메시지:
"creation of ChipKingdom pending..."
"[block:xxxxx txIndex:xx] from: 0x...
to: ChipKingdom.(constructor)
value: 0 wei data: 0x608..."

✅ 컨트랙트 주소 생성:
"Contract deployed at 0x1234...abcd"
```

### **6.2 Deployed Contracts 섹션**

```
📋 배포된 컨트랙트 목록에서 확인:
CHIPKINGDOM AT 0X1234...ABCD (주소)
- 모든 함수들이 표시됨
- 읽기 함수들 (파란색)
- 쓰기 함수들 (빨간색)
```

### **6.3 BSCScan 확인**

1. 컨트랙트 주소 복사
2. https://bscscan.com 에서 검색
3. **Contract Creation** 트랜잭션 확인

---

## 🔍 **Step 7: 배포 검증**

### **7.1 기본 정보 확인 (Remix에서)**

```javascript
// 다음 함수들을 클릭하여 확인
name() → "ChipKingdom"
symbol() → "CHIP"
decimals() → 18
totalSupply() → "10000000000000000000000000000"
balanceOf(배포자주소) → "10000000000000000000000000000"
```

### **7.2 BSCScan에서 확인**

```
✅ Contract: 컨트랙트 주소 표시
✅ Token Tracker: CHIP 토큰 정보
✅ Transactions: 배포 트랜잭션 기록
```

---

## 📝 **Step 8: 중요 정보 백업**

### **8.1 필수 백업 정보**

```
🔑 컨트랙트 주소: 0x1234...abcd
🔑 배포 트랜잭션: 0xabcd...1234
🔑 배포 블록 번호: #12345678
🔑 배포 시간: 2024-XX-XX XX:XX:XX UTC
🔑 가스 사용량: X,XXX,XXX
🔑 배포자 주소: 0xabcd...1234
```

### **8.2 안전한 저장**

- 📁 텍스트 파일로 저장
- 💾 클라우드 백업 (암호화)
- 📋 물리적 메모 (종이)

---

## ⚠️ **배포 중 발생 가능한 문제들**

### **🚫 "Injected Provider - MetaMask" 없음**

**해결법:**

1. MetaMask 확장 프로그램 활성화
2. MetaMask에서 Remix 사이트 연결 승인
3. 브라우저 새로고침 후 재시도

### **🚫 "Insufficient funds for gas"**

**해결법:**

1. BNB 잔액 확인
2. 필요시 추가 BNB 구매/전송
3. 가스 한도 조정 (낮추기)

### **🚫 "Transaction failed"**

**해결법:**

1. 가스 가격 증가
2. 가스 한도 증가
3. 네트워크 혼잡 시 시간차 재시도

### **🚫 컴파일 오류**

**해결법:**

1. Solidity 버전 확인 (0.8.19)
2. Import 경로 확인
3. 코드 문법 검토

---

## ✅ **성공 체크리스트**

배포 완료 후 확인:

- [ ] **Remix 콘솔**에 성공 메시지 표시
- [ ] **컨트랙트 주소** 생성됨
- [ ] **BSCScan**에서 컨트랙트 확인됨
- [ ] **기본 함수들** 정상 작동
- [ ] **토큰 정보** 올바르게 표시
- [ ] **배포자 계정**에 100억 토큰 보유
- [ ] **중요 정보** 백업 완료

---

## 🎯 **배포 후 즉시 할 일**

### **1순위 (배포 후 10분 내)**

1. **컨트랙트 주소 백업**
2. **BSCScan에서 검증** 준비
3. **기본 기능 테스트**

### **2순위 (배포 후 1시간 내)**

1. **BSCScan 소스코드 검증**
2. **토큰 로고 등록**
3. **커뮤니티 공지**

### **3순위 (배포 후 24시간 내)**

1. **PancakeSwap 상장**
2. **CoinGecko/CMC 등록**
3. **마케팅 시작**

---

## 🔧 **트러블슈팅 가이드**

### **MetaMask 연결 문제**

```bash
1. MetaMask 잠금 해제
2. BSC 메인넷 선택 확인
3. Remix 사이트 새로고침
4. 브라우저 캐시 삭제
```

### **가스비 최적화**

```bash
최적 가스 설정:
- Gas Limit: 2,500,000
- Gas Price: Auto (약 5 Gwei)
- 혼잡 시간대 피하기: 한국시간 오전 9-11시, 오후 8-10시
```

### **네트워크 문제**

```bash
대체 RPC 엔드포인트:
1. https://bsc-dataseed1.defibit.io/
2. https://bsc-dataseed1.ninicoin.io/
3. https://bsc.nodereal.io
```

---

## 🎊 **축하합니다!**

메인넷 배포가 완료되었다면 ChipKingdom 토큰이 공식적으로 BSC 블록체인에 존재하게 됩니다!

다음 단계인 **BSCScan 검증** 과정이 궁금하시거나, 배포 중 문제가 발생하면 언제든 말씀해주세요! 🚀
