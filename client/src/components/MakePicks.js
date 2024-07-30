import React, { useState } from 'react';

const MakePicks = () => {
  const [picks, setPicks] = useState({});

  const handleChange = (event) => {
    const { name, value } = event.target;
    setPicks(prevPicks => ({
      ...prevPicks,
      [name]: value
    }));
  };

  const handleSubmit = (event) => {
    event.preventDefault();
    fetch('/api/make_picks', {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify(picks),
    })
      .then(response => response.json())
      .then(data => console.log('Picks submitted:', data))
      .catch(error => console.error('Error submitting picks:', error));
  };

  return (
    <div>
      <h1>Make Your Picks</h1>
      <form onSubmit={handleSubmit}>
        <label>
          Team 1:
          <input type="text" name="team1" value={picks.team1 || ''} onChange={handleChange} />
        </label>
        <label>
          Team 2:
          <input type="text" name="team2" value={picks.team2 || ''} onChange={handleChange} />
        </label>
        <button type="submit">Submit Picks</button>
      </form>
    </div>
  );
};

export default MakePicks;
