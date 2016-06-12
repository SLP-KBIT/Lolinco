class UserAgent
  ANDROID = %w(Android).freeze
  IOS = %w(iPhone iPad iPod).freeze

  def initialize(user_agent)
    @ua = user_agent
  end

  def android?
    ANDROID.any? { |s| @ua.include?(s) }
  end

  def ios?
    !android? && IOS.any? { |s| @ua.include?(s) }
  end

  def mobile?
    android? || ios?
  end
end

