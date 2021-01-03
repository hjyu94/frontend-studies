const React = require('react');
const { useState, useRef } = React;
/*
    <script src="https://unpkg.com/react@17/umd/react.development.js" crossorigin></script>
    <script src="https://unpkg.com/react-dom@17/umd/react-dom.development.js" crossorigin></script>
    <script src="https://unpkg.com/babel-standalone@6/babel.min.js"></script> <!-- 바벨 -->

    더 이상 위와 같이 쓰지 않아도 된다. npm module 을 require 하는 식으로 쓰면 된다.
*/
const GuGuDan = () => {
    const [first, setFirst] = useState(Math.ceil(Math.random() * 9));
    const [second, setSecond] = useState(Math.ceil(Math.random() * 9));
    const [value, setValue] = useState('');
    const [result, setResult] = useState('');
    const inputRef = useRef(null);

    const onChangeInput = (e) => {
        setValue(e.target.value);
    };

    const onSubmitForm = (e) => {
        e.preventDefault()
        if (parseInt(value) === first * second) {
            setFirst(Math.ceil(Math.random() * 9));
            setSecond(Math.ceil(Math.random() * 9));
            setResult('정답! ' + value);
            setValue('');
            inputRef.current.focus();
        } else {
            setFirst(Math.ceil(Math.random() * 9));
            setSecond(Math.ceil(Math.random() * 9));
            setResult('땡! ' + value);
            setValue('');
            inputRef.current.focus();
        }
    }

    console.log('렌더링');
    // class 를 썼을 때에 비해 hooks 를 쓰면 GuGuDan 함수가 onChange, onSubmit 등 변화가 있을 때마다 불린다.
    // 그래서 성능상 조금 더 느릴 수 있다.

    return (
        <>
            <div>{first} 곱하기 {second} 는?</div>
            <form onSubmit={onSubmitForm}>
                <input ref={inputRef} onChange={onChangeInput} value={value}/>
                <button>입력!</button>
            </form>
            <div id="result">{result}</div>
        </>
    );
}

module.exports = GuGuDan
// 파일을 쪼개는 경우 exports 를 지정해줘야 다른 곳에서 사용할 수 있어진다.
