//+------------------------------------------------------------------+
//|                                                       errors.mqh |
//|                               Copyright 2025, Jonathan Fernandez |
//|                                  https://www.github.com/joni0108 |
//+------------------------------------------------------------------+
#property copyright "Copyright 2025, Jonathan Fernandez"
#property link      "https://www.github.com/joni0108"

// Library for handling errors
enum ENUM_SDK_ERRORS
{
    SDK_ERROR_NONE = 0,
    SDK_ERROR_INVALID_PARAMETER = 1,
    SDK_ERROR_ENUM_OUT_OF_RANGE = 2,
    SDK_ERROR_UNINITIALIZED_CLASS_MEMBER = 3,
    SDK_ERROR_FILE_OPENING_FAILED = 4,
    SDK_ERROR_EMPTY_ARRAY = 5,
    SDK_ERROR_DIVISION_BY_ZERO = 6
};

class CErrorsHandler
{
private:
    ENUM_SDK_ERRORS m_errorCode;

public:
    CErrorsHandler() 
    {
        this.m_errorCode = SDK_ERROR_NONE;
        return;
    }

    void SetError(ENUM_SDK_ERRORS _error);
    void ClearError();
    bool HasError();
    string GetErrorMessage();
    int GetErrorCode();
    void PrintErrorMessage();

} ErrorHandler;

void CErrorsHandler::SetError(ENUM_SDK_ERRORS _error)
{
    m_errorCode = _error;
    return;
}

void CErrorsHandler::ClearError()
{
    m_errorCode = SDK_ERROR_NONE;
    return;
}

bool CErrorsHandler::HasError()
{
    return m_errorCode != SDK_ERROR_NONE;
}

string CErrorsHandler::GetErrorMessage()
{
    switch (m_errorCode)
    {
        case SDK_ERROR_NONE:
            return "No error";
        case SDK_ERROR_INVALID_PARAMETER:
            return "Invalid parameter";
        case SDK_ERROR_ENUM_OUT_OF_RANGE:
            return "Enum out of range";
        case SDK_ERROR_UNINITIALIZED_CLASS_MEMBER:
            return "Uninitialized class member";
        case SDK_ERROR_FILE_OPENING_FAILED:
            return "It was an error while trying to open the file";
        case SDK_ERROR_EMPTY_ARRAY:
            return "Empty array passed as parameter or as result";
        case SDK_ERROR_DIVISION_BY_ZERO:
            return "Division by zero";
        default:
            return "Unknown error";
    }
}

int CErrorsHandler::GetErrorCode()
{
    return m_errorCode;
}

void CErrorsHandler::PrintErrorMessage()
{
    Print("[ERROR] ",GetErrorMessage());
    return;
}