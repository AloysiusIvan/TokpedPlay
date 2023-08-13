const path = require('path');
const webpack = require('webpack');

module.exports = {
    entry: {
        main: './Controllers/controller.js'
    },
    output: {
        path: path.resolve(__dirname, 'dist'),
        publicPath: '/',
        filename: 'server.bundle.js',
        clean: true
    },
    mode: 'production',
    target: 'node',
    module: {
        rules: [
            {
                test: /\.js$/,
                exclude: /node_modules/,
                loader: 'babel-loader'
            }
        ]
    }
};