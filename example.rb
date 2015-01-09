def get_words_from_file(file_name)
  if !File.exists?(file_name)
    say "#{file_name} doesn't exist!"
    return
  end

  File.open(file_name, 'r') do |f|
    f.read
  end.split
end

nouns = get_words_from_file('eng_nouns.txt')
verbs = get_words_from_file('eng_verbs.txt')
adjectives = get_words_from_file('eng_adjectives.txt')

dictionary = {
  nouns: nouns,
  verbs: verbs,
  adjectives: adjectives
}
  def say(msg)
  puts("=> #{msg}")
end

def exit_with(msg)
  say msg
  exit
end

exit_with("No input file!") if ARGV.empty?
exit_with("File doesn't exist!") if !File.exists?(ARGV[0])

contents = File.open(ARGV[0], 'r') do |f|
  f.read
end

contents.gsub!('NOUN').each do
  dictionary[:nouns].sample
end

contents.gsub!('VERB').each do
  dictionary[:verbs].sample
end

contents.gsub!('ADJECTIVE').each do
  dictionary[:adjectives].sample
end

p contents
