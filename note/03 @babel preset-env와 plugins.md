### webpack.config.js - @babel/preset-env와 plugins
#### [1] @babel/preset-env

```js
module.exports = {
    // ...
    entry: {
        app: './client'
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
```
entry 를 이용해서 output 을 만들어낼 때 entry 들에 module 이 적용된다.   
위의 경우 babel-loader 를 entry 들에 적용하는데   
babel-loader 들의 options 값들이 presets, plugins 으로 나열되어 있다.   
babel-loader 의 @babel/preset-env 의 옵션값들이 있을 수도 있는데    
plugin 들의 모음이 preset 이다. (수십개의 플러그인들로 하나의 프리셋이 이뤄져있다.)   
이 경우 아래처럼 chrome 마지막 2 버전에만 babel-loader 를 적용하라는 옵션값을 줄 수 있다.   

```js
const path = require('path');

module.exports = {
    // ...
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
                    }],
                    '@babel/preset-react'
                    ],
                // plugins: [],
            }
        }]
    }
}
```

##### Ref
 - https://github.com/browserslist/browserslist#queries

---
 
#### [2] plugins
webpack.config.js 에서 주된 설정 값은 entry, module, output 이다.   
그 외 mode, devtool, resolve 등은 부가적인 역할을 하는데   
이처럼 부수적인 역할을 하는 얘 중 plugins 라는게 있다.
(babel-loader 의 plugins 도 있고 webpack.config.js 에도 plugins 라는게 있다.)
module 적용하고 그 이후 plugins 까지 적용해서 output 이 나오는 것.

```js
const path = require('path');

module.exports = {
    // ...
    plugins: [
        new webpack.LoaderOptionsPlugin({ debug: true}),
    ],
}
```