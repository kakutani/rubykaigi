class LanguageDetector
  def initialize(availables, fallback = nil)
    @availables = availables
    @fallback = fallback || availables.first
  end

  def detect(locales)
    normalized = Array(locales).map{|l| l.split("-").first }
    normalized.detect{|l| @availables.include?(l) } || @fallback
  end
end

