const { expect } = require("chai");
const { ethers } = require("hardhat");

const errors = {};

describe("ExampleCC0Thing.sol", () => {
  let contract, license;

  beforeEach(async () => {
    [owner, user1, user2, randomUser] = await ethers.getSigners();
    // Deploy contract
    const contractFactory = await ethers.getContractFactory("ExampleCC0Thing");
    contract = await contractFactory.deploy();
    // await contract.deployed();
    const licenseAddress = await contract.license();
    license = await ethers.getContractAt('Thing', licenseAddress);
  });

  describe("Correct Deployment", () => {
    it("should allow init", async () => {
      expect(typeof contract.license).to.eq("function");
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


  describe("Sets the Correct Blessed Things", () => {
    it("supports base Thing interface", async function () {

      const tx = await license.get("no-exist");
      expect(tx).to.eq("");
    });

    it("supports cc0", async function () {
      const fixtures = [
        ["slug", "cc0"],
        ["description", "creative commons v0 license"],
        ["isa", "license"],
        [
          "url",
          "https://creativecommons.org/share-your-work/public-domain/cc0/",
        ],
      ];

      await Promise.all(
        fixtures.map(async (fixture) => {
          let thing = await license.get(fixture[0]);
          thing = thing.toString();
          expect(thing).to.eq(fixture[1]);
        })
      );
    });
  });
});
