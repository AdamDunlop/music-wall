class CreateUsers < ActiveRecord::Migration

def change

  create_table :users do |t|
    
    t.string :user_name
    t.string :email
    t.string :password
    t.timestamp :created_at

    end
  end

end
# https://soundcloud.com/sanholobeats/dr-dre-the-next-episode-ft-snoop-dogg-san-holo-remix