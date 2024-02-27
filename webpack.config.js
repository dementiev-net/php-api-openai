const path = require("path");
const buildType = process.env.BUILD_TYPE ? process.env.BUILD_TYPE : "development"

module.exports = {
    mode: buildType,
    entry: {
        entry: './src/index.js'
    },
    output: {
        path: path.join(__dirname, './assets'),
        filename: 'bundle.js'
    }
}
