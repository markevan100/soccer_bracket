import React, { useState, useEffect } from 'react';

const UserPicks = () => {
  const [picks, setPicks] = useState([]);

  useEffect(() => {
    fetch('/api/user_picks')
      .then(response => response.json())
      .then(data => setPicks(data))
      .catch(error => console.error('Error fetching picks:', error));
  }, []);

  return (
    <div>
      <h1>Your Picks</h1>
      <ul>
        {picks.map((pick, index) => (
          <li key={index}>{pick.team} - {pick.prediction}</li>
        ))}
      </ul>
    </div>
  );
};

export default UserPicks;
