/*
    function App() {
    return (
        <Wrapper>
            <Hello name="react" color="red" isSpecial={true}/>
            <Hello color="pink" />
        </Wrapper>
    )
    }

    function Hello({ color, name, isSpecial }) { // props.color, props.name, props.isSpecial
    return (
        <div style={{ color }}>
            { isSpecial ? <b>*</b> : null }
            안녕하세요 {name}
        </div>
        // isSpecial 값이 true 라면 <b>*</b> 를, 그렇지 않다면 null 을 보여주도록 했습니다. 참고로 JSX 에서 null, false, undefined 를 렌더링하게 된다면 아무것도 나타나지 않게 됩니다.
    );
    }
*/

/*
    보통 삼항연산자를 사용한 조건부 렌더링을 주로 특정 조건에 따라 보여줘야 하는 내용이 다를 때 사용합니다.
    지금은 내용이 달라지는게 아니라, 단순히 특정 조건이 true 이면 보여주고, 그렇지 않다면 숨겨주고 있는데요, 이러한 상황에서는 && 연산자를 사용해서 처리하는 것이 더 간편합니다.

    function Hello({ color, name, isSpecial }) {
    return (
        <div style={{ color }}>
            {isSpecial && <b>*</b>}
            안녕하세요 {name}
        </div>
    );
    }
*/

import React from 'react';
import styled, { css } from 'styled-components';
import { MdDone, MdDelete } from 'react-icons/md';
import { useTodoDispatch } from '../TodoContext';

const Remove = styled.div`
  display: flex;
  align-items: center;
  justify-content: center;
  color: #dee2e6;
  font-size: 24px;
  cursor: pointer;
  &:hover {
    color: #ff6b6b;
  }
  display: none;
`;

/*
    여기서 사용된 기능은 Component Selector 라는 기능입니다.
    이 스타일은 TodoItemBlock 위에 커서가 있을 때,
    Remove 컴포넌트를 보여주라는 의미를 가지고 있습니다.
*/
const TodoItemBlock = styled.div`
  display: flex;
  align-items: center;
  padding-top: 12px;
  padding-bottom: 12px;
  &:hover {
    ${Remove} {
      display: initial;
    }
  }
`;

const CheckCircle = styled.div`
  width: 32px;
  height: 32px;
  border-radius: 16px;
  border: 1px solid #ced4da;
  font-size: 24px;
  display: flex;
  align-items: center;
  justify-content: center;
  margin-right: 20px;
  cursor: pointer;
  ${props =>
    props.done &&
    css`
      border: 1px solid #38d9a9;
      color: #38d9a9;
    `}
`;

const Text = styled.div`
  flex: 1;
  font-size: 21px;
  color: #495057;
  ${props =>
    props.done &&
    css`
      color: #ced4da;
    `}
`;

function TodoItem({ id, done, text }) {
    const dispatch = useTodoDispatch();
    const onToggle = () => dispatch({ type: 'TOGGLE', id });
    const onRemove = () => dispatch({ type: 'REMOVE', id });
    return (
      <TodoItemBlock>
        <CheckCircle done={done} onClick={onToggle}>
          {done && <MdDone />}
        </CheckCircle>
        <Text done={done}>{text}</Text>
        <Remove onClick={onRemove}>
          <MdDelete />
        </Remove>
      </TodoItemBlock>
    );
  }

export default React.memo(TodoItem);