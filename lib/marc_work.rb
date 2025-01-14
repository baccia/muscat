class MarcWork < Marc
  def initialize(source = nil)
    super("work", source)
  end
  
  def get_title
    composer, title, scoring, number, key = ""
    if node = first_occurance("100", "a")
      composer = node.content.blank? ? "" : "#{node.content}:"
    end
    if node = first_occurance("100", "t")
      title = node.content.blank? ? " [without title]" : " #{node.content}"
    end
    if node = first_occurance("100", "n")
      number = node.content.blank? ? "" : " #{node.content}"
    end
    if node = first_occurance("100", "r")
      key = node.content.blank? ? "" : " #{node.content}"
    end
    if node = first_occurance("100", "m")
      scoring = node.content.blank? ? "" : "; #{node.content}"
    end
    return "#{composer}#{title}#{number}#{key}#{scoring}"
  end

  def get_composer
    if node = first_occurance("100", "a")
      person = node.foreign_object
    end
    return person
  end



end
