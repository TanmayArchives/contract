
import React from 'react';
import { Box, Container, Heading } from '@chakra-ui/react';
import { BrowserRouter as Router, Route, Routes } from 'react-router-dom';
import Navbar from './components/Navbar';
import Home from './pages/Home';
import Lender from './pages/Lender';
import Borrower from './pages/Borrower';
import Auditor from './pages/Auditor';

function App() {
  return (
    <Router>
      <Box>
        <Navbar />
        <Container maxW="container.md" mt={4}>
          <Routes>
            <Route path="/" element={<Home />} />
            <Route path="/lender" element={<Lender />} />
            <Route path="/borrower" element={<Borrower />} />
            <Route path="/auditor" element={<Auditor />} />
          </Routes>
        </Container>
      </Box>
    </Router>
  );
}

export default App;
