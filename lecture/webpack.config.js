const path = require('path');

module.exports = {
    name: 'wordrelay-setting',
    mode: 'development', // 실서비스: production
    devtool: 'eval',
    resolve: {
        extensions: ['.js', '.jsx']
    },
    entry: {
        app: ['./client'] // client.jsx 에서 './WordRelay.jsx' 를 불러오기 때문에 또 써줄 필요가 ㄴㄴ
    }, // 입력
    module: {
        rules: [{
            test: /\.jsx?/, // jsx 파일에 룰을 적용하겠다.
            loader: 'babel-loader', // 어떤 룰? 바벨 룰. 최신이나 실험적인 문법을 옛날 브라우저에서도 돌아가게끔 바꿔주겠다.
            options: {
                presets: [
                    '@babel/preset-env',
                    '@babel/preset-react'
                ],
                plugins: [
                    '@babel/plugin-proposal-class-properties'
                ]
            }
        }]
    }, // 입력에 모듈을 적용해서 출력을 낸다.
    output: {
        path: path.join(__dirname, 'dist'),
        filename: 'app.js'
    }, // 출력
}