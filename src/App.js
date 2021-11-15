import logo from './logo.svg';
import './App.css';
import { createGlobalStyle } from 'styled-components';
import TodoTemplate from './components/TodoTemplate';

const GlobalStyle = createGlobalStyle`
  body {
    background: #ddb8a0;
  }
`;

function App() {
  return (
    <div>
      <GlobalStyle />
      <TodoTemplate>안녕하세요</TodoTemplate>
    </div>
  );
}

export default App;
