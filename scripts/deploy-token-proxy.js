const hre = require("hardhat");

async function main() {
  const [ deployer ] = await hre.ethers.getSigners();

  const DiverseUsdcTokenProxy = await hre.ethers.getContractFactory("DiverseUsdcTokenProxy");
  const tokenInstance = await hre.ethers.getContractAt("DiverseUsdcToken",process.env.DIVERSE_USDC_ADDRESS);

  const proxyInstance = await DiverseUsdcTokenProxy.deploy(tokenInstance.address);

  console.log("Diverse USDC Token Proxy deployed to:", proxyInstance.address);
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });
