require('sinatra')
require('sinatra/reloader')
require('./lib/word')
require('./lib/definition')
require 'pry'
also_reload('lib/**/*.rb')

### Application Routes
get('/') do
  @words = Word.all
  erb(:index)
end

### Word Routes

# Word Index
get('/words') do; end

# Word New
get('/words/new') do
  erb :'words/new', layout: :layout
end

# Word Create
post('/words') do
  Word.new(params[:word]).save

  redirect to('/')
end

# Word Show (Read)
get('/words/:id') do
  @word = Word.find params[:id]

  erb :'words/show'
end

# Word Edit
get('/words/:id/edit') do
  @word = Word.find params[:id]

  erb :'words/edit'
end

# Word Update
put('/words/:id') do
  @word = Word.find params[:id]
  @word.title = params[:word]

  redirect to("/words/#{@word.id}")
end

# Word Destroy
delete('/words/:id') do
  @word = Word.find params[:id]
  @word.destroy

  redirect to('/')
end

### Definition Routes

# Definition Index
get('/definitions') do; end

# Definition New
get('/definitions/new') do; end

# Definition Create
post('/definitions') do; end

# Definition Show (Read)
get('/definitions/:id') do; end

# Definition Edit
get('/definitions/:id/edit') do; end

# Definition Update
put('/definitions/:id') do; end

# Definition Destroy
delete('/definitions/:id') do; end

# get('/home') do
#   new_word = params[:new_word]
#   new_definition = params[:new_definition]
#   alternate_definition = params[:alternate_definition]
#   word = Word.new(new_word, new_definition)
#   define = Definition.new(new_word, new_definition, alternate_definition)
#   define.save()
#   word.save()
#   @study_terms = Word.all()
#   @definitions = Definition.all()
#   # binding.pry
#   erb(:home)
# end
# post('/home') do
#   new_word = params[:new_word]
#   new_definition = params[:new_definition]
#   alternate_definition = params[:alternate_definition]
#   word = Word.new(new_word, new_definition)
#   word.add_definition(params[:alternate_definition])
#   define = Definition.new(new_word, new_definition, alternate_definition)
#   @chosen_word = word.new_word
#   word.save()
#   define.save()
#   @definitions = Definition.all()
#   @study_terms = Word.all()
#   erb(:home)
# end
# get('/home/edit') do
#   @term = Word.find(@chosen_word)
#   @study_terms = Word.all()
#   @definitions = Definition.all()
# erb(:edit)
# end
#
# patch('/home/edit') do
#   @term = Word.find(@chosen_word)
#   @vocab = Defintion.find(params[:new_definition])
#   @vocab.edit(params[:new_definition])
#   @vocab2 = Definition.find(params[:alternate_definition])
#     @vocab2.edit(params[:alternate_definition])
#
#   @study_terms = Word.all()
#   @definitions = Definition.all()
#   erb(:edit)
# end
# post('/home/edit') do
#   new_word = params[:new_word]
#   new_definition = params[:new_definition]
#   alternate_definition = params[:alternate_definition]
#   word = Word.new(new_word, new_definition)
#   word.add_definition(params[:alternate_definition])
#   define = Definition.new(new_word, new_definition, alternate_definition)
#   @chosen_word = word.new_word
#   word.save()
#   define.save()
#   @definitions = Definition.all()
#   @study_terms = Word.all()
#   erb(:home)
# end
