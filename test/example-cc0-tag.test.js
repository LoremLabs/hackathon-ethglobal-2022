const { expect } = require("chai");
const { ethers } = require("hardhat");

const { getAmountInWei } = require("../utils/helper-scripts");

const errors = {};

describe("ExampleCC0Tag.sol", () => {
  let contract, license;

  beforeEach(async () => {
    [owner, user1, user2, randomUser] = await ethers.getSigners();
    // Deploy contract
    const contractFactory = await ethers.getContractFactory("ExampleCC0Tag");
    contract = await contractFactory.deploy();
    // await contract.deployed();
    const licenseAddress = await contract.license();
    license = await ethers.getContractAt("Tag", licenseAddress);
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

  describe("Sets the Correct Tag Interface", () => {
    it("supports base Tag interface", async function () {
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

    it("sets claims prices", async function () {
      expect(await license.claimPrice()).to.equal(getAmountInWei(0.001));
    });

    it("activates claims", async function () {
      expect(await license.claimsEnabled()).to.be.true;
    });

    it("should have correct owner address", async () => {
      const contractOwner = await contract.owner();
      expect(contractOwner).to.equal(owner.address);

      // TODO: who owns the license? msg.sender?
      // const licenseOwner = await license.owner();
      // expect(licenseOwner).to.equal(await owner.address());
    });

  });
});
