module.exports = {
    chainWebpack: config => {
      config.module
        .rule('solidity')
        .test(/\.sol$/)
        .use('solc-loader')
        .loader('solc-loader')
        .options({
          compiler: 'solcjs',
          solidity: {
            version: '0.8.18',
          },
        })
    }
  }