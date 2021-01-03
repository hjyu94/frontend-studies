const path = require('path');

module.exports = {
    mode: 'development', // 실서비스: production
    devtool: 'eval', // 실서비스: hidden-source-map'
    entry: {
        app: './client'
    },
    resolve: {
        extensions: ['.jsx', '.js']
    },
    module: {
        rules: [{
            test: /\.jsx?$/, // 정규표현식
            loader: 'babel-loader',
            options: {
                presets: ['@babel/preset-env', '@babel/preset-react'],
                // plugins: [],
            }
        }]
    },
    output: {
        filename: 'app.js',
        path: path.join(__dirname, 'dist')
    }
}