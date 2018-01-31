# Everybody

## Description

Everybody is an application interface created in Ruby for the implementation of a web service. You can use a UI such as Postman or RestEasy to feed a Database. This Api is exclusive to develop a Blog.

## Installation


### Usage

```html
$ git clone https://github.com/DanielArturoAlejoAlvarez/everybody.git [NAME APP]
```
Follow the following steps and you're good to go! Important:

Install packages:
```html

Genfile:

$ gem install mysql2
$ gem install faker
$ gem install friendly_id

$ bundle install
```

## DB using MySql
```sql
CREATE DATABASE [name database];
```
***(Implement config/database.yml) mysql2

## Coding

### Model and Migration
```ruby
$ rails g model Post title:string body:text slug:string

$ rake db:migrate

$ rails s
```

### Controller

```ruby
module Api
    module V1 
        class PostsController < ApplicationController

            def index
                posts = Post.all.order("created_at DESC")
                render json: {status: 'SUCCESS', msg: 'Loaded Posts', data:posts}, status: :ok
            end

            ...

             private

            def post_params 
                params.require(:post).permit(:title, :body, :slug)
            end
        end
    end
end
```
### Model

```ruby
class Post < ApplicationRecord
    validates :title, presence: true
    validates :body, presence: true

    extend FriendlyId

    ...

end
```

### Routing

```ruby
...
namespace 'api' do 
    namespace 'v1' do 
      resources :posts
    end
  end
...
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/DanielArturoAlejoAlvarez/everybody. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

 
