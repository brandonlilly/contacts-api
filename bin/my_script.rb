require 'addressable/uri'
require 'rest-client'

url = Addressable::URI.new(
  scheme: 'http',
  host: 'localhost',
  port: 3000,
  path: '/users.html'
).to_s

# puts RestClient.get(url)

post_request = Addressable::URI.new(
  scheme: 'http',
  host: 'localhost',
  port: 3000,
  path: '/users'
).to_s

data = {user: {
  name: 'my_name'
  }
}

# RestClient.post(post_request, data)


# url2 = Addressable::URI.new(
#   scheme: 'http',
#   host: 'localhost',
#   port: 3000,
#   path: '/users',
#   # query_values: {
#   #   'some_category[a_key]' => 'another value',
#   #   'some_category[a_second_key]' => 'yet another value',
#   #   'some_category[inner_inner_hash][key]' => 'value',
#   #   'something_else' => 'aaahhhhh'
#   # }
# ).to_s
#
# puts RestClient.post(url2,{
#   'some_category[a_key]' => 'another value',
#   'some_category[a_second_key]' => 'yet another value',
#   'some_category[inner_inner_hash][key]' => 'value',
#   'something_else' => 'aaahhhhh'
# } )

def create_user
  url = Addressable::URI.new(
    scheme: 'http',
    host: 'localhost',
    port: 3000,
    path: '/users.json'
  ).to_s

  puts RestClient.post(
    url,
    { user: { username: "Gizmo" } }
  )
end

def update_user
  url = Addressable::URI.new(
    scheme: 'http',
    host: 'localhost',
    port: 3000,
    path: '/users/1.json'
  ).to_s

  puts RestClient.patch(
    url,
    { user: { name: "Gizmo"} }
  )
end

def delete_user
  url = Addressable::URI.new(
    scheme: 'http',
    host: 'localhost',
    port: 3000,
    path: '/users/2.json'
  ).to_s

  puts RestClient.delete(url)
end


def create_contact(data)
  url = Addressable::URI.new(
    scheme: 'http',
    host: 'localhost',
    port: 3000,
    path: '/contacts.json'
  ).to_s

  puts RestClient.post(url, data)
end

def update_contact(data)
  url = Addressable::URI.new(
    scheme: 'http',
    host: 'localhost',
    port: 3000,
    path: '/contacts/17json'
  ).to_s

  puts RestClient.patch(
    url, data
  )
end

def destroy_contact(id)
  url = Addressable::URI.new(
    scheme: 'http',
    host: 'localhost',
    port: 3000,
    path: "/contacts/#{id}.json"
  ).to_s

  puts RestClient.delete(url)
end

# create_contact(
#   contact: {
#     name: 'Chris Stott',
#     email: 'stott@example.com',
#     user_id: 9
#   }
# )

# update_contact(
#   contact: {
#     email: 'pan@example.com'
#   }
# )

destroy_contact(18)
