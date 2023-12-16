require_relative 'class_based_logger'

ClassBasedLogger.level = ClassBasedLogger::INFO
ClassBasedLogger.info('Computer wins chess game.')
ClassBasedLogger.warning('AE-35 hardware failure predicted.')
ClassBasedLogger.error('HAL-9000 malfunction, take emergency action!')
