# Redu [![Build Status](https://travis-ci.org/redu/redu-ruby.png?branch=master)](https://travis-ci.org/redu/redu-ruby) [![Dependency Status](https://gemnasium.com/redu/redu-ruby.png)](https://gemnasium.com/redu/redu-ruby)

Redu Ruby é um encpsulador para da API REST do Redu escrito em Ruby. Seu principal objetivo é abstrair a lógica de comunicaçào HTTP entre os clientes e a API do Redu.

O Redu é uma plataforma de ensino a distância construída sobre uma rede social.

## Instalação

Adicione esta linha ao seu Gemfile:

    gem 'redu'

E execute:

    $ bundle

Ou instale o gem utilizando:

    $ gem install redu

## Uso

Inicialize um cliente passando o *access token* do OAuth:

```ruby
client = Redu::Client.new(oauth_token_secret: 'xyz')
me = client.me
puts me.first_name
# => 'Guilherme'
```

### Pegando amigos do usuário

```ruby
me = client.me
friends = me.friends.select(&:first_name)
puts friends
# => ['André', 'Juliana', 'Anderson']
```

### Postando no mural do usuário

```ruby
me = client.me
me.statuses.create(text: 'Hello World!')
me.statuses.last.text
# => 'Hello World!'
```

### Visualizando primeira aula da disciplina 12

```ruby
me = client.me
space = me.spaces.fetch(id: 12)
lecture = space.lectures.first
puts lecture.type, lecture.raw
# => 'Page'
# => 'Conteúdo da aula...'
```

### Respondendo um post do mural

```ruby
me = client.me
last_status = me.statuses.last
puts last_status
# => 'Alguém está sem grupo para o trabalho de matemática?'
last_status.answer(text: 'Eu! Vamos fazer uma equipe?')
puts last_status.anwers.first
# => 'Eu! Vamos fazer uma equipe?'
```

### Pegando Disciplinas do usuário

```ruby
user = client.me
# Todas as disciplinas que o usuário faz parte
spaces = user.spaces
# Todas as disciplinas onde o usuário é professor
teaching_spaces = user.spaces(role: :teacher)
```

## Contribuindo

1. Faça fork do projeto
2. Crie um novo branch (`git checkout -b my-new-feature`)
3. Realize seus commits (`git commit -am 'Add some feature'`)
4. Dê push nas modificações (`git push origin my-new-feature`)
5. Envie um pull request

<img src="https://github.com/downloads/redu/redupy/redutech-marca.png" alt="Redu Educational Technologies" width="300">

Este projeto é financiado e mantido pelo [Redu Educational Techologies](http://tech.redu.com.br).

## Copyright

Copyright (c) 2012 Redu Educational Technologies

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
