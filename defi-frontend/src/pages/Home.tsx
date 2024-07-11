
import React from 'react';
import { Box, Heading, Text } from '@chakra-ui/react';

const Home = () => {
  return (
    <Box>
      <Heading>Welcome to the DeFi Platform</Heading>
      <Text mt={4}>
        This is a decentralized lending platform where you can participate as a lender, borrower, or auditor.
      </Text>
    </Box>
  );
};

export default Home;
