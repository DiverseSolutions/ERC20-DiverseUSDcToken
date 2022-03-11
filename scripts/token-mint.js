const hre = require("hardhat");

async function main() {
  const [ deployer ] = await hre.ethers.getSigners();

  const tokenInstance = await hre.ethers.getContractAt("DiverseUsdcToken",process.env.DIVERSE_USDC_ADDRESS);

  await tokenInstance.mint(deployer.address,hre.ethers.utils.parseEther("10000000000"))

  console.log("Diverse USDC Token deployed to:", tokenInstance.address);
  console.log("Diverse USDC Token Name :", await tokenInstance.name());
  console.log("Diverse USDC Token Symbol :", await tokenInstance.symbol());
  console.log("Diverse USDC Token Currency :", await tokenInstance.currency());
  console.log("Diverse USDC Token Decimals :", await tokenInstance.decimals());
  console.log("Diverse USDC Token Supply :", (await tokenInstance.totalSupply()).toString());
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });
