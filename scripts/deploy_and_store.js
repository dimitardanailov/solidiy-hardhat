// We require the Hardhat Runtime Environment explicitly here. This is optional
// but useful for running the script in a standalone fashion through `node <script>`.
//
// You can also run a script with `npx hardhat run <script>`. If you do that, Hardhat
// will compile your contracts, add the Hardhat Runtime Environment's members to the
// global scope, and execute the script.
const hre = require('hardhat')

async function main() {
  await hre.run('compile')

  const SimpleStorage = await hre.ethers.getContractFactory('SimpleStorage')
  const simpleStorage = await SimpleStorage.deploy()
  await simpleStorage.deployed()

  const transactionResponse = await simpleStorage.store(1)
  const transactionReceipt = await transactionResponse.wait()
  console.log('Event data')
  const {args} = transactionReceipt.events[0]
  console.log('Old number: ', args.oldNumber.toString())
  console.log('New number: ', args.newNumber.toString())
  console.log('Added Number: ', args.addedNumber.toString())
  console.log('Sender: ', args.sender.toString())

  console.log(transactionReceipt)
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch(error => {
  console.error(error)
  process.exitCode = 1
})
