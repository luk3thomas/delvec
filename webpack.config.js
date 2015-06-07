module.exports =
{
  entry: './index.coffee',
  output: {
    filename: 'delvec.js',
    library: 'delvec',
    libraryTarget: 'umd'
  },
  module: {
    loaders: [
      { test: /\.coffee$/, loader: 'coffee' }
    ]
  }
}
