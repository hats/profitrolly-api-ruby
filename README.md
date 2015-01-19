# Profitrolly API Ruby
Проект является оберткой над API сервиса [Profitrolly](http://profitrolly.com).

## Установка

Добавьте строку ниже в Gemfile вашего приложения:

```ruby
gem 'profitrolly-api-ruby', github: 'hats/profitrolly-api-ruby'
```

После чего выполните команду:

    $ bundle

## Использование

``` ruby
require 'rubygems'
require 'profitrolly'

# укажите ваши данные здесь
your_token         = 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxx'
your_profit_code   = 'ccccccccccccccccccccccccccccc'

# настройте клиент для работы с Profitrolly API
@client = Profitrolly::Client.new(
  token: your_token
)

# активация профита
@client.activate(
  code: your_profit_code
)

# получение статуса профита
@client.available?(code)
```

## Ваш вклад в проект

1. Форкните репозиторий ( https://github.com/hats/profitrolly-api-ruby/fork )
2. Создайте ветку для ваших изменений (`git checkout -b my-new-feature`)
3. Зафиксируйте ваши изменения (`git commit -am 'Add some feature'`)
4. Отправьте ваши изменения в репозиторий (`git push origin my-new-feature`)
5. Создайте запрос на изменения

ENJOY!
