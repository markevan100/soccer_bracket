import React from 'react';
import { Link } from 'react-router-dom';
import './Navbar.css';

const Navbar = () => {
  return (
    <nav>
      <ul>
        <li><Link to="/">Home</Link></li>
        <li><Link to="/teams">Teams</Link></li>
        <li><Link to="/matches">Matches</Link></li>
        <li><Link to="/group_picks">Group Picks</Link></li>
        <li><Link to="/standings">Standings</Link></li>
      </ul>
    </nav>
  );
};

export default Navbar;
