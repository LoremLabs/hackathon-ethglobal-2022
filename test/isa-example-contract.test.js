const { expect } = require("chai");
const { ethers } = require("hardhat");


const errors = {
};

describe("BlessedExampleContract.sol", () => {

    let contract;
    
  beforeEach(async () => {
    [owner, user1, user2, randomUser] = await ethers.getSigners();
    // Deploy contract
    const contractFactory = await ethers.getContractFactory(
      "BlessedExampleContract"
    );
    contract = await contractFactory.deploy();
  });

  describe("Correct Deployment", () => {
    it("should have correct owner address", async () => {
      const contractOwner = await contract.owner();
      expect(contractOwner).to.equal(owner.address);
    });
  });

  describe("Inherits Correctly", () => {
    // it("supports ERC165", async function () {
    //   expect(await contract.supportsInterface("0x01ffc9a7")).to.eq(true);
    // });
    // TODO
    // it("supports Blessed", async function () {
    //   expect(await contract.supportsInterface("TODO")).to.eq(true);
    // });
  });

});
