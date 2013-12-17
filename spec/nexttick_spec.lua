setloop('ev')

describe('The nexttick module',function()
    local nexttick = require'nexttick'
    
    it('provides new method',function()
        assert.is_function(nexttick.new)
      end)
    
    it('provides nexttick method',function()
        assert.is_function(nexttick.nexttick)
      end)
    
    it('the nexttick callback gets called',function(done)
        nexttick.nexttick(async(function()
              done()
          end))
      end)
    
    it('the nexttick callback gets called from another call context',function(done)
        local s = {}
        nexttick.nexttick(async(function()
              assert.is_true(s.dirty)
              done()
          end))
        s.dirty = true
      end)
    
  end)
