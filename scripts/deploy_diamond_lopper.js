require('dotenv').config()

const hre = require('hardhat')

async function main() {
  await hre.run('compile')

  const ContractFactory = await hre.ethers.getContractFactory('FuncDiamond')
  const contract = await ContractFactory.deploy()
  await contract.deployed()
  console.log('Address:', contract.address)

  console.log('Here ...')
}

main().catch(error => {
  console.error(error)
  process.exitCode = 1
})
