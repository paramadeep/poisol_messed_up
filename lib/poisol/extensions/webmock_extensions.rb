module WebMock
  class NetConnectNotAllowedError
    alias real_init initialize
    def initialize(*args)
      exception = real_init *args
      PoisolLog.error exception.message
      exception
    end
  end

end
