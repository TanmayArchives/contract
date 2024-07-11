
import { Box, Flex, Link, Button } from '@chakra-ui/react';
import { Link as RouterLink } from 'react-router-dom';

const Navbar = () => {
  return (
    <Box bg="teal.500" p={4} color="white">
      <Flex justify="space-between" align="center">
        <Box fontWeight="bold">DeFi Platform</Box>
        <Flex>
          <Link as={RouterLink} to="/" p={2}>
            Home
          </Link>
          <Link as={RouterLink} to="/lender" p={2}>
            Lender
          </Link>
          <Link as={RouterLink} to="/borrower" p={2}>
            Borrower
          </Link>
          <Link as={RouterLink} to="/auditor" p={2}>
            Auditor
          </Link>
        </Flex>
        <Button colorScheme="teal" variant="outline">
          Connect Wallet
        </Button>
      </Flex>
    </Box>
  );
};

export default Navbar;
