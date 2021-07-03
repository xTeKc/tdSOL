# Complete ERC20 Token & DEX 
###### From scratch - Written in Solidity
***
###### Testing using Truffle
---
![DGLD-DEX](https://user-images.githubusercontent.com/81730792/123808908-266d9100-d8bf-11eb-9c70-6c3c9eca6f84.png)
***
This project is a display of a Token contract and an Exchange contract combined to have the Token hard coded into the Exchange and add the ability to buy, sell, and interact with Ethereum. The data shows the different prices for buying and selling as well as the  Trade history and a price chart.
***

###### To get started:
First, make sure you have the tools to setup the project.


__NodeJS, Truffle & Ganache-Cli__

+ _Arch Linux - NodeJS & Npm_

    + `sudo pacman -S nodejs npm`

+ _Debian - NodeJS & Npm_

    + `sudo apt install nodejs npm`

+ _Truffle_
    + `npm install -g truffle`

+ _Ganache-Cli_
    + `npm install -g ganache-cli`
---
Once you get the tools installed to run the project, make sure to Clone the repo & install the dependencies that are in the package.json file by typing `npm install` into the terminal. Make sure you have ganache-cli open in a seperate terminal tab, so that it doesn't interfere with your main terminal. To compile and migrate the contracts, type `truffle migrate --reset` into the terminal. After you have compiled the contracts, you can then seed the exchange by typing `truffle exec scripts/seed-exchange.js` this will execute the created scripts to display the data onto the user interface. Make sure you are logged into your developer MetaMask, then to display the user interface, open a new terminal tab & start the React App by typing `npm run start` this should prompt for you to login to your MetaMask and show all the data for the Token and the Exchange.
