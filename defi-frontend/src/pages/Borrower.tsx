
import  { useState } from 'react';
import { Box, Heading, Input, Button, Text } from '@chakra-ui/react';
import { ethers } from 'ethers';

const Borrower = () => {
  const [borrowAmount, setBorrowAmount] = useState('');
  const [collateralAmount, setCollateralAmount] = useState('');
  const [message, setMessage] = useState('');

  const handleBorrow = async () => {
    // Borrow funds from the smart contract
    setMessage(`Borrowed ${borrowAmount} ETH with ${collateralAmount} ETH collateral`);
  };

  return (
    <Box>
      <Heading>Borrower Dashboard</Heading>
      <Input
        placeholder="Amount to borrow"
        value={borrowAmount}
        onChange={(e) => setBorrowAmount(e.target.value)}
        mt={4}
      />
      <Input
        placeholder="Collateral amount"
        value={collateralAmount}
        onChange={(e) => setCollateralAmount(e.target.value)}
        mt={4}
      />
      <Button onClick={handleBorrow} colorScheme="teal" mt={4}>
        Borrow
      </Button>
      {message && <Text mt={4}>{message}</Text>}
    </Box>
  );
};

export default Borrower;
