require 'logger'

class Logger 
  ROTATION = 7
  MAX_SIZE = 1048576

  def self.log
    if @logger.nil?
      @logger = Logger.new('customer_daas.log', ROTATION, MAX_SIZE)
      @logger.level = Logger::DEBUG
      @logger.datetime_format = '%Y-%m-%d %H:%M:%S '
    end
    @logger
  end
end