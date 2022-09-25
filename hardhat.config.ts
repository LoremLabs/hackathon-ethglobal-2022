require("dotenv").config();
require("@nomiclabs/hardhat-waffle");
require("@nomiclabs/hardhat-etherscan");
require("hardhat-abi-exporter");

if (process.env.REPORT_GAS) {
  require("hardhat-gas-reporter");
}

if (process.env.REPORT_COVERAGE) {
  require("solidity-coverage");
}

const { task, run } = require("hardhat/config");

const settings = {
  optimizer: {
    enabled: true,
    runs: 2000,
    details: {
      yul: true,
      yulDetails: {
        stackAllocation: true,
      },
    },
  },
};

task(
  "accounts",
  "Prints the list of accounts",
  async (_taskArgs: any, hre: { ethers: { getSigners: () => any } }) => {
    const accounts = await hre.ethers.getSigners();

    for (const account of accounts) {
      console.log(account.address);
    }
  }
);

/**
 * @type import('hardhat/config').HardhatUserConfig
 */
module.exports = {
  abiExporter: {
    path: './abi',
    runOnCompile: true,
    clear: true,
    flat: true,
    // only: [':ERC20$'],
    spacing: 2,
    pretty: true,
    // format: "minimal",
  },
  solidity: {
    compilers: [
      // { version: '0.4.24', settings },
      // { version: '0.4.25', settings },
      // { version: '0.5.0', settings },
      // { version: '0.5.12', settings },
      // { version: '0.5.17', settings },
      // { version: '0.5.14', settings },
      // { version: '0.5.7', settings },
      // { version: '0.5.9', settings },
      // { version: '0.6.12', settings },
      // { version: '0.7.6', settings },
      // { version: '0.8.0', settings },
      // { version: '0.8.2', settings },
      // { version: '0.8.4', settings },
      { version: "0.8.15", settings },
    ],
  },
  gasReporter: {
    currency: "USD",
    gasPrice: 100,
    showTimeSpent: true,
  },
  plugins: ["solidity-coverage"],
  networks: {
    hardhat: {
      chainId: 31337,
    },
    rinkeby: {
      url: `https://rinkeby.infura.io/v3/${process.env.INFURA_API_KEY}`,
      accounts: [`${process.env.RINKEBY_PRIVATE_KEY}`],
      chainId: 4,
    },
    mainnet: {
            url: `https://mainnet.infura.io/v3/${process.env.INFURA_API_KEY}`,
            accounts: [
              `${process.env.MAINNET_PRIVATE_KEY}`,
            ],
          },
  },
  settings: {
    optimizer: {
      enabled: true,
      runs: 800,
    },
  },
  etherscan: {
    apiKey: {
      mainnet: process.env.MAINNET_ETHERSCAN_API_KEY,
      rinkeby: process.env.RINKEBY_ETHERSCAN_API_KEY,
    },
  },
};
