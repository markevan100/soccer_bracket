import React, { useEffect, useState } from 'react';
import axiosInstance from '../../api/axiosInstance';
import './Teams.css';

const Teams = () => {
  const [teams, setTeams] = useState([]);
  const [groups, setGroups] = useState([]);

  useEffect(() => {
    const fetchData = async () => {
      try {
        const teamResponse = await axiosInstance.get('/teams');
        setTeams(teamResponse.data);
        const groupResponse = await axiosInstance.get('/groups');
        setGroups(groupResponse.data);
      } catch (error) {
        console.error('Error fetching data', error);
      }
    };
    fetchData();
  }, []);

  const groupMap = groups.reduce((acc, group) => {
    acc[group.id] = group.name;
    return acc;
  }, {});

  const groupedTeams = teams.reduce((acc, team) => {
    const groupId = team.group_id;
    if (!acc[groupId]) {
      acc[groupId] = [];
    }
    acc[groupId].push(team);
    return acc;
  }, {});

  return (
    <div className="teams">
      {Object.keys(groupedTeams).map(groupId => (
        <div key={groupId} className="team-group">
          <h2>{groupMap[groupId]}</h2>
          {groupedTeams[groupId].map(team => (
            <div key={team.id} className="team">
              <img src={`https://flagcdn.com/w320/${team.country_code.toLowerCase()}.png`} alt={team.country} className="team-flag" />
              <span className="team-name">{team.country}</span>
            </div>
          ))}
        </div>
      ))}
    </div>
  );
};

export default Teams;