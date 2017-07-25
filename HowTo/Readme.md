
# Education in tokens and ICO contracts.

## How do I receive DEX tokens?

You should send ETC to the ICO contract address. You will receive DEX automatically after the transaction will submit.

You can use MyEtherWallet to do it, for example.

![alt text](https://github.com/Dexaran/ICO/blob/master/HowTo/participate_in_ICO.jpg)

## When will I receive my DEX tokens?

You will instantly receive DEX after you transaction to the ICO address will submit.

##  How do I interact with it?

You can use any wallet that supports ERC20 or ERC223 tokens to watch/transfer your tokens. You can also use MyEtherWallet for this purpose.

You should **add token** at your MyEtherWallet tab to interact with your tokens. Press "Add custom token" button and fill dropdown text boxes with this parameters:

Address: 0x345a9e6c44d546dae5141700372986c4bb532e3d

Token Symbol: DEX

Decimals: 18

Then press "Save" button.

![alt text](https://github.com/Dexaran/ICO/blob/master/HowTo/MEW_DEX.png)

#### IMPORTANT: You should add `0x345a9e6c44d546dae5141700372986c4bb532e3d` address to watch token. This is an address of token contract. If you will add ICO contract address then you will not be able to watch your tokens because of ICO contract is not a token contract.

After you added DEX tokens in your MyEtherWallet tab you can choose what currency would you like to transfer when making a  transaction. Click on currency symbol to choose DEX token from dropdown menu:

![alt text](https://github.com/Dexaran/ICO/blob/master/HowTo/send_DEX_token.jpg)

## Where it will be stored?

Token balance is mappable variable inside token contract in fact.

For ordinary users and non-technicians token is the same thing as ETC. You can hold token on your ETC-address, you can transfer token from one ETC-address to another ETC-address. MyEtherWallet will show your token balance as well.

When you are sending ETC you should pay a little comission in ETC.
Token differs from ETC so that when you send a token, you still pay a commission in ETC.

## How to vote?

Voting process is not yet defined. I've said that I will establish a final version of voting contract at 1st September, 2018.

I have a [Trial Voting](https://github.com/Dexaran/ICO/issues/1) version now. You should transfer your tokens to voting contract to participate in trial voting.

For example, to vote for item "1", you must transfer the token to `0x01` and vote for item "2", you must transfer the token to the address `0x02`.

**IMPORTANT !** You should attach 90 000 GAS to the voting transactions. Otherwise your tokens would not be transferred to the contract address and the transaction will fail (tokens would just stay at your balance in this case)

Tokens would not be spent during the voting. You can withdraw tokens from token contract at any time. I have not yet created a web UI for this but I will do it a bit later.

After the voting will end all remaining tokens would be sent to their owners automatically. It means if you haven't withdrawn tokens manually then you will receive them back after the voting will end automatically.

## How to withdraw tokens from VotePool contract?

First of all you need VotePool contract ABI: https://github.com/Dexaran/ICO/blob/master/Voting/VotePoolABI.abi

```
[{"constant":true,"inputs":[],"name":"name","outputs":[{"name":"","type":"string"}],"payable":false,"type":"function"},{"constant":true,"inputs":[],"name":"Vote_Name","outputs":[{"name":"_name","type":"string"}],"payable":false,"type":"function"},{"constant":false,"inputs":[],"name":"Withdraw","outputs":[],"payable":false,"type":"function"},{"constant":true,"inputs":[],"name":"owner","outputs":[{"name":"","type":"address"}],"payable":false,"type":"function"},{"constant":false,"inputs":[{"name":"_who","type":"address"}],"name":"Refund","outputs":[],"payable":false,"type":"function"},{"constant":false,"inputs":[{"name":"_proposal","type":"string"}],"name":"Update_Proposal","outputs":[],"payable":false,"type":"function"},{"constant":true,"inputs":[],"name":"Total_Score","outputs":[{"name":"","type":"uint256"}],"payable":false,"type":"function"},{"constant":false,"inputs":[{"name":"_from","type":"address"},{"name":"_value","type":"uint256"},{"name":"_data","type":"bytes"}],"name":"tokenFallback","outputs":[],"payable":false,"type":"function"},{"constant":true,"inputs":[{"name":"","type":"address"}],"name":"deposited","outputs":[{"name":"","type":"uint256"}],"payable":false,"type":"function"},{"constant":true,"inputs":[],"name":"token","outputs":[{"name":"","type":"address"}],"payable":false,"type":"function"}]
```

Copy the ABI and open MyEtherWallet "Contract" tab. Paste ABI into the "ABI / JSON Interface" section. 

Find an address of the contract that you voted and paste it into "Contract Address" section as follows:

![alt text](https://github.com/Dexaran/ICO/blob/master/HowTo/VotePool_Voting.jpg)

Press "Access" button.

Press "Select function" dropdown menu.

Choose "Withdraw" function.

![alt text](https://github.com/Dexaran/ICO/blob/master/HowTo/VotePool_Withdrawing.jpg)

Unlock your wallet and click "WRITE" button. Attach 90 000 GAS to the transaction and press Generate Transaction button. Confirm the transaction.

![alt text](https://github.com/Dexaran/ICO/blob/master/HowTo/VotePool_Proceed.jpg)

Thats all, you have successfully withdrawn your tokens.

If you have any problems feel free to contact me: dexaran820@gmail.com
