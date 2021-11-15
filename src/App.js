import logo from './logo.svg';
import './App.css';
import { createGlobalStyle } from 'styled-components';

const GlobalStyle = createGlobalStyle`
  body {
    background: #ddb8a0;
  }
`;

function App() {
  return (
    <div>
      <GlobalStyle />
      <div>안녕하세요</div>
    </div>
  );
}

export default App;
