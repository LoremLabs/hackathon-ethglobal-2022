const { expect } = require("chai");
const { ethers } = require("hardhat");


const errors = {
};

describe("IsaExampleContract.sol", () => {

    let contract;
    
  beforeEach(async () => {
    [owner, user1, user2, randomUser] = await ethers.getSigners();
    // Deploy contract
    const contractFactory = await ethers.getContractFactory(
      "IsaExampleContract"
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
    it("supports ERC165", async function () {
      expect(await contract.supportsInterface("0x01ffc9a7")).to.eq(true);
    });
    // TODO
    // it("supports Isa", async function () {
    //   expect(await contract.supportsInterface("TODO")).to.eq(true);
    // });
  });

});
