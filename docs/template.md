# `Module-Name` Module
This is a module of the MQL package. It will allow you to import all account-related data and operations.

## Import
If you didn't imported all the SDK or the MQL module, you can import this module using:
```cpp
#include <MQL5-SDK/modules/mql5/account.mqh>
```

# Class `Class-Name`
## Methods
```cpp
bool isMyClass(); // Gets if the class is your class
```

## Emuns
```cpp
enum ENUM_ACCOUNT
{
    // Integer expected return value
    LOGIN = 0, // Account login
    TRADE_MODE = 1, // Trade mode
    LEVERAGE = 2, // Leverage
    LIMIT_ORDERS = 3, // Limit orders

    // Boolean expected return value
    TRADE_ALLOWED_ACCOUNT = 4, // Trade allowed
    TRADE_EXPERTS = 5, // Trade experts

    // Double expected return value
    BALANCE = 6, // Balance
    CREDIT = 7, // Credit
    EQUITY = 8, // Equity
    MARGIN_FREE = 9, // Free margin
    MARGIN = 10, // Margin
    PROFIT = 11, // Profit
    MARGIN_LEVEL = 12, // Margin level

    // String expected return value
    COMPANY = 13, // Company
    NAME = 14, // Name
    SERVER = 15, // Server
    CURRENCY = 16, // Currency
};
```

## Errors returned
```cpp
SDK_ERROR_ENUM_OUT_OF_RANGE - If the ENUM_ACCOUNT value is out of range
```

## Usage Example
Please, if the module is complex, add an usage example to the doc. Or if you updated a current module which had a usage example, add your new features to the current usage example.

## Changelog
### v1.00
- Initial version of the file.
