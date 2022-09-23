const { expect } = require("chai");
const { ethers } = require("hardhat");

const errors = {};

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

  // TODO: move to own files
  describe("Sets the Correct Blessed Things", () => {
    it("supports base Blessed interface", async function () {
      expect(typeof contract.blessedAs).to.eq("function");
      expect(await contract.blessedAs("no-exist", "no-existe")).to.eq("");
    });

    it("supports cc0", async function () {
      const fixtures = [
        ["license", "slug", "license-cc0"],
        ["license", "name", "creative commons 0"],
        ["license", "address", "0x0"],
        [
          "license",
          "url",
          "https://creativecommons.org/share-your-work/public-domain/cc0/",
        ],
      ];

      await Promise.all(
        fixtures.map(async (fixture) => {
          let thing = await contract.blessedAs(fixture[0], fixture[1]);
          thing = thing.toString();
          expect(thing).to.eq(fixture[2]);
        })
      );
    });
  });
});
