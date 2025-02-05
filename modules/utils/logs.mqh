//+------------------------------------------------------------------+
//|                                                         logs.mqh |
//|                                                     MIT LICENSED |
//|                                  https://www.github.com/joni0108 |
//+------------------------------------------------------------------+
//version 1.00

#property copyright "Created by Jonathan Fernandez"
#property link      "https://www.github.com/joni0108"

// Imports
#include <MQL5-SDK/internal/enums.mqh>
#include <MQL5-SDK/internal/errors.mqh>
#include <MQL5-SDK/modules/mql5/files.mqh>

//+------------------------------------------------------------------+

class CLogs
  {
public:
                     CLogs(void) {}
                    ~CLogs(void) {}

   void              Create(string name, string path = NULL, bool commonFlag = false);      //Class Constructor, call it in the OnInit()
   void              Add(string details, LOG_TYPE type, int errorCode = 0);                  //Add a log to the file
   void              Initialize();                                                           //Add the initialization line
   void              Unitialize();                                                           //Add the uninitialization line

private:
   string            m_name;
   string            m_path;
   bool              m_inCommon;
  };

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void CLogs::Create(string name,string path=NULL,bool commonFlag=false)
  {
   m_name = name + ".log";
   m_path = path;
   m_inCommon = commonFlag;
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void CLogs::Add(string details, LOG_TYPE type, int errorCode = 0)
  {
   int fileHandle = INVALID_HANDLE;
   string mode = "LOG  ";
   bool firstTime = false;

   if(!FileIsExist(m_path + m_name)) 
      firstTime = true;

   if(type == ERROR)
      mode = "ERROR";
   else
      if(type == WARNING)
         mode = "WARN ";
      else
         if(type == INFO)
            mode = "INFO ";
         else
            if(type == DEBUG)
               mode = "DEBUG";

   if(m_inCommon)
     {
      fileHandle =  FileOpen(m_path + m_name, FILE_WRITE | FILE_READ | FILE_TXT | FILE_COMMON);
     }
   else
     {
      fileHandle = FileOpen(m_path + m_name, FILE_WRITE | FILE_READ | FILE_TXT);
     }

   if(fileHandle == INVALID_HANDLE)
   {
    ErrorHandler.SetError(SDK_ERROR_FILE_OPENING_FAILED);
    return;
   }

   if(!firstTime)
     {
      FileSeek(fileHandle,0,SEEK_END);
      FileWrite(fileHandle,(TimeToString(TimeLocal()) + " | " + mode +  " | Error code = " + IntegerToString(errorCode) + " | Description = " + details));
     }
   else
     {
      FileWrite(fileHandle,TimeToString(TimeLocal()) + " | " + "INFO-" +  " | The Logs Files has been created.");
     }

   FileClose(fileHandle);
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void CLogs::Initialize(void)
  {
   int fileHandle = INVALID_HANDLE;

   if(m_inCommon)
     {
      fileHandle =  FileOpen(m_path + m_name, FILE_WRITE | FILE_READ | FILE_TXT | FILE_COMMON);
     }
   else
     {
      fileHandle = FileOpen(m_path + m_name, FILE_WRITE | FILE_READ | FILE_TXT);
     }

  if(fileHandle == INVALID_HANDLE)
   {
    ErrorHandler.SetError(SDK_ERROR_FILE_OPENING_FAILED);
    return;
   }

   FileSeek(fileHandle,0,SEEK_END);
   FileWrite(fileHandle,(TimeToString(TimeLocal()) + " | " + "INIT " +  " | The Logs Files has been initialized------------------------------------------------------------"));
   FileClose(fileHandle);
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void CLogs::Unitialize(void)
  {
   int fileHandle = INVALID_HANDLE;

   if(m_inCommon)
     {
      fileHandle =  FileOpen(m_path + m_name, FILE_WRITE | FILE_READ | FILE_TXT | FILE_COMMON);
     }
   else
     {
      fileHandle = FileOpen(m_path + m_name, FILE_WRITE | FILE_READ | FILE_TXT);
     }
  if(fileHandle == INVALID_HANDLE)
   {
    ErrorHandler.SetError(SDK_ERROR_FILE_OPENING_FAILED);
    return;
   }

   FileSeek(fileHandle,0,SEEK_END);
   FileWrite(fileHandle,(TimeToString(TimeLocal()) + " | " + "DEINIT" +  "| The Logs Files has been deinitialized----------------------------------------------------------\n"));
   FileClose(fileHandle);
  }
//+------------------------------------------------------------------+