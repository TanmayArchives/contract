
import { ethers } from 'ethers';
import DeFiAppAbi from './abis/DeFiApp.json';

const contractAddress = 'YOUR_DEPLOYED_CONTRACT_ADDRESS';

export const getContract = async () => {
  if (!window.ethereum) {
    throw new Error('No crypto wallet found. Please install it.');
  }

  await window.ethereum.send('eth_requestAccounts');
  const provider = new ethers.providers.Web3Provider(window.ethereum);
  const signer = provider.getSigner();
  return new ethers.Contract(contractAddress, DeFiAppAbi, signer);
};
