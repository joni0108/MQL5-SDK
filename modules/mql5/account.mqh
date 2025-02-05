//+------------------------------------------------------------------+
//|                                                       market.mqh |
//|                                                     MIT LICENSED |
//|                                  https://www.github.com/joni0108 |
//+------------------------------------------------------------------+
//version 1.00

#property copyright "Created by Jonathan Fernandez"
#property link      "https://www.github.com/joni0108"

// Imports
#include <MQL5-SDK/internal/enums.mqh>
#include <MQL5-SDK/internal/errors.mqh>

//+------------------------------------------------------------------+
class CAccount
{
private:
    
public:    
    CAccount() { }

    // Getters
    bool InfoBoolean(ENUM_ACCOUNT _info);
    int InfoInteger(ENUM_ACCOUNT _info);
    double InfoDouble(ENUM_ACCOUNT _info);
    string InfoString(ENUM_ACCOUNT _info);
} Account;

bool CAccount::InfoBoolean(ENUM_ACCOUNT _info)
{
    if(_info != 4 && _info != 5)
    {
        ErrorHandler.SetError(SDK_ERROR_ENUM_OUT_OF_RANGE);
        ErrorHandler.PrintErrorMessage();
        return false;
    }
    switch(_info)
    {
        case 4:
            return (bool)AccountInfoInteger(ACCOUNT_TRADE_ALLOWED);
        case 5:
            return (bool)AccountInfoInteger(ACCOUNT_TRADE_EXPERT);
    }

    return false;
}

int CAccount::InfoInteger(ENUM_ACCOUNT _info)
{
    if(_info < 0 || _info > 3)
    {
        ErrorHandler.SetError(SDK_ERROR_ENUM_OUT_OF_RANGE);
        ErrorHandler.PrintErrorMessage();
        return -1;
    }
    switch(_info)
    {
        case 0:
            return (int)AccountInfoInteger(ACCOUNT_LOGIN);
        case 1:
            return (int)AccountInfoInteger(ACCOUNT_TRADE_MODE);
        case 2:
            return (int)AccountInfoInteger(ACCOUNT_LEVERAGE);
        case 3:
            return (int)AccountInfoInteger(ACCOUNT_LIMIT_ORDERS);
    }

    return -1;
}

double CAccount::InfoDouble(ENUM_ACCOUNT _info)
{
    if(_info < 6 || _info > 12)
    {
        ErrorHandler.SetError(SDK_ERROR_ENUM_OUT_OF_RANGE);
        ErrorHandler.PrintErrorMessage();
        return -1;
    }
    switch(_info)
    {
        case 6:
            return AccountInfoDouble(ACCOUNT_BALANCE);
        case 7:
            return AccountInfoDouble(ACCOUNT_CREDIT);
        case 8:
            return AccountInfoDouble(ACCOUNT_EQUITY);
        case 9:
            return AccountInfoDouble(ACCOUNT_MARGIN_FREE);
        case 10:
            return AccountInfoDouble(ACCOUNT_MARGIN);
        case 11:
            return AccountInfoDouble(ACCOUNT_PROFIT);
        case 12:
            return AccountInfoDouble(ACCOUNT_MARGIN_LEVEL);
    }

    return -1;
}

string CAccount::InfoString(ENUM_ACCOUNT _info)
{
    if(_info < 13 || _info > 16)
    {
        ErrorHandler.SetError(SDK_ERROR_ENUM_OUT_OF_RANGE);
        ErrorHandler.PrintErrorMessage();
        return "";
    }
    switch(_info)
    {
        case 13:
            return AccountInfoString(ACCOUNT_COMPANY);
        case 14:
            return AccountInfoString(ACCOUNT_NAME);
        case 15:
            return AccountInfoString(ACCOUNT_SERVER);
        case 16:
            return AccountInfoString(ACCOUNT_CURRENCY);
    }

    return "";
}