const { expect } = require("chai");
const { ethers } = require("hardhat");

const { getAmountInWei } = require("../utils/helper-scripts");

describe("ExampleCC0Tag.sol", () => {
  let contract, license;

  beforeEach(async () => {
    [owner, user1, user2, randomUser] = await ethers.getSigners();
    // Deploy contract
    const contractFactory = await ethers.getContractFactory("ExampleCC0Tag");
    contract = await contractFactory.deploy("license:cc0");
    // await contract.deployed();
    // const licenseAddress = await contract.license();
    // license = await ethers.getContractAt("Tag", licenseAddress);
  });

  describe("Correct Deployment", () => {
    it("should allow init", async () => {
      expect(typeof contract.tag).to.eq("function");
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
      const tx = await contract.get("no-exist");
      expect(tx).to.eq("");
    });

    it("supports cc0", async function () {
      const fixtures = [
        ["description", "creative commons v0 license"],
        ["isa", "license"],
        [
          "url",
          "https://creativecommons.org/share-your-work/public-domain/cc0/",
        ],
      ];

      await Promise.all(
        fixtures.map(async (fixture) => {
          let thing = await contract.get(fixture[0]);
          thing = thing.toString();
          expect(thing).to.eq(fixture[1]);
        })
      );
    });

    it("sets claims prices", async function () {
      expect(await contract.claimPrice()).to.equal(getAmountInWei(0.001));
    });

    it("activates claims", async function () {
      expect(await contract.claimsEnabled()).to.be.true;
    });

    it("should have correct owner address", async () => {
      const contractOwner = await contract.owner();
      expect(contractOwner).to.equal(owner.address);

      // TODO: who owns the contract? msg.sender?
      // const contractOwner = await contract.owner();
      // expect(contractOwner).to.equal(await owner.address());
    });

    // TODO: more coverage!

  });
});
