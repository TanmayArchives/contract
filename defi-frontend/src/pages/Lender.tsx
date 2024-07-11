
import  { useState } from 'react';
import { Box, Heading, Input, Button, Text } from '@chakra-ui/react';
import { getContract } from '../utils/ethHelpers';

const Lender = () => {
  const [depositAmount, setDepositAmount] = useState('');
  const [message, setMessage] = useState('');

  const handleDeposit = async () => {
    try {
      const contract = await getContract();
      const tx = await contract.lenderDeposit(ethers.utils.parseEther(depositAmount));
      await tx.wait();
      setMessage(`Deposited ${depositAmount} ETH`);
    } catch (error) {
      console.error(error);
      setMessage('Error during deposit');
    }
  };

  return (
    <Box>
      <Heading>Lender Dashboard</Heading>
      <Input
        placeholder="Amount to deposit"
        value={depositAmount}
        onChange={(e) => setDepositAmount(e.target.value)}
        mt={4}
      />
      <Button onClick={handleDeposit} colorScheme="teal" mt={4}>
        Deposit
      </Button>
      {message && <Text mt={4}>{message}</Text>}
    </Box>
  );
};

export default Lender;
