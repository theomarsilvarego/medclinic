import React from 'react';
import { createRoot } from 'react-dom/client';
import './styles.css';
import { App } from './pages/App/App';
import { AnamnesisPage } from './pages/AnamnesisPage/AnamnesisPage';
import { ClinicalDocumentValidationPage } from './pages/ClinicalDocumentValidationPage/ClinicalDocumentValidationPage';
import './responsive.css';

const anamnesisMatch = window.location.pathname.match(/^\/anamnese\/([a-zA-Z0-9_-]{43})\/?$/);
const validationMatch = window.location.pathname.match(/^\/validar\/([A-Fa-f0-9]{36})\/?$/);
const page = anamnesisMatch
  ? <AnamnesisPage token={anamnesisMatch[1]} />
  : validationMatch
    ? <ClinicalDocumentValidationPage code={validationMatch[1]} />
    : <App />;

createRoot(document.getElementById('root')!).render(<React.StrictMode>{page}</React.StrictMode>);
