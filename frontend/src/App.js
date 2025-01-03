import React from 'react';
import { BrowserRouter as Router, Route, Routes } from 'react-router-dom';
import GameList from './components/GameList';
import Game from './components/Game';
import './App.css';

function App() {
  return (
    <Router>
      <div className="App">
        <Routes>
          <Route path="/" element={<GameList />} />
          <Route path="/games/:id" element={<Game />} />
        </Routes>
      </div>
    </Router>
  );
}

export default App;
