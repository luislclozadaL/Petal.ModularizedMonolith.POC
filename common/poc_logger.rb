class PocLogger
  def info(data)
    logger.info(data)
  end

  def warn(data)
    logger.warn(data)
  end

  private def logger
    Rails.logger
  end
end