  require 'sanitize'

  def string_to_html(text, file_name, bypass_html)
    code_emodzi = %w[1F480 1F479 1F92C 1F629 1F61E 1F917 1F61B 263A 1F60D 1F970 1F973]
    arr_message = %w[Сытость: Настроение: Здоровье: Масса: Рост: Умение: Миссия:]

    if file_name.nil?
      file_name = 'index.html'
    end

    unless bypass_html
      text = Sanitize.fragment(text)
    end

    arr_level = text.split(',')
    file_html = File.new(file_name, 'w+')
    file_html.puts '<!DOCTYPE html>'
    file_html.puts '<html lang="ru">'
    file_html.puts '<head>'
    file_html.puts '<meta charset="utf-8">'
    file_html.puts '<title>string_to_html</title>'
    file_html.puts '<meta name="description" content="Gem string_to_html">'
    file_html.puts '</head>'
    file_html.puts '<body>'
    arr_message.each_index{|index|  file_html.puts "<p style='color:#4682B4; font-size:30px'> #{arr_message[index]}  #{arr_level[index]} </p>" }
    file_html.puts "<p style='font-size:70px'> Уровень голода -  &#x#{code_emodzi[arr_level[0].to_i]}; </p>"
    file_html.puts '</body>'
    file_html.puts '</html>'
    file_html.close
  end





