const path = require('path');
const webpack = require('webpack');

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
                presets: [
                    ['@babel/preset-env', {
                        targets: {
                            browsers: ['> 5% in KR', 'last 2 chrome versions'],
                        },
                        debug: true,
                    }],
                    '@babel/preset-react'
                    ],
                // plugins: [],
            }
        }]
    },
    plugins: [
        new webpack.LoaderOptionsPlugin({ debug: true }),
    ],
    output: {
        filename: 'app.js',
        path: path.join(__dirname, 'dist')
    }
}