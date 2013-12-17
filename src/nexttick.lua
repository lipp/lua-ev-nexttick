local ev = require'ev'

local create_nexttick = function(loop)
  if ev.Idle then
    local on_idle
    local idle_io = ev.Idle.new(
      function(loop,idle_io)
        idle_io:stop(loop)
        on_idle()
      end)
    return function(f)
      on_idle = f
      idle_io:start(loop)
    end
  else
    local eps = 2^-40
    local once
    local on_timeout
    local timer_io = ev.Timer.new(
      function(loop,timer_io)
        once = true
        timer_io:stop(loop)
        on_timeout()
      end,eps)
    return function(f)
      if once then
        timer_io:again(loop)
      else
        timer_io:start(loop)
      end
    end
  end
end

return {
  new = create_nexttick,
  nexttick = create_nexttick(ev.Loop.default),
}
