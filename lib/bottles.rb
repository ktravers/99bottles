class Bottles
  def verse(num)
    <<-VERSE
#{num_inflector(num).capitalize} #{bottle_inflector(num)} of beer on the wall, #{num_inflector(num)} #{bottle_inflector(num)} of beer.
#{set_last_verse(num)}
VERSE
  end

  def verses(firstNum, secondNum)
    range = (secondNum..firstNum).to_a.reverse

    verses = ""
    range.each do |num|
      verses += verse(num)
      verses += "\n"
    end
    puts "********* VERSES: #{verses}"

    verses.strip
  end

  private

  def bottle_inflector(num)
    case num
    when 1
      return 'bottle'
    else
      return 'bottles'
    end
  end

  def num_inflector(num)
    case num
    when 0
      return 'no more'
    else
      return num.to_s
    end
  end

  def pronoun_inflector(num)
    case num
    when 1
      return 'it'
    else
      return 'one'
    end
  end

  def set_last_verse(num)
    if num === 0
      "Go to the store and buy some more, 99 bottles of beer on the wall."
    else
      "Take #{pronoun_inflector(num)} down and pass it around, #{num_inflector(num - 1)} #{bottle_inflector(num - 1)} of beer on the wall."
    end
  end
end
