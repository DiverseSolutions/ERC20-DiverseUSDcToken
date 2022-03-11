const hre = require("hardhat");

async function main() {
  const [ deployer ] = await hre.ethers.getSigners();

  const DiverseUsdcTokenProxy = await hre.ethers.getContractFactory("DiverseUsdcTokenProxy");
  const DiverseUsdcToken = await hre.ethers.getContractFactory("DiverseUsdcToken");

  const tokenInstance = await DiverseUsdcToken.deploy();

  let tokenName = "Diverse USDC"
  let tokenSymbol = "dUSDC"
  let tokenCurrency = "USD"
  let tokenDecimals = 18
  let newMasterMinter = deployer.address
  let newPauser = deployer.address 
  let newBlacklister = deployer.address
  let newOwner = deployer.address
  

  await tokenInstance.initialize(tokenName,tokenSymbol,tokenCurrency,tokenDecimals,newMasterMinter,newPauser,newBlacklister,newOwner)

  console.log("Diverse USDC Token deployed to:", tokenInstance.address);
  console.log("Diverse USDC Token Name :", await tokenInstance.name());
  console.log("Diverse USDC Token Symbol :", await tokenInstance.symbol());
  console.log("Diverse USDC Token Currency :", await tokenInstance.currency());
  console.log("Diverse USDC Token Decimals :", await tokenInstance.decimals());

  const proxyInstance = await DiverseUsdcTokenProxy.deploy(tokenInstance.address);

  console.log("Diverse USDC Token Proxy deployed to:", proxyInstance.address);
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });
