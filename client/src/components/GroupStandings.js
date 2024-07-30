import React, { useState, useEffect } from 'react';

const GroupStandings = () => {
  const [standings, setStandings] = useState([]);

  useEffect(() => {
    fetch('/api/group_standings')
      .then(response => response.json())
      .then(data => setStandings(data))
      .catch(error => console.error('Error fetching standings:', error));
  }, []);

  return (
    <div>
      <h1>Group Standings</h1>
      <ul>
        {standings.map((standing, index) => (
          <li key={index}>{standing.team} - {standing.position}</li>
        ))}
      </ul>
    </div>
  );
};

export default GroupStandings;
