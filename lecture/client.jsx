const React = require('react');
const ReactDom = require('react-dom');
// 이제 더 이상 html 파일에서 React, ReactDom 을 include 해주지 않아도 된다.

const WordRelay = require('./WordRelay');

ReactDom.render(<WordRelay />, document.querySelector('#root' ))