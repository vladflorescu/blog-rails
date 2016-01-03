module StringOpsHelper
  def splitByNewline(string)
    return string.split(findNewlineCharacter(string)) - [""]
  end

  private

  def findNewlineCharacter(string)
    if string.include? "\r\n"
      return "\r\n"
    elsif string.include? "\r"
      return "\r"
    else
      return "\n"
    end
  end
end
