/** @type import('hardhat/config').HardhatUserConfig */
require("@nomiclabs/hardhat-waffle");
require("@nomiclabs/hardhat-etherscan");

const secret_keys = require("./secret");

/*
module.exports = {
  solidity: "0.8.12",
  networks: {
    goerli: {
      url: `https://eth-goerli.g.alchemy.com/v2/${secret_keys.ALCHEMY_API_KEY}`,
      accounts: [secret_keys.METAMASK_PRIVATE_KEY]
    }
  },
  etherscan: {
    // Your API key for Etherscan
    // Obtain one at https://etherscan.io/
    apiKey: secret_keys.ETHERSCAN_API_KEY,
  }
};
*/

module.exports = {
  defaultNetwork: "mainnet",
  networks: {
    localhost: {
      url: "http://127.0.0.1:8545"
    },
    hardhat: {
    },
    testnet: {
      url: "https://data-seed-prebsc-1-s1.binance.org:8545",
      chainId: 97,
      gasPrice: 20000000000,
      accounts: [secret_keys.METAMASK_PRIVATE_KEY]
    },
    mainnet: {
      url: "https://bsc-dataseed.binance.org/",
      chainId: 56,
      gasPrice: 20000000000,
      accounts: [secret_keys.METAMASK_PRIVATE_KEY],
    }
  },
  solidity: {
    version: "0.8.12",
    settings: {
      optimizer: {
        enabled: true,
        runs: 1000,
      }
    }
  },
  paths: {
    sources: "./contracts",
    tests: "./test",
    cache: "./cache",
    artifacts: "./artifacts"
  },
  mocha: {
    timeout: 20000
  },
  etherscan: {
    // Your API key for Etherscan
    // Obtain one at https://etherscan.io/
    apiKey: {
      bsc: "BY3D6WCZVRUX26T6CVFICIEEIXRUQSCKX8",
    }
  }
};
