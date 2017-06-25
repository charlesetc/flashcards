# encoding: utf-8

words = ARGV[0]
template = ARGV[1]

wordlist = File.readlines(words).each_with_index.map do |l, i|
  spanish, english = l.force_encoding("iso-8859-1").split(' ---- ')
  "<span class='spanish' id='spanish_#{i}'>#{spanish}</span><span class='english' id='english_#{i}'>#{english}</span>"
end.join("\n")

out = File.read(template).sub("%%%%%", wordlist)

File.write(File.basename(template, ".template.html") + ".html", out)
