require 'timeout'
require 'socket'

class PegasusStatus

  attr_reader :search, :booking

  HOST = 'ud.pegsinc.com'

  def check!
    @search = check HOST, 5454
    @booking = check HOST, 443
    PegasusStatusPresenter.new(self)
  end

  private

  def check host, port
    begin
      timeout 3 do
        TCPSocket.new host, port
        true
      end
    rescue
      false
    end
  end
end
