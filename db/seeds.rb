Api::V1::User.destroy_all

u1 = Api::V1::User.create(username: 'ash', email: 'ash@pokemons.com', password: 'pikachu')
u2 = Api::V1::User.create(username: 'misty', email: 'misty@pokemons.com', password: 'psyduck')
u3 = Api::V1::User.create(username: 'brock', email: 'brock@pokemons.com', password: 'nursejoy')
