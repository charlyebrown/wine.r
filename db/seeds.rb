User.create(username: "charlyebrown", name: "Charlye Tran", address: '123 Brick Lane',
birthday: "Dec 12, 1982", preferences: "red", password: "123",
password_confirmation: "123", email: "charlye@gmail.com")

User.create(username: "superman", name: "Super Man", address: '123 Winding Rd',
birthday: "Dec 12, 1982",
preferences: "white", password: "123",
password_confirmation: "123", email: "super@gmail.com")

User.create(username: "batman", name: "Bat Man", address: '123 Hollow Blvd',
birthday: "Jan 1, 1982",
preferences: "rose", password: "123",
password_confirmation: "123", email: "bat@gmail.com")

Wine.create({
           :name => "Hatzimichalis Veriki White",
       :varietal => "Chardonnay",
        :vintage => 2008,
         :region => "Greece > Attica",
       :vineyard => nil,
    :description => nil,
          :color => "White Wine",
         :rating => nil,
          :image => "http://ei.isnooth.com/multimedia/e/c/5/image_840976_square.jpeg",
           :code => "hatzimichalis-veriki-white-2008",
          :price => 11.6
})

Wine.create({
           :name => "Callaway Coastal Sauvignon Blanc",
       :varietal => "Sauvignon Blanc",
        :vintage => 2012,
         :region => "USA > California",
       :vineyard => nil,
    :description => nil,
          :color => "White Wine",
         :rating => nil,
          :image => "http://ei.isnooth.com/multimedia/e/9/9/image_2840357_square.jpeg",
           :code => "callaway-coastal-sauvignon-blanc-2012",
          :price => 7.19})
Wine.create({
  :name => "Sauvignon Republic Sauvignon Blanc Russian River",
           :varietal => "Sauvignon Blanc",
            :vintage => 2008,
             :region => "USA > California > Sonoma County > Russian River Valley",
           :vineyard => nil,
        :description => nil,
              :color => "White Wine",
             :rating => nil,
              :image => "http://ei.isnooth.com/multimedia/8/3/8/image_794827_square.jpeg",
               :code => "sauvignon-republic-sauvignon-blanc-russian-river-2008",
              :price => 14.99

  })
