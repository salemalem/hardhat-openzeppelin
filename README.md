# Default hardhat config

# Rename secret.js.example to secret.js & Replace your alchemy, etherscan api keys and private key in the secret.js

# Install required components
`npm i`

## Write your solidity contracts in /contracts
## Consider using openzeppelin wizard for quick lookups
https://docs.openzeppelin.com/contracts/4.x/wizard

# Compile smart contracts first 
`npx hardhat compile`

# Edit deployment endpoint & deploy. For quick tests, I use goerli testnet.
`npx hardhat run scripts/deploy.js --network goerli`

# To verify the source code once published
`npx hardhat verify --network goerli CONTRACT_ADDRESS`
