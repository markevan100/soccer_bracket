import React from 'react';
import { BrowserRouter as Router, Route, Routes } from 'react-router-dom';
import Home from './components/Home';
import Teams from './components/Teams/Teams';
import Matches from './components/Matches';
import GroupPicks from './components/GroupPicks';
import UserPicks from './components/UserPicks';
import Navbar from './components/Navbar/Navbar';

function App() {
  return (
    <Router>
      <div>
        <Navbar />
        <Routes>
          <Route path="/" element={<Home />} />
          <Route path="/teams" element={<Teams />} />
          <Route path="/matches" element={<Matches />} />
          <Route path="/group-picks" element={<GroupPicks />} />
          <Route path="/user-picks" element={<UserPicks />} />
        </Routes>
      </div>
    </Router>
  );
}

export default App;