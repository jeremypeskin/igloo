namespace :db do

  desc 'This task converts mortgage principal and interest payments into expenses'
  task :recurring_mortgage => :environment do
    Dir.glob("#{Rails.root}/app/models/*.rb").each { |file| require file }
    date = Date.today
    Property.all.each do |property|
      if property.recurring_mortgage == true
        property.interest_payments.each do |key, value|
          if key == date
            property.expenses.create(user_id: property.user.id, property_id: property.id, amount:value, description:'Mortgage Interest Payment', date: key, expense_type: 1, category: 1)
          end
        end
        property.principal_payments.each do |key, value|
          if key == date
            property.expenses.create(user_id: property.user.id, property_id: property.id, amount:value, description:'Mortgage Principal Payment', date: key, expense_type: 1, category: 1)
          end
        end
      end
    end
  end
end
