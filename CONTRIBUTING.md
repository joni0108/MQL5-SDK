# Contributing Guidelines
Hello developer, thank you for wanting to contribute to the project, feel welcome to do so, these are some guidelines and goals to achieve when contributing.

## Branch
For Pull Requests, use the `dev` branch only.

## What files to include?
- The source code of what you are adding modifying.
- The docs file of what you are adding/modifying.
- A changelog notes of what you added/changed with your contribution.

## Files Templates

### Source Code Template

Header
```cpp
//+------------------------------------------------------------------+
//|                                                     filename.mqh |
//|                                                     MIT LICENSED |
//|                                  https://www.github.com/joni0108 |
//+------------------------------------------------------------------+
//version 1.00

#property copyright "Created by <Author Name>, Edited by <Your Name>"
#property link      "https://www.github.com/joni0108"

// Imports
#include <MQL5-SDK/internal/errors.mqh>

//+------------------------------------------------------------------+
```

**Guidelines**
- Mantain the header structure across all source files.
- All files included on this SDK are MIT licensed.
- Give credits, if its you library, add the credits under the `created by` section, if is another's library, add their credits, if you edited another's or this SDK's library, add your name under the `edited by` section and the author name is not yet added.
- The property link will redirect to this repository.
- Use OOP (Object Oriented Programming) as much as possible, with the classes name starting with a letter `C` and without it for the static call.
- Always update the file version when doing an update:
    - For a minor update that keeps retrocompatibility, just add `0.01` for hotfix, or `0.10` for improvements to the version.
    - For a major version where retrocompatibility is lost, add `1.00` to the version.

```cpp
class CMyClass {
    {
        private:
    
        public:    
            CAccount() { }

            // Getters
            bool isMyClass();
} MyClass;
```

### Docs
[Documentation File Template](https://www.github.com/joni0108/MQL5-SDK/docs/template.md)