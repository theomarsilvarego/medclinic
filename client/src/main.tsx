import React from 'react';
import { createRoot } from 'react-dom/client';
import './styles.css';
import { App } from './pages/App/App';
import { AnamnesisPage } from './pages/AnamnesisPage/AnamnesisPage';

const anamnesisMatch = window.location.pathname.match(/^\/anamnese\/([a-zA-Z0-9_-]{43})\/?$/);
const page = anamnesisMatch ? <AnamnesisPage token={anamnesisMatch[1]} /> : <App />;

createRoot(document.getElementById('root')!).render(<React.StrictMode>{page}</React.StrictMode>);
