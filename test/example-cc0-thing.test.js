const { expect } = require("chai");
const { ethers } = require("hardhat");

const errors = {};

describe("ExampleCC0Thing.sol", () => {
  let contract;

  beforeEach(async () => {
    [owner, user1, user2, randomUser] = await ethers.getSigners();
    // Deploy contract
    const contractFactory = await ethers.getContractFactory("ExampleCC0Thing");
    contract = await contractFactory.deploy();
//   await contract.deployed();
  });

  describe("Correct Deployment", () => {
    it.only("should allow init", async () => {

      const inited = await contract.connect(user1).doinit();
      await expect(await contract.tf()).to.be.true;


      // const u = await contract.connect(owner);
      // const tf = await u.doinit();

      // // const tf = await contract.doinit.call();
      // // await tf.wait();
      // console.log({ tf });
      // expect(tf).to.be.true;
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

  describe("Sets TF", () => {
    it("tf", async function () {
      const tf = await contract.tf();
      expect(tf).to.eq(true);
    });
  });

  describe("Sets the Correct Blessed Things", () => {
    it("supports base Thing interface", async function () {
      const license = await contract.license();
      console.log(license, "zzzzaaaa");
      const getter = await contract.license.get;
      console.log(getter, "aaaa");
      expect(typeof getter).to.eq("function");
      expect(await getter("no-exist").to.eq(""));
    });

    it("supports cc0", async function () {
      const fixtures = [
        ["slug", "cc0"],
        ["name", "creative commons 0"],
        ["isa", "license"],
        [
          "url",
          "https://creativecommons.org/share-your-work/public-domain/cc0/",
        ],
      ];

      await Promise.all(
        fixtures.map(async (fixture) => {
          let thing = await contract.license.get(fixture[0]);
          thing = thing.toString();
          expect(thing).to.eq(fixture[1]);
        })
      );
    });
  });
});
