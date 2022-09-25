const { expect } = require("chai");
const { ethers } = require("hardhat");

const errors = {};

describe("TaggerExampleContract.sol", () => {
  let contract;

  beforeEach(async () => {
    [owner, user1, user2, randomUser] = await ethers.getSigners();
    // Deploy contract
    const contractFactory = await ethers.getContractFactory(
      "TaggerExampleContract"
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
      expect(typeof contract.taggedAs).to.eq("function");
      expect(await contract.taggedAs("no-exist", "no-existe")).to.eq("");
    });

    it("supports cc0", async function () {
      const fixtures = [
        ["license", "slug", "license-cc0"],
        ["license", "name", "creative commons 0"],
        ["license", "address", "0x04943a8D464aC4f988453FD3690C85A6CEb2C66c"],
        [
          "license",
          "url",
          "https://creativecommons.org/share-your-work/public-domain/cc0/",
        ],
      ];

      await Promise.all(
        fixtures.map(async (fixture) => {
          let thing = await contract.taggedAs(fixture[0], fixture[1]);
          thing = thing.toString();
          expect(thing).to.eq(fixture[2]);
        })
      );
    });
  });
});
