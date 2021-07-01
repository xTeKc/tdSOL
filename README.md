# Complete ERC20 Token & DEX from scratch written in Solidity
*************************
### testing using Truffle
-------------------------
![DGLD-DEX](https://user-images.githubusercontent.com/81730792/123808908-266d9100-d8bf-11eb-9c70-6c3c9eca6f84.png)

__To get started__:
First, make sure you have the tools to setup the project.


__NodeJS__:

_Arch Linux - NodeJS & Npm_

+ `sudo pacman -S nodejs npm`

_Debian - NodeJS & Npm_

+ `sudo apt install nodejs npm`
---
__Truffle__:

+ `npm install -g truffle`
---
__Ganache-Cli__:

+ `npm install -g ganache-cli`
---
__Clone the repo & install the dependencies__:

+ `npm install`
---

__Make sure you have ganache-cli open__

---

__Migrate the Contracts__:

+ `truffle migrate --reset`

---
__Seed the Exchange__:

+ `truffle exec scripts/seed-exchange.js`
---
__Make sure you are logged into your developer MetaMask__

---

__To display the UI__:
Open a new terminal tab & start the React App.

+ `npm run start`
