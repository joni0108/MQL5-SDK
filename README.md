# MQL-SDK
![](https://img.shields.io/github/license/joni0108/MQL5-SDK)
![](https://img.shields.io/github/v/release/joni0108/MQL5-SDK?include_prereleases&label=last%20release)
![](https://img.shields.io/github/repo-size/joni0108/MQL5-SDK)
![](https://img.shields.io/badge/Languages-MQL5-blue)
![](https://img.shields.io/github/issues-raw/joni0108/MQL5-SDK)

**What is MQL5-SDK?**
This is an open-source framework created with the goal of easy development for EAs in the trading platform most used worldwide (Metatrader 5).

## What is Metaquotes Language (MQL5)
MQL5 is the programming language used by the trading platform Metatrader 5. It does share syntax with C++ and C#, so knowing any of these languages will make you know MQL as well. <br>
MQL is a close environment, this means that the platforms are allowed to access files just within the data folder of themself, however, you can use other more complex features by including DLL files in your project. <br>
With this language you will be able to code trading robots, trading indicators, and other tools that help traders to diversify and take decisions. <br>
The compiled version of the MQL language are `ex5` files.

## Why do I need this SDK?
This SDK will have a common API for all future MQL5 versions, so you don't have to update your EAs if something challenge, but it also will include several modules that will extend MQL5 features to code everything very easily, so the answer is the same as why to use React if you have native JavaScript, simplicity and features extensibility.

## Docummentation
You will have the official MQL documentation in the following link for [MQL5](https://www.mql5.com/en/docs). <br>
However, while using our SDK we changed most of the functions and methods to be able to create an unique and stable API, so reach our docummentation in order to understand how to se them. <br>
In the **Modules** section of this ReadMe files you can reach the documentation for each module by clicking their hyperlink.

## Getting Started
### Installing the SDK
At the moment, it can only be installed manually, but we are working on create an installer for Windows and MacOS.

**MANUALLY**: <br>
1. Download or clone the SDK repository in your computer, and unzip it if zipped.
2. If you have a Metatrader app already installed in your system, skip to the step **4**.
3. Install the [Metatrader 5](https://www.metatrader5.com/en/download) platform in your system.
4. Go to the Metatrader data folder; The path looks like this `C:\Users\<your username>\AppData\Roaming\MetaQuotes\Terminal\<a-random-terminal-name>\MQL5\Include`
5. Create a folder with name `MQL5-SDK` inside `includes` and `libraries` folder
6. Copy the files from the `SDK downloaded folder/modules` and `SDK downloaded folder/internal` into the `/includes/MQL5-SDK` in your Metatrader 5 data folder.
7. Copy the files from the `SDK downloaded folder/libraries` into the `/libraries/MQL5-SDK` in your Metatrader 5 data folder.
8. Copy the file `SDK downloaded folder/mql5.mqh` into the `/includes/MQL5-SDK` in your Metatrader 5 data folder.
9. Create a new EA and add the following line in the top of it:

```cpp
#include <SDK-MQL/all.mqh>
```

**Files Structure**
This should be the structure files for your Metatrader 5 Data folder:

```
MQL5
 |
 |--- /includes
 |       |
 |       |--- /MQL5-SDK
 |               |--- /modules
 |               |       |
 |               |       |--- "all the modules..."
 |               |
 |               |--- /internal
 |               |        |
 |               |        |--- "all the internal files like error, enums, etc..."
 |               |
 |               |--- mql5.mqh
 |       
 |
 |--- /libraries
          |
          |--- /MQL5-SDK
          |        |
                   |--- "all the .dll files..."
```


Notes: <br>
You can also include specific modules instead of the whole framework, for doing so, go to the module documentation to see the including rules.

Do not forget to check the docummentation of each library by clicking on the module name in the table below.



## Documentation
Access the documentation files in MD format by clicking in the `blue` link of each module name of the table below to check its docummentation.

# Packages & Modules
The SDK will be divided in a package-modules-classes structure. Where,
* A `package` will be like a whole sub-framework. A set of modules and classes for an specific task.
* A `module` can contain 1 or more classes for different sub-tasks.

## Understanding the table
The table below has all the `packages` and `modules`, and their current status/version.

To import them individually you can use:
```cpp
#include <MQL-SDK/<Import as column value>
```

Remember the hierarchy, which means that if you included the whole `mql` package, you do not need to include individually any of its modules. And if you only included one module, example `account` from `mql`, you must included other modules in order to use them.


| Package    |                                     Module                                      | Import as                            | Description                                                                                   | Last Release      |
|:-----------|:-------------------------------------------------------------------------------:|:-------------------------------------|:----------------------------------------------------------------------------------------------|:------------------|
| `MQL`      |                                                                                 | `modules/mql5.mqh`                   | Allows you to code any EA in a single language and export it to both languages (MQL4 & MQL5). |                   |
| ->         |  [Account](https://github.com/joni0108/MQL-SDK/tree/main/docs/mql5/account.md)  | modules/mql5/account.mqh             | Handle all the account-related information.                                                   | 1.00              |
| ->         | [Terminal](https://github.com/joni0108/MQL-SDK/tree/main/docs/mql5/terminal.md) | modules/mql5/terminal.mqh            | Handle all the terminal-related information.                                                  | 1.00              |
| ->         |   [Market](https://github.com/joni0108/MQL-SDK/tree/main/docs/mql5/market.md)   | modules/mql5/market.mqh              | Handle all the market-related information                                                     | 1.00              |
| ->         |    [Trade](https://github.com/joni0108/MQL-SDK/tree/main/docs/mql5/trade.md)    | modules/mql5/trade.mqh               | Send, Manage, and handle orders and positions                                                 | 1.00              |
| ->         |    [Files](https://github.com/joni0108/MQL-SDK/tree/main/docs/mql5/files.md)    | modules/mql5/files.mqh               | Handle different files types, including .sets, .logs and .dat                                 | 1.00              |
| `Network`  |                                                                                 | `modules/network.mqh`                | Allows you to make network-related operations like web-requests, working with sockets, etc    |                   |
| ->         |                                   Web Sockets                                   | modules/network/sockets.mqh          | Handle server and client sockets                                                              | Under Development |
| `Terminal` |                                                                                 | `modules/terminal.mqh`               | Simulate human operations like click and keyboard presses from code using DLLs.               |                   |
| ->         |                                 Human New Order                                 | modules/terminal/neworder.mqh        | Simulate clicks on the New Order button and windows                                           | Under Development |
| ->         |                                 Human One Click                                 | modules/terminal/oneclick.mqh        | Simulate clicks on the One Click Window                                                       | Under Development |
| ->         |                             Human AutoTrading Link                              | modules/terminal/autotrading.mqh     | Toggle the Auto Trading button in the terminal from code                                      | Under Development |
| ->         |                                     KeyMap                                      | modules/terminal/keymap.mqh          | Detect and return as a string a key pressed by the user                                       | Under Development |
| ->         |                                      Login                                      | modules/terminal/login.mqh           | Simulate clicks and entries on the Login windows                                              | Under Development |
| `APIs`     |                                                                                 | `modules/apis.mqh`                   | Allow connection to some of the most famouses APIs                                            |                   |
| ->         |                                     Discord                                     | modules/apis/discord.mqh             | Allow sending data to a discord channel through a Discord Webhook                             | Under Development |
| ->         |                                    Telegram                                     | modules/apis/telegram.mqh            | Allow sending data to a telegram channel using a telegram bot and api key                     | Under Development |
| ->         |                                     Notion                                      | modules/apis/notion.mqh              | Allow sending data to a Notion database                                                       | Under Development |
| ->         |                                      Coda                                       | modules/apis/coda.mqh                | Allow sending data to a coda table (a better alternative than Notion)                         | Under Development |
| ->         |                                     Sheets                                      | modules/apis/sheets.mqh              | Allow sending data to a Google Sheet                                                          | Under Development |
| ->         |                                      News                                       | modules/apis/news.mqh                | Allows you to get information about news in the market                                        | Under Development |
| `Concepts` |                                                                                 | `modules/concepts.mqh`               | Handle some trading concepts to be used in strategies                                         |                   |
| ->         |                              Candlestick Patterns                               | modules/concepts/candlespatterns.mqh | Handle candlesticks' patterns                                                                 | Under Development |
| ->         |                                  ChartPatterns                                  | modules/concepts/chartpatterns.mqh   | Handle chart's patterns                                                                       | Under Development |
| ->         |                                     SRZones                                     | modules/concepts/srzones.mqh         | Handle Support and Resistance zones                                                           | Under Development |
| ->         |                                    Liquidity                                    | modules/concepts/liquidity.mqh       | Handle different liquidity types                                                              | Under Development |
| ->         |                                       OBs                                       | modules/concepts/obs.mqh             | Handle Order Blocks                                                                           | Under Development |
| ->         |                                     SDZones                                     | modules/concepts/sdzones.mqh         | Handle Supply and Demand Zones                                                                | Under Development |
| ->         |                                       FVG                                       | modules/concepts/imb.mqh             | Handle Imbalances and Inneficiencies in price                                                 | Under Development |
| ->         |                                      Trend                                      | modules/concepts/imb.mqh             | Handles the trend, including impulse, pullback, CHoCH, etc.                                   | Under Development |
| `Utils`    |                                                                                 | `modules/backtest.mqh`               | Allows you lot of functions that will help you during a backtest                              |                   |
| ->         |    [Logs](https://github.com/joni0108/MQL-SDK/tree/main/docs/utils/logs.md)     | modules/utils/logs.mqh               | Help you store logs in a very well structure file, easy to read                               | 1.00              |
| ->         |                                     Reports                                     | modules/backtest/reports.mqh         | Allows you to get detailed reports with images about a backtest                               | Under Development |
| ->         |                                   Multi Pairs                                   | modules/backtest/multipairs.mqh      | Allows you to run backtest in multiple pairs at once                                          | Under Development |
| ->         |                                  Trading Math                                   | modules/tools/tradingmath.mqh        | Allows you to calculate a big amount of trading insights for using it in reports              | Under Development |
| ->         |                                     Charts                                      | modules/tools/charts.mqh             | Functions to work with charts, like closing, opening, save templates, etc                     | Under Development |
| ->         |                                   Time Inputs                                   | modules/tools/timeinput.mqh          | Allows you to get a time input from the user                                                  | Under Development |
| ->         |                                      Debug                                      | modules/tools/debug.mqh              | Better Print()s, and other useful debugging functions                                         | Under Development |
| ->         |                               JSON Serialization                                | modules/network/json.mqh             | Serializes and Deserializes JSON data for web requests                                        | Under Development |

# Repository Structure
## Branches
Are 3 branches: `main`, `main-beta`, and `dev`.
* `Main`: This branch will be up-to-date with the lastest `stable release`. This branch have been fully tested and works successfully.
* `Main-beta`: This branch will be up-to-date with the lastest `beta release`, so it can contain small logical bugs, but no compilation errors.
* `Dev`: This is the branch I will be using to update the SDK. Do not clone this branch as it contains fatal errors and uncomplete code. After the code get tested, it will be merged with the main branch.

## Releases
Here will be the updated tested code. It will be divided in `beta` and `stable` releases, where beta does compile and got tested via code, the stable release have been human tested.
If you will use the code, and not improve it, always download an `stable release` to avoid bugs in your projects.

## Versions
The release version structure will be `x.yy.zz-<type>`.

### Types
As explained before, it will be `beta` and `stable`.

### Z
An increment in Z means a hotfix, the syntax was not affected so you can update the files with not adjustment in your code.

### Y
An increment in Y means an adjustment in the modules, maybe because mnore modules were added, or current modules were extended. No syntax changes were made to the current modules, so you don't have to do any adjustment in your project.

### X
An increment in X means that the syntax were changed in at least one of the classes, which means that you have to make adjustment to your projects in order to support this version. This is due to an extension, fix, or deletion of functions, classes, or modules, a change in the folder structure, or a change in function, classes, or constants names.

We will avoid doing this as much as possible, but sometimes is needed to be done.

### Examples
* Release from v1.2.1 to 1.2.2 - The code syntax is 100% compatible with previews versions, not adjustments in your projects is needed.
* Release from v1.2.2 to 1.3.0 - One of the modules changed its syntax in some way that you must make a few adjustments in your projects.
* Release from v1.3.0 to 2.0.0 - The whole SDK version is mostly incompatible with the previews version. You may keep using the last version or make the jump, but you must do lot of adjustments in your code to update them to the new version.

## Changelogs
You can check the changelogs by clicking [here](CHANGELOGS.md).

# FAQs
### **How stable is it?**
All the packages and modules on an official `release` and `main branch` will be ready to production use on your projects.

### **A built-in MQL5 function is not in the SDK**
This can be because that function is 100% compatible in MQL5 by default and easy to use, so it does not need to be included in the SDK. That way we save disk and memory.

### **Can I code my indicators here?**
Yes, you can, however, the SDK is mostly designed for Expert Advisors and Scripts.

### **Can I improve the SDK?**
Of course, this is an open-source SDK and you can contribute in several ways. Here's some examples:
* **By reporting bugs**: This will help us to fix them on future updates.
* **By suggesting**: If you have an idea of a module, package, or feature that you want in the SDK, leave it in the Issues tab and we will implement it.
* **By suggesting libraries**: If you know or even have a library that want to incorporate in the SDK, leave it in the Issues section or make a pull request on the `Open` branch and I will check it out.
* **By improving the actual code**: Maybe optimize it, or adding new functions or classes to actual modules will help.
* **By sharing it**: Sharing the repository is forum will help others developers to reach it, and more developers means more improvements to the project.

If you want to directly contribute with code, read the [contributing][CONTRIBUTING.md] rules and guidelines.
