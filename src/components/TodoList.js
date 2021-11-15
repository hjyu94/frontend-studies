import React from 'react';
import styled from 'styled-components';
import TodoItem from './TodoItem';
import { useTodoState } from '../TodoContext';

const TodoListBlock = styled.div`
  flex: 1; /* 자신이 차지 할 수 있는 영역을 꽉 채우도록 설정 */
  padding: 20px 32px;
  padding-bottom: 48px;
  overflow-y: auto;
`;

// state 를 조회해서 todo item 렌더링
// onToggle, onRemove 와 같은 작업은 TodoList 에서 할 필요 없고, TodoItem 에서 작업할 예정
function TodoList() {
    const todos = useTodoState();

    return (
      <TodoListBlock>
        {todos.map(todo => (
          <TodoItem
            key={todo.id}
            id={todo.id}
            text={todo.text}
            done={todo.done}
          />
        ))}
      </TodoListBlock>
    );
  }

export default TodoList;