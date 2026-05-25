module.exports = {
  lintOnSave: false,
  publicPath: process.env.NODE_ENV === 'development' ? './' : '././',
  outputDir: 'dist',
  devServer: {
    host: "0.0.0.0",
    port: 8082,
    hot: true,
    https: false,
    proxy: {
      '/tourismrecmngsys': {
        target: 'http://localhost:8080/tourismrecmngsys/',
        changeOrigin: true,
        secure: false,
        pathRewrite: {
          '^/tourismrecmngsys': ''
        }
      }
    }
  }
}