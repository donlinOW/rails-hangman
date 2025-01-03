import React, { useState, useEffect } from 'react';
import axios from '../axiosConfig'; 
import { Link } from 'react-router-dom';
import './GameList.css'; 

const GameList = () => {
  const [games, setGames] = useState([]);

  useEffect(() => {
    const fetchGames = async () => {
      const response = await axios.get('/games');
      setGames(response.data);
    };
    fetchGames();
  }, []);

  const startNewGame = async () => {
    const response = await axios.post('/games');
    setGames([...games, response.data]);
  };

  const deleteGame = async (id) => {
    await axios.delete(`/games/${id}`);
    setGames(games.filter(game => game.id !== id));
  };

  return (
    <div>
      <h1>Hangman Games</h1>
      <button onClick={startNewGame}>Start New Game</button>
      <ul className="game-list">
        {games.map(game => (
          <li key={game.id} className="game-item">
            <Link to={`/games/${game.id}`} className="game-link">Game {game.id}</Link>
            <button onClick={() => deleteGame(game.id)} className="delete-button">Delete</button>
          </li>
        ))}
      </ul>
    </div>
  );
};

export default GameList;