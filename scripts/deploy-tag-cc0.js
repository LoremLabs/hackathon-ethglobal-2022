
async function main() {
    const [deployer] = await ethers.getSigners();
  
    console.log("Deploying contracts with the account:", deployer.address);
  
    const factory = await ethers.getContractFactory('ExampleCC0Tag');
  
    const gasPrice = await factory.signer.getGasPrice();
    console.log(`Current gas price: ${gasPrice}`);
  
    const estimatedGas = await factory.signer.estimateGas(
      factory.getDeployTransaction('abc'),
    );
    console.log(`Estimated gas: ${estimatedGas}`);
  
    const deploymentPrice = gasPrice.mul(estimatedGas);
    const deployerBalance = await factory.signer.getBalance();
    console.log(`Deployer balance:  ${ethers.utils.formatEther(deployerBalance)}`);
    console.log(`Deployment price:  ${ethers.utils.formatEther(deploymentPrice)}`);
    if (deployerBalance.lt(deploymentPrice)) {
      throw new Error(
        `Insufficient funds. Top up your account balance by ${ethers.utils.formatEther(
          deploymentPrice.sub(deployerBalance),
        )}`,
      );
    }
  
    const contract = await factory.deploy("license:cc0");
  
    await contract.deployed();
  
    console.log("Contract Address: ", contract.address);
  }
  
    main()
    .then(() => process.exit(0))
    .catch((error) => {
      console.error(error);
      process.exit(1);
    });
  