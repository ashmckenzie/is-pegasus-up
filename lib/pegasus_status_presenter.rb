require 'forwardable'

class PegasusStatusPresenter

  extend Forwardable

  attr_reader :search, :booking

  def initialize pegasus_status
    @pegasus_status = pegasus_status
  end

  def css_class
    up? ? 'up' : 'down'
  end

  def description
    up? ? 'Y' : 'N'
  end

  def icon
    up? ? 'icon-thumbs-up' : 'icon-thumbs-down'
  end

  def up?
    @up ||= search_up? && booking_up?
  end

  def search_up?
    @search_up ||= search
  end

  def booking_up?
    @booking_up ||= booking
  end

  def_delegators :@pegasus_status, :search, :booking

  private

  attr_reader :pegasus_status

end
