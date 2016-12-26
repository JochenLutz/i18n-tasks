# frozen_string_literal: true
module I18n::Tasks::Logging
  module_function

  def warn_deprecated(message)
    log_stderr Term::ANSIColor.yellow Term::ANSIColor.bold "#{program_name}: [DEPRECATED] #{message}"
  end

  def log_verbose(message = nil)
    if ::I18n::Tasks.verbose?
      log_stderr Term::ANSIColor.bright_blue(message || yield)
    end
  end

  def log_warn(message)
    log_stderr Term::ANSIColor.yellow "#{program_name}: [WARN] #{message}"
  end

  def log_error(message)
    log_stderr Term::ANSIColor.red Term::ANSIColor.bold "#{program_name}: #{message}"
  end

  def log_stderr(*args)
    $stderr.puts(*args)
  end

  def program_name
    @program_name ||= File.basename($PROGRAM_NAME)
  end
end
