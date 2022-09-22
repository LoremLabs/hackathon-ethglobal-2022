const { expect } = require("chai");
const { ethers } = require("hardhat");


const errors = {
};

describe("IsA.sol", () => {

    let contract;
    
  beforeEach(async () => {
    [owner, user1, user2, randomUser] = await ethers.getSigners();
    // Deploy contract
    const contractFactory = await ethers.getContractFactory(
      "IsA"
    );
    contract = await contractFactory.deploy();
  });

  describe("Correct Deployment", () => {
    it("should have correct owner address", async () => {
      const contractOwner = await contract.owner();
      expect(contractOwner).to.equal(owner.address);
    });
  });
});
