class LogLineParser
  def initialize(line)
    @line = line
  end

  def message
    @line.gsub(/\[(ERROR|WARNING|INFO)\]:(.*)/, '\2').strip
  end

  def log_level
    @line.gsub(/\[(ERROR|WARNING|INFO)\]:.*/, '\1').downcase.strip
  end

  def reformat
    "#{self.message} (#{self.log_level})"
  end
end
