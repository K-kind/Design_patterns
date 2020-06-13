require 'singleton'

# class SimpleLogger
#   include Singleton
#   attr_accessor :level

#   ERROR = 1
#   WARNING = 2
#   INFO = 3

#   def initialize
#     @log = File.open('test.log', 'w')
#     @level = WARNING
#   end

#   def error(text)
#     @log.puts(text)
#     @log.flush
#   end

#   def warning(text)
#     @log.puts(text) if @level >= WARNING
#     @log.flush
#   end

#   def info(text)
#     @log.puts(text) if @level >= INFO
#     @log.flush
#   end

#   # @@instance = self.new

#   # def self.instance
#   #   @@instance
#   # end

#   # private_class_method :new
# end

# logger1 = SimpleLogger.instance
# logger1.warning('危険です')

# logger2 = SimpleLogger.instance
# logger2.error('エラーです')
# logger2.level = SimpleLogger::INFO
# logger2.info('情報です')

module SimpleLogger
  ERROR = 1
  WARNING = 2
  INFO = 3

  @@log = File.open('test.log', 'w')
  @@level = WARNING

  def self.level
    @@level
  end

  def self.level=(level)
    @@level = level
  end

  def self.error(text)
    @@log.puts(text)
    @@log.flush
  end

  def self.warning(text)
    @@log.puts(text) if @@level >= WARNING
    @@log.flush
  end

  def self.info(text)
    @@log.puts(text) if @@level >= INFO
    @@log.flush
  end
end

logger1 = SimpleLogger
logger1.warning('危険です')

logger2 = SimpleLogger
logger2.error('エラーです')
logger2.level = SimpleLogger::INFO
logger2.info('情報です')