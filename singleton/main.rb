require_relative 'simple_logger'

logger = SimpleLogger.instance
puts logger.level

SimpleLogger.instance.info('Computer wins chess game.')
SimpleLogger.instance.warning('AE-35 hardware failure predicted.')
SimpleLogger.instance.error('HAL-9000 malfunction, take emergency action!')
