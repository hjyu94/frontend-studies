import React, { useReducer, createContext, useContext } from 'react';

const initialTodos = [
  {
    id: 1,
    text: '프로젝트 생성하기',
    done: true
  },
  {
    id: 2,
    text: '컴포넌트 스타일링하기',
    done: true
  },
  {
    id: 3,
    text: 'Context 만들기',
    done: false
  },
  {
    id: 4,
    text: '기능 구현하기',
    done: false
  }
];

function todoReducer(state, action) {
  switch (action.type) {
    case 'CREATE':
      return state.concat(action.todo);
    case 'TOGGLE':
      return state.map(todo =>
        todo.id === action.id ? { ...todo, done: !todo.done } : todo
      );
    case 'REMOVE':
      return state.filter(todo => todo.id !== action.id);
    default:
      throw new Error(`Unhandled action type: ${action.type}`);
  }
}

const TodoStateContext = createContext();
const TodoDispatchContext = createContext();

export function TodoProvider({ children }) {
  const [state, dispatch] = useReducer(todoReducer, initialTodos);
  return (
    <TodoStateContext.Provider value={state}>
      <TodoDispatchContext.Provider value={dispatch}>
        {children}
      </TodoDispatchContext.Provider>
    </TodoStateContext.Provider>
  );
}

/*
    Context 에서 사용 할 값을 지정 할 때에는 위와 같이 Provider 컴포넌트를 렌더링 하고 value 를 설정해주면 됩니다.
    그리고, props 로 받아온 children 값을 내부에 렌더링해주세요.
    이렇게 하면 다른 컴포넌트에서 state 나 dispatch를 사용하고 싶을 때 다음과 같이 할 수 있습니다.

    import React, { useContext } from 'react';
    import { TodoStateContext, TodoDispatchContext } from '../TodoContext';

    function Sample() {
        const state = useContext(TodoStateContext);
        const dispatch = useContext(TodoDispatchContext);
        return <div>Sample</div>;
    }
*/

export function useTodoState() {
  return useContext(TodoStateContext);
}

export function useTodoDispatch() {
  return useContext(TodoDispatchContext);
}

/*
    우리는 컴포넌트에서 useContext 를 직접 사용하는 대신에,
    useContext 를 사용하는 커스텀 Hook 을 만들어서 내보내주겠습니다.

    import React from 'react';
    import { useTodoState, useTodoDispatch } from '../TodoContext';

    function Sample() {
        const state = useTodoState();
        const dispatch = useTodoDispatch();
        return <div>Sample</div>;
    }
*/
