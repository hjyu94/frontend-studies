import logo from './logo.svg';
import './App.css';
import { createGlobalStyle } from 'styled-components';
import TodoTemplate from './components/TodoTemplate';
import TodoHead from './components/TodoHead';
import TodoList from './components/TodoList';
import TodoCreate from './components/TodoCreate';
import { TodoProvider } from './TodoContext';

const GlobalStyle = createGlobalStyle`
  body {
    background: #ddb8a0;
  }
`;


function App() {
  return (
    <TodoProvider
      // 우리 프로젝트 모든 곳에서 Todo 관련 Context 들을 사용 할 수 있도록,
      // App 컴포넌트에서 TodoProvider 를 불러와서 모든 내용을 TodoProvider 로 감싸주겠습니다.
    >
      <GlobalStyle />
      <TodoTemplate>
        <TodoHead />
        <TodoList />
        <TodoCreate />
      </TodoTemplate>
    </TodoProvider>
  );
}

export default App;
