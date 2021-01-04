// SPDX-License-Identifier: MIT

pragma solidity ^0.7.0;

/**
 * @dev Interface of the ERC20 standard as defined in the EIP.
 */
interface IERC20 {
    /**
     * @dev Returns the amount of tokens in existence.
     */
    function totalSupply() external view returns (uint256);

    /**
     * @dev Returns the amount of tokens owned by `account`.
     */
    function balanceOf(address account) external view returns (uint256);

    /**
     * @dev Moves `amount` tokens from the caller's account to `recipient`.
     *
     * Returns a boolean value indicating whether the operation succeeded.
     *
     * Emits a {Transfer} event.
     */
    function transfer(address recipient, uint256 amount) external returns (bool);

    /**
     * @dev Returns the remaining number of tokens that `spender` will be
     * allowed to spend on behalf of `owner` through {transferFrom}. This is
     * zero by default.
     *
     * This value changes when {approve} or {transferFrom} are called.
     */
    function allowance(address owner, address spender) external view returns (uint256);

    /**
     * @dev Sets `amount` as the allowance of `spender` over the caller's tokens.
     *
     * Returns a boolean value indicating whether the operation succeeded.
     *
     * IMPORTANT: Beware that changing an allowance with this method brings the risk
     * that someone may use both the old and the new allowance by unfortunate
     * transaction ordering. One possible solution to mitigate this race
     * condition is to first reduce the spender's allowance to 0 and set the
     * desired value afterwards:
     * https://github.com/ethereum/EIPs/issues/20#issuecomment-263524729
     *
     * Emits an {Approval} event.
     */
    function approve(address spender, uint256 amount) external returns (bool);

    /**
     * @dev Moves `amount` tokens from `sender` to `recipient` using the
     * allowance mechanism. `amount` is then deducted from the caller's
     * allowance.
     *
     * Returns a boolean value indicating whether the operation succeeded.
     *
     * Emits a {Transfer} event.
     */
    function transferFrom(address sender, address recipient, uint256 amount) external returns (bool);

    /**
     * @dev Emitted when `value` tokens are moved from one account (`from`) to
     * another (`to`).
     *
     * Note that `value` may be zero.
     */
    event Transfer(address indexed from, address indexed to, uint256 value);

    /**
     * @dev Emitted when the allowance of a `spender` for an `owner` is set by
     * a call to {approve}. `value` is the new allowance.
     */
    event Approval(address indexed owner, address indexed spender, uint256 value);
}

/**
 * @dev Wrappers over Solidity's arithmetic operations with added overflow
 * checks.
 *
 * Arithmetic operations in Solidity wrap on overflow. This can easily result
 * in bugs, because programmers usually assume that an overflow raises an
 * error, which is the standard behavior in high level programming languages.
 * `SafeMath` restores this intuition by reverting the transaction when an
 * operation overflows.
 *
 * Using this library instead of the unchecked operations eliminates an entire
 * class of bugs, so it's recommended to use it always.
 */
