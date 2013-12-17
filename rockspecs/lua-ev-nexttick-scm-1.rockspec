package = 'lua-ev-nexttick'
version = 'scm-1'

source = {
  url = 'git://github.com/lipp/lua-ev-nexttick.git',
}

description = {
  summary = 'The lua-ev equivalent to node.js process.nextTick.',
  homepage = 'http://github.com/lipp/lua-ev-nexttick',
  license = 'MIT/X11'
}

dependencies = {
  'lua >= 5.1',
  'lua-ev'
}

build = {
  type = 'none',
  install = {
    lua = {
      ['nexttick'] = 'src/nexttick.lua'
    }
  }
}
