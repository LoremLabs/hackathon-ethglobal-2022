const { expect } = require("chai");
const { ethers } = require("hardhat");

const errors = {};

describe("TaggerExampleContract.sol", () => {
  let contract;

  beforeEach(async () => {
    [owner, user1, user2, randomUser] = await ethers.getSigners();
    // Deploy contract
    const contractFactory = await ethers.getContractFactory(
      "ExampleTaggedContract"
    );
    contract = await contractFactory.deploy();
  });

  describe("Correct Deployment", () => {
    // it("should have correct deployer address", async () => {
    //   const contractOwner = await contract.owner();
    //   expect(contractOwner).to.equal(owner.address);
    // });
  });

  describe("Inherits Correctly", () => {
    // it("supports ERC165", async function () {
    //   expect(await contract.supportsInterface("0x01ffc9a7")).to.eq(true);
    // });
    // TODO
    // it("supports Tagger", async function () {
    //   expect(await contract.supportsInterface("TODO")).to.eq(true);
    // });
  });

  // TODO: move to own files
  describe("Sets the Correct Tagger", () => {
    it("supports base Tagger interface", async function () {
      expect(typeof contract.jsonTags).to.eq("function");
    });

    it("supports tags", async function () {

      // setTag("license:cc0", "0x04943a8D464aC4f988453FD3690C85A6CEb2C66c"); // reference to more info
      // setTag("author:matt-mankins"); // simple tag
      // setTag("Example"); // simpler tag :), stored as lowercase
      const NO_REF = "0x0";
      const fixtures = [
        ["license:cc0", "0x04943a8D464aC4f988453FD3690C85A6CEb2C66c"],
        ["author:matt-mankins", NO_REF],
        ["example", NO_REF],
      ];

      await Promise.all(
        fixtures.map(async (fixture) => {
          let thing = await contract.getTagRef(fixture[0]);
          thing = thing.toString();
          expect(thing).to.eq(fixture[1]);
        })
      );
    });
  });
});