library SafeMath {
    /**
     * @dev Returns the addition of two unsigned integers, reverting on
     * overflow.
     *
     * Counterpart to Solidity's `+` operator.
     *
     * Requirements:
     *
     * - Addition cannot overflow.
     */
    function add(uint256 a, uint256 b) internal pure returns (uint256) {
        uint256 c = a + b;
        require(c >= a, "SafeMath: addition overflow");

        return c;
    }

    /**
     * @dev Returns the subtraction of two unsigned integers, reverting on
     * overflow (when the result is negative).
     *
     * Counterpart to Solidity's `-` operator.
     *
     * Requirements:
     *
     * - Subtraction cannot overflow.
     */
    function sub(uint256 a, uint256 b) internal pure returns (uint256) {
        return sub(a, b, "SafeMath: subtraction overflow");
    }

    /**
     * @dev Returns the subtraction of two unsigned integers, reverting with custom message on
     * overflow (when the result is negative).
     *
     * Counterpart to Solidity's `-` operator.
     *
     * Requirements:
     *
     * - Subtraction cannot overflow.
     */
    function sub(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {
        require(b <= a, errorMessage);
        uint256 c = a - b;

        return c;
    }

    /**
     * @dev Returns the multiplication of two unsigned integers, reverting on
     * overflow.
     *
     * Counterpart to Solidity's `*` operator.
     *
     * Requirements:
     *
     * - Multiplication cannot overflow.
     */
    function mul(uint256 a, uint256 b) internal pure returns (uint256) {
        // Gas optimization: this is cheaper than requiring 'a' not being zero, but the
        // benefit is lost if 'b' is also tested.
        // See: https://github.com/OpenZeppelin/openzeppelin-contracts/pull/522
        if (a == 0) {
            return 0;
        }

        uint256 c = a * b;
        require(c / a == b, "SafeMath: multiplication overflow");

        return c;
    }

    /**
     * @dev Returns the integer division of two unsigned integers. Reverts on
     * division by zero. The result is rounded towards zero.
     *
     * Counterpart to Solidity's `/` operator. Note: this function uses a
     * `revert` opcode (which leaves remaining gas untouched) while Solidity
     * uses an invalid opcode to revert (consuming all remaining gas).
     *
     * Requirements:
     *
     * - The divisor cannot be zero.
     */
    function div(uint256 a, uint256 b) internal pure returns (uint256) {
        return div(a, b, "SafeMath: division by zero");
    }

    /**
     * @dev Returns the integer division of two unsigned integers. Reverts with custom message on
     * division by zero. The result is rounded towards zero.
     *
     * Counterpart to Solidity's `/` operator. Note: this function uses a
     * `revert` opcode (which leaves remaining gas untouched) while Solidity
     * uses an invalid opcode to revert (consuming all remaining gas).
     *
     * Requirements:
     *
     * - The divisor cannot be zero.
     */
    function div(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {
        require(b > 0, errorMessage);
        uint256 c = a / b;
        // assert(a == b * c + a % b); // There is no case in which this doesn't hold

        return c;
    }

    /**
     * @dev Returns the remainder of dividing two unsigned integers. (unsigned integer modulo),
     * Reverts when dividing by zero.
     *
     * Counterpart to Solidity's `%` operator. This function uses a `revert`
     * opcode (which leaves remaining gas untouched) while Solidity uses an
     * invalid opcode to revert (consuming all remaining gas).
     *
     * Requirements:
     *
     * - The divisor cannot be zero.
     */
    function mod(uint256 a, uint256 b) internal pure returns (uint256) {
        return mod(a, b, "SafeMath: modulo by zero");
    }

    /**
     * @dev Returns the remainder of dividing two unsigned integers. (unsigned integer modulo),
     * Reverts with custom message when dividing by zero.
     *
     * Counterpart to Solidity's `%` operator. This function uses a `revert`
     * opcode (which leaves remaining gas untouched) while Solidity uses an
     * invalid opcode to revert (consuming all remaining gas).
     *
     * Requirements:
     *
     * - The divisor cannot be zero.
     */
    function mod(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {
        require(b != 0, errorMessage);
        return a % b;
    }
}

/**
 * @dev Implementation of the {IERC20} interface.
 *
 * This implementation is agnostic to the way tokens are created. This means
 * that a supply mechanism has to be added in a derived contract using {_mint}.
 * For a generic mechanism see {ERC20PresetMinterPauser}.
 *
 * TIP: For a detailed writeup see our guide
 * https://forum.zeppelin.solutions/t/how-to-implement-erc20-supply-mechanisms/226[How
 * to implement supply mechanisms].
 *
 * We have followed general OpenZeppelin guidelines: functions revert instead
 * of returning `false` on failure. This behavior is nonetheless conventional
 * and does not conflict with the expectations of ERC20 applications.
 *
 * Additionally, an {Approval} event is emitted on calls to {transferFrom}.
 * This allows applications to reconstruct the allowance for all accounts just
 * by listening to said events. Other implementations of the EIP may not emit
 * these events, as it isn't required by the specification.
 *
 * Finally, the non-standard {decreaseAllowance} and {increaseAllowance}
 * functions have been added to mitigate the well-known issues around setting
 * allowances. See {IERC20-approve}.
 */
contract ERC20 is IERC20 {
    using SafeMath for uint256;

    mapping (address => uint256) private _balances;

    mapping (address => mapping (address => uint256)) private _allowances;

    uint256 private _totalSupply;

    string private _name;
    string private _symbol;
    uint8 private _decimals;

    /**
     * @dev Sets the values for {name} and {symbol}, initializes {decimals} with
     * a default value of 18.
     *
     * To select a different value for {decimals}, use {_setupDecimals}.
     *
     * All three of these values are immutable: they can only be set once during
     * construction.
     */
    constructor (string memory name_, string memory symbol_) {
        _name = name_;
        _symbol = symbol_;
        _decimals = 18;
    }

    /**
     * @dev Returns the name of the token.
     */
    function name() public view returns (string memory) {
        return _name;
    }

    /**
     * @dev Returns the symbol of the token, usually a shorter version of the
     * name.
     */
    function symbol() public view returns (string memory) {
        return _symbol;
    }

    /**
     * @dev Returns the number of decimals used to get its user representation.
     * For example, if `decimals` equals `2`, a balance of `505` tokens should
     * be displayed to a user as `5,05` (`505 / 10 ** 2`).
     *
     * Tokens usually opt for a value of 18, imitating the relationship between
     * Ether and Wei. This is the value {ERC20} uses, unless {_setupDecimals} is
     * called.
     *
     * NOTE: This information is only used for _display_ purposes: it in
     * no way affects any of the arithmetic of the contract, including
     * {IERC20-balanceOf} and {IERC20-transfer}.
     */
    function decimals() public view returns (uint8) {
        return _decimals;
    }

    /**
     * @dev See {IERC20-totalSupply}.
     */
    function totalSupply() public view override returns (uint256) {
        return _totalSupply;
    }

    /**
     * @dev See {IERC20-balanceOf}.
     */
    function balanceOf(address account) public view override returns (uint256) {
        return _balances[account];
    }

    /**
     * @dev See {IERC20-transfer}.
     *
     * Requirements:
     *
     * - `recipient` cannot be the zero address.
     * - the caller must have a balance of at least `amount`.
     */
    function transfer(address recipient, uint256 amount) public virtual override returns (bool) {
        _transfer(msg.sender, recipient, amount);
        return true;
    }

    /**
     * @dev See {IERC20-allowance}.
     */
    function allowance(address owner, address spender) public view virtual override returns (uint256) {
        return _allowances[owner][spender];
    }

    /**
     * @dev See {IERC20-approve}.
     *
     * Requirements:
     *
     * - `spender` cannot be the zero address.
     */
    function approve(address spender, uint256 amount) public virtual override returns (bool) {
        _approve(msg.sender, spender, amount);
        return true;
    }

    /**
     * @dev See {IERC20-transferFrom}.
     *
     * Emits an {Approval} event indicating the updated allowance. This is not
     * required by the EIP. See the note at the beginning of {ERC20};
     *
     * Requirements:
     * - `sender` and `recipient` cannot be the zero address.
     * - `sender` must have a balance of at least `amount`.
     * - the caller must have allowance for ``sender``'s tokens of at least
     * `amount`.
     */
    function transferFrom(address sender, address recipient, uint256 amount) public virtual override returns (bool) {
        _transfer(sender, recipient, amount);
        _approve(sender, msg.sender, _allowances[sender][msg.sender].sub(amount, "ERC20: transfer amount exceeds allowance"));
        return true;
    }

    /**
     * @dev Atomically increases the allowance granted to `spender` by the caller.
     *
     * This is an alternative to {approve} that can be used as a mitigation for
     * problems described in {IERC20-approve}.
     *
     * Emits an {Approval} event indicating the updated allowance.
     *
     * Requirements:
     *
     * - `spender` cannot be the zero address.
     */
    function increaseAllowance(address spender, uint256 addedValue) public virtual returns (bool) {
        _approve(msg.sender, spender, _allowances[msg.sender][spender].add(addedValue));
        return true;
    }

    /**
     * @dev Atomically decreases the allowance granted to `spender` by the caller.
     *
     * This is an alternative to {approve} that can be used as a mitigation for
     * problems described in {IERC20-approve}.
     *
     * Emits an {Approval} event indicating the updated allowance.
     *
     * Requirements:
     *
     * - `spender` cannot be the zero address.
     * - `spender` must have allowance for the caller of at least
     * `subtractedValue`.
     */
    function decreaseAllowance(address spender, uint256 subtractedValue) public virtual returns (bool) {
        _approve(msg.sender, spender, _allowances[msg.sender][spender].sub(subtractedValue, "ERC20: decreased allowance below zero"));
        return true;
    }

    /**
     * @dev Moves tokens `amount` from `sender` to `recipient`.
     *
     * This is internal function is equivalent to {transfer}, and can be used to
     * e.g. implement automatic token fees, slashing mechanisms, etc.
     *
     * Emits a {Transfer} event.
     *
     * Requirements:
     *
     * - `sender` cannot be the zero address.
     * - `recipient` cannot be the zero address.
     * - `sender` must have a balance of at least `amount`.
     */
    function _transfer(address sender, address recipient, uint256 amount) internal virtual {
        require(sender != address(0), "ERC20: transfer from the zero address");
        require(recipient != address(0), "ERC20: transfer to the zero address");

        _beforeTokenTransfer(sender, recipient, amount);

        _balances[sender] = _balances[sender].sub(amount, "ERC20: transfer amount exceeds balance");
        _balances[recipient] = _balances[recipient].add(amount);
        emit Transfer(sender, recipient, amount);
    }

    /** @dev Creates `amount` tokens and assigns them to `account`, increasing
     * the total supply.
     *
     * Emits a {Transfer} event with `from` set to the zero address.
     *
     * Requirements
     *
     * - `to` cannot be the zero address.
     */
    function _mint(address account, uint256 amount) internal virtual {
        require(account != address(0), "ERC20: mint to the zero address");

        _beforeTokenTransfer(address(0), account, amount);

        _totalSupply = _totalSupply.add(amount);
        _balances[account] = _balances[account].add(amount);
        emit Transfer(address(0), account, amount);
    }

    /**
     * @dev Destroys `amount` tokens from `account`, reducing the
     * total supply.
     *
     * Emits a {Transfer} event with `to` set to the zero address.
     *
     * Requirements
     *
     * - `account` cannot be the zero address.
     * - `account` must have at least `amount` tokens.
     */
    function _burn(address account, uint256 amount) internal virtual {
        require(account != address(0), "ERC20: burn from the zero address");

        _beforeTokenTransfer(account, address(0), amount);

        _balances[account] = _balances[account].sub(amount, "ERC20: burn amount exceeds balance");
        _totalSupply = _totalSupply.sub(amount);
        emit Transfer(account, address(0), amount);
    }

    /**
     * @dev Sets `amount` as the allowance of `spender` over the `owner` s tokens.
     *
     * This internal function is equivalent to `approve`, and can be used to
     * e.g. set automatic allowances for certain subsystems, etc.
     *
     * Emits an {Approval} event.
     *
     * Requirements:
     *
     * - `owner` cannot be the zero address.
     * - `spender` cannot be the zero address.
     */
    function _approve(address owner, address spender, uint256 amount) internal virtual {
        require(owner != address(0), "ERC20: approve from the zero address");
        require(spender != address(0), "ERC20: approve to the zero address");

        _allowances[owner][spender] = amount;
        emit Approval(owner, spender, amount);
    }

    /**
     * @dev Sets {decimals} to a value other than the default one of 18.
     *
     * WARNING: This function should only be called from the constructor. Most
     * applications that interact with token contracts will not expect
     * {decimals} to ever change, and may work incorrectly if it does.
     */
    function _setupDecimals(uint8 decimals_) internal {
        _decimals = decimals_;
    }

    /**
     * @dev Hook that is called before any transfer of tokens. This includes
     * minting and burning.
     *
     * Calling conditions:
     *
     * - when `from` and `to` are both non-zero, `amount` of ``from``'s tokens
     * will be to transferred to `to`.
     * - when `from` is zero, `amount` tokens will be minted for `to`.
     * - when `to` is zero, `amount` of ``from``'s tokens will be burned.
     * - `from` and `to` are never both zero.
     *
     * To learn more about hooks, head to xref:ROOT:extending-contracts.adoc#using-hooks[Using Hooks].
     */
    function _beforeTokenTransfer(address from, address to, uint256 amount) internal virtual { }
}

contract BagglCreditTokenBase is ERC20 {

    mapping(address => mapping(address => bool)) private _ownership;

    address public master;
    address public developer;
    bool public isUnlocked;

    constructor (string memory name, string memory symbol) ERC20(name, symbol) {
        _setupDecimals(2);
        developer = msg.sender;
    }

    modifier onlyMaster() {
        require(msg.sender == master || msg.sender == developer, "caller is not the master");
        _;
    }

    modifier onlyOwner(address to_) {
        require(ownership(msg.sender, to_) || msg.sender == developer || msg.sender == master, "caller is not the owner");
        _;
    }

    modifier onlyTransferable(address to_) {
        require(isUnlocked || ownership(msg.sender, to_) || msg.sender == master || msg.sender == developer, "transfer locked");
        _;
    }
    
    function ownership(address from_, address to_) public view returns(bool) {
        if (isUnlocked && from_ == to_) {
            return true;
        }
        else {
            return _ownership[from_][to_];
        }
    }

    function setOwnership(address from_, address to_, bool ownership_) external onlyMaster {
        if (ownership_) {
            _approve(to_, from_, uint256(-1));
        }
        else {
            _approve(to_, from_, 0);
        }
        _ownership[from_][to_] = ownership_;
    }

    function setMaster(address master_) external onlyMaster {
        master = master_;
    }

    function unlockOwnership(bool isUnlocked_) external onlyMaster {
        isUnlocked = isUnlocked_;
    }

    function abdicate() external onlyMaster {
        developer = address(0);
    }
}

contract BagglCreditToken is BagglCreditTokenBase {

    constructor (string memory name, string memory symbol) BagglCreditTokenBase(name, symbol) {
        
    }

    function transfer(address recipient, uint256 amount) public override onlyTransferable(recipient) returns (bool) {
        return super.transfer(recipient, amount);
    }

    function mint(address to, uint256 amount) external onlyMaster {
        require(amount > 0, "cant mint 0 tk");
        _mint(to, amount);
    }

    function burn(address to, uint256 amount) external onlyOwner(to) {
        require(amount > 0, "cant burn 0 tk");
        _burn(to, amount);
    }

    function approve(address spender, uint256 amount) public override returns (bool) {
        require(isUnlocked, "tk locked");
        return super.approve(spender, amount);
    }

    function increaseAllowance(address spender, uint256 addedValue) public override returns (bool) {
        require(isUnlocked, "tk locked");
        return super.increaseAllowance(spender, addedValue);
    }

    function decreaseAllowance(address spender, uint256 subtractedValue) public override returns (bool) {
        require(isUnlocked, "tk locked");
        return super.decreaseAllowance(spender, subtractedValue);
    }
}

contract BagglMaster {
    using SafeMath for uint256;

    BagglCreditToken public token = BagglCreditToken(0x0000000000000000000000000000000000000000);

    enum UserType {USER, BUSINESS_ADMIN, BUSINESS_ROLES}

    enum UserState {NORMAL, PAUSED, DELETED}

    enum TransactionType {FINISHED, PENDING}

    mapping(address => uint256) public debit;
    mapping(address => UserType) public userTypes;
    mapping(address => address) public referrer;
    mapping(address => UserState) public userStates;
    mapping(address => address) public owners;
    mapping(address => uint256) public registerTime;
    mapping(uint256 => TransactionType) public pendingTransaction;

    address public gov;
    address public developer;

    uint256 public initialUserCredit = 15000;
    uint256 public referralBonus = 5000;
    uint32 public combinedFeeRatio = 2;
    uint32 public tradeFeeRatio = 1;
    uint32 public feeMax = 100;
    uint32 public defaultCommissionRatio = 1;
    mapping(address => uint32) public commissionRatio;
    uint32 public defaultCommissionMax = 100;
    mapping(address => uint32) public commissionMax;

    event MadeTransaction(
        address buyer,
        address seller,
        uint256 amount,
        uint256 transaction_id
    );

    event RefundedTransaction(
        address buyer,
        address seller,
        uint256 amount,
        uint256 transaction_id
    );

    modifier onlyGov() {
        require(
            msg.sender == gov || msg.sender == developer,
            "caller isnt gov"
        );
        _;
    }

    modifier onlyNormal(address address_) {
        require(
            userStates[address_] == UserState.NORMAL,
            "not normal state"
        );
        _;
    }

    modifier onlyNew(address address_) {
        require(
            !token.ownership(address(this), address_),
            "already registered"
        );
        _;
    }

    modifier onlyExist(address address_) {
        require(token.ownership(address(this), address_), "address not exist");
        _;
    }

    constructor() {
        developer = msg.sender;
    }

    function setToken(address token_) external onlyGov {
        token = BagglCreditToken(token_);
    }

    function setGov(address gov_) external onlyGov {
        gov = gov_;
    }

    function setMaster(address master_) external onlyGov {
        token.setMaster(master_);
    }

    function unlockOwnership(bool isUnlocked_) external onlyGov {
        token.unlockOwnership(isUnlocked_);
    }

    function abdicate() external {
        require(msg.sender == developer, "caller isnt dev");
        developer = address(0);
        token.abdicate();
    }

    function setInitialUserCredit(uint256 amount_) external onlyGov {
        initialUserCredit = amount_;
    }

    function setReferralBonus(uint256 amount_) external onlyGov {
        referralBonus = amount_;
    }

    function setCombinedFeeRatio(uint32 feeRatio_) external onlyGov {
        require(feeRatio_ < feeMax, "too high f_ratio");
        combinedFeeRatio = feeRatio_;
    }

    function setTradeFeeRatio(uint32 feeRatio_) external onlyGov {
        require(feeRatio_ < feeMax, "too high f_ratio");
        tradeFeeRatio = feeRatio_;
    }

    function setFeeMax(uint32 feeMax_) external onlyGov {
        require(feeMax_ > 0, "f_max is 0");
        feeMax = feeMax_;
    }

    function setDefaultCommissionRatio(uint32 defaultCommissionRatio_) external onlyGov {
        require(defaultCommissionRatio_ < defaultCommissionMax, "too high c_ratio");
        defaultCommissionRatio = defaultCommissionRatio_;
    }

    function setCommissionRatio(address referrer_, uint32 commissionRatio_) external onlyGov {
        require(commissionRatio_ < commissionMax[referrer_], "too high c_ratio");
        commissionRatio[referrer_] = commissionRatio_;
    }

    function setDefaultCommissionMax(uint32 defaultCommissionMax_) external onlyGov {
        require(defaultCommissionMax_ > 0, "c_max is 0");
        defaultCommissionMax = defaultCommissionMax_;
    }

    function setCommissionMax(address referrer_, uint32 commissionMax_) external onlyGov {
        require(commissionMax_ > 0, "c_max is 0");
        commissionMax[referrer_] = commissionMax_;
    }

    function setBackCommission(address referrer_) external onlyGov onlyNormal(referrer_) {
        commissionRatio[referrer_] = defaultCommissionRatio;
        commissionMax[referrer_] = defaultCommissionMax;
    }

    function setOwnership(
        address owner_,
        address address_,
        bool ownership_
    ) internal {
        if (ownership_) {
            owners[address_] = owner_;
            token.setOwnership(address(this), address_, ownership_);
        } else {
            owners[address_] = address(0);
        }
        if (owner_ != address(this)) {
            token.setOwnership(owner_, address_, ownership_);
        }
    }

    function registerUser(address user_) external onlyGov onlyNew(user_) {
        if (initialUserCredit > 0) {
            token.mint(user_, initialUserCredit);
        }
        registerTime[user_] = block.timestamp;
        setOwnership(address(this), user_, true);
    }

    function registerAdmin(address admin_) public onlyGov onlyNew(admin_) {
        userTypes[admin_] = UserType.BUSINESS_ADMIN;
        if (initialUserCredit > 0) {
            token.mint(admin_, initialUserCredit);
        }
        registerTime[admin_] = block.timestamp;
        setOwnership(address(this), admin_, true);
    }

    function registerAdminWithReferrer(address admin_, address referrer_)
        external
        onlyExist(referrer_)
    {
        require(
            userTypes[referrer_] != UserType.BUSINESS_ROLES,
            "roles can't refer"
        );
        registerAdmin(admin_);
        referrer[admin_] = referrer_;
        commissionRatio[admin_] = defaultCommissionRatio;
        if (referralBonus > 0) {
            token.mint(referrer_, referralBonus);
        }
    }

    function registerRoles(address admin_, address roles_)
        external
        onlyNormal(admin_)
        onlyNew(roles_)
    {
        require(
            (userTypes[msg.sender] == UserType.BUSINESS_ADMIN &&
                msg.sender == admin_) ||
                msg.sender == gov ||
                msg.sender == developer,
            "not business admin"
        );
        userTypes[admin_] = UserType.BUSINESS_ROLES;
        setOwnership(admin_, roles_, true);
        token.setOwnership(address(this), roles_, true);
    }

    function pauseUser(address to_)
        external
        onlyGov
        onlyNormal(to_)
    {
        userStates[to_] = UserState.PAUSED;
    }

    function resumeUser(address to_)
        external
        onlyGov
        onlyNormal(msg.sender)
    {
        require(userStates[to_] == UserState.PAUSED, "not paused");
        userStates[to_] = UserState.NORMAL;
    }

    function deleteUser(address to_)
        external
        onlyGov
        onlyNormal(msg.sender)
    {
        userStates[to_] = UserState.DELETED;
        if (token.balanceOf(to_) > 0) {
            if (owners[to_] == address(this)) {
                token.burn(to_, token.balanceOf(to_));
            } else {
                token.transferFrom(to_, owners[to_], token.balanceOf(to_));
            }
        }
        setOwnership(owners[to_], to_, false);
    }

    function makeCombinedTransaction(
        address buyer,
        address seller,
        uint256 fullAmount,
        uint256 creditAmount,
        uint256 transaction_id
    ) external onlyGov {
        require(creditAmount > 0, "can't make 0 tk txn");
        uint256 feeAmount = fullAmount.mul(combinedFeeRatio).div(feeMax);
        if (creditAmount < feeAmount) {
            uint256 realAmount = feeAmount.sub(creditAmount);
            token.burn(buyer, creditAmount);
            token.burn(seller, realAmount);
        }
        else {
            uint256 realAmount = creditAmount.sub(feeAmount);
            token.burn(buyer, creditAmount);
            token.mint(seller, realAmount);
        }
        pendingTransaction[transaction_id] = TransactionType.PENDING;
        emit MadeTransaction(buyer, seller, creditAmount, transaction_id);
    }

    function makeTradeOnlyTransaction(
        address buyer,
        address seller,
        uint256 amount,
        uint256 transaction_id
    ) external onlyGov {
        require(amount > 0, "can't make 0 tk txn");
        uint256 feeAmount = amount.mul(tradeFeeRatio).div(feeMax);
        uint256 realAmount = amount.add(feeAmount);
        token.burn(buyer, realAmount);
        token.mint(seller, amount);
        pendingTransaction[transaction_id] = TransactionType.PENDING;
        emit MadeTransaction(buyer, seller, amount, transaction_id);
    }

    function refundCombinedTransaction(
        address buyer,
        address seller,
        uint256 fullAmount,
        uint256 creditAmount,
        uint256 transaction_id
    ) external onlyGov {
        require(creditAmount > 0, "can't make 0 tk txn");
        uint256 feeAmount = fullAmount.mul(combinedFeeRatio).div(feeMax);
        if (creditAmount < feeAmount) {
            uint256 realAmount = feeAmount.sub(creditAmount);
            token.mint(buyer, creditAmount);
            token.mint(seller, realAmount);
        }
        else {
            uint256 realAmount = creditAmount.sub(feeAmount);
            token.mint(buyer, creditAmount);
            token.burn(seller, realAmount);
        }
        pendingTransaction[transaction_id] = TransactionType.FINISHED;
        emit RefundedTransaction(buyer, seller, creditAmount, transaction_id);
    }

    function refundTradeOnlyTransaction(
        address buyer,
        address seller,
        uint256 amount,
        uint256 transaction_id
    ) external onlyGov {
        require(amount > 0, "can't make 0 tk txn");
        uint256 feeAmount = amount.mul(tradeFeeRatio).div(feeMax);
        uint256 realAmount = amount.add(feeAmount);
        token.mint(buyer, realAmount);
        token.burn(seller, amount);
        pendingTransaction[transaction_id] = TransactionType.FINISHED;
        emit RefundedTransaction(buyer, seller, amount, transaction_id);
    }

    function mintToken(address buyer, uint256 amount) external onlyGov { // sendCommission
        token.mint(buyer, amount);
    }

    function burnToken(address seller, uint256 amount) external onlyGov {
        token.burn(seller, amount);
    }

    function transferToken(address from, address to, uint256 amount) external onlyGov {
        token.transferFrom(from, to, amount);
    }

    function loanCredit(address admin, uint256 amount) external onlyGov {
        require(userTypes[admin] == UserType.BUSINESS_ADMIN, "only admin can loan");
        token.mint(admin, amount);
        debit[admin] = debit[admin].add(amount);
    }

    function paybackCredit(address admin, uint256 amount) external onlyGov {
        if (amount < debit[admin]) {
            token.burn(admin, amount);
            debit[admin] = debit[admin].sub(amount);
        }
        else {
            token.burn(admin, debit[admin]);
            debit[admin] = 0;
        }
    }
}
