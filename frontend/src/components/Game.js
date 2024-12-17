import React, { useState, useEffect } from 'react';
import axios from '../axiosConfig'; 
import { useParams } from 'react-router-dom';

const Game = () => {
  const { id } = useParams();
  const [game, setGame] = useState(null);
  const [letter, setLetter] = useState('');

  useEffect(() => {
    const fetchGame = async () => {
      const response = await axios.get(`/games/${id}`);
      setGame(response.data);
    };
    fetchGame();
  }, [id]);

  const guessLetter = async () => {
    const response = await axios.patch(`/games/${id}`, { letter });
    setGame(response.data);
    setLetter('');
  };

  if (!game) return <div>Loading...</div>;

  return (
    <div>
      <h1>Game {game.id}</h1>
      <p>Word: {game.word}</p>
      <p>Lives: {game.lives}</p>
      <p>Guessed Letters: {game.guessed_letters.join(', ')}</p>
      <p>State: {game.state}</p>
      <input
        type="text"
        value={letter}
        onChange={(e) => setLetter(e.target.value)}
        maxLength="1"
      />
      <button onClick={guessLetter}>Guess</button>
    </div>
  );
};

export default Game;