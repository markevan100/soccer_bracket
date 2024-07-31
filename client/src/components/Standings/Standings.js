import React, { useState, useEffect } from 'react';
import axiosInstance from '../../api/axiosInstance';
import Flag from 'react-world-flags';
import './Standings.css';

const Standings = () => {
  const [standingsData, setStandingsData] = useState([]);

  useEffect(() => {
    const fetchStandings = async () => {
      try {
        const response = await axiosInstance.get('/group_standings');
        setStandingsData(response.data);
      } catch (error) {
        console.error('Error fetching standings data:', error);
      }
    };

    fetchStandings();
  }, []);

  return (
    <div className="standings">
      {standingsData.map((groupData) => (
        <div key={groupData.group.id} className="standings-group">
          <h2>{groupData.group.name}</h2>
          <table>
            <thead>
              <tr>
                <th>Team</th>
                <th>Points</th>
                <th>Goal Diff</th>
                <th>Goals For</th>
                <th>Goals Against</th>
                <th>Red Cards</th>
                <th>Yellow Cards</th>
              </tr>
            </thead>
            <tbody>
              {groupData.standings.map((standing) => (
                <tr key={standing.id}>
                  <td>
                    <Flag code={standing.country_code} style={{ width: '45px', height: '30px' }} />
                  </td>
                  <td>{standing.points}</td>
                  <td>{standing.goal_difference}</td>
                  <td>{standing.goals_for}</td>
                  <td>{standing.goals_against}</td>
                  <td>{standing.red_cards}</td>
                  <td>{standing.yellow_cards}</td>
                </tr>
              ))}
            </tbody>
          </table>
        </div>
      ))}
    </div>
  );
};

export default Standings;
